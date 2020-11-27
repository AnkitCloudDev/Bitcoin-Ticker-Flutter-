# Bitcoin-Ticker-Flutter-
Simple Mobile Application to tell the price of different crypto-currencies


[![Bitcoin Ticker](http://img.youtube.com/vi/owXJUmtBEdg/0.jpg)](https://youtu.be/owXJUmtBEdg)
>>>>>>> 5805d167f5d9f515da9ee74dac7e37c5c3b6b779

# How to Run the APP
1. Install flutter from here
https://flutter.dev/docs/get-started/install
2. Optionally you can Install Android Studio from
https://developer.android.com/studio?gclid=CjwKCAiA2O39BRBjEiwApB2IklUot2wKA2863SbV3BOxu44idrakcjggZIq-dmIz9_PA4jDQnosbmhoCgx8QAvD_BwE&gclsrc=aw.ds
3. Clone/Download the code repo and extract it
4. Goto https://www.coinapi.io/ and create an account
5. Get the Free API key
6. use your API key in the APP by replace the kApi_key constant to the value of your API key. If your API key is 143513414. The kApi_key should look like:
    const kApi_key="?apikey=143513414";
    //use your own API key
    // TODO: GOTO https://www.coinapi.io/Pricing, scroll down and click get a free API key. Create an account and you will get a free API key mailed to you,
7. Goto to the root folder of the code and type:
    flutter build apk for Android
    or flutter build ios for ios

### NOTE: If you ge error flutter command not found then include flutter in your PATH environmental variable
## Install an APK on a device
Follow these steps to install the APK on a connected Android device.

From the command line:

Connect your Android device to your computer with a USB cable.
Enter cd <app dir> where <app dir> is your application directory.
Run flutter install.


