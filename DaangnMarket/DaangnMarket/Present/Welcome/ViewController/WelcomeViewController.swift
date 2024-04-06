//
//  WelcomeViewController.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/30.
//

import UIKit

import Then
import SnapKit

final class WelcomeViewController: UIViewController {
    
    //MARK: - Properties
    
    var id: String?
    
    //MARK: - UI Components 
    
    private let logoImageView = UIImageView()
    private let welcomeLabel = UILabel()
    private let goHomeButton = UIButton()
    private let backToLoginButton = UIButton()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()

        bindID()
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if let loginViewController = navigationController?.viewControllers.first(where: { $0 is LoginViewController }) as? LoginViewController {
            loginViewController.resetTextField()
        }
        
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

//MARK: - private Extension

private extension WelcomeViewController {
    func setStyle() {
        self.view.backgroundColor = .white
        
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
            $0.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
            $0.layer.cornerRadius = 6
        }
        
        backToLoginButton.do {
            $0.backgroundColor = .daangngrey200
            $0.setTitle("다시 로그인", for: .normal)
            $0.setTitleColor(.daangngrey300, for: .normal)
            $0.titleLabel?.font = .pretendardBold(size: 18)
            $0.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
            $0.layer.cornerRadius = 6
        }
    }
    
    func setHierarchy() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
   
    func setLayout() {
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
    
    func bindID() {
        if let idText = id {
            self.welcomeLabel.text = "\(idText)님 \n반가워요!"
        } else {
            print("id가 없습니다. ")
        }
    }
}

//MARK: - Extension

extension WelcomeViewController {
    func setLabelText(id: String?) {
        self.id = id
    }
}
