//
//  NewsDetailsToolBar.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/18.
//

import SwiftUI

struct NewsDetailsToolBar: View {
    @EnvironmentObject var userData: UserData
    var newsExtra: NewsExtra
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 0.5, height: 30)
                .foregroundColor(.secondary)
                .padding()
            
            Image(systemName: "bubble.right")
                .imageScale(.large)
                .overlay (
                    Text("\(newsExtra.comments)")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .offset(x: 25, y: -5)
                        .frame(width: 25, height: 25)
                )
            
            Spacer()
            
            Image(systemName: userData.isThumbsup ? "hand.thumbsup.fill" : "hand.thumbsup")
                .imageScale(.large)
                //.padding()
                .overlay (
                    Text("\(newsExtra.popularity)")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .offset(x: 25, y: -5)
                        .frame(width: 25, height: 25)
                )
                .onTapGesture {
                    userData.isThumbsup.toggle()
                    userData.timeRemaining = 2
                }
            
            Spacer()
            
            Image(systemName: userData.isStared ? "star.fill" : "star")
                .imageScale(.large)
                //.padding()
                .onTapGesture {
                    userData.isStared.toggle()
                }
            
            Spacer()
            
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
        }
        .frame(width: UIScreen.main.bounds.width - 50)
        .padding(.trailing)
    }
}

struct NewsDetailsToolBar_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsToolBar(newsExtra: newsExtra9733310).environmentObject(UserData())
    }
}
