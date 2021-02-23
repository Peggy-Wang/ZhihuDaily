//
//  NewsDetailsPage.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/1/28.
//

import SwiftUI

struct NewsDetailsPage: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    @State private var isActive = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let details: NewsDetails
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: 主页面
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .bottomLeading) {
                            ImageBlurView(imageUrl: URL(string: details.image)!)
                            
                            ZStack(alignment: .bottomTrailing) {
                                Text(details.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                
                                Text(details.image_source)
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                    .padding(.trailing, 5)
                            }
                            .frame(width: UIScreen.main.bounds.width, height: 100)
                        }
                        
                        Text("栏目 / \(details.section_name)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    
                    Text(details.body)
                }
                
                // MARK: 点赞提示
                if userData.timeRemaining > 0 {
                    ButtonFeedbackView()
                }
            }
            .onReceive(timer) { time in
                guard self.isActive else { return }
                if userData.timeRemaining > 0 {
                    userData.timeRemaining -= 1
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                self.isActive = false
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                self.isActive = true
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        // MARK: 使用presentationMode进行返回时 返回按键须与该页面处于同一结构中
                        Image(systemName: "chevron.backward")
                            .imageScale(.large)
                            .foregroundColor(Color(.label))
                            .padding(.leading, 20)
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        
                        NewsDetailsToolBar(newsExtra: newsExtra9733310)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
            }
            .edgesIgnoringSafeArea(.top) // MARK: 去掉上部安全区域
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
        //.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsPage(details: newsDetails9733310).environmentObject(UserData())
    }
}
