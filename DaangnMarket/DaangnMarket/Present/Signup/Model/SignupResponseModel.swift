//
//  SignupResponseModel.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/04/27.
//

import Foundation

// 회원가입 응답
struct SignUpResponseModel: Codable {
    let code: Int
    let message: String
}
