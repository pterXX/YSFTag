//
// Created by Day Ling on 15/1/12.
// Copyright (c) 2015 Day Ling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class YSFTag;
@interface YSFTagButton: UIButton

@property (nonatomic, strong) YSFTag * _Nullable skTag;

+ (nonnull instancetype)buttonWithTag:(nonnull YSFTag *)tag;

@end
