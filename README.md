# TodoList_MVVM_SwiftUI


To-Do List app from scratch using SwiftUI with a MVVM architecture pattern.
Also incorporate UserDefaults into the application to save and persist data between sessions.

**MVVM architecture:**

**M : Model**
The Model layer manages logic for specific pieces of data in our app.

**V : View**
The View layer is strictly responsible for the UI (user interface) of the application. Therefore, the view has all of the UI components but none of the logic for downloading/uploading/saving data.

**VM: View Model**
The ViewModel layer is often the most complex of the layers in MVVM because it includes most of the business logic for the app. 
This layer brings the entire app together and has connections to the View layer as well as the Model layer. 
Within the ViewModel, we will add all logic for downloading, updating, adding, and saving data for our app!
