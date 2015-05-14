//
//  SectionView.h
//  GENIUS
//
//  Created by jamalping on 15/5/5.
//  Copyright (c) 2015年 李小平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionView : UIView

/**
 *  @brief  点击的block响应
 */
@property (nonatomic,copy)void(^TapAction)(SectionView *sectionView);
/**
 *  @brief  是否选中
 */
@property (nonatomic,assign)BOOL unPold;
@property (nonatomic,strong)NSString *title;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title unPold:(BOOL)unPold;

@end
