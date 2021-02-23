//
//  NewsExtra.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/23.
//

import SwiftUI

struct NewsExtra: Codable {
    var popularity: Int
    var comments: Int
}

let newsExtra9733310 = loadNewsExtraData(url: URL(string: "https://news-at.zhihu.com/api/3/story-extra/9733310")!)

func loadNewsExtraData(url: URL) -> NewsExtra {
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load URL")
    }
    guard let newsExtra = try? JSONDecoder().decode(NewsExtra.self, from: data) else {
        fatalError("Can not parse json data")
    }
    return newsExtra
}


