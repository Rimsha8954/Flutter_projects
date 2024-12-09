
# 🎥 Exercise Video Player App  

✨ **A sleek and interactive app to stay fit and follow structured workout routines!**  

---

## 🚀 Features  

- 🎬 **Video Player Screen**:  
  - Play exercise videos with interactive controls (play, pause, seek).  
  - Watch workout instructions with a clean interface.  

- 🖌️ **Dashboard UI**:  
  - A beautifully designed placeholder screen showcasing workout categories and progress.  
  - Displays information about workout programs and areas of focus (e.g., Glutes, Abs).  

---

## 🖼️ Screenshots  

### 📋 Dashboard  
![Dashboard](https://github.com/Rimsha8954/Image_data/blob/main/home.jpg)  

### 🏡 Home  
![Video-Player-Screen](https://github.com/Rimsha8954/Image_data/blob/main/Dashboard.jpg)  

---

## 🛠️ Tech Stack  

- **Flutter** 🌟: Framework for building the app.  
- **Dart** 🚀: Programming language.  
- **Video_Player** 🎥: For smooth video playback.  
- **GetX** ⚡: Efficient state management.  

---

## 📂 Project Structure  

Here’s how the project is organized:  

```
lib/
├── screens/                  # UI Screens
│   ├── dashboard.dart        # Dashboard Screen
│   └── video_player.dart     # Video Player Screen
└── app_colors.dart       # Colors used throughout the app
├── json/
│   ├── info.json             # Metadata for the app
│   └── videoInfo.json        # Data about videos
assets/
└── images/                   # Images for UI
pubspec.yaml                  # Dependencies and configurations
```  

- 📄 **Screens Folder**: Contains screens like `dashboard` and `video_player`.  
- 🎨 **AppColors**: Centralized color constants for consistent theming.  
- 📑 **JSON Folder**: Stores app and video information in `info.json` and `videoInfo.json`.  
- 🌐 **Assets Folder**: Contains all images used in the app.  
- 🌎 **Network URLs**: Videos are streamed directly using URLs.  

---

## ⚙️ Installation Guide  

1. Clone the repository:  
   ```bash
   git clone https://github.com/YourGitHubUsername/ExerciseVideoPlayer.git
   cd ExerciseVideoPlayer
   ```  

2. Install dependencies:  
   ```bash
   flutter pub get
   ```  

3. Run the app:  
   ```bash
   flutter run
   ```  

---

## 💻 How to Use  

1. 📜 **Select a Workout**: Navigate to your desired workout program from the dashboard.  
2. 🎥 **Play Videos**: Watch exercise videos with interactive controls.  
3. ⏱️ **Follow the Routine**: Perform exercises as per the timers and instructions provided.  
4. 🎯 **Target Specific Areas**: Choose workouts focused on Glutes, Abs, or other areas.  

---

## 📦 Dependencies  

Here are the core dependencies used in the project:  

| 📦 Dependency       | 🔗 Description                                  |
|---------------------|-----------------------------------------------|
| `video_player`      | For video playback functionality.             |
| `get`               | For efficient state management.               |
| `flutter_svg`       | To render vector graphics in the app.         |

---

## ✨ Future Enhancements  

- ☁️ **Dynamic Content**: Add video streaming from a backend server.  
- 🛠️ **Custom Plans**: Allow users to create personalized workout routines.  
- 📈 **Insights**: Include detailed performance analytics and calorie tracking.  

---

## 💡 Contributing  

Want to contribute? Follow these steps:  

1. Fork this repository.  
2. Create a feature branch:  
   ```bash
   git checkout -b feature/awesome-feature
   ```  
3. Make your changes and commit them:  
   ```bash
   git commit -m "Add some awesome feature"
   ```  
4. Push to the branch and open a Pull Request!  

---

🌟 **Stay Fit and Keep Coding!** 💪  

