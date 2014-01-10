//
//  JKComboBox.m
//  JKComboBox
//
//  Created by Jakey on 14-1-9.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "JKComboBox.h"
#import<QuartzCore/QuartzCore.h>

@implementation JKComboBox

#pragma mark -
#pragma mark custom methods

- (void)relodData{
    [_comboBoxTableView removeFromSuperview];
    CGRect frame = [self.superview convertRect:self.frame toView:_showInView];
    
	_comboBoxTableView = [[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMaxY(frame), CGRectGetWidth(self.frame), 200)];
    
	_comboBoxTableView.dataSource = self;
	_comboBoxTableView.delegate = self;
	_comboBoxTableView.backgroundColor = [UIColor whiteColor];
	_comboBoxTableView.separatorColor = [UIColor grayColor];
 
    [_comboBoxTableView.layer setShadowOffset:CGSizeMake(2, 2)];
    [_comboBoxTableView.layer setShadowRadius:5];
    [_comboBoxTableView.layer setShadowOpacity:1];
    [_comboBoxTableView.layer setShadowColor:[UIColor blackColor].CGColor];
    _comboBoxTableView.layer.masksToBounds = YES;
    [_comboBoxTableView setNeedsDisplay];
    
	[_showInView addSubview:_comboBoxTableView];
}
- (void)showInView:(UIView*)view didSelectComboBox:(DidSelectComboBox)didSelectComboBox{
    _didSelectComboBox = didSelectComboBox;
    _showInView = view;
    [self relodData];
}

- (void)hidden {
    [_comboBoxTableView removeFromSuperview];
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDatasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"ListCellIdentifier";
	UITableViewCell *cell = [_comboBoxTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	cell.textLabel.text = (NSString *)[_items objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont systemFontOfSize:18.0f];
	cell.accessoryType = UITableViewCellAccessoryNone;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 30.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self hidden];
    if (_didSelectComboBox) {
        _didSelectComboBox(indexPath.row,[_items objectAtIndex:indexPath.row]);
    }
}

@end

