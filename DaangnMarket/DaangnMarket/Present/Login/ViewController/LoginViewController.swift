//
//  LoginViewController.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/29.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let loginView = LoginView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
    }
    
    @objc
    private func loginButtonDidTap() {
        // presentToWelcomeVC()
        pushToWelcomeVC()
    }
}

//MARK: - private Extension

private extension LoginViewController {
    func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = loginView.idTextField.text
        welcomeViewController.setLabelText(id: loginView.idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
    
    func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = loginView.idTextField.text
        welcomeViewController.setLabelText(id: loginView.idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func setAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
}

extension LoginViewController {
    func resetTextField() {
        loginView.idTextField.text = ""
        loginView.passwordTextField.text = ""
    }
}
