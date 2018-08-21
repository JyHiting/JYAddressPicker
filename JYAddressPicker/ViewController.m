//
//  ViewController.m
//  JYAddressPicker
//
//  Created by flying on 2018/8/20.
//  Copyright © 2018年 杨建勇. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "JYAddressPicker.h"

@interface ViewController ()

@property (nonatomic, strong)UILabel *addressInfo;
@property (nonatomic, strong) NSArray *selectedArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addressInfo = [UILabel new];
    self.addressInfo.backgroundColor = [UIColor yellowColor];
    self.addressInfo.text = @"这里展示选择的地址信息";
    [self.view addSubview:self.addressInfo];
    
    [self.addressInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(60);
    }];
    
    UIButton *showBt = [UIButton buttonWithType:UIButtonTypeCustom];
    showBt.backgroundColor = [UIColor grayColor];
    [showBt setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [showBt addTarget:self action:@selector(showAddressPicker) forControlEvents:UIControlEventTouchUpInside];
    [showBt setTitle:@"请点击" forState:UIControlStateNormal];
    [self.view addSubview:showBt];

    [showBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.addressInfo.mas_bottom).offset(45);
    }];
    
}

-(void)showAddressPicker{
    
    if (self.selectedArr) {
        
        NSArray *defaultValues = @[[self.selectedArr objectAtIndex:0][@"text"],[self.selectedArr objectAtIndex:1][@"text"],[self.selectedArr objectAtIndex:2][@"text"]];
        JYAddressPicker *addressPicker = [JYAddressPicker jy_showAt:self defaultShow:defaultValues];
        addressPicker.selectedItemBlock = ^(NSArray *addressArr) {
            
            NSString *province = [addressArr objectAtIndex:0][@"text"];
            NSString *city = [addressArr objectAtIndex:1][@"text"];
            NSString *county = [addressArr objectAtIndex:2][@"text"];
            
            self.addressInfo.text = [NSString stringWithFormat:@"%@%@%@",province,city,county];
            self.selectedArr = addressArr;
        };
    }else{
        JYAddressPicker *addressPicker = [JYAddressPicker jy_showAt:self];
        addressPicker.selectedItemBlock = ^(NSArray *addressArr) {
            
            NSString *province = [addressArr objectAtIndex:0][@"text"];
            NSString *city = [addressArr objectAtIndex:1][@"text"];
            NSString *county = [addressArr objectAtIndex:2][@"text"];
            
            self.addressInfo.text = [NSString stringWithFormat:@"%@%@%@",province,city,county];
            self.selectedArr = addressArr;
        };
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
