//
//  YSFTag.m
//  YunShiFinance
//
//  Created by Apple on 2018/9/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "YSFTag.h"
static const CGFloat kDefaultFontSize = 13.0;

@implementation YSFTag

- (instancetype)init {
    self = [super init];
    if (self) {
        _fontSize = kDefaultFontSize;
        _textColor = [UIColor blackColor];
        _bgColor = [UIColor whiteColor];
        _enable = YES;
    }
    return self;
}

- (instancetype)initWithText: (NSString *)text {
    self = [self init];
    if (self) {
        _text = text;
    }
    return self;
}

+ (instancetype)tagWithText: (NSString *)text {
    return [[self alloc] initWithText: text];
}

@end
