Submission for the take home test with Grip. I'm using Swift and SwiftUI to make a simple Pokedex app that gives the user a list of pokemon which they can scroll through and then view specific details for each pokemon. 

To achieve this I decided to implement a MVVM architecture pattern to seperate the Data from the UI. We have Data models for Pokemon and Pokedex pages that conform to the JSON structure returned by pokeapi. We then have viewodels that call the network requests and handle the business logic for the ui. 

I decided to try to split the UI up into as many views as possible to improve the testability of the ui components and also make the code more readable. There is space for further refactoring here. That would come with changes to make the UI more interesting but the time constraint didn't allow for it. I am happy with how the UI turned out.

The pokedex makes use of pagination to load in new pokemon when the user reaches the bottom of the current list. This makes the api calls extremely fast and less likely to time out errors. Errors in the API calls are being handled however and the user does have the chance to reload the list or an individual pokemon if an error occurs. 

**Possible Improvements**
The Stats view could be changed in the future. The system I have at the moment is not as readable as it could be. Using a TableView would be a good option but the data model would have to be changed to be Identifiable.

One thing I would change is to break out the API calls into a Network manager as I think for the application to be considered CLEAN, the API calls shouldn't happen in the View Model. Also this would make the app much easier to test. 

Another thing that could be added are DTO's to again obscure the JSON data format from the UI. 

I would have liked to add unit tests as well but wanted to respect the time limit of the task. I think what would benefit most from this would be the API calls themselves. So if I had more time my first course of action would be to separate the API calls and then test the calls.

**Closing Comments**
I just want to say thank you for giving me the opportunity to do this coding challenge. It was good fun and I really enjoyed putting it together. I'm looking forward to hearing from you soon and hopefull getting the opportunity to talk more about the task and my choices. 
