//
//  CheckUserInfoViewController.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/04/27.
//

import Foundation
import UIKit

final class CheckUserInfoViewController: UIViewController {

    private let checkUserInfoView = CheckUserInfoView()
    
    override func loadView() {
        self.view = checkUserInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestUserInfo()
    }

    private func requestUserInfo() {
        //memeberId에 아까 받은 멤버 아이디 직접 넣어주기
        UserService.shared.getUserInfo(memberId: "\(11)") { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? UserInfoResponseModel else {
                    return }
                self?.checkUserInfoView.idLabel.text = data.data.authenticationId
                self?.checkUserInfoView.nickNameLabel.text = data.data.nickname
                self?.checkUserInfoView.phoneNumberLabel.text = data.data.phone
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
}
