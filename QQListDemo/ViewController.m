//
//  ViewController.m
//  QQListDemo
//
//  Created by jamalping on 15/5/14.
//  Copyright (c) 2015年 jamal. All rights reserved.
//

#import "ViewController.h"
#import "SectionView.h"

#define JamalBoundleResource(resourceName,resourceType) [[NSBundle mainBundle] pathForResource:resourceName ofType:resourceType]

#define CSFormat(format, ...) [NSString stringWithFormat:format, ##__VA_ARGS__]

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self commonSet];
}

- (void)commonSet {
    _datas = [NSMutableArray array];
    NSArray *informationDatas = [NSArray arrayWithContentsOfFile:JamalBoundleResource(@"informationSet", @"plist")];
    [informationDatas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:obj];
        
        if ([[dic objectForKey:@"Show"] boolValue]==YES) {
            NSMutableArray *ary = [NSMutableArray array];
            for (int j = 0; j <= idx ; j++) {
                [ary addObject:CSFormat(@"%ld",idx*3)];
            }
            [dic setObject:ary forKey:@"data"];
            [_datas addObject:dic];
        }
    }];
}

#pragma mark - tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([[_datas[section] objectForKey:@"Show"] boolValue]) {
        
        return [[_datas[section] objectForKey:@"data"] count];
    }else {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdetify = @"dbsdsd";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdetify];
    }
    cell.textLabel.text = [[_datas[indexPath.section] objectForKey:@"data"] objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SectionView *sectionView = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)title:[_datas[section] objectForKey:@"Title"] unPold:[[_datas[section] objectForKey:@"Show"] boolValue]];
    sectionView.tag = section;
    __weak ViewController *inforMation = self;
    [sectionView setTapAction:^(SectionView *sectionView){
        [inforMation.datas[section] setObject:[NSNumber numberWithBool:sectionView.unPold] forKey:@"Show"];
        [tableView reloadData];
    }];
    return sectionView;
}

@end
