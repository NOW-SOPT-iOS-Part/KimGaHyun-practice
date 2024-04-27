//
//  ItemCollectionViewCell.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/04/20.
//

import UIKit

import SnapKit
import Then

protocol ItemCollectoinViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

final class ItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemCollectionViewCell"
    var itemRow: Int?
    
    weak var delegate: ItemCollectoinViewCellDelegate?
    
    private let itemImageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private lazy var heartButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.heartButton.isSelected = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func heartButtonDidTap() {
        self.heartButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.heartButtonDidTapEvent(
                state: self.heartButton.isSelected,
                row: itemRow
            )
        }
    }
}

private extension ItemCollectionViewCell {
    func setupStyle() {
        self.backgroundColor = .white
        
        nameLabel.do {
            $0.textColor = .daangnblack
            $0.textAlignment = .center
            $0.font = .pretendardRegular(size: 16)
        }
        
        priceLabel.do {
            $0.textColor = .daangnprimary
            $0.textAlignment = .left
            $0.font = .pretendardBold(size: 15)
        }
        
        heartButton.do {
            $0.setImage(.icHeart, for: .normal)
            $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
            //button.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        }
    }
    
    func setupHierarchy() {
        [itemImageView, nameLabel, priceLabel, heartButton].forEach {
            contentView.addSubview($0)
        }
    }
        
    func setupLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
}

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        itemImageView.image = itemData.itemImg
        nameLabel.text = itemData.name
        priceLabel.text =  itemData.price
        heartButton.isSelected = itemData.heartIsSelected
        self.itemRow = itemRow
    }
}


