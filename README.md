# My First SwiftUI Project - To Do App 
A simple Todo App built in SwiftUI, following the MVVM architecture, with Firebase integration for authentication. 
The app demonstrates async operationsm reactive UI with ViewMOdels, and clean separation of concerns. 


## Features 
- **ProfileView** - Displays user profile information from Firebase.
- **TodoView** - Shows todos from the user's collection.
- **NewItemView** - Add a new todo with a title and due date.
- **Delete Todos** - Swipe to delete todos.
- **ToggleAuthenticationCompletion** - Mark todos as done or undone.
- **Authentication** - Login and register users using Firebase Auth.

## Architecture
- **MVVM**: Separates Models, Views and ViewModels for maintainable code.
- **Repositories**: Handle all Firebase CRUD operations and authentication.
- **Async Operations**: All Firebase calls are asynchronous.
- **Reactive UI**: @Published properties in ViewModels automatically update Views. 

## Future Implementation 
- Add members to todos
- Add Profile picture and save to Firebase Storage.
- Update how todo is going
  

