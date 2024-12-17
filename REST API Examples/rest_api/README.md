
# 🧑‍💻 User Fetching API with Dart and Flutter

## 🌟 Overview
This project demonstrates how to fetch user data from a public API, transform the data into structured Dart objects, and handle network errors effectively. The application uses Dart's `http` package for making API calls and includes features like retries, error handling, and null safety.

## ✨ Features
- 🌐 Fetches 500 random users from the [Random User API](https://randomuser.me/).
- 🛠 Maps API data into Dart classes (`User` and `UserName`).
- 🔄 Implements retry logic to handle temporary failures.
- 🛡 Comprehensive error handling with user-friendly messages.
- ✅ Ensures null safety for all fetched fields.

## 📂 Project Structure

### 🗂 Files and Directories
```
|-- lib/
    |-- Pages/
        |-- home_page.dart    # Contains the UI design of the app.
    |-- services/
        |-- fetch_user_api.dart    # Contains the UserApi class for fetching user data.
    |-- model/
        |-- user.dart        # Defines the User class.
        |-- user_name.dart   # Defines the UserName class.
        |-- user_dob.dart        # Defines the date of birth class.
        |-- user_picture.dart   # Defines the user picture class.
        |-- user_location.dart        # Defines the user location class.
```

## 🌐 API Details
The project fetches data from the [Random User API](https://randomuser.me/):
- **URL:** `https://randomuser.me/api/?results=500`
- **Returns:** JSON response containing user details like name, email, phone, and nationality.

### 🔍 Sample Response
```json
{
  "results": [
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "John",
        "last": "Doe"
      },
      "email": "johndoe@example.com",
      "cell": "123-456-7890",
      "phone": "098-765-4321",
      "nat": "US"
    }
  ]
}
```

## 🛠 Usage

### 1️⃣ Fetch Users
Call the `fetchUsers` method from the `UserApi` class:

```dart
import 'api/user_api.dart';

void main() async {
  try {
    final users = await UserApi.fetchUsers();
    print('Fetched ${users.length} users');
  } catch (e) {
    print('Error: $e');
  }
}
```

### 2️⃣ User Class Definition
#### 🧑 User
```dart
class User {
  final String email;
  final String cell;
  final String gender;
  final String nat;
  final String phone;
  final UserName name;

  User({
    required this.email,
    required this.cell,
    required this.gender,
    required this.nat,
    required this.phone,
    required this.name,
  });
}
```

#### 🧾 UserName
```dart
class UserName {
  final String title;
  final String first;
  final String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });
}
```

### 3️⃣ API Class
#### 📡 UserApi
```dart
class UserApi {
  static Future<List<User>> fetchUsers({int retries = 3}) async {
    const url = 'https://randomuser.me/api/?results=500';

    for (int attempt = 0; attempt < retries; attempt++) {
      try {
        final uri = Uri.parse(url);
        final response = await http.get(uri);

        if (response.statusCode == 200) {
          final body = response.body;
          final json = jsonDecode(body);

          if (json['results'] is! List) {
            throw Exception('Unexpected API response format');
          }

          final results = json['results'] as List<dynamic>;
          final users = results.map((e) {
            final name = UserName(
              title: e['name']['title'] ?? '',
              first: e['name']['first'] ?? '',
              last: e['name']['last'] ?? '',
            );
            return User(
              email: e['email'] ?? '',
              cell: e['cell'] ?? '',
              gender: e['gender'] ?? '',
              nat: e['nat'] ?? '',
              phone: e['phone'] ?? '',
              name: name,
            );
          }).toList();

          return users;
        } else {
          throw Exception('Server error: ${response.statusCode}');
        }
      } catch (error) {
        if (attempt == retries - 1) {
          throw Exception('Failed to fetch users after $retries attempts: $error');
        }
      }
    }

    throw Exception('Unexpected error: fetchUsers completed without returning.');
  }
}
```

## 🛡 Error Handling
- ❌ **Invalid API Response:** Ensures `results` is a valid list.
- 🔄 **Retries:** Retries up to 3 times by default in case of network errors or server issues.
- ✅ **Default Values:** Handles null fields in API response with default empty strings.

## ⚙️ Prerequisites
- 🛠 Dart SDK installed.
- 📦 Add the `http` package to your project:
  ```bash
  flutter pub add http
  ```

## 🚀 Future Improvements
- Add a UI layer in Flutter to display the fetched users.
- Implement a caching mechanism to reduce API calls.
- Add localization support for user data.

## 🤝 Contributing
Feel free to fork this repository and submit pull requests for improvements or bug fixes.

---
Thank you for exploring the **User Fetching API**! 🌟
