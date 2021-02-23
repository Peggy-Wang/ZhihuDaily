//
//  ButtonFeedbackView.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/23.
//

import SwiftUI

struct ButtonFeedbackView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(red: 220/255, green: 220/255, blue: 220/255))
            
            VStack {
                Image(systemName: "checkmark")
                    .imageScale(.large)
                    .padding(.top, 10)
                
                Text(userData.isThumbsup ? "点赞成功" : "取消点赞")
                    .fontWeight(.semibold)
                    .padding(5)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 1/3,
               height: UIScreen.main.bounds.width * 1/3 * 3/4)
    }
}

struct ButtonFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFeedbackView().environmentObject(UserData())
    }
}
