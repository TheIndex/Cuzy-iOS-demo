//
//  AppDelegate.h
//
//
//  Created by Alex on 3/22/12.
//  Copyright (c) 2012 theindex. All rights reserved.
//#import <Foundation/Foundation.h>


#define DEVICE_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define DEVICE_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define IS_IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


@interface DataSingleton : NSObject{
   
    NSString* strInformation;
    
    int newSearchNeeded;
    NSString* searchString;
    NSMutableArray* TweburlArray;
    
};
@property(nonatomic, retain)NSMutableArray* TweburlArray;
@property(nonatomic, assign)    int newSearchNeeded;
@property(nonatomic, retain)    NSString* searchString;



@property(nonatomic, retain)NSString* strInformation;
+ (DataSingleton *)singleton;

@end

