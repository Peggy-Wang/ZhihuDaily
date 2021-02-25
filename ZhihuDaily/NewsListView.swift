//
//  NewsListView.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/19.
//

import SwiftUI

struct NewsListView: View {
    var singleNews: News
    
    var body: some View {
        VStack {
            // MARK: 日期分割线: 不显示本日的日期分割线
            if Int(singleNews.date)! != dateCode() {
                HStack {
                    Text(date_zh(date: singleNews.date))
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 100, height: 0.5)
                        .foregroundColor(.secondary)
                }
                .frame(width: UIScreen.main.bounds.width, height: 20)
            }
            // MARK: 显示新闻列表
            VStack {
                ForEach(singleNews.stories, id: \.id) { story in
                    NewsCell(story: story)
                        .listRowInsets(EdgeInsets())
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 660)
            // MARK: 去除系统自带分割线效果
            .onAppear {
                UITableView.appearance().separatorStyle = .none
                UITableViewCell.appearance().selectionStyle = .none
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(singleNews: newsList[0])
    }
}
