/*===============================================================================
 Copyright (c) 2015 PTC Inc. All Rights Reserved. Confidential and Proprietary -
 Protected under copyright and other laws.
 Vuforia is a trademark of PTC Inc., registered in the United States and other
 countries.
 ===============================================================================*/

#import <UIKit/UIKit.h>


@protocol SampleAppMenuDelegate <NSObject>

- (BOOL) menuProcess:(NSString *)itemName value:(BOOL) value;
- (void) menuDidExit;

@end


@interface SampleAppMenuViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (weak, nonatomic) id<SampleAppMenuDelegate> menuDelegate;

@property (nonatomic, readwrite) BOOL showingMenu;
@property (nonatomic, copy) NSString *dismissItemName;
@property (nonatomic, copy) NSString *sampleAppFeatureName;
@property (nonatomic, copy) NSString *backSegueId;
@property (nonatomic, readwrite) BOOL windowTapGestureRecognizerAdded;
@property (nonatomic, strong) UITapGestureRecognizer * windowTapGestureRecognizer;

+ (CGFloat)getMenuWidthScale;
- (void)setValue:(BOOL)value forMenuItem:(NSString*)name;


@end
