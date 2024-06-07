//
//  SignupViewController.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/04/27.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then
import Moya

final class SignUpViewController: UIViewController {
    
    private let signUpView = SignUpView()
    
    let userProvider = MoyaProvider<UserTargetType>(
        plugins:  [MoyaLoggingPlugin()]
    )
    
    override func loadView() {
        self.view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setTarget()
    }
}

private extension SignUpViewController {
    func setTarget() {
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    func signUpButtonDidTap() {
        guard let id = signUpView.idTextField.text else { return }
        guard let password = signUpView.passwordTextField.text else { return }
        guard let nickName = signUpView.nickNameTextField.text else { return }
        guard let phoneNumber = signUpView.phoneNumberTextField.text else { return }
        
        let request = SignUpRequestModel(
            authenticationId: id,
            password: password,
            nickname: nickName,
            phone: phoneNumber
        )
        
        // SignUp Manager로 서버통신 코드 빼기 - SRP (역할 책임 분리)
        UserService.shared.signUp(request: request) { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponseModel else { return }
                dump(data)
                self?.pushToCheckUserInfoVC()
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
    
    func pushToCheckUserInfoVC() {
        let checkUserInfoVC = CheckUserInfoViewController()
        self.navigationController?.pushViewController(checkUserInfoVC, animated: true)
    }
    
    func signupButtonRx() {
        signUpView.signUpButton.rx.tap
            .subscribe(onNext: {
                print("버튼이 눌렸다! ")
            },onError: {_ in
                print("에러 발생 ㅋㅋ")
            },onCompleted: {
                print("이벤트가 종료되었다! ")
            }).disposed(by: disposebag)
    }
}
