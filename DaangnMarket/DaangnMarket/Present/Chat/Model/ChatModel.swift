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
            ChatModel(profileImg: .imgUser1, name: "류희재", place: "성북구", message: "나는 바보다!", itemImg: .imgTotoro),
            ChatModel(profileImg: .imgUser2, name: "윤희슬", place: "여의도", message: "나는 공주일걸?", itemImg: .imgCinamon),
            ChatModel(profileImg: .imgUser3, name: "김가현", place: "잠실", message: "어쩌라고요", itemImg: .imgMymelody),
            ChatModel(profileImg: .imgUser4, name: "김선우", place: "회기", message: "두산 화이팅!", itemImg: .imgKuromi),
            ChatModel(profileImg: .imgUser5, name: "서은수", place: "미국", message: "하암냐 지각 안 할게요", itemImg: .imgMymelody2),
            ChatModel(profileImg: .imgUser6, name: "김민서", place: "중국", message: "곽성준 나락나락ㄴ나라가나락", itemImg: .imgChikawa),
            ChatModel(profileImg: .imgUser7, name: "한지석", place: "태국", message: "젊을때사랑은돈주고도못산다", itemImg: .imgMymelody3),
            ChatModel(profileImg: .imgUser8, name: "조혜린", place: "명왕성", message: "뒷풀이좀갑시다선생님", itemImg: .imgFriend),
            ChatModel(profileImg: .imgUser9, name: "정민지", place: "일본", message: "응애저는갓기입니다", itemImg: .imgKuromi2),
            ChatModel(profileImg: .imgUser10, name: "박신영", place: "안드로메다", message: "소주를마시지않겠습니다", itemImg: .imgFriend2)
        ]
    }
}
