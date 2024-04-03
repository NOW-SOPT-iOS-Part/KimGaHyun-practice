//
//  LoginViewController.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/29.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.addPadding(left: 23)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.addPadding(left: 23)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        // presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
}

