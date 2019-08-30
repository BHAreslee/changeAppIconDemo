//
//  ViewController.m
//  iconchangedemo
//
//  Created by sp on 2019/8/30.
//  Copyright © 2019 iconchange. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBtn.frame = CGRectMake(100, 100, 100, 40);
    [changeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [changeBtn setTitle:@"替换icon" forState:UIControlStateNormal];
    [changeBtn setTitle:@"还原icon" forState:UIControlStateSelected];
    [changeBtn addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeBtn];
}


-(void)changeClick:(UIButton *)sender{
    sender.selected = !sender.isSelected;
    if (sender.selected == YES) {
        [[UIApplication sharedApplication] setAlternateIconName:@"iconbear" completionHandler:^(NSError * _Nullable error) {
            if (error == nil) {
                NSLog(@"替换成功");
            }else{
                NSLog(@"替换失败");
            }
        }];
    }else{
        [[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
            if (error == nil) {
                NSLog(@"还原成功");
            }else{
                NSLog(@"还原失败");
            }
        }];
    }
}





@end
