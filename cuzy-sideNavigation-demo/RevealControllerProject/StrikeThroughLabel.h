//
//  StrikeThroughLabel.h
//  StrikeThroughLabelExample
//
//  Created by Scott Hodgin on 12/14/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StrikeThroughLabel : UILabel {
    BOOL _strikeThroughEnabled;
}

@property (nonatomic) BOOL strikeThroughEnabled;

@end
