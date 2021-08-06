# The Basic Concept App

My custom app design for the online pet-centric store, [The Basic Concept](https://www.thebasicconcept.com). 

Disclaimer: This was done as a personal project and is no way affiliated with the original brand!! If you woud like to get some cool stuff for your pet you can find their website at [thebasicconcept.com](https://www.thebasicconcept.com)

<br>

## App Preview

<img src="https://raw.githubusercontent.com/josh-umahi/josh-umahi/master/.github/images/tbc_video.gif" width="450"/>

<br>

## How this app was made

This app was built using the [flutter framework](https://flutter.dev/docs) and some additional external libraries from [pub.dev](https://pub.dev).
These include:

| Name                                                    | Usage                                               |
| ------------------------------------------------------- | --------------------------------------------------- |
| [**flutter_bloc**](https://pub.dev/packages/flutter_bloc)       | State Management                                    |
| [**http**](https://pub.dev/packages/http)      | Making HTTP requests       |
| [**shared_preferences**](https://pub.dev/packages/shared_preferences)       | Save data in device local storage                                 |
| [**equatable**](https://pub.dev/packages/equatable)                 | An equality comparison tool to use for testing my blocs                     |
| [**carousel_slider**](https://pub.dev/packages/carousel_slider) | A carousel slider widget |
| [**bloc_test**](https://pub.dev/packages/bloc_test) | For testing my cubits |

The backend consists of a JSON API created with [json-server](https://github.com/typicode/json-server) and hosted on [Heroku](https://www.heroku.com/), a great platform for quickly deploying servers and much more. The code for the backend is also on my github, [check it out!](https://github.com/josh-umahi/the-basic-concept-API)
