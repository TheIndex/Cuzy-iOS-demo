//
//  imageCacheManager.h
//  trueNameSimpler
//
//  Created by Alex on 9/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface imageCacheManager : NSObject
{
}

+(void) setImageView: (UIImageView*) imageView withUrlString: (NSString *) urlString withPlaceHolder:(NSString*)placeHoderString;
+(void) setImageView: (UIImageView*)imageView withUrlString: (NSString *) urlString;
+(void) initCacheDirectory;
+(void) clearCache;
@end
