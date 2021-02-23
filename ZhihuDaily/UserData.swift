//
//  UserData.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/21.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var isThumbsup: Bool = false
    @Published var isStared: Bool = false
    @Published var isLogined: Bool = false
    @Published var userName: String = "ginger ale"
    @Published var password: String = "123456"
    @Published var timeRemaining = 0
}

