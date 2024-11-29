# ✨ Tendify Admin App 🌟  
Welcome to the **Tendify Admin App**, a **jewelry e-commerce clone** app! This project uses **Flutter** 💙 and **Firebase** 🔥 to simulate managing products, orders, and users in a jewelry store. 💎✨  

---

## 📋 Features  

🛍️ **Product Management**  
- Add, edit, and delete jewelry products. 💍  
- Upload product images directly to **Firebase Storage** 🖼️.  
- Retrieve and display products dynamically from **Firebase Firestore** 🔄.  

📦 **Order Management**  
- View and manage orders stored in Firebase 📦.  
- Update order statuses in real time ✅⏳.  

🔒 **Authentication**  
- Secure admin login using **Firebase Authentication** 🔑.  

🎨 **Responsive Design**  
- A sleek and user-friendly UI, optimized for both mobile and tablet devices 📱💻.

---

## 🚀 Purpose  
This project serves as a **learning exercise** 🧠 to explore Flutter and Firebase integration, focusing on building admin panels for e-commerce platforms.  

---

## 🔧 Getting Started  

### Prerequisites  
✔️ **Flutter SDK** (3.x.x or higher)  
✔️ **Dart SDK** (2.x.x or higher)  
✔️ Firebase project setup with Firestore, Authentication, and Storage 🔥.  
✔️ IDE like VS Code or Android Studio 💻  

### Clone the Repository  
```bash  
git clone https://github.com/Rimsha8954/Tendify-Admin.git
```
### Install Dependencies 🧩
Navigate to the project folder and run:

```bash
flutter pub get
```
### Configure Firebase 🔥
- Set up a Firebase project in the Firebase Console.
- Download the google-services.json (for Android) or GoogleService-Info.plist (for iOS) and place it in the respective platform folders:
- android/app/
- ios/Runner/
- Enable Authentication, Firestore, and Storage in the Firebase console.
- Run the App 🏃‍♀️
```bash
flutter run
```
Make sure you have a device connected or emulator running 📱✨.

📂 Project Structure
```bash
lib/
├── Pages/           # 📺 Screens for products, orders, users
├── models/            # 📦 Models for Firebase data
├── Reuseablewidgets/           # 🛠️ Reusable UI components
├── Controller/          # 🔥 Firebase integration services
└── main.dart          # 🚪 App entry point
assets/
├── images/            # 🖼️ Placeholder images
```

## 🔥 Firebase Features
Firestore: For real-time database and product/order storage.
Storage: For uploading and retrieving product images.
Authentication: For secure admin login.

## ❓ FAQ
Does this app connect to Firebase?
✅ Yes, it integrates with Firebase Firestore, Storage, and Authentication.

Can I use this app in production?
⚠️ This is a clone app designed for learning. While it uses Firebase, additional security and optimization are needed for production use.

## 🛠️ Built With
- Flutter: Cross-platform app framework 🛠️.
- Dart: Programming language powering Flutter ✨.
- Firebase: Backend as a Service for Firestore, authentication, and storage 🔥.
  
## 🎉 Contributing
Want to make it better? Fork it, clone it, and contribute your magic! ✨
## 📝 License
This project is for educational purposes and is not intended for commercial use. 🚫💰


