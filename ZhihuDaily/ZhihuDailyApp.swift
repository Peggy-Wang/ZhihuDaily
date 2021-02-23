//
//  ZhihuDailyApp.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/1/28.
//

import SwiftUI

@main
struct ZhihuDailyApp: App {
    var body: some Scene {
        WindowGroup {
            NewsPage().environmentObject(UserData())
        }
    }
}
