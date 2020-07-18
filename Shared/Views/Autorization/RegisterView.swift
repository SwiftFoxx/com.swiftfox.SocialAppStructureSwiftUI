//
//  RegisterView.swift
//  SocialAppStructure
//
//  Created by Koushik Mudi on 18/07/20.
//

import SwiftUI
import IQKeyboardManagerSwift

struct RegisterView: View {
    @State var authModel: AuthModel
    @State var pickerPresented: Bool = false
    @State var shouldShowHome: Bool = false
    var body: some View {
        VStack {
            Text("Register").font(.system(size: 21, weight: .semibold))
            Text("Authentication for users done here. Change as per design. Currently it uses default storage for authentication, available per session.")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            VStack(spacing: 30) {
                ZStack {
                    Color(.secondarySystemBackground)
                        .frame(width: 150, height: 150)
                        .cornerRadius(75)
                    Button(action: {
                        pickerPresented.toggle()
                    }) {
                        VStack {
                            Image(systemName: "camera.fill")
                                .foregroundColor(Color(UIColor.tertiarySystemFill))
                            Text("Add Image")
                                .font(.footnote)
                                .foregroundColor(Color(UIColor.tertiarySystemFill))
                        }
                    }
                }
                VStack(spacing: 25) {
                    HStack(spacing: 10) {
                        Text("Username").font(.system(size: 16, weight: .semibold))
                        TextField("john.doe", text: $authModel.userName)
                            .font(.system(size: 16, weight: .semibold))
                            .autocapitalization(.none)
                    }
                    HStack(spacing: 12) {
                        Text("Full Name").font(.system(size: 16, weight: .semibold))
                        TextField("John Doe", text: $authModel.fullName)
                            .font(.system(size: 16, weight: .semibold))
                            .autocapitalization(.words)
                    }
                    HStack(spacing: 47) {
                        Text("Email").font(.system(size: 16, weight: .semibold))
                        TextField("johndoe@example.com", text: $authModel.email)
                            .font(.system(size: 16, weight: .semibold))
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    HStack(spacing: 15) {
                        Text("Password").font(.system(size: 16, weight: .semibold))
                        SecureField("••••••••••", text: $authModel.password)
                            .font(.system(size: 16, weight: .semibold))
                            .textContentType(.password)
                    }
                }
                NavigationLink(
                    destination: HomeView(),
                    isActive: $shouldShowHome,
                    label: {
                    })
                Button(action: {
                    if authModel != AuthModel.void {
                        shouldShowHome = true
                    } else {
                        shouldShowHome = false
                    }
                }, label: {
                    ZStack {
                        Color(.systemPink)
                            .frame(width: 330, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(12)
                        Text("Submit")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                })
            }
            Spacer()
        }
        .accentColor(.yellow)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
        .navigationTitle("")
        .onAppear {
            IQKeyboardManager.shared.enable = true
        }
        .sheet(isPresented: $pickerPresented) {
            // Create ImagePicker
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(authModel: AuthModel(
            id: 0,
            fullName: "",
            email: "",
            userName: "",
            password: "",
            image: ""
        ))
        .preferredColorScheme(.dark)
    }
}
