//
//  SignupViewModel.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/05/25.
//

import UIKit

protocol SignupViewModelType {
    var isValid: ObservablePattern<Bool> { get }
    var errMessage: ObservablePattern<String> { get }
    
    func checkValid(id: String?, password: String?)
}

final class SignupViewModel {
    
}
