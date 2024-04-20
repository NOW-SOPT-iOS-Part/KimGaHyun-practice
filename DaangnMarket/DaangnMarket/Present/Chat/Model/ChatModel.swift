//
//  ChatModel.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/04/20.
//

import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .imgUser1, name: "류희재", place: "성북구", message: "땡큐", itemImg: .imgTotoro),
            ChatModel(profileImg: .imgUser2, name: "윤희슬", place: "여의도", message: "안녕", itemImg: .imgCinamon),
            ChatModel(profileImg: .imgUser3, name: "김가현", place: "잠실", message: "아요", itemImg: .imgMymelody),
            ChatModel(profileImg: .imgUser4, name: "김선우", place: "회기", message: "너무 좋아요", itemImg: .imgKuromi),
            ChatModel(profileImg: .imgUser5, name: "서은수", place: "미국", message: "뿅", itemImg: .imgMymelody2),
            ChatModel(profileImg: .imgUser6, name: "김민서", place: "중국", message: "뿡", itemImg: .imgChikawa),
            ChatModel(profileImg: .imgUser9, name: "정민지", place: "일본", message: "자기야 미안해 했자나", itemImg: .imgKuromi2),
            ChatModel(profileImg: .imgUser7, name: "한지석", place: "태국", message: "솝트 이딴거 안했어", itemImg: .imgMymelody3),
            ChatModel(profileImg: .imgUser8, name: "조혜린", place: "명왕성", message: "진짜?", itemImg: .imgFriend),
            ChatModel(profileImg: .imgUser10, name: "이지훈", place: "안드로메다", message: "난이서~", itemImg: .imgFriend2)
        ]
    }
}
