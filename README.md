**Summary**
The App consist of 1 screen which list the recipes. The Name and cuisine are displayed on top of the image to bring a nice UI experience.
![simulator_screenshot_EC7CE2A8-00AF-430A-BF21-69919E890671](https://github.com/user-attachments/assets/37918630-8d10-418c-b5d0-c7b6a1ef5cbb)

**Focus Areas:**
 Modularizing: I have modularized the project into different modules based on the its work. This will help in the scalability of the project. 
 The unit test is added in the Networking Package.
 Networking: This module is responsible for networking codes
 Dependencies: This module has the Dependency injection related code
 Resources: This module will contain all the image, color, font and localizable files
 RecipesUI: This module will contain reusable UI 
 RecipesFoundation: This is similar to Foundation framework. The foundation level reusable items will be under this package.

 **Time Spent:**
 12 hrs
 Most time I spend on organizing the modules.

  **Trade-offs and Decisions:**
  The Networking layer is basic. This time it only considered the current project. Since it is a module, we always have the option to update it whenever needed.
  The dependency injection is done at the initial stage. There is another better way to do it. For now, I have added it at first when the app is loaded.

  **Weakest Part of the Project:**
  I have added all the options for error handling. If i have a UI we could display the error in a better way.
  There is a viewstate i have added for the view model. I can make that reusable by adding a protocol to all viewModels which make sure to implement view state in viewmodels which confirms to this protocol.

  **Additional Information:**
  The app is using packages for modularization. The unit testing is also written for networking package. I didnt write unit test for the view model since it doesnt have much logic involved.
