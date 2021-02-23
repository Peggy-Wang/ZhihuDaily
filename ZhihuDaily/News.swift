//
//  News.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/2.
//

import SwiftUI

struct News: Codable {
    var date: String
    var stories: [Story]
}

struct Story: Codable {
    var id: Int
    var title: String
    var url: String
    var hint: String
    var images: [String]
}

let newsToday = loadNewsData(url: URL(string: "https://news-at.zhihu.com/api/3/news/before/\(dateCode() + 1)")!)

func loadNewsData(url: URL) -> News {
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load URL")
    }
    guard let news = try? JSONDecoder().decode(News.self, from: data) else {
        fatalError("Can not parse json data")
    }
    return news
}

var newsList: [News] = loadNewsList()

// MARK: 二月：读取近一个月的新闻
func loadNewsList() -> [News] {
    var someNews = [News]()

    for index in 0..<30 {
        if dateCode() - index > 20210200 {
            let news = loadNewsData(url: URL(string: "https://news-at.zhihu.com/api/3/news/before/\(dateCode() - index)")!)
            someNews.append(news)
        } else {
            let news = loadNewsData(url: URL(string: "https://news-at.zhihu.com/api/3/news/before/\(20210131 + dateCode() - (20210200 + index))")!)
            someNews.append(news)
        }
    }
    return someNews
}


