//
//  ImageBlurView.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/20.
//

import SwiftUI

struct ImageBlurView: View {
    var imageUrl: URL
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(uiImage: loadImageData(url: imageUrl))
                .resizable()
                .scaledToFit()
            // MARK: 局部虚化效果: 两张相同图片进行拼接
            Image(uiImage: loadImageData(url: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 120, alignment: .bottom)
                .blur(radius: 4)
                .clipped()
        }
    }
}

struct ImageBlurView_Previews: PreviewProvider {
    static var previews: some View {
        ImageBlurView(imageUrl: URL(string: getNewsDetails(newsId: 9733310).image)!)
    }
}
