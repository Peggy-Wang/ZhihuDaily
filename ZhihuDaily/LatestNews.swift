//
//  LatestNews.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/20.
//

import SwiftUI

struct LatestNews: Codable {
    var date: String
    var stories: [LatestStory]
    var top_stories: [LatestTopStory]
}

struct LatestStory: Codable {
    var id: Int
    var title: String
    var images: [String]
}

struct LatestTopStory: Codable {
    var id: Int
    var hint: String
    var title: String
    var image: String
}

func loadLatestNewsData(url: URL) -> LatestNews {
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load URL")
    }
    guard let latestNews = try? JSONDecoder().decode(LatestNews.self, from: data) else {
        fatalError("Can not parse json data")
    }
    return latestNews
}

let latestNews = loadLatestNewsData(url: URL(string: "https://news-at.zhihu.com/api/3/news/latest")!)
let lateseNewsDetailsList: [NewsDetails] = loadLatestNewsDetailsList()

// MARK: 读取top_stories的新闻详情
func loadLatestNewsDetailsList() -> [NewsDetails] {
    var someNewsDetails = [NewsDetails]()

    for topStory in latestNews.top_stories {
        let newsDetails = loadNewsDetailsData(url: URL(string: "https://news-at.zhihu.com/api/3/news/\(topStory.id)")!)
        someNewsDetails.append(newsDetails)
        print("正在读取id: \(topStory.id)")
    }
    return someNewsDetails
}
