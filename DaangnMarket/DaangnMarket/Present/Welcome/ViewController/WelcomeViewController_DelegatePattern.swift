//
//  WelcomeViewController_DelegatePattern.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/04/06.
//

import UIKit

import Then
import SnapKit

protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}

final class WelcomeViewController_DelegatePattern: UIViewController {
    
    //MARK: - Properties
    
    weak var delegate: DataBindProtocol?
    var id: String?

    typealias handler = ((String) -> (Void))
    var completionHandler: handler?
    
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
        if let loginViewController = navigationController?.viewControllers.first(where: { $0 is LoginViewController_DelegatePattern }) as? LoginViewController_DelegatePattern {
            loginViewController.resetTextField()
        }
        
        guard let id else { return }
        completionHandler?(id)
        
        self.navigationController?.popViewController(animated: true)
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

//MARK: - private Extension

private extension WelcomeViewController_DelegatePattern {
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
    
    //TODO: - SnapKit 적용
    func setLayout() {
        logoImageView.frame = CGRect(x: 127, y: 87, width: 150, height: 150)
        welcomeLabel.frame = CGRect(x: 145, y: 295, width: 95, height: 60)
        goHomeButton.frame = CGRect(x: 28, y: 426, width: 335, height: 58)
        backToLoginButton.frame = CGRect(x: 28, y: 498, width: 335, height: 58)
    }
    
    func bindID() {
        // guard let idText = id else { return }
        // self.welcomeLabel.text = "\(idText)님 \n반가워요!"
        if let idText = id {
            self.welcomeLabel.text = "\(idText)님 \n반가워요!"
        } else {
            print("id가 없습니다. ")
        }
    }
}

//MARK: - Extension

extension WelcomeViewController_DelegatePattern {
    func setLabelText(id: String?) {
        self.id = id
    }
}

