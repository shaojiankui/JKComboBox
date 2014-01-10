//
//  JKComboBox.h
//  JKComboBox
//
//  Created by Jakey on 14-1-9.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
 typedef void(^DidSelectComboBox)(NSInteger index,id result);


@interface JKComboBox : UIButton< UITableViewDelegate, UITableViewDataSource > {
	UITableView		*_comboBoxTableView;
    DidSelectComboBox _didSelectComboBox;
    
    UIView *_showInView;

}
@property (nonatomic, strong) NSArray *items;

- (void)showInView:(UIView*)view didSelectComboBox:(DidSelectComboBox)didSelectComboBox;

- (void)hidden;
@end

