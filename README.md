## Notes
This is the test app done in flutter for ANA.
It has been done using the latest Flutter release with nullsafety

### Date
25-Aug-2021

### Instructions for how to build & run the app
Just run the following commands:
 * flutter clean
 * flutter pub get
 * Create an Android emulator and run it there
### Time spent
It was 12 hours
### Assumptionsmade

I used a provider to add as many cities as you whish.

### Shortcuts/Compromisesmade
Many things, look and feel could be better. Using a Shared preferences for storing information


### Why did you choose the technology/framework you used?

I used Bloc pattern for my current location, the idea is it sink data when coordenates change, in other words, when the device move to another city
I used provider for keeping the list of cities

### Stretch goals attempted
I did not configure the solution for IOS because I have no time for testing it.

### What did you not include in your solution that you want us to know about?
The clean code architecture, it is easy to folow 

### Your feedback on this technical challenge
It was good, in the begining I thought it was going to be easier and then when I started working with GPS I realized it was not so easy. The test is ok, it covers almost everything (Api calls, GPS, state management and more)