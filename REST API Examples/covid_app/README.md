# Covid Tracker App

This project is a **Covid-19 Tracker App** built using Flutter. It fetches real-time data from a REST API to display statistics such as the total number of cases, deaths, and recoveries by country. The app also features a search functionality to filter data based on user input.

## Features

- **Real-Time Data**: Fetches up-to-date Covid-19 statistics from a REST API.
- **Search Functionality**: Allows users to search for specific countries.
- **Dynamic UI**:
    - Displays country-specific data such as cases, deaths, and flag images.
    - Animated splash screen with a rotating virus icon.
- **Navigation**: Automatically transitions from the splash screen to the main statistics screen.

## Screenshots

### Splash Screen
![Splash Screen](https://github.com/Rimsha8954/Image_data/blob/main/splashScreen.jpg)

### Main Screen
![WorldStats Screen](https://github.com/Rimsha8954/Image_data/blob/main/worldStatsScreen.jpg)

### Splash Screen
![CountriesList](https://github.com/Rimsha8954/Image_data/blob/main/countriesList.jpg)


---
## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/covid_tracker_app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd covid_tracker_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## How It Works

1. The app starts with an animated splash screen that rotates a virus icon for 3 seconds.
2. After 3 seconds, the app navigates to the main screen, which displays Covid-19 statistics for all countries.
3. Users can scroll through the list or use the search bar to find specific countries.

## Technologies Used

- **Flutter**: Framework for building cross-platform apps.
- **REST API**: Fetches real-time Covid-19 data.
- **State Management**: Managed using built-in Flutter state management.
- **Animation**: Used `AnimationController` and `AnimatedBuilder` for creating the splash screen effect.

## Resources and Credits

- **YouTube Playlist**: This app was created following the [REST API Playlist by Asif Taj](https://www.youtube.com/watch?v=2_sjpyAvvo8&list=PLFyjjoCMAPtzgITDreXNNkSWLKbd1wf51&index=1).
- **API Source**: The data is fetched from a public Covid-19 API (e.g., disease.sh API).


---

Feel free to contribute or provide feedback to improve the app! If you like the project, don't forget to star the repository on GitHub.

### Author

Rimsha Ashraf
---

Thank you for checking out the Covid Tracker App! Stay safe and healthy.
