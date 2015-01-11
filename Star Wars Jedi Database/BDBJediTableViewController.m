//
//  BDBJediTableViewController.m
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 10/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBJediTableViewController.h"
#import "BDBJedi.h"
#import "BDBLightSaber.h"


@interface BDBJediTableViewController ()

@property (strong, nonatomic) NSArray* knightTable;
@property (strong, nonatomic) NSArray* masterTable;
@property (strong, nonatomic) NSArray* grandMasterTable;

@end

@implementation BDBJediTableViewController

-(id)initWithModelKnight:(NSArray*)aKnight Master:(NSArray*)aMaster Grand:(NSArray*)aGrand{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _knightTable = [[NSArray alloc]initWithArray:aKnight];
        _masterTable = [[NSArray alloc]initWithArray:aMaster];
        _grandMasterTable = [[NSArray alloc]initWithArray:aGrand];
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"WILL TABLE KNIGHTS");
    NSLog(@"%@", self.knightTable);
    NSLog(@"WILL TABLE MASTERS");
    NSLog(@"%@", self.masterTable);
    NSLog(@"WILL TABLE GRAND MASTERS");
    NSLog(@"%@", self.grandMasterTable);
    

    
    }

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
   }

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.knightTable count];
    }else if (section == 1){
        return [self.masterTable count];
    }else{
        return [self.grandMasterTable count];
    }

}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Jedi Knights";
    }else if (section == 1){
        return @"Jedi Masters";
    }else{
        return @"Jedi Grand Masters";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell...
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [[self.knightTable objectAtIndex:indexPath.row]name];
        cell.detailTextLabel.text = [[self.knightTable objectAtIndex:indexPath.row]jediRange];
        cell.imageView.image = [UIImage imageNamed:@"light saber table"];
        cell.imageView.backgroundColor = [[[self.knightTable objectAtIndex:indexPath.row]lightSaber]color];
        
    }else if (indexPath.section == 1){
        cell.textLabel.text = [[self.masterTable objectAtIndex:indexPath.row]name];
        cell.detailTextLabel.text = [[self.masterTable objectAtIndex:indexPath.row]jediRange];
        cell.imageView.image = [UIImage imageNamed:@"light saber table"];
        cell.imageView.backgroundColor = [[[self.masterTable objectAtIndex:indexPath.row]lightSaber]color];
        
    }else{
        cell.textLabel.text = [[self.grandMasterTable objectAtIndex:indexPath.row]name];
        cell.detailTextLabel.text = [[self.grandMasterTable objectAtIndex:indexPath.row]jediRange];
        cell.imageView.image = [UIImage imageNamed:@"light saber table"];
        cell.imageView.backgroundColor = [[[self.grandMasterTable objectAtIndex:indexPath.row]lightSaber]color];
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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

-(void)arraysTableWithKnights:(NSArray *)knightArray Masters:(NSArray *)masterArray GrandMasters:(NSArray *)granMasterArray{
    self.knightTable = knightArray;
    self.masterTable = masterArray;
    self.grandMasterTable = granMasterArray;
}



@end
