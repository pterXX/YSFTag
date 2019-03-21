//
//  YSFTag.h
//  YunShiFinance
//
//  Created by Apple on 2018/9/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YSFTagBorderStyle) {
    YSFTagBorderStyleDefault = 0,      //默认实线
    YSFTagBorderStyleDotted,   // 虚线
};

@interface YSFTag : NSObject

@property (copy, nonatomic, nullable) NSString *text;
@property (copy, nonatomic, nullable) NSAttributedString *attributedText;
@property (strong, nonatomic, nullable) UIColor *textColor;
@property (strong, nonatomic, nullable) UIColor *selectTextColor;
///backgound color
@property (strong, nonatomic, nullable) UIColor *bgColor;
@property (strong, nonatomic, nullable) UIColor *highlightedBgColor;
@property (strong, nonatomic, nullable) UIColor *selectBgColor;
///background image
@property (strong, nonatomic, nullable) UIImage *bgImg;
@property (assign, nonatomic) CGFloat cornerRadius;
@property (strong, nonatomic, nullable) UIColor *borderColor;
@property (strong, nonatomic, nullable) UIColor *selectborderColor;
@property (assign, nonatomic) CGFloat borderWidth;
@property (assign, nonatomic) YSFTagBorderStyle borderStyle;

///like padding in css
@property (assign, nonatomic) UIEdgeInsets padding;
@property (strong, nonatomic, nullable) UIFont *font;
///if no font is specified, system font with fontSize is used
@property (assign, nonatomic) CGFloat fontSize;
///default:YES
@property (assign, nonatomic) BOOL enable;
//是否选中
@property (assign, nonatomic) BOOL isSelect;

- (nonnull instancetype)initWithText: (nonnull NSString *)text;
+ (nonnull instancetype)tagWithText: (nonnull NSString *)text;

@end

