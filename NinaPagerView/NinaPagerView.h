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
    NinaPagerStyleBottomLine = 0, //Default style
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
- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles WithVCs:(NSArray *)childVCs WithColorArrays:(NSArray *)colors;

/**<
 *  顶部菜单栏的展示样式。
 *  The style of TopTab.
 **/
@property (assign, nonatomic) NinaPagerStyle ninaPagerStyles;
/**<
 *  所在的控制器index或点击上方button的index。
 *  Current controller's or view's index and click button's index.
 **/
@property (copy, nonatomic) NSString *PageIndex;
/**<  
  *  设置默认加载的界面，默认加载的界面是第一页，您可以选择要加载第几页的页面，不仅仅局限于第一页这样的展示方法，更加灵活。
  *  Set default loading page,you can set this for index of your page.Not only loads first page,but also choose other pages as default page.More flexible.
 **/
@property (assign, nonatomic) NSInteger ninaDefaultPage;
/**
 *  您可以设置titleSize这个属性来设置标题的缩放比例(相对于原比例标题)，推荐您设置的范围在1~1.5之间，如果不设置此属性，默认的缩放比例为1.15。
 *  You can set titleSize for title animation(compare to origin title),command range between 1 and 1.5.If don't set this,default scale is 1.15.
 */
@property (assign, nonatomic) CGFloat titleScale;
/**<
 *  您可以对此参数进行设置来改变下划线的长度，此参数代表的是选中的整体部分的占比，默认为1，您可以对此进行设置，但推荐您尽量不要设置在0.5以下(此参数设置在两种样式中均可使用)。
 *  You can set this parameter to change the length of bottomline,the percent of selected button,default is 1.Recommand to set it above 0.5.
 **/
@property (assign, nonatomic) CGFloat selectBottomLinePer;
/**<
 *  您可以对此参数进行设置来改变下划线的高度，默认为2，若超过3，则默认为3。
 *  You can set this to change bottomline's height,default is 2,max height is 3.
 **/
@property (assign, nonatomic) CGFloat selectBottomLineHeight;
/**<
 *  NinaPagerStyleSlideBlock模式下的滑块高度。
 *  SliderBlock's height in NinaPagerStyleSlideBlock.
 **/
@property (assign, nonatomic) CGFloat sliderHeight;
/**<
 *  是否隐藏了导航栏，您需要将您的导航栏设置为隐藏，然后才可以将此属性设置为YES。
 *  Hide NavigationBar or not,if you wanna set this to YES,you must hide your NavigationBar first.
 **/
@property (assign, nonatomic) BOOL nina_navigationBarHidden;
/**<
 *  是否一次性加载全部页面或控制器。
 *  Load whole viewcontrollers or views.
 **/
@property (assign, nonatomic) BOOL loadWholePages;

@property (weak, nonatomic) id<NinaPagerViewDelegate>delegate; /**< NinaPagerView代理 **/

@end
