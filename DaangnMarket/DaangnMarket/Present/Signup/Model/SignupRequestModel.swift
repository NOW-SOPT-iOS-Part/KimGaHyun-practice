//
//  SignupRequestModel.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/04/27.
//

import Foundation

// 회원가입 요청
struct SignUpRequestModel: Codable {
    let authenticationId: String
    let password: String
    let nickname: String
    let phone: String
}
