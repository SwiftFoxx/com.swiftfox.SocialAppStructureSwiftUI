//
//  AuthModel.swift
//  SocialAppStructure
//
//  Created by Koushik Mudi on 18/07/20.
//

import Foundation

struct AuthModel: Codable, Identifiable, Equatable {
    var id: Int
    var fullName: String
    var email: String
    var userName: String
    var password: String
    var image: String
    
    static var void = AuthModel(id: 0, fullName: "", email: "", userName: "", password: "", image: "")
}
