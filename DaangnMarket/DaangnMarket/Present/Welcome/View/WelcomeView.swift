//
//  WelcomeView.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/30.
//

import UIKit

import SnapKit
import Then

final class WelcomeView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let logoImageView = UIImageView()
    let welcomeLabel = UILabel()
    let goHomeButton = UIButton()
    let backToLoginButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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

private extension WelcomeView {
    
    func setupStyle() {
        self.backgroundColor = .white
        
        logoImageView.do {
            $0.image = UIImage(named: "img_character")
        }
        
        welcomeLabel.do {
            $0.text = "???님 \n반가워요!"
            $0.font = .pretendardExtraBold(size: 25)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        goHomeButton.do {
            $0.backgroundColor = .daangnprimary
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.daangnwhite, for: .normal)
            $0.titleLabel?.font = .pretendardBold(size: 18)
            $0.layer.cornerRadius = 6
        }
        
        backToLoginButton.do {
            $0.backgroundColor = .daangngrey200
            $0.setTitle("다시 로그인", for: .normal)
            $0.setTitleColor(.daangngrey300, for: .normal)
            $0.titleLabel?.font = .pretendardBold(size: 18)
            $0.layer.cornerRadius = 6
        }
    }
    
    func setupHierarchy() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setupLayout() {
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(87)
            $0.width.height.equalTo(150)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(58)
            $0.height.equalTo(60)
        }
        
        goHomeButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(71)
            $0.width.equalTo(335)
            $0.height.equalTo(58)
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(goHomeButton.snp.bottom).offset(14)
            $0.width.equalTo(335)
            $0.height.equalTo(58)
        }
    }
    
}
