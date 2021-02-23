//
//  UserPage.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/21.
//

import SwiftUI

struct UserPage: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        if userData.isLogined == true {
            VStack {
                HStack {
                    Image(systemName: "chevron.backward")
                        .imageScale(.large)
                        .foregroundColor(Color(.label))
                        .padding()
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                
                Spacer()
                
                VStack {
                    VStack {
                        Image("avatar")
                            .resizable()
                            .cornerRadius(50)
                            .frame(width: 100, height: 100)
                            .padding()
                        Text(userData.userName)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    Divider()
                    
                    HStack {
                        Spacer()
                        
                        Text("退出登录")
                            .font(.title3)
                            .foregroundColor(.red)
                            .onTapGesture {
                                userData.isLogined.toggle()
                                userData.userName = ""
                                userData.password = ""
                            }
                        
                        Spacer()
                    }
                    .padding(8)
                    
                    Divider()
                    Spacer()
                    
                    HStack {
                        VStack {
                            Image(systemName: "moon")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding()
                            Text("夜间模式")
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding()
                            Text("设置")
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 3/5)
                    .padding(.bottom, UIScreen.main.bounds.height * 1/15)
                }
                .navigationBarHidden(true)
            }
        } else {
            VStack {
                HStack {
                    Image(systemName: "chevron.backward")
                        .imageScale(.large)
                        .foregroundColor(Color(.label))
                        .padding()
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                Spacer()
                
                Text("登录")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width * 14/15, alignment: .leading)
                    .padding()
                
                VStack {
                    Divider()
                    HStack {
                        Text("用户名")
                            .frame(width: UIScreen.main.bounds.width * 1/5, alignment: .leading)
                        TextField("用户名", text: $userData.userName)
                    }
                    
                    Divider()
                    HStack {
                        Text("密码")
                            .frame(width: UIScreen.main.bounds.width * 1/5, alignment: .leading)
                        SecureField("必填", text: $userData.password)
                    }
                    Divider()
                }
                .padding()
                
                VStack {
                    Divider()
                    HStack {
                        if userData.userName == "" || userData.password == "" {
                            Text("登录")
                                .foregroundColor(.secondary)
                        } else {
                            Text("登录")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    userData.isLogined.toggle()
                                }
                        }
                    }
                    Divider()
                }
                .padding()
                .padding(.bottom, UIScreen.main.bounds.height * 1/2)
            }
            .navigationBarHidden(true)
        }
    }
}

struct UserPage_Previews: PreviewProvider {
    static var previews: some View {
        UserPage().environmentObject(UserData())
    }
}
