//
//  ExampleCell.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 4/2/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "ExampleCell.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface ExampleCell ()

@property (nonatomic, strong) UILabel * label;

@end

@implementation ExampleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        label.numberOfLines = 0;
        [self setLabel:label];
//        [self.contentView.insert$ insert:label trim:(UIEdgeInsetsMake(-10, -10, -10, -10))];
        [label.insert$ insertIn:self.contentView trim:(UIEdgeInsetsMake(10, 10, 10, 10))];
    }
    return self;
}

- (void)configureModel:(id)model {
    _label.text = model;
}

@end
