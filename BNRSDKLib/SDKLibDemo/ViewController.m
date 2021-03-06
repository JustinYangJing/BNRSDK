//
//  ViewController.m
//  SDKLibDemo
//
//  Created by JustinYang on 8/10/16.
//  Copyright © 2016 JustinYang. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "BNRLeftSideController.h"
@interface ViewController ()

@property (nonatomic,strong) UIView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.contentView = [[UIView alloc] init];
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.height.equalTo(@30);
    }];
    self.contentView.backgroundColor = [UIColor yellowColor];
    UILabel *tmpLabel = nil;
    for (int i = 0; i < 4; i++) {
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            tmpLabel==nil?make.leading.equalTo(self.contentView.mas_leading):make.leading.equalTo(tmpLabel.mas_trailing).offset(10);
            make.top.equalTo(self.contentView.mas_top);
        }];
        tmpLabel = label;
    }
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(tmpLabel.mas_trailing);
    }];
    
    UIViewController *vc1=  [[UIViewController alloc] init];
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    vc2.view.backgroundColor = [UIColor blueColor];
    BNRLeftSideController *container = [[BNRLeftSideController alloc] initWithLeftView:vc1 andMainView:vc2 andBackgroundImage:nil];
    container.yShift = 0;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self presentViewController:container animated:YES completion:nil];
    });
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UILabel *label in self.contentView.subviews) {
        label.text = [NSString stringWithFormat:@"ga%@",@(arc4random()%1000)];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
