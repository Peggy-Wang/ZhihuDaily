//
//  NewsNavigationBar.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/18.
//

import SwiftUI

struct NewsNavigationBar: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        HStack {
            VStack {
                Text(getDay())
                    .font(.title2)
                    .fontWeight(.bold)
                Text(month_zh())
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .padding(.leading)
            
            Rectangle()
                .frame(width: 0.5, height: 40)
                .foregroundColor(.secondary)
                .padding(10)
            
            Text(greeting(hour: getHour()))
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            NavigationLink(destination: UserPage()) {
                if userData.isLogined {
                    Image("avatar")
                        .resizable()
                        .cornerRadius(18)
                        .frame(width: 36, height: 36)
                        .padding()
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .cornerRadius(18)
                        .frame(width: 36, height: 36)
                        .padding()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct NewsNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NewsNavigationBar().environmentObject(UserData())
    }
}

func greeting(hour: String) -> String {
    let hour_value = Int(hour)
    if hour_value! >= 6 && hour_value! < 12 {
        return "早上好"
    } else if hour_value! >= 12 && hour_value! < 18 {
        return "下午好"
    } else if hour_value! >= 18 && hour_value! < 24 {
        return "晚上好"
    } else {
        return "早点休息"
    }
}
