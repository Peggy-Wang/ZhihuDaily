//
//  NewsCell.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/19.
//

import SwiftUI

struct NewsCell: View {
    let story: Story
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(story.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.label))
                    .padding(5)
                
                Text(story.hint)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(5)
                
                Spacer()
            }
            .padding(.top)
            .padding(.leading, 5)
            
            Spacer()
            
            Image(uiImage: loadImageData(url: URL(string: story.images[0])!))
                .resizable()
                .frame(width: 80, height: 80)
                .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 110)
        .onTapGesture {
            showNewsDetails = true
        }
        .fullScreenCover(isPresented: $showNewsDetails, content: {
            NewsDetailsPage(details: newsDetails9733310)
        })
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(story: newsList[0].stories[0])
    }
}
