# MVVM

MVVMs main focus is "separation of concerns", separates the user interface logic from the business logic or in other words, keep the UI clean so it can be easy to manage. MVVM pattern fits nicely for data-centric applications, with apps that load data from a database (CRUD) applications.

## Layers

MODEL: Is data-centric, represents the entities and models of the business logic.

VIEW: It's responsible for implementing the visual parts of the application and in the general case it must not contain any logic that requires unit-testing.

VIEW-MODEL: Interacts with Model and prepares observables for the View. ViewModel should be decoupled from the View and should not be aware of the View it's interacting with. 

## Repository

The repository is created to consider the redux store as the single source of truth for the app. Even in the case that the redux data is outdated the app will consider them as valid up until a fresh feed of data is retrieved from a webService. 