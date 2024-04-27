//
//  ItemModel.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/04/20.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .imgKuromi, name: "쿠로미", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgKuromi2, name: "귀여운 쿠로미", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgMymelody, name: "마이멜로디", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgMymelody2, name: "귀여운 멜로디", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgMymelody3, name: "이쁜 멜로디", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgChikawa, name: "민서가 좋아하는애", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgCinamon, name: "희슬언니가 좋아하는애", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgFriend2, name: "내가 좋아함", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgFriend, name: "지원가현", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgKuromi, name: "Jiwon", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .imgTotoro, name: "희재오빠가 좋아하는애", price: "22000원", heartIsSelected: false)
        ]
    }
}
