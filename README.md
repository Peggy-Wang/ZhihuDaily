# ZhihuDaily - SwiftUI试水 
Swift实现仿知乎日报App - Peggy Wang

本来打算这个假期好好学一下Swift 但打完美赛后就一直在摸鱼 很多技术都没学 还有很多地方要去完善

先说一下目前存在的一些问题:(
* 主页面banner的滑动分页效果（滑动时会停留在中间）
  * SwiftUI原生的的ScrollView不支持分页效果 需要UIKit中的UIScrollView实现

* 新闻列表对应页面的跳转
  * 加入全部新闻对应页面跳转时会导致网络请求失败 如果只放几条新闻的话可以实现 推测是url请求次数存在限制 也可能是我的跳转方法有问题 没办法我只能先让所有的新闻详情跳转到id为9733310的一篇新闻
  
* 新闻详情页的body部分显示问题
  * body部分不是完整的HTML 无法解析

# 基础功能展示 
大尺寸gif注意⚠️
  * 主页面
    * ![image](https://github.com/Peggy-Wang/ZhihuDaily/blob/master/主页面.GIF)
  * 详情页
    * ![image](https://github.com/Peggy-Wang/ZhihuDaily/blob/master/详情页.GIF)
  * 个人页面
    * ![image](https://github.com/Peggy-Wang/ZhihuDaily/blob/master/个人页面.GIF)
  * 夜间模式
    * ![image](https://github.com/Peggy-Wang/ZhihuDaily/blob/master/夜间模式.GIF)

# 结构简析
整体为MVC?架构

* 接收数据解析json: News.swift, LatestNews.swift, NewsDetails.swift, NewsExtra.swift -- 分别对应要求中的4种数据形式

* 用户数据UserData.swift: 主要数据采用全局环境变量@EnvironmentObject的形式储存 方便不同结构间数据的传输 同时保证数据不会在关闭该页面后丢失 

* 主页面NewsPage.swift: 顶部导航栏模块(NewsNavigationBar.swift) + 头条新闻模块(LatestNewsCell.swift) + 新闻列表模块(NewsCell.swift + NewsListView.swift) -- 模块化提高可维护性

* 详情页NewsDetailsPage.swift: 新闻显示模块 + 底部导航栏模块(NewsDetailsToolBar.swift + ButtonFeedbackView.swift)

* 个人页面UserPage.swift: 由userData.isLogined控制显示内容 -- true显示用户界面 false显示伪登录界面 用户界面下面的两个按钮(夜间模式, 设置)是不能按的:) 但是实际上是支持夜间模式的 需要手动到系统设置中开启 我不知道要怎么做应用内部开启夜间模式这个功能

* 一些细节: 
  * 图片模糊效果(ImageBlurView.swift) 效果其实有点难看 原来想做成渐变的效果 但有点难没做出来,,,
  * 屏幕中央出现的点赞提示(ButtonFeedbacView.swift) 使用Timer定时控制显示时间 布局采用ZStack 这里忘记添加收藏的相关提示效果了0.0
  * 日期的获取及相关计算函数(Time.swift) 使用Swift的Date日期数据类型和DateFormatter日期数据格式
  * 生命周期控制采用了最新的SwiftUI App模式 十分的简洁 啥也不用管 告别了复杂的UIKit App Delegate
  * 2021.2.25: 去除了新闻列表模块的系统自带的分割线(gif中展示的是带有分割线的版本)



  
