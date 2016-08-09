// The MIT License (MIT)
//
// Copyright (c) 2015-2016 RamWire ( https://github.com/RamWire )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NinaPagerStyle) {
    /**<  上侧为下划线   **/
    NinaPagerStyleBottomLine = 0,
    /**<  上侧为滑块   **/
    NinaPagerStyleSlideBlock = 1,
    /**<  上侧只有文字颜色变化(没有下划线或滑块)   **/
    NinaPagerStyleStateNormal = 2,
};

@protocol NinaPagerViewDelegate <NSObject>
@optional
/**
 *  Dealloc Method
 *
 *  @return If YES,just keep recent five views or controllers,dealloc others,init them again when needed.If NO,keep all.
 */
- (BOOL)deallocVCsIfUnnecessary;
/**
 *  Get current page
 *
 *  @param currentPage Current page when you scroll to or choose the view or controller.
 */
- (void)ninaCurrentPageIndex:(NSString *)currentPage;
@end

@interface NinaPagerView : UIView
/**
 *  NinaPagerView init method.
 *
 *  @param ninaPagerStyle NinaPagerView show style.
 *  @param titles         Titles in Toptab.
 *  @param childVCs       Controllers or views in NinaPagerView.
 *  @param colors         Several colors can set in NinaPagerView.
 *
 */
- (instancetype)initWithNinaPagerStyle:(NinaPagerStyle)ninaPagerStyle WithTitles:(NSArray *)titles WithVCs:(NSArray *)childVCs WithColorArrays:(NSArray *)colors;

@property (strong, nonatomic) UIColor *selectColor; /**<  选中时的颜色   **/
@property (strong, nonatomic) UIColor *unselectColor; /**<  未选中时的颜色   **/
@property (strong, nonatomic) UIColor *underlineColor; /**<  下划线的颜色   **/
@property (strong, nonatomic) UIColor *topTabColor; /**<  顶部菜单栏的背景颜色   **/
@property (assign, nonatomic) BOOL pushEnabled; /**<  使添加的视图可以进行点击push动作   **/
@property (copy, nonatomic) NSString *PageIndex; /**< 所在的控制器index或点击上方button的index **/
@property (assign, nonatomic) CGFloat titleScale; /**<  标题缩放比例   **/
@property (assign, nonatomic) BOOL nina_navigationBarHidden; /**<  是否隐藏了导航栏   **/
@property (weak, nonatomic) id<NinaPagerViewDelegate>delegate; /**< NinaPagerView代理 **/

@end
