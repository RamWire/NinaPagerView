//
//  UIParameter.h
//  NinaPagerView
//
//  Created by RamWire on 15/11/13.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#ifndef UIParameter_h
#define UIParameter_h

//是否需要打印调试
#define isDebug NO
//全屏宽和高大小
#define FUll_VIEW_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define FUll_VIEW_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define FUll_CONTENT_HEIGHT FUll_VIEW_HEIGHT - 64 - 49
//十六进制颜色值
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define PageBtn .0735 * FUll_VIEW_HEIGHT //6s下高度45
//tabbar的高度
#define TabbarHeight 49
//TopTab相关参数
#define LeftLength  .6 * 45 //左侧的视图长度 20 / 45
#define LeftX .12 * self.frame.size.width //左侧视图的X 20 / 375
#define TotalY .015 * FUll_VIEW_HEIGHT //两边图片的Y 10 / 45
#define TotalYPlus .009 * FUll_VIEW_HEIGHT //右侧图片的高度调节
#define TitleWidth  .4 * FUll_VIEW_WIDTH / 2 //标题的宽度 55 / 375
#define RightImageWidth .085 * FUll_VIEW_WIDTH //右侧图片宽度
#define RightImageHeight .024 * FUll_VIEW_HEIGHT //右侧图片高度
#define RightTitleWidth .06 * FUll_VIEW_WIDTH  //右侧文字宽度
#define RightTitleHeight .021 * FUll_VIEW_HEIGHT //右侧文字高度
#define RightTitleY 0.0015 * FUll_VIEW_HEIGHT //右侧文字Y
#define RightTitleX 0.015 * FUll_VIEW_WIDTH //右侧文字X
#define LinbottomWidth (132.0/375)*FUll_VIEW_WIDTH //下面红线的宽度
#define More5LineWidth FUll_VIEW_WIDTH / 5.0 //超过5个标题的宽度

#endif /* UIParameter_h */


