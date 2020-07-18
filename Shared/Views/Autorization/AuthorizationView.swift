//
//  AuthorizationView.swift
//  SocialAppStructure
//
//  Created by Koushik Mudi on 18/07/20.
//

import SwiftUI

struct AuthorizationView: View {
    
    @State var presented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 60) {
                ZStack {
                    Image("bg1")
                        .resizable()
                        .cornerRadius(12)
                        .shadow(color: Color(UIColor(red: 211/255, green: 210/255, blue: 206/255, alpha: 1)),radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    VStack(alignment: .leading, spacing: 12) {
                        Text("App Logo")
                            .font(.system(size: 18, weight: .heavy))
                            .foregroundColor(Color(.blue))
                        Text("Welcome to the App!\nLogin or Register to enjoy everything we have to offer.")
                            .font(.system(size: 20, weight: .light))
                            .foregroundColor(Color(UIColor.label))
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                VStack {
                    HStack {
                        NavigationLink(
                            destination: LoginView(),
                            label: {
                                ZStack {
                                    Color(.systemGray6)
                                        .cornerRadius(12)
                                    Text("Login")
                                        .font(.system(size: 15, weight: .semibold))
                                }
                            })
                        
                        NavigationLink(
                            destination: RegisterView(authModel: .void),
                            label: {
                                ZStack {
                                    Color(.systemGray6)
                                        .cornerRadius(12)
                                    Text("Register")
                                        .font(.system(size: 15, weight: .semibold))
                                }
                            })
                    }
                    .frame(width: mainScreenBounds.width - 50, height: 50)
                    
                    HStack(alignment: .center) {
                        HStack(alignment: .center, spacing: 15) {
                            Image("apple")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .onTapGesture {
                                    presented.toggle()
                                }
                            Image("fb")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .onTapGesture {
                                    presented.toggle()
                                }
                            Image("google")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .onTapGesture {
                                    presented.toggle()
                                }
                        }
                    }
                    .frame(width: mainScreenBounds.width - 50)
                    .padding(.top, 25)
                    .alert(isPresented: $presented) {
                        Alert(title: Text("Info"), message: Text("Apply your code here."), dismissButton: .cancel())
                    }
                }
            }
            .padding(.horizontal, 25)
            .accentColor(Color(UIColor.systemPink))
            
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
        
    }
}
