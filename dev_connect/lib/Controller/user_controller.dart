import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userImage = ''.obs; // Store the image path as an observable variable

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _fetchUserData();
  }
  Future<void> signUp(String name, String email, String password) async {
    try {
      // Create a new user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user from the user credential
      User? user = userCredential.user;

      // Update user profile with name
      await user?.updateDisplayName(name);

      // Save additional user information in Firestore
      await _firestore.collection('users').doc(user?.uid).set({
        'name': name,
        'email': email,
        'image': '', // You can update the image path later
      });

      // Update the observable variables
      userName.value = name;
      userEmail.value = email;

      // Navigate to the home page after successful signup
      Get.offAllNamed('/home');

    } catch (e) {
      // Show an error message if signup fails
      Get.snackbar('Error', 'Failed to sign up: $e');
    }
  }


  Future<void> _fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        userEmail.value = user.email ?? '';

        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          userName.value = userDoc['name'];
          userImage.value = userDoc['image'] ?? ''; // Fetch the image path from Firestore
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user data: $e');
    }
  }


  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        userImage.value = pickedFile.path;

        // Update Firestore with the new image path
        User? user = _auth.currentUser;
        if (user != null) {
          await _firestore.collection('users').doc(user.uid).update({
            'image': pickedFile.path,
          });
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }
}
