# 🏋️ Smart Health & Fitness Tracker  

### A cross-platform mobile application built with **Flutter** to help users monitor their health and fitness progress. The app allows users to log workouts, track nutrition, and analyze fitness trends using interactive visualizations.  

---

## 🚀 Features  

### ✅ **Mobile Application (Flutter)**
- 🌟 User-friendly **home screen** with quick access to logs & analytics.
- 🏈 **Workout Logging** – Add workouts with type, duration, and date.
- 📊 **Data Visualization** – Track fitness progress over time.
- 📢 **Notifications & Reminders** – Get workout reminders.
- 🗓 **Integration with Calendar** – Sync scheduled workouts.
- 🔒 **Secure Authentication** (Future update).

### ✅ **Backend API (Node.js + Express)**
- 🔄 REST API for **workout data management**.
- 📞 Handles GET & POST requests for storing workouts.
- 🛠️ Easy-to-extend architecture for new features.
- ⚡ Ready for **database integration** (MongoDB/Firebase planned).

---

## 🏠 **Tech Stack**  

### **Frontend (Flutter)**
- 🎨 **Flutter (Dart)** – UI development  
- ⚡ **FlutterFlow** – Rapid prototyping  
- 🔄 **HTTP package** – API integration  
- 📱 **Cross-platform** (iOS & Android)  

### **Backend (Node.js + Express)**
- ⚙️ **Node.js** – Server-side logic  
- 🌎 **Express.js** – API routing  
- 📄 **JSON storage** – Temporary data storage  
- 🔓 **CORS enabled** for frontend-backend communication  

---

## 🏢 **Project Structure**  

```
smart_health_app/  
├── lib/  
│   ├── main.dart  # Main entry point  
│   ├── models/  
│   │   └── workout.dart  # Data model  
│   ├── screens/  
│   │   ├── home_screen.dart  # Home page  
│   │   ├── workout_log_screen.dart  # Workout logging UI  
│   │   ├── analytics_screen.dart  # Placeholder for analytics  
│   ├── services/  
│   │   └── api_service.dart  # Handles API calls  
│  
├── backend/  
│   ├── index.js  # Node.js backend server  
│   ├── package.json  # Dependencies  
│  
├── pubspec.yaml  # Flutter dependencies  
├── README.md  # Project documentation  
```

---

## 🛠️ **Installation & Setup**  

### 🔹 **1. Clone the repository**  
```bash
git clone https://github.com/yourusername/smart-health-tracker.git
cd smart-health-tracker
```

### 🔹 **2. Set Up Backend (Node.js API)**
> **Requirements:** Node.js installed (https://nodejs.org/)  

1️⃣ Navigate to the backend folder:
```bash
cd backend
```
2️⃣ Install dependencies:
```bash
npm install
```
3️⃣ Start the server:
```bash
npm start
```
🚀 The backend should now be running at `http://localhost:3000`.

---

### 🔹 **3. Set Up Frontend (Flutter App)**
> **Requirements:** Flutter SDK installed (https://flutter.dev/docs/get-started/install)  

1️⃣ Navigate to the Flutter project:
```bash
cd smart_health_app
```
2️⃣ Install dependencies:
```bash
flutter pub get
```
3️⃣ Run the app:
```bash
flutter run
```
📱 The mobile app should launch in the emulator/device.

---

## 📈 **API Documentation**  

### 📌 **GET /workouts**
> Fetch all logged workouts.  

**Request:**  
```http
GET /workouts
Host: http://localhost:3000
```

**Response:**  
```json
[
  {
    "id": 1,
    "type": "Running",
    "duration": 30,
    "date": "2025-02-07T10:30:00Z"
  }
]
```

---

### 📌 **POST /workouts**
> Add a new workout.  

**Request:**  
```http
POST /workouts
Host: http://localhost:3000
Content-Type: application/json
```
**Body:**
```json
{
  "type": "Cycling",
  "duration": 45,
  "date": "2025-02-07T12:00:00Z"
}
```

**Response:**  
```json
{
  "id": 2,
  "type": "Cycling",
  "duration": 45,
  "date": "2025-02-07T12:00:00Z"
}
```

---

## 🔗 **Future Enhancements**
✅ **Authentication:** Google & Email login  
✅ **Database Integration:** MongoDB or Firebase  
✅ **Workout Analytics:** Graphs & progress tracking  
✅ **Nutrition Logging:** Diet & calorie tracking  

---

## 👨‍💻 **Contributors**  

| Name        | Role           | Contact                 |
|-------------|--------------|-------------------------|
| **Harish Karthick S**  | Developer  | harish.s@kalvium.community |


---

## 🐝 **License**
MIT License. Feel free to use & contribute.

---

## ❤️ **Support & Contribution**
Want to contribute?  
- Fork the repo 🍽️  
- Create a new branch 🌿  
- Make awesome changes ✨  
- Submit a Pull Request 🔥  

Give this project a ⭐ if you found it useful!  

