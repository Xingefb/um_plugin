#import "UmPlugin.h"
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>

@implementation UmPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"um_plugin"
            binaryMessenger:[registrar messenger]];
  UmPlugin* instance = [[UmPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"setup" isEqualToString:call.method]) {
        [self setupWithMethodCall:call result:result];
    } else if ([@"setAutoPageEnabled" isEqualToString:call.method]) {
        [self setAutoPageEnabledWithMethodCall:call result:result];
    } else if ([@"addEvent" isEqualToString:call.method]) {
        [self addEventWithMethodCall:call result:result];
    } else if ([@"eventDict" isEqualToString:call.method]) {
        [self eventDictWithMethodCall:call result:result];
    }else if ([@"beginPage" isEqualToString:call.method]) {
        [self beginPageWithMethodCall:call result:result];
    } else if ([@"endPage" isEqualToString:call.method]) {
        [self endPageWithMethodCall:call result:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)setupWithMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"um appkey%@",call.arguments[@"appKey"]);
    [UMConfigure initWithAppkey:call.arguments[@"appKey"] channel:call.arguments[@"channel"]];
    [UMConfigure setEncryptEnabled:YES];
}
- (void)beginPageWithMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    [MobClick beginEvent:call.arguments[@"name"]];
}
- (void)endPageWithMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    [MobClick beginEvent:call.arguments[@"name"]];
}
- (void)addEventWithMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    [MobClick event:call.arguments[@"eventId"] label:call.arguments[@"label"]];
}
- (void)eventDictWithMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    [MobClick event:call.arguments[@"eventId"] attributes:call.arguments[@"dict"]];
//    [MobClick event:call.arguments[@"id"]];
}
- (void)setAutoPageEnabledWithMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    [MobClick setAutoPageEnabled:YES];
}

@end
