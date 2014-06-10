//
//  TDSItemListViewController.m
//  ToDoSample
//
//  Created by iurano on 6/8/14.
//  Copyright (c) 2014 WhatAmILookingFor. All rights reserved.
//

#import "TDSItemListViewController.h"
#import "TDSCreateItemViewController.h"

@interface TDSItemListViewController () <TDSCreateItemViewControllerDelegate>

// An array property
@property NSMutableArray *items;

@end

@implementation TDSItemListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    // 配列からアイテムを取得してLabelのテキストに代入
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 「Delete」ボタンが押されたら配列からアイテムを削除する
        [_items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation
 */

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"CreateItemSeque"]) {
       // 遷移先のTDSCreateItemViewControllerのインスタンスを取得する
        TDSCreateItemViewController *controller
        = (TDSCreateItemViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        // delegateプロパティにself（MasterViewController自身）を設定する
        controller.delegate = self;
    }
}

- (void)createItemViewControllerDidFinish:(TDSCreateItemViewController *)controller item:(NSString *)item {
    
    // 配列がない場合は生成する
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    // アイテムを先頭に追加する
    [_items insertObject:item atIndex:0];
    
    // UITableViewにUITableViewCellを追加する
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // TDSCreateItemViewControllerを閉じる
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)createItemViewControllerDidCancel:(TDSCreateItemViewController *)controller {
    // TDSCreateItemViewControllerを閉じる
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
