#import "MageReact.h"
#import <Mage/Mage.h>
#import "RCTUtils.h"

@implementation MageReact

// we use Node's convention to make the first parameter an error object (usually null when there is no error) and the rest are the results of the function.
RCT_EXPORT_MODULE();

+ (BOOL)requiresMainQueueSetup{
   return NO;
}

// This is not really needet but can be used to init the module seperatly to reduce overall load
RCT_EXPORT_METHOD(sharedInstance){
    [Mage sharedInstance];
}

RCT_EXPORT_METHOD(setOptions: (NSDictionary*)options){
    [[Mage sharedInstance] setOptions:options];
}

RCT_EXPORT_METHOD(getIdFromProductName: (NSString*)productName withFallback:(NSString*)fallbackID withCallback: (RCTResponseSenderBlock)callback){
    NSString *productId = [[Mage sharedInstance] getIdFromProductName:productName withFallback:fallbackID];
    callback(@[productId]);
}

RCT_EXPORT_METHOD(getProductNameFromId: (NSString*)iapID withCallback: (RCTResponseSenderBlock)callback){
    [[Mage sharedInstance] getProductNameFromId:iapID completionHandler:^(NSError * _Nonnull err, NSString * _Nonnull productName) {
        if(err){
            callback(@[RCTMakeError(@"Product name not found", nil, nil)]);
        }else{
            callback(@[[NSNull null], productName]);
        }
    }];
}
@end
