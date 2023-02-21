# acronyms_finder

Flutter project to allow users to search for acronyms.

## Getting Started

Make sure that you have permission to access acronyms api. [You can request here](http://www.nactem.ac.uk/software/acromine/rest.html) 

Installation:
- Go [here](https://flutter.dev/) to setup your local environment
- Once Local environment is set, then you run your ```flutter pub run build_runner build```
- Then you can run the program using ```flutter run```

##Architecture:
- Uses MVVM pattern, acheived using bloc state management. [More info here](https://bloclibrary.dev/#/)
- Business logic will be under bloc directory inside each module
- Service is layer uses singleton for better memory management
- Data serialization models will be under ```models``` directory 

#If you want to install the app in your Android phone, then download the app here and intall it directly on your device.