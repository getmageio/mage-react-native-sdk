<p align="center"><a href="https://www.getmage.io/"><img width="660" src="https://uploads-ssl.webflow.com/5eb96fb23eccf7fcdeb3d89f/5ef20b997a17d70677effb6f_header.svg"></a></p>

# Mage React Native SDK

Distributing products globally should not be a one price fits all strategy. Get started with Mage to scale your products worldwide!

Before implementing the SDK please *read and complete* the [integration guide](https://www.getmage.io/documentation) on our website.

## Requirements
Please note that our SDK currently just works on iOS 11 and up.

## Getting started

`$ npm install @getmageio/react-native-mage --save`

On iOS run `$ cd ios && pod install && cd ..` to install the native dependencies

## Usage

### 1) Import the React Native Mage SDK

```javascript
import {Mage} from '@getmageio/react-native-mage'
```

### 2) Set the API Key 

```javascript
Mage.setOptions({
  // Set your API key
  apiKey: "YOUR_API_KEY",
  // Indicate if your app is running on a consumer device.
  // Please not that production should not be set to true if your app runs on real testing devices!
  // Default: false
  production: true,
  // Optional: strict mode. The SDK will crash when errors occur.
  // This way you can test if you set up the SDK correctly!
  // Default: false
  strict: false
})
```

### 3) Get your in app purchase IDs

Wherever you show in app purchases, call `getIdFromProductName` to get the correct in app purchase ID. This could be, for example, somewhere in your ViewController for your store view / popup.

```javascript
Mage.getIdFromProductName("myProduct", "com.myapp.myFallBackID", (inAppPurchaseId) => {
  // work with inAppPurchaseId 
})
```

### 4) Know what you sold

In some cases, you might want to know what the user bought so you can send it to a CRM,
your own backend or for some custom logic inside your app. `getProductNameFromId` will help you out!

```javascript
Mage.getProductNameFromId("com.myapp.someIapID", (err, productName) => {
  if(!err){
    // work with productName 
  }
})
```

### 5) Identify the user for our Subscription Lifetime Value Tracking (optional)
Subscription status tracking is usually done on your backend or by some third party service. Apple or Google sends real-time subscription status updates that you interpret and take action on. This is why we provide a simple Web API to enable subscription lifetime value tracking for Mage. Apple or Google contacts your backend, your backend contacts Mage.

This way, we can adequately track the durations of your subscriptions and identify free trial and introductory price offer conversion rates. To make this feature work, you need to implement the `setUserIdentifier` method so that we can identify the calls from your backend. [Learn more about our Subscription Lifetime Value Tracking Feature](link...).

```javascript
Mage.setUserIdentifier("myUserIdentifier")
```

### 6) Report purchases (Android only)

On iOS there is no need to report a purchase since that is handled automatically. However auto-purchase tracking is not yet implemented in our Android Java SDK.
Whenever a user makes a purchase you need to report it.

```javascript
if (Platform.OS === 'android'){
  Mage.userPurchased("com.myapp.someIapID")
}
```