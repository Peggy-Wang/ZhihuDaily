//
//  NewsPage.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/1/28.
//

import SwiftUI

struct NewsPage: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(latestNews.top_stories, id: \.id) { topStory in
                            LatestNewsCell(topStory: topStory)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
                // TODO: 加入对应界面的页面跳转之后 新闻列表无法加载 只能加载一条新闻
                // MARK: 今日新闻
                // NewsCell(story: newsToday.stories[0])
                NewsListView(singleNews: newsToday)
                // MARK: 往期新闻
                // NewsCell(story: newsList[0].stories[0])
                NewsListView(singleNews: newsList[0])
                NewsListView(singleNews: newsList[1])
                NewsListView(singleNews: newsList[2])
                }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: NewsNavigationBar())
            .navigationBarTitle("首页", displayMode: .inline)
        }
        .navigationBarHidden(true)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        NewsPage().environmentObject(UserData())
    }
}

