//
//  CheckUserInfoView.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/05/03.
//

import UIKit

import SnapKit
import Then
import Moya

final class CheckUserInfoView: UIView {
    
    let logoImageView = UIImageView(image: .imgMymelody)
    let idLabel = UILabel()
    let nickNameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    
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

private extension CheckUserInfoView {
    func setupStyle() {
        self.backgroundColor = .white
        
        idLabel.do {
            $0.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
            $0.textAlignment = .center
        }
        
        nickNameLabel.do {
            $0.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
            $0.textAlignment = .center
        }
        
        phoneNumberLabel.do {
            $0.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
            $0.textAlignment = .center
        }
    }
    
    func setupHierarchy() {
        [logoImageView, idLabel, nickNameLabel, phoneNumberLabel].forEach {
            self.addSubview($0)
        }
    }
    
    func setupLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(87)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(150)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
        }
        nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
    }
}
