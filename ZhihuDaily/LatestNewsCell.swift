//
//  LatestNewsCell.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/19.
//

import SwiftUI

struct LatestNewsCell: View {
    var topStory: LatestTopStory
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ImageBlurView(imageUrl: URL(string: topStory.image)!)
            VStack(alignment: .leading) {
                Text(topStory.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.trailing)
                
                Text(topStory.hint)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 5)
                    .padding(.leading)
                    .padding(.trailing)
            }
            .frame(width: UIScreen.main.bounds.width, height: 120, alignment: .leading)
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.width)
        .onTapGesture {
            showTopStory = true
        }
        .fullScreenCover(isPresented: $showTopStory, content: {
            NewsDetailsPage(details: newsDetails9733310)
        })
    }
}

struct LatestNewsCell_Previews: PreviewProvider {
    static var previews: some View {
        LatestNewsCell(topStory: latestNews.top_stories[0])
    }
}
