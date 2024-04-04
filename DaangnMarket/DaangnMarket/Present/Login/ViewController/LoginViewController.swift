//
//  LoginViewController.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/29.
//

import UIKit

import Then

final class LoginViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let titleLabel = UILabel()
    private var idTextField = UITextField()
    private var passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @objc
    private func loginButtonDidTap() {
        // presentToWelcomeVC()
        pushToWelcomeVC()
    }
}

//MARK: - private Extension

private extension LoginViewController {
    func setStyle() {
        self.view.backgroundColor = .white
        
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
            $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
            $0.layer.cornerRadius = 6
        }
    }
    
    func setHierarchy() {
        view.addSubviews(titleLabel, idTextField, passwordTextField, loginButton)
    }
    
    //TODO: - SnapKit 적용
    func setLayout() {
        titleLabel.frame = CGRect(x: 78, y: 161, width: 236, height: 44)
        idTextField.frame = CGRect(x: 28, y: 276, width: 335, height: 52)
        passwordTextField.frame = CGRect(x: 28, y: 335, width: 335, height: 52)
        loginButton.frame = CGRect(x: 30, y: 422, width: 332, height: 58)
    }
    
    func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
    
    func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
}

extension LoginViewController {
    func resetTextField() {
        idTextField.text = ""
        passwordTextField.text = ""
    }
}
