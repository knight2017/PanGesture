//
//  ProfileView.m
//  PagingWith UIScreenEdgePanGestureRecognizer
//  Copyright (c) 2015 Intelligrape. All rights reserved.
//

#import "ProfileView.h"

@interface ProfileView()<UITableViewDataSource,UITableViewDelegate>{
    UISegmentedControl *segmentControl;
    UIImageView *profileImageView;
    UITableView *profileTableView;
    NSArray *photosArray;
    NSInteger currentIndex;
    NSArray *tableData;
}
@end
@implementation ProfileView

-(id)initWithFrame:(CGRect)frame withArray:(NSArray *)photosUrlArray currentIndex:(NSInteger)index{
    self = [super initWithFrame:frame];
    if(self){
        photosArray = photosUrlArray;
        currentIndex = index;
        [self commonInit];
        [self configureSegmentControl];
        [self configureTableView];
        [self configureDataInView];
        
    }
    return self;
}




#pragma mark UITableView Data Source Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *profileCell;
    
    profileCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!profileCell){
        profileCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [profileCell.textLabel setText:[tableData objectAtIndex:indexPath.row]];
    return profileCell;
}




#pragma mark - Tableview Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Deselect cell
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView;
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [headerView setBackgroundColor:[UIColor whiteColor]];
    [headerView addSubview:segmentControl];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 44;
    
    return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}



#pragma mark - Private Methods


-(void)commonInit{
    tableData =  [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
}

-(void)configureSegmentControl{
    //segmentControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
    NSArray *segmentItemArray = [NSArray arrayWithObjects:@"PROFILE",@"PHOTOS",nil];
    segmentControl = [[UISegmentedControl alloc]initWithItems:segmentItemArray];
    segmentControl.frame = CGRectMake(0,0, self.frame.size.width,44);
    segmentControl.selectedSegmentIndex = 0;
}

-(void)configureTableView
{
    
    profileTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    profileTableView.delegate = self;
    profileTableView.dataSource = self;
    [profileTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 390)];
    [tableHeaderView setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 319, 320, 73)];
    [shadowImageView setImage:[UIImage imageNamed:@"profileGradient.png"]];
    [tableHeaderView addSubview:shadowImageView];
    
    UIImageView *gradientTopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 73)];
    [gradientTopImageView setImage:[UIImage imageNamed:@"gradientTop.png"]];
    [tableHeaderView addSubview:gradientTopImageView];
    
    [tableHeaderView bringSubviewToFront:gradientTopImageView];
    
    profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 390)];
    [tableHeaderView addSubview:profileImageView];
    [profileTableView setTableHeaderView:tableHeaderView];
    [profileTableView setBackgroundColor:[UIColor whiteColor]];
    
    [self addSubview:profileTableView];
}


-(void)configureDataInView{
    NSString *photoURLString = [photosArray objectAtIndex:currentIndex];
    [profileImageView setImage:[UIImage imageNamed:photoURLString]];
    [profileImageView setContentMode:UIViewContentModeScaleAspectFill];
}



@end
