# ZhihuDaily
Swift实现仿知乎日报App

先说一下没实现的功能:）
* 主页面banner的滑动分页效果（滑动时会停留在中间）
  * SwiftUI原生的的ScrollView不支持分页效果 需要UIKit中的UIScrollView实现

* 新闻列表对应页面的跳转
  * 加入全部新闻对应页面跳转时会导致网络请求失败 如果只放几条新闻的话可以实现 推测是url请求次数存在限制 也可能是我的跳转方法有问题
  
* 新闻详情页的body部分显示问题
  * body部分不是完整的HTML 无法解析

# 基础功能展示
  * 主页面
   * ![image](https://github.com/Peggy-Wang/ZhihuDaily/blob/master/主页面.GIF)
  * 详情页
   * ![image](https://github.com/Peggy-Wang/ZhihuDaily/blob/master/详情页.GIF)
  * 个人页面
   * ![image](https://github.com/Peggy-Wang/ZhihuDaily/blob/master/个人页面.GIF)
  * 夜间模式
   * ![image](https://github.com/Peggy-Wang/ZhihuDaily/blob/master/夜间模式.GIF)



  
