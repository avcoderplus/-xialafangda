//
//  RootTableViewController.m
//  下拉放大+导航栏变化
//
//  Created by dllo on 15/11/2.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import "RootTableViewController.h"
#import "UINavigationBar+BackGroudColor.h"
@interface RootTableViewController ()
@property (nonatomic, retain)UIImageView *imageView;
@end

@implementation RootTableViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
   //  self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.tableView.contentInset = UIEdgeInsetsMake(200.0, 0, 0, 0);

    
    //相对于0点,图片坐标应该是(0,-200)
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200.0, self.view.frame.size.width, 200)];
    self.imageView.image = [UIImage imageNamed:@"hua.jpg"];
    //设置imageView高度改变时宽度也跟着改变
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.tableView addSubview:self.imageView];


    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 20;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //刚开始y的偏移量初始值就是-264
    NSLog(@"y1 === %f",scrollView.contentOffset.y);
    CGFloat y = scrollView.contentOffset.y;//加上导航栏高度,第一次是-200
    NSLog(@"y2 === %f",y);
    UIColor * color = [UIColor colorWithRed:0.941 green:0.108 blue:0.098 alpha:1.000];

    if (y <= -200) {
        CGRect frame = self.imageView.frame;
        frame.origin.y = y;//imageView的frame是不断往上偏移
        frame.size.height =  -y;//tablview向下偏移了多少,高度就增加多少
        self.imageView.frame = frame;
            [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
         }

    else
    {
   
        CGFloat alpha = MIN(1, 1 - ((30 - y) / 64));
        
        NSLog(@"%f",alpha);
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];

        

    }
    

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qiang" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = @"qiang";
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
