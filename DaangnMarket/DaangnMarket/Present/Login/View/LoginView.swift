//
//  LoginView.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/29.
//

import Foundation
import UIKit

final class LoginView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    var titleLabel = UILabel()
    var idTextField = UITextField()
    var passwordTextField = UITextField()
    lazy var loginButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - extension

private extension LoginView {
    
    func setupStyle() {
        
        
        // titleLabel
        titleLabel = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        titleLabel.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        // idTextField
        idTextField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        idTextField.placeholder = "아이디"
        idTextField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        idTextField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        
        // passwordTextField
        passwordTextField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        passwordTextField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        
        // loginButton
        loginButton = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        loginButton.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        // loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    func setupHierarchy() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setupLayout() {

    }
    
}
