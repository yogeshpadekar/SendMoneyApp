# 💰 Send Money App

### A modern iOS app POC for sending money with dynamic forms, localization, and in-memory state management.

---

## 💡 **Project Overview**

The **Send Money App** is an iOS application that allows users to:  
- Select a **Service** and **Provider** dynamically.  
- Fill in the **form fields** generated dynamically based on the selected provider.  
- Perform **data validation** according to JSON-defined rules.  
- Save the money transfer request in the app’s state.  
- View all saved requests with detailed information in JSON format.  
- Switch between **English** and **Arabic** at runtime with full localization support.  

---

## ⚙️ **Architecture & Design Choices**

### **Architecture**
The app follows the **MVVM (Model-View-ViewModel)** architecture pattern, ensuring:  
- **Separation of concerns** → Clean separation between business logic, data handling, and UI.  
- **Reusability and testability** → The ViewModel handles the business logic, making the app easy to test.  
- **Scalability** → Makes the project easily extendable and maintainable.

---

### **Design Choices**

- **Dynamic Form Generation:**  
   - Form fields are dynamically generated based on the **JSON schema**, making the app adaptable to changes in field definitions.  

- **Localization with Runtime Language Switching:**  
   - Supports **English** and **Arabic** languages.  
   - Allows switching the language at runtime without restarting the app.  
   - Localized strings include **placeholders** for dynamic content.  

- **State Management:**  
   - The app uses **`@EnvironmentObject`** and **`@Published` properties** for in-memory state management.  
   - `AppState` handles the application state and maintains the saved requests.

- **Validation Logic:**  
   - Each field uses **regular expressions (Regex)** for validation.  
   - Numeric fields are restricted to only **numbers**.  
   - Maximum and minimum length constraints are applied.  

- **Toast Notifications:**  
   - Toast messages display the **status of request saving**.  
   - Animations ensure smooth user feedback.

---

## 🔧 **Technologies Used**

| **Technology**         | **Purpose**                         |
|-------------------------|-----------------------------------|
| **SwiftUI**             | UI framework for building views.   |
| **Combine**             | Reactive programming for state management. |
| **Localization (String Catalog)** | Runtime language switching with catalog support. |
| **XCTest**               | Unit testing framework.           |
| **MVVM Architecture**   | Separation of business logic and UI. |

---

## 🚀 **Build and Run Instructions**

### **Prerequisites**
- **Xcode 15.3 or later**.  
- **iOS 17 or newer**.  

---

### ✅ **Building the Project**

1. **Open folder SendMoneyApp and double click the file  SendMoneyApp.xcodeproj to open it with Xcode**
2. **Click on RUN icon in Xcode. The app will open in a simulator**
