//
//  AppDelegate.h
//  
//
//  Created by Alex on 3/22/12.
//  Copyright (c) 2012 theindex. All rights reserved.
//

#import "DataSingleton.h"

@implementation DataSingleton

@synthesize strInformation;
@synthesize newSearchNeeded,searchString;
@synthesize TweburlArray;
static DataSingleton * MyCommon_Singleton = nil;

+ (DataSingleton *)singleton

{
    
    @synchronized(self)
    {
        if  (MyCommon_Singleton  ==  nil)
        {
            MyCommon_Singleton=[[[DataSingleton alloc] init] autorelease];
            MyCommon_Singleton.strInformation = @"in dataSingleton";
            MyCommon_Singleton.newSearchNeeded = 0;
            MyCommon_Singleton.searchString = @"";
            MyCommon_Singleton.TweburlArray = [[[NSMutableArray alloc] init] autorelease];
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1006"];
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1007"];
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1008"];
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1009"];
            
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1043"];
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1046"];
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1071"];
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1562"];
            [MyCommon_Singleton.TweburlArray addObject:@"http://r.m.taobao.com/m3?p=mm_31846197_4064295_13216326&c=1563"];

            
        }
    }
    
    return  MyCommon_Singleton;
    
}
+(void)resetDataSingleton
{
  
}
+  (id)allocWithZone:(NSZone  * )zone
{
    @synchronized(self)
    {
        if (MyCommon_Singleton  ==  nil)
        {
            MyCommon_Singleton  =  [super allocWithZone:zone];
            return  MyCommon_Singleton;
        }
    }
    
    return  nil;
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

//retain返回单例本身
- (id)retain
{
    return self;
}

//引用计数总是为1
- (unsigned)retainCount
{
    return 1;
}

//release不做任何处理
- (oneway void)release
{
    
}

//autorelease返回单例本身
- (id)autorelease
{
    return self;
}

//真release私有接口
-(void)realRelease
{
    [super release];
}


-(void)dealloc
{
   [super dealloc];
}






@end
