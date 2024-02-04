<img width="60" alt="spotlight120" src="https://github.com/PedroMMoreno93/BusRoutePlanner/assets/136183437/b802f5b2-9f2a-44fe-bbd5-c8072e1c02af">

# BusRoutePlanner

## 📱 Overview 
A simple trip manager for a bus-on-demand solution. This tool will be used by the operators of the service in order to see the trips available in the system.

<img src="https://github.com/PedroMMoreno93/BusRoutePlanner/assets/136183437/939c33b9-06e9-438f-82bf-ca74f561db08" width="195.0" height="422.0" />
<sup></sup>

<img src="https://github.com/PedroMMoreno93/BusRoutePlanner/assets/136183437/b117b447-51c8-49e4-8325-6ddf4c672caf" width="195.0" height="422.0" />
<sup></sup>


## 📋 Table of Contents 
1. [Getting Started](#🚀-getting-started)
    * [Prerequisites](#prerequisites)
    * [Installation](#installation)
2. [Usage](#🛠-usage)
3. [Features](#🎉-features)
4. [Contributing](#🤝-contributing)
5. [Acknowledgments](#🙏-acknowledgments)

## 🚀 Getting Started
### Prerequisites
The app has been developed using **XCode 15.2**, and built for iOS 17.0.
You'll also need to be provided the file **Secrets.swift** 

### Installation
Download the repo and open the project in XCode. Then add the provided file **Configuration.swift** to the folder *Source/Setup*. Click on the checkboxes as the screenshot below:

![Captura de pantalla 2024-02-04 a las 18 50 31](https://github.com/PedroMMoreno93/BusRoutePlanner/assets/136183437/ff3b1a83-2b9d-423c-bf1e-54ac2253864c)

## 🎉 Features
The application displays a map with a list of available trips. Each trip has a defined route with an origin, a destination and a series of stops.
To see detailed information about a trip, click on your card. Its status may be in progress, scheduled, cancelled or completed.
It will also be able to interact with the markers present on the user's map, informing about the name of the origin/destination or the distance to the origin in the case of stops.

Additionally, the user can open an issue by pressing the first button on the top right. Pressing it will open a form with a series of fields to be filled out. Upon completion, the user will be able to
save the theme.

The number of saved themes will be displayed in both the application badge and the second button in the main window. Also, the user will be able to access, through this second button, a list of the saved questions, which can be
consult to see its details, or delete it.


The app has been designed and developed to consider users' different needs regarding visual sizing. Thus, the app's main elements scale to respond to the dynamic type selected by the user.
Besides, the color system adapts to both theme modes, light and dark. 

The design of the different views follows a guide to make the whole app look homogeneous and clean.


## 🤝 Contributing
1. Fork the repository
2. Create a new branch (git checkout -b feature/your-feature)
3. Make changes and commit (git commit -m 'Add new feature')
4. Push to the branch (git push origin feature/your-feature)
5. Create a pull request

## 🙏 Acknowledgments & Attribuitions
This app has not been developed to be released. There's no intention either to commercialize it. The app uses the following 3rd Party libraries and elements:

* Maps SDK: [Google Maps SDK For iOS Swift package](https://github.com/googlemaps/ios-maps-sdk) 
* App icon: [Route icons created by Freepik](https://www.flaticon.com/free-icon/route_2055407)
* Bus icon: [Bus icons created by Vectors Market - Flaticon](https://www.flaticon.com/free-icons/bus)
* Bus stop icon: [Bus stop icons created by mavadee - Flaticon](https://www.flaticon.com/free-icon/bus-stop_3448339?term=bus+stop&page=1&position=10&origin=search&related_id=3448339)
* Finish icon: [Start icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/start)
