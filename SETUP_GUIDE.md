# BrickBook - Setup Guide

## 🎯 Problem Solved

The error `Failed host lookup: 'api.brickbook.app'` occurs because the app tries to connect to a production backend that doesn't exist yet.

## ✅ Solution: Mock API Server

We've implemented a **local mock server** so you can run and test the app without a real backend.

---

## 🚀 Quick Start (3 Steps)

### **Option A: With Mock Server (Recommended)**

1. **Open a terminal** in the project folder
2. **Start the mock server:**
   ```bash
   dart run mock_server.dart
   ```
   You should see:
   ```
   🚀 BrickBook Mock API running on http://localhost:8080
   ```
3. **Open another terminal**, run the app:
   ```bash
   flutter run
   ```

> The mock server provides fake data for all API endpoints (projects, dashboard, auth, etc.) and works offline.

---

### **Option B: No Server (Built-in Fallbacks)**

The app has **built-in mock data fallbacks**. Even if the server isn't running, the repository returns sample data automatically.

Just run:
```bash
flutter run
```
and it will work! (You'll see debug warnings about failed API calls, but mock data displays)

---

## 📡 How It Works

### **1. API Endpoints Configuration**
File: `lib/core/network/api_endpoints.dart`
```dart
static const String baseUrl = 'http://localhost:8080/api';  // Development
// static const String baseUrl = 'https://api.brickbook.app/api'; // Production
```

### **2. Mock Server**
File: `mock_server.dart` + `mock_db.dart`

Runs a lightweight Dart HTTP server on port 8080 serving:
- `GET    /api/projects` → Returns 3 sample projects
- `GET    /api/projects/:id` → Single project with phases
- `GET    /api/dashboard/summary` → Dashboard stats
- `POST   /api/projects` → Creates a new project
- `PUT    /api/projects/:id` → Updates project
- `DELETE /api/projects/:id` → Deletes project
- `GET    /api/projects/:id/phases` → Project phases
- `GET    /api/projects/:id/members` → Team members
- `POST   /api/login` → Mock authentication
- `POST   /api/register` → Mock registration

### **3. Repository Fallback**
File: `lib/features/projects/data/project_repository.dart`

Every API method has a try-catch that returns **mock data** if the HTTP call fails. This means:
- Without server → mock data displayed ✅
- With server running → real API calls succeed ✅

---

## 🎨 What You'll See

After login, the dashboard shows:

### **Dashboard Screen**
- Greeting header with your name
- **Stats chip row:** Total Projects | Active | Total Spent
- **Budget Overview:** Progress bar, spent vs budget
- **Recent Projects:** 3 sample project cards with:
  - Project type icon (🏠 🏢 🔨)
  - Name & location
  - Status badge (Active/Over Budget/On Hold)
  - Budget breakdown + progress bar
- **FAB:** "+ New Project" button

### **Projects List**
- Filterable tabs: All | Active | On Hold | Done
- Project cards with icons and progress bars

### **Project Detail**
- Tabbed interface: Expenses | Budget | Phases | Team
- Budget tab shows KPI cards and phase breakdown
- Phases tab shows phase cards with status bars
- Team tab with invite dialog

---

## 🔧 Troubleshooting

### **"Failed host lookup" error still appears**
1. Check if mock server is running on port 8080
2. Or ensure `baseUrl` in `api_endpoints.dart` is set to `http://localhost:8080/api`
3. The repo fallback should still show data — check debug console

### **Port 8080 already in use**
Kill the process or change port in both:
- `mock_server.dart` line: `HttpServer.bind(..., 8080)` → change 8080
- `api_endpoints.dart` line: baseUrl accordingly

### **No data showing on dashboard**
- Verify mock server is running
- Check terminal for errors from `mock_server.dart`
- Hot restart the app (`R` in terminal or hot restart button)
- Call `ref.invalidate(dashboardSummaryProvider)` to force refresh

---

## 📁 Files Modified/Created

### **New Files**
- `mock_server.dart` - Local API server
- `mock_db.dart` - Sample data
- `start_mock_server.bat` - Windows batch file to start server

### **Modified Files**
- `lib/core/network/api_endpoints.dart` - Changed baseUrl to localhost
- `lib/features/projects/data/project_repository.dart` - Added mock fallback

### **Already Implemented (Step 3)**
- `lib/features/dashboard/screens/dashboard_screen.dart`
- `lib/features/projects/screens/projects_list_screen.dart`
- `lib/features/projects/screens/create_project_screen.dart`
- `lib/features/projects/screens/project_detail_screen.dart`
- `lib/features/projects/data/models/project_models.dart`
- `lib/features/projects/providers/project_providers.dart`
- `lib/core/widgets/bb_shimmer.dart`

---

## 🎮 Testing the App

1. **Start mock server:**
   ```bash
   dart run mock_server.dart
   ```

2. **In another terminal, run Flutter:**
   ```bash
   flutter run
   ```

3. **Login flow:**
   - Any email + password `password123` works
   - Or register a new account (any details)
   - After login → Dashboard appears with mock data

4. **Test features:**
   - Click "+ New Project" → Fill form → Create
   - Navigate to Projects list → Filter by status
   - Tap a project → View detail tabs
   - Bottom nav switches between Home/Projects

---

## 📊 Sample Login Credentials

For testing the mock auth:
```
Email:    test@example.com
Password: password123
```

Or register with any name/email/password combo.

---

## 🎯 Next Steps

When the real backend is ready:
1. Change `baseUrl` back to `https://api.brickbook.app/api`
2. Remove try-catch mock fallbacks from repositories (or set `_useMock = false`)
3. Stop running the mock server
4. Test with real API

---

## 🐛 Debug Tips

- **Check API calls:** Open browser DevTools → Network tab to see requests
- **Logs:** Mock server logs every request to console
- **Hot reload:** Make code changes and press `r` in terminal
- **Clear storage:** Delete app data or call `storage.clearAll()` to reset login

---

**You're all set! The dashboard should now show beautiful mock data. 🎉**
