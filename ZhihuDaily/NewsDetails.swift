//
//  NewsDetails.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/1/28.
//

import SwiftUI

struct NewsDetails: Codable {
    var body: String
    var image_source: String
    var title: String
    var url: String
    var image: String
    var section_id: Int
    var share_url: String
    var section_name: String
}

let newsDetails9733310 = loadNewsDetailsData(url: URL(string: "https://news-at.zhihu.com/api/3/news/9733310")!)

func getNewsDetails(newsId: Int) -> NewsDetails {
    print("正在调用id: \(newsId)")
    return loadNewsDetailsData(url: URL(string: "https://news-at.zhihu.com/api/3/news/\(newsId)")!)
}

func loadNewsDetailsData(url: URL) -> NewsDetails {
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load URL")
    }
    guard let detail = try? JSONDecoder().decode(NewsDetails.self, from: data) else {
        fatalError("Can not parse json data")
    }
    return detail
}

// MARK: 通过URL请求获取图片
func loadImageData(url: URL) -> UIImage {
    guard let imageData = try? Data(contentsOf: url) else {
        fatalError("Can not load image URL")
    }
    return UIImage(data: imageData)!
}


