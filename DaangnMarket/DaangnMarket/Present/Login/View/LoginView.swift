//
//  LoginView.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/29.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
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
        
        self.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
            $0.textColor = .daangnblack
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = .pretendardBold(size: 18)
        }
        
        idTextField.do {
            $0.placeholder = "아이디"
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.isSecureTextEntry = true
        }
        
        [idTextField, passwordTextField].forEach() {
            $0.do {
                $0.font = .pretendardSemiBold(size: 14)
                $0.backgroundColor = .daangngrey200
                $0.layer.cornerRadius = 3
                $0.clearButtonMode = .whileEditing
                $0.addPadding(left: 23)
            }
        }
        
        loginButton.do {
            $0.backgroundColor = .daangnprimary
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.daangnwhite, for: .normal)
            $0.titleLabel?.font = .pretendardBold(size: 18)
            $0.layer.cornerRadius = 6
        }
    }
    
    func setupHierarchy() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(161)
            $0.leading.trailing.equalToSuperview().inset(69)
            $0.height.equalTo(44)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
    }
    
}

