package io.getmage.reactnativeandroid;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReadableMap;
// TODO: coming soon
// import io.getmage.android.Mage;

public class MageModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public MageModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "MageReact";
    }

    @ReactMethod
    public void setOptions(ReadableMap options) {
        try {
            // Mage.setOptions(getReactApplicationContext(), options.toHashMap());
            Mage.setOptions(reactContext, options.toHashMap());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @ReactMethod
    public void userPurchased(String inAppId) {
        Mage.userPurchased(inAppId);
    }

    @ReactMethod
    public void getIdFromProductName(String productName, String fallbackId, Callback callback) {
        callback.invoke(Mage.getIdFromProductName(productName, fallbackId));
    }

    @ReactMethod
    public void getProductNameFromId(String iapID, Callback callback) {
        String productName = Mage.getProductNameFromId(iapID);
        if(productName != null){
            callback.invoke(null, productName);
        }else{
            // err
            callback.invoke("ERROR", null);
        }
    }
}
