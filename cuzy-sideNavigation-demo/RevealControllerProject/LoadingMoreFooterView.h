//
//  LoadingMoreFooterView.h
//  Miu Ptt
//
//  Created by Xingzhi Cheng on 3/6/12.
//  Copyright (c) 2012 TheIndex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingMoreFooterView : UIView
@property(nonatomic, readwrite) BOOL showActivityIndicator;
@property(nonatomic, readwrite, getter = isRefreshing) BOOL refreshing;
@property(nonatomic, readwrite) BOOL enabled;   // in case that no more items to load
@property(nonatomic, readwrite) UITextAlignment textAlignment;
@end
