//
//  WelcomeViewController.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/30.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    //MARK: - Properties
    
    var id: String?
    
    //MARK: - UI Components
    
    private let welcomeView = WelcomeView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
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
    func bindID() {
        if let idText = id {
            welcomeView.welcomeLabel.text = "\(idText)님 \n반가워요!"
        } else {
            print("id가 없습니다. ")
        }
    }
    
    func setAddTarget() {
        welcomeView.goHomeButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        welcomeView.backToLoginButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }
}

//MARK: - Extension

extension WelcomeViewController {
    func setLabelText(id: String?) {
        self.id = id
    }
}
