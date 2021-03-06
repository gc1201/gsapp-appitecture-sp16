/*===============================================================================
 Copyright (c) 2012-2015 Qualcomm Connected Experiences, Inc. All Rights Reserved.
 
 Vuforia is a trademark of PTC Inc., registered in the United States and other
 countries.
 ===============================================================================*/

#import "SampleAppAboutViewController.h"

@interface SampleAppAboutViewController (){
    UIButton *secondfButton;
    UIButton *thirdfButton;
    UIButton *fourthfButton;
    UIButton *sevenfButton;
}


@end

@implementation SampleAppAboutViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.appTitle = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"VuforiaSampleAppName"];
    //self.appAboutPageName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"VuforiaSampleAppAboutPage"];
    
    //[self loadWebView];
    
    // we set the UINavigationControllerDelegate
    // so that we can enforce portrait only for this view controller
    self.navigationController.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dismissAppController:)
                                                 name:@"kDismissAppViewController"
                                               object:nil];
    
    
    UIImage *img = [UIImage imageNamed:@"front.png"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:iv];
    
    // 1. creating and setting buttons
    secondfButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    secondfButton. frame = CGRectMake(50, 80, 200, 40);
    secondfButton.backgroundColor = [UIColor blueColor];
    [secondfButton setTitle:@"2F" forState:UIControlStateNormal];
    [secondfButton addTarget:self action:@selector(cameraDevice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:secondfButton];
    
    // 2. creating and setting buttons
    thirdfButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    thirdfButton. frame = CGRectMake(50, 160, 200, 40);
    thirdfButton.backgroundColor = [UIColor blueColor];
    [thirdfButton setTitle:@"3F" forState:UIControlStateNormal];
    [thirdfButton addTarget:self action:@selector(cameraDevice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdfButton];
    
    // 3. creating and setting buttons
    fourthfButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fourthfButton. frame = CGRectMake(50, 240, 200, 40);
    fourthfButton.backgroundColor = [UIColor blueColor];
    [fourthfButton setTitle:@"4F" forState:UIControlStateNormal];
    [fourthfButton addTarget:self action:@selector(cameraDevice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fourthfButton];
    
    // 4. creating and setting buttons
    sevenfButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sevenfButton. frame = CGRectMake(50, 320, 200, 40);
    sevenfButton.backgroundColor = [UIColor blueColor];
    [sevenfButton setTitle:@"7F" forState:UIControlStateNormal];
    [sevenfButton addTarget:self action:@selector(cameraDevice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sevenfButton];
    
     
    
     

    
    
    
    

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // We ensure the navigation bar is shown
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self setUiWebView:nil];
}

- (IBAction)onStartButton:(id)sender
{
    NSString *appNameNoWhiteSpaces = [self.appTitle stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *segueId = [NSString stringWithFormat:@"Push%@", appNameNoWhiteSpaces];
    [self performSegueWithIdentifier:segueId sender:self];
}

//------------------------------------------------------------------------------
#pragma mark - Autorotation
- (NSUInteger)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController
{
    return UIInterfaceOrientationPortrait;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return YES;
}

//------------------------------------------------------------------------------
#pragma mark - Private

- (void) dismissAppController:(id) sender
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)loadWebView
{
    self.uiWebView.delegate = self;
    
    //  Load html from a local file for the about screen
    NSString *aboutFilePath = [[NSBundle mainBundle] pathForResource:self.appAboutPageName
                                                              ofType:@"html"];
    
    NSString* htmlString = [NSString stringWithContentsOfFile:aboutFilePath
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
    
    NSString *aPath = [[NSBundle mainBundle] bundlePath];
    NSURL *anURL = [NSURL fileURLWithPath:aPath];
    [self.uiWebView loadHTMLString:htmlString baseURL:anURL];
}


//------------------------------------------------------------------------------
#pragma mark - UIWebViewDelegate

-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType
{
    //  Opens the links within this UIWebView on a safari web browser
    
    BOOL retVal = NO;
    
    if ( inType == UIWebViewNavigationTypeLinkClicked )
    {
        [[UIApplication sharedApplication] openURL:[inRequest URL]];
    }
    else
    {
        retVal = YES;
    }
    
    return retVal;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // Uncomment to have the double finger tap show the build number
//    UITapGestureRecognizer *gesture = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTouches:)] autorelease];
//    gesture.numberOfTouchesRequired = 2;
//    [webView addGestureRecognizer:gesture];
}

- (void) handleTouches:(UILongPressGestureRecognizer *)gesture {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Application Version Number"
                                                    message:[NSString stringWithFormat:@"Build number is: %@", version]
                                                    delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end
