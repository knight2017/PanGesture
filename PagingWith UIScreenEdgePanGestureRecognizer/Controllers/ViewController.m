//
//  ViewController.m
//  UIScreenEdgePanGestureRecognizerWithPaging
//  Copyright (c) 2015 Intelligrape. All rights reserved.
//

#import "ViewController.h"
#import "ProfileView.h"

@interface ViewController ()<UIGestureRecognizerDelegate>{
    NSArray *photosUrlArray;
    NSInteger currentIndex;
    
    ProfileView *centerProfileView;
    ProfileView *leftProfileView;
    ProfileView *rightProfileView;
    
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    UIScreenEdgePanGestureRecognizer *leftEdgeGesture;
    UIScreenEdgePanGestureRecognizer *rightEdgeGesture;
}

@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
    [self addGestureRecognizer];
    [self configurePagingViews];
}





#pragma mark - Private Methods

-(void)commonInit{
    currentIndex = 0;
    screenWidth = self.view.frame.size.width;
    screenHeight = self.view.frame.size.height;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    photosUrlArray = [[NSArray alloc]initWithObjects:@"A Photographer.jpg",@"A Song of Ice and Fire.jpg",@"Another Rockaway Sunset.jpg",@"Antelope Butte.jpg",nil];
}

-(void)configurePagingViews{
    
    centerProfileView =[[ProfileView alloc]initWithFrame:CGRectMake(0 , 0, self.view.frame.size.width, self.view.frame.size.height) withArray:photosUrlArray currentIndex:0];
    centerProfileView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:centerProfileView];
}


// Creating object of Left and Right UIScrennEdgePangesture

-(void)addGestureRecognizer{
    
    leftEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftEdgeGesture:)];
    leftEdgeGesture.edges = UIRectEdgeLeft;
    leftEdgeGesture.delegate = self;
    [self.view addGestureRecognizer:leftEdgeGesture];
    
    rightEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightEdgeGesture:)];
    rightEdgeGesture.edges = UIRectEdgeRight;
    rightEdgeGesture.delegate = self;
    [self.view addGestureRecognizer:rightEdgeGesture];

}


#pragma mark - Handle Left ScreenEdgePanGesture


- (void)handleLeftEdgeGesture:(UIScreenEdgePanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat  percent = MAX([gesture translationInView:self.view].x, 0)/width;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            
            if(--currentIndex <0){
                return;
            }
            
            leftProfileView = [[ProfileView alloc]initWithFrame:CGRectMake(-screenWidth ,0,screenWidth, screenHeight) withArray:photosUrlArray currentIndex:currentIndex];
            [self.view addSubview:leftProfileView];
            
            UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:leftProfileView.bounds];
            leftProfileView.layer.masksToBounds = NO;
            leftProfileView.layer.shadowColor = [UIColor blackColor].CGColor;
            leftProfileView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
            leftProfileView.layer.shadowOpacity = 1;
            leftProfileView.layer.shadowPath = shadowPath.CGPath;
        }
            break;
        case UIGestureRecognizerStateChanged:
            
            if(currentIndex <0){
                return;
            }
            centerProfileView.frame=CGRectMake(0 + translation.x/3, 0, screenWidth, 480);
            leftProfileView.frame=CGRectMake(-screenWidth + translation.x, 0, screenWidth, 480);
            [leftProfileView setUserInteractionEnabled:NO];
            [self.view setUserInteractionEnabled:NO];
            break;
            
            
        case UIGestureRecognizerStateEnded:
            if(currentIndex <0){
                currentIndex=0;
                return;
            }
            if (percent > 0.5 || fabs([gesture velocityInView:self.view].x) > 20)
            {

                [UIView animateWithDuration:0.2 delay:0.0 options:
                 UIViewAnimationOptionTransitionNone animations:^{
                     centerProfileView.frame=CGRectMake(screenWidth  , self.view.frame.origin.y,screenWidth,screenHeight);
                     leftProfileView.frame=CGRectMake(0, self.view.frame.origin.y,screenWidth,screenHeight);
                 }
                                 completion:^ (BOOL completed) {
                                     [centerProfileView removeFromSuperview];
                                     centerProfileView=leftProfileView;
                                 }];
            }else{
                [UIView animateWithDuration:0.2 delay:0.0 options:
                 UIViewAnimationOptionTransitionNone animations:^{
                     
                     centerProfileView.frame=CGRectMake(0  , self.view.frame.origin.y,screenWidth,screenHeight);
                     leftProfileView.frame=CGRectMake(-screenWidth, self.view.frame.origin.y,screenWidth,screenHeight);
                 } completion:^ (BOOL completed) {
                     
                     [leftProfileView removeFromSuperview];
                     leftProfileView=nil;
                     currentIndex++;
                 }];
            }
            [leftProfileView setUserInteractionEnabled:YES];
            [self.view setUserInteractionEnabled:YES];
            break;
        default:{
            
        }
    }
    
}

#pragma mark - Handle Right ScreenEdgePanGesture

- (void)handleRightEdgeGesture:(UIScreenEdgePanGestureRecognizer *)gesture
{
    
    CGPoint translation = [gesture translationInView:gesture.view];
    CGFloat width = self.view.frame.size.width;
    CGFloat percent = MAX(-[gesture translationInView:self.view].x, 0)/width;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            if(++currentIndex>=[photosUrlArray count]){
                return;
            }
            rightProfileView = [[ProfileView alloc]initWithFrame:CGRectMake(screenWidth , 0, screenWidth, screenHeight) withArray:photosUrlArray currentIndex:currentIndex];
            [self.view addSubview:rightProfileView];
            
            UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:rightProfileView.bounds];
            rightProfileView.layer.masksToBounds = NO;
            rightProfileView.layer.shadowColor = [UIColor blackColor].CGColor;
            rightProfileView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
            rightProfileView.layer.shadowOpacity = 1;
            rightProfileView.layer.shadowPath = shadowPath.CGPath;
        }
            break;
        case UIGestureRecognizerStateChanged:
            if(currentIndex>=[photosUrlArray count]){
                return;
            }
            
            centerProfileView.frame=CGRectMake(0 + translation.x/3, 0,screenWidth, 480);
            
            rightProfileView.frame=CGRectMake(screenWidth + translation.x, 0, screenWidth, 480);
            [rightProfileView setUserInteractionEnabled:NO];
            [self.view setUserInteractionEnabled:NO];
            
            break;
        case UIGestureRecognizerStateEnded:
            
            if(currentIndex>=[photosUrlArray count]){
                currentIndex = [photosUrlArray count]-1;
                return;
            }
            if (percent > 0.5 || fabs([gesture velocityInView:self.view].x) > 20)
            {
                [UIView animateWithDuration:0.2 delay:0.0 options:
                 UIViewAnimationOptionTransitionNone animations:^{
                     
                     centerProfileView.frame=CGRectMake(-screenWidth  , self.view.frame.origin.y,screenWidth, screenHeight);
                     rightProfileView.frame=CGRectMake(0, self.view.frame.origin.y, screenWidth,screenHeight);
                     
                 }
                                 completion:^ (BOOL completed) {
                                     [centerProfileView removeFromSuperview];
                                     centerProfileView=rightProfileView;
                                 }];
            }else {
                [UIView animateWithDuration:0.2 delay:0.0 options:
                 UIViewAnimationOptionTransitionNone animations:^{
                     centerProfileView.frame=CGRectMake(0  , self.view.frame.origin.y,screenWidth, screenHeight);
                     rightProfileView.frame=CGRectMake(screenWidth, self.view.frame.origin.y,screenWidth, screenHeight);
                 } completion:^ (BOOL completed) {
                     [rightProfileView removeFromSuperview];
                     rightProfileView=nil;
                     currentIndex--;
                 }];
            }
            [rightProfileView setUserInteractionEnabled:YES];
            [self.view setUserInteractionEnabled:YES];
            break;
        default:{
            
        }
    }
}



@end
