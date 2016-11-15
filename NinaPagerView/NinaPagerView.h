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
 *  如果您觉得创建的控制器(0.7:只适用于控制器情况)过多(>5)占用内存过大，可以尝试此代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。
 *  If you care the vcs causes huge memory,please try this delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO.
 *
 *  @return If YES,just keep recent five views or controllers,dealloc others,init them again when needed.If NO,keep all.
 */
- (BOOL)deallocVCsIfUnnecessary;
/**
 *  通过此代理方法您可以获取到当前页码进而对相关的控制器进行操作。
 *  Get current page of your views or viewcontrollers by the delegate method, you can code here when you need it.
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
- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles WithVCs:(NSArray *)childVCs;

/**<
 *  顶部菜单栏的展示样式。
 *  The style of TopTab.
 **/
@property (assign, nonatomic) NinaPagerStyle ninaPagerStyles;
/**<
 *  上方标题未选中时颜色，默认颜色为灰色。
 *  The titles' color when not selected,default color is gray.
 **/
@property (strong, nonatomic) UIColor *unSelectTitleColor;
/**<
 *  上方标题选中时颜色，默认颜色为黑色。
 *  The titles' color when selected,default color is black.
 **/
@property (strong, nonatomic) UIColor *selectTitleColor;
/**<
 *  在下划线模式下的下划线的颜色，默认十六进制颜色码为#ff6262。
 *  Underline's color in NinaPagerStyleBottomLine mode,default color code is #ff6262.
 **/
@property (strong, nonatomic) UIColor *underlineColor;
/**<
 *  在滑块模式下滑块颜色，默认十六进制颜色码为#ff6262。
 *  SliderBlock's color in NinaPagerStyleSlideBlock mode,default color code is #ff6262.
 **/
@property (strong, nonatomic) UIColor *sliderBlockColor;
/**<
 *  上方topTab背景颜色，默认颜色为白色。
 *  TopTab's background colordefault color is white.
 **/
@property (strong, nonatomic) UIColor *topTabBackGroundColor;

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
 *  上方TopTab的高度值，如果不设置默认值为40，请设置值大于25。
 *  TopTab height,default height is 40,please set it above 25.
 */
@property (assign, nonatomic) CGFloat topTabHeight;
/**
 *  上方标题的字体大小设置，默认为14。
 *  Title font in TopTab,default font is 14.
 */
@property (assign, nonatomic) CGFloat titleFont;
/**
 *  您可以设置titleSize这个属性来设置标题的缩放比例(相对于原比例标题)。同时，在加入了顶部自定义视图之后，您可以通过设置此属性来对选中的view整体进行缩放，推荐您设置的范围在1~1.5之间，如果不设置此属性，默认的缩放比例为1.15。(需要注意的是，此属性不适用于NinaPagerStyleSlideBlock样式)
 *  You can set titleSize for title animation(compare to origin title).Meanwhile,after adding custom topTab,you also can set the property to the topTab view which selected.Command range between 1 and 1.5.If don't set this,default scale is 1.15.(TitleScale is not working on NinaPagerStyleSlideBlock)
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
 *  滑块的layer.cornerRadius属性，默认的计算公式是(滑块宽度 / SlideBlockCornerRadius)，若您想要自定义调整，请修改此参数，如果不想要圆角，请设置此参数为0。
 *  Sliderblock's layer.cornerRadius,if you don't want cornerRadius,please set this to 0.
 **/
@property (assign, nonatomic) CGFloat slideBlockCornerRadius;
/**<
 *  是否隐藏了导航栏，您的导航栏如果隐藏或者没有，需要将此属性设置为YES。
 *  Hide NavigationBar or not,if you wanna set this to YES,you must hide your NavigationBar first.
 **/
@property (assign, nonatomic) BOOL nina_navigationBarHidden;
/**<
 *  是否一次性加载全部页面或控制器，默认为否。
 *  Load whole viewcontrollers or views,default is NO.
 **/
@property (assign, nonatomic) BOOL loadWholePages;
/**<
 *  上方TopTab下面的总览线是否隐藏，默认为不隐藏。
 *  Hide the topTab's underline(not the select underline) or not,default is NO.
 **/
@property (assign, nonatomic) BOOL underLineHidden;
/**<
 *  允许下方视图进行左右滑动，默认为允许。
 *  Able to scroll scrollview in main view,default is YES.
 **/
@property (assign, nonatomic) BOOL nina_scrollEnabled;
/**<
 *  是否选择自适应下划线长度(与当前标题文字长度相同)，默认为NO，如果设置了selectBottomLinePer属性，此属性将不起作用。
 *  Auto-calculate bottomline's width,the same with current title's width,default is NO,if you set selectBottomLinePer,this property will not work.
 **/
@property (assign, nonatomic) BOOL nina_autoBottomLineEnable;
/**<
 *  是否允许topTab根据下方视图上下滑动进行隐藏显示的功能，需要注意的是此属性必须跟您的子控制器或者子视图进行对应的显示或隐藏，您可以参考Example的TopTabTestController中设置来自定义，默认的隐藏显示动画时间为0.3秒。
 *  Make topTab hidden when scrollview scrolling down.This property must be changed by your vcs or views.You can refer to detail codes in TopTabTestController,default animation duration is 0.3.
 **/
@property (assign, nonatomic) BOOL topTabScrollHidden;
/**<
 *  自定义顶部栏视图，支持用户替代原有的固态标题样式。该属性是需要传入未选中(普通状态)时顶部样式，具体设置可参照Example中的方式(此自定义方式在NinaPagerStyleSlideBlock中并不适用)。
 *  Custom topTab views,you can set views as you wish.The property needs to your unselected(normal) views array,you can set it like Example's setting(This property doesn't support NinaPagerStyleSlideBlock mode).
 **/
@property (strong, nonatomic) NSArray *topTabViews;
/**<
 *  自定义顶部栏视图，支持用户替代原有的固态标题样式。该属性是需要传入选中时顶部样式，具体设置可参照Example中的方式(此自定义方式在NinaPagerStyleSlideBlock中并不适用)。
 *  Custom topTab views,you can set views as you wish.The property needs to your selected views array,you can set it like Example's setting(This property doesn't support NinaPagerStyleSlideBlock mode).
 **/
@property (strong, nonatomic) NSArray *selectedTopTabViews;

@property (weak, nonatomic) id<NinaPagerViewDelegate>delegate; /**< NinaPagerView代理 **/

@end
