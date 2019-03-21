//
// Created by Day Ling on 15/1/12.
// Copyright (c) 2015 Day Ling. All rights reserved.
//

#import "YSFTagButton.h"
#import "YSFTag.h"

@interface YSFTagButton()
@property (nonatomic ,strong) CAShapeLayer *border;
@end

@implementation YSFTagButton

+ (instancetype)buttonWithTag:(YSFTag *)tag {
	YSFTagButton *btn = [super buttonWithType:UIButtonTypeCustom];
    btn.skTag = tag;
    
	if (tag.attributedText) {
		[btn setAttributedTitle: tag.attributedText forState: UIControlStateNormal];
	} else {
		[btn setTitle: tag.text forState:UIControlStateNormal];
		[btn setTitleColor: tag.textColor forState: UIControlStateNormal];
		btn.titleLabel.font = tag.font ?: [UIFont systemFontOfSize: tag.fontSize];
	}
    if (tag.selectTextColor) {
        [btn setTitleColor:tag.selectTextColor forState:UIControlStateSelected];
    }
    if (tag.selectBgColor) {
        UIColor *selectBgColor = tag.selectBgColor;
        [btn setBackgroundImage:[self imageWithColor:selectBgColor] forState:UIControlStateSelected];
    }
    
    btn.selected = tag.isSelect;
	btn.backgroundColor = tag.bgColor;
	btn.contentEdgeInsets = tag.padding;
	btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
	
    if (tag.bgImg) {
        [btn setBackgroundImage: tag.bgImg forState: UIControlStateNormal];
    }

    if (tag.borderStyle == YSFTagBorderStyleDefault) {
        if (btn.selected) {
            if (tag.selectborderColor) {
                btn.layer.borderColor = tag.selectborderColor.CGColor;
            }
        }
        
        if (!btn.selected) {
            if (tag.borderColor) {
                btn.layer.borderColor = tag.borderColor.CGColor;
            }
            
        }
        
        if (tag.borderWidth) {
            btn.layer.borderWidth = tag.borderWidth;
        }
    }else{
        
    }
    
    btn.userInteractionEnabled = tag.enable;
    if (tag.enable) {
        UIColor *highlightedBgColor = tag.highlightedBgColor ?: [self darkerColor:btn.backgroundColor];
        [btn setBackgroundImage:[self imageWithColor:highlightedBgColor] forState:UIControlStateHighlighted];
    }
    
    btn.layer.cornerRadius = tag.cornerRadius;
    btn.layer.masksToBounds = YES;
    return btn;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self addDottedBorderLayer];
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    [self addDottedBorderLayer];
}

//  添加虚线border的layer
- (void)addDottedBorderLayer{
    if (self.skTag.borderStyle == YSFTagBorderStyleDotted) {
        [self.border removeFromSuperlayer];
        CAShapeLayer *border = [CAShapeLayer layer];
        if (self.selected) {
            if (self.skTag.selectborderColor) {
                border.strokeColor = self.skTag.selectborderColor.CGColor;
            }
        }
        
        if (!self.selected) {
            if (self.skTag.borderColor) {
                border.strokeColor = self.skTag.borderColor.CGColor;
            }
            
        }
        
        if (self.skTag.borderWidth) {
            border.lineWidth = self.skTag.borderWidth;
        }
        border.fillColor = [UIColor clearColor].CGColor;
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.skTag.cornerRadius];
        border.path = path.CGPath;
        border.frame = self.bounds;
        border.lineDashPattern = @[@4, @2];
        self.layer.cornerRadius = self.skTag.cornerRadius;
        self.layer.masksToBounds = YES;
        [self.layer addSublayer:border];
        self.border = border;
    }
}


+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIColor *)darkerColor:(UIColor *)color {
    CGFloat h, s, b, a;
    if ([color getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * 0.85
                               alpha:a];
    return color;
}



@end
