
#import <UIKit/UIKit.h>

typedef enum{
    kCuzyAdBarContentSizeStylePortrait,
    kCuzyAdBarContentSizeStyleLandscape
} CuzyAdBarContentSizeStyle;
@class CuzyAdBarView;
@protocol CuzyAdBarViewDelegate <NSObject>
-(void)adImageDidLoaded:(CuzyAdBarView*)adView;
@end

@interface CuzyAdBarView : UIView
@property(nonatomic,weak)id<CuzyAdBarViewDelegate> delegate;
@property(nonatomic)CuzyAdBarContentSizeStyle contentSizeStyle;

@end
