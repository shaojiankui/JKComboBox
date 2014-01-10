//
//  ViewController.m
//  JKComboBox
//
//  Created by Jakey on 16/4/10.
//  Copyright © 2016年 jakey. All rights reserved.
//

#import "ViewController.h"
#import "JKComboBox.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showTouched:(JKComboBox*)comboBox {
    NSArray *comboBoxDatasource = [[NSArray alloc] initWithObjects:@"展厅一", @"展厅二", @"展厅三", @"展厅四", @"展厅五", @"展厅六", @"展厅七", @"展厅八", nil];
    comboBox.items = comboBoxDatasource;
    [comboBox showInView:self.view didSelectComboBox:^(NSInteger index, id result) {
        [comboBox setTitle:[result description] forState:UIControlStateNormal];
    }];
}
@end
