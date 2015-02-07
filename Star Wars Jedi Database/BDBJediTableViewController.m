//
//  BDBJediTableViewController.m
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 12/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBJediTableViewController.h"
#import "BDBJedi.h"
#import "BDBLightSaber.h"

@interface BDBJediTableViewController ()

@property (strong, nonatomic)NSArray* knightArray2;
@property (strong, nonatomic)NSArray* masterArray2;
@property (strong, nonatomic)NSArray* grandMasterArray2;

@end

@implementation BDBJediTableViewController

-(id)initWithModelKnight:(NSArray*)aKnight Master:(NSArray*)aMaster Grand:(NSArray*)aGrand{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _knightArray2 = [[NSArray alloc]initWithArray:aKnight];
        _masterArray2 = [[NSArray alloc]initWithArray:aMaster];
        _grandMasterArray2 = [[NSArray alloc]initWithArray:aGrand];
        
    }
    return self;
}



#pragma mark - Table view data source

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Jedi Knights";
    }else if (section == 1){
        return @"Jedi Masters";
    }else{
        return @"Jedi Grand Masters";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.knightArray2 count];
    }else if (section == 1){
        return [self.masterArray2 count];
    }else{
        return [self.grandMasterArray2 count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [[self.knightArray2 objectAtIndex:indexPath.row]name];
        cell.detailTextLabel.text = [[self.knightArray2 objectAtIndex:indexPath.row]jediRange];
        cell.imageView.image = [UIImage imageNamed:@"light saber table"];
        cell.imageView.backgroundColor = [[[self.knightArray2 objectAtIndex:indexPath.row]lightSaber]color];
    }else if (indexPath.section == 1){
        cell.textLabel.text = [[self.masterArray2 objectAtIndex:indexPath.row]name];
        cell.detailTextLabel.text = [[self.masterArray2 objectAtIndex:indexPath.row]jediRange];
        cell.imageView.image = [UIImage imageNamed:@"light saber table"];
        cell.imageView.backgroundColor = [[[self.masterArray2 objectAtIndex:indexPath.row]lightSaber]color];
    }else{
        cell.textLabel.text = [[self.grandMasterArray2 objectAtIndex:indexPath.row]name];
        cell.detailTextLabel.text = [[self.grandMasterArray2 objectAtIndex:indexPath.row]jediRange];
        cell.imageView.image = [UIImage imageNamed:@"light saber table"];
        cell.imageView.backgroundColor = [[[self.grandMasterArray2 objectAtIndex:indexPath.row]lightSaber]color];
    }
    
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

-(void)arraysTableWithKnights:(NSArray *)knightArray
                      Masters:(NSArray *)masterArray
                 GrandMasters:(NSArray *)granMasterArray{
    
    self.knightArray2 = [NSArray arrayWithArray:knightArray];
    self.masterArray2 = [NSArray arrayWithArray:masterArray];
    self.grandMasterArray2 = [NSArray arrayWithArray:granMasterArray];
}

@end
