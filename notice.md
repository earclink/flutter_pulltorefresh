# 注意地方

## RefreshController
* 要注意记得dispose掉refreshController,否则当你刷新过程中,组件被销毁之后刷新刚好完毕，会报空指针的警告。

## SmartRefresher
* child只支持ListView,GridView,CustomView,不知道还没有,总之就是继承ScrollView的都可以。当你想放一个单一的非滚动视图的话,利用ListView即可。
* 当你想要关闭掉下拉和上拉的功能,可利用enablePullUp和enablePullDown这两个属性
* 当child不是继承ScrollView时,要注意盒子约束,在SmartRefresher下高度是unbounded
* SingleChildScrollView它不是继承ScrollView,千万别在child节点使用它,这样做只是ScrollView里嵌套ScrollView
* 当想在ScrollView增加背景时,记住别在child节点给ListView或者GridView包装Container,请在SmartRefresher外部包装Container

## Front刷新样式
* 这种样式跟Behind,Follow,UnFollow实现机制是有点区别的,Follow基于ClampScrollPhysics修改实现,而Behind,Follow,UnFollow这三个基于iOS里的弹性滑动引擎。Front适用于Android多一点。
* 1.4.5后重改FrontStyle,请无视这条,使用Front这个风格后,列表初始offset是100.0,在0~100之间会回弹回去,所以计算scrollController的offset的时候,要减去指示器的高度(100),才是列表中的真实offset。同样,当你滚动到顶部时,要animateTo(100.0),而不是animateTo(0.0)。
* 只能放在第一个Sliver!

## Behind刷新样式
* 这种样式的实现事实上就是采用高度的动态变化来实现的,试试外围多利用Align属性,会有不同的滑动效果。
* 暂时已经发现这种样式不支持Icon这个widget,也就是ClassicHeader,是不支持的,使用这个指示器,你会发现Icon会悬浮在试图区上,原因我还是未查出来。

## 底部指示器
* 对于不满足一页隐藏的问题,虽然内部采取通过precedingScrollExtent来判断前面有多少个距离,但是这种方法也是不可取的,有一种情况就是某一个sliver只占用scrollExtent而不占用
  layoutExtent的情况。所以假如你内部slivers有这种sliver,我内部判断是不合法的,需要你手动去判断。设置hideWhenNotFull为false,然后用布尔值决定。

## NestedScrollView(非必要情况避免使用)
* 由于设计上的问题,RefreshStyle.Front暂时不能兼容,尝试去使用CustomScrollView配合内部有一个offset的属性来实现出现的位置。
* ScrollController要放在NestedScrollView里,放在child里是没作用的。
* 如何去获取内部的scrollController?通过refreshController.scrollController获取

## CustomScrollView
* 对于UnFollow刷新风格,当你slivers第一个元素带有SliverAppbar,Sliverheader时,会出现很奇怪的现象,不知道怎么描述,就是SliverAppBar位置会随着指示器位置的变化而变化。对于这种情况,你可以尝试在slivers第一个元素追加SliverToBoxAdapter。