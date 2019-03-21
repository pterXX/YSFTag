//
//  YSFTagView.h
//  YunShiFinance
//
//  Created by Apple on 2018/9/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSFTag.h"

typedef NS_ENUM(NSInteger, YSFTagViewStyle) {
    YSFTagViewStyleDefault = 0,      //不可选
    YSFTagViewStyleOnlySelectOne,   //单选
    YSFTagViewStyleCanSelectMore   //多选
};

@interface YSFTagView : UIView

@property (assign, nonatomic) UIEdgeInsets padding;
@property (assign, nonatomic) CGFloat lineSpacing;
@property (assign, nonatomic) CGFloat interitemSpacing;
@property (assign, nonatomic) CGFloat preferredMaxLayoutWidth;
@property (assign, nonatomic) CGFloat regularWidth; //!< 固定宽度
@property (nonatomic, assign) CGFloat regularHeight; //!< 固定高度
@property (nonatomic, assign) YSFTagViewStyle tagViewStyle;//是否可以进行多选
@property (assign, nonatomic) BOOL singleLine;
@property (copy, nonatomic, nullable) void (^didTapTagAtIndex)(NSUInteger index , UIButton * _Nonnull bnt);

- (void)addTag: (nonnull YSFTag *)tag;
- (void)insertTag: (nonnull YSFTag *)tag atIndex:(NSUInteger)index;
- (void)removeTag: (nonnull YSFTag *)tag;
- (void)removeTagAtIndex: (NSUInteger)index;
- (void)removeAllTags;

@end
