//
//  SectionView.m
//  GENIUS
//
//  Created by jamalping on 15/5/5.
//  Copyright (c) 2015年 李小平. All rights reserved.
//

#import "SectionView.h"

@interface SectionView ()
{
    UILabel *_label;
    UIImageView *_imgView;
}
@end

@implementation SectionView
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title unPold:(BOOL)unPold
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        _title = title;
        self.unPold = unPold;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 270, 40)];
    _label.text = self.unPold?[NSString stringWithFormat:@"%@---展开",_title]:[NSString stringWithFormat:@"%@---关闭",_title];
    [self addSubview:_label];
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-60, 10, 30, 30)];
    _imgView.image = [UIImage imageNamed:@"testImg"];
    [self addSubview:_imgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
}

- (void)tapAction {
    self.unPold = !self.unPold;
    _label.text = self.unPold?[NSString stringWithFormat:@"%@---展开",_title]:self.title;
    if (_TapAction) {
        _TapAction(self);
    }
}


@end
