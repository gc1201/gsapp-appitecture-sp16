/*===============================================================================
Copyright (c) 2016 PTC Inc. All Rights Reserved.

Copyright (c) 2012-2015 Qualcomm Connected Experiences, Inc. All Rights Reserved.

Vuforia is a trademark of PTC Inc., registered in the United States and other 
countries.
===============================================================================*/

#import <UIKit/UIKit.h>
#import "OcclusionManagementEAGLView.h"
#import "SampleApplicationSession.h"
#include "SampleAppMenuViewController.h"
#import <Vuforia/DataSet.h>

@interface OcclusionManagementViewController : UIViewController <SampleApplicationControl, SampleAppMenuDelegate> {
    Vuforia::DataSet*  dataSet;
    
    // menu options
    BOOL continuousAutofocusEnabled;
    BOOL flashEnabled;
}

@property (nonatomic, strong) OcclusionManagementEAGLView* eaglView;
@property (nonatomic, strong) UITapGestureRecognizer * tapGestureRecognizer;
@property (nonatomic, strong) SampleApplicationSession * vapp;
@property (nonatomic, assign) BOOL showingMenu;

@end
