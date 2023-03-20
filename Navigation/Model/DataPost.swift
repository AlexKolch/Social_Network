//
//  Post.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import Foundation

struct DataPost {
    var author: DataUser
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

final class Posts {
    static let shared: Posts = .init()

    var posts: [DataPost] = [
        DataPost(author: DataUser.setupUser(),
                 description: "Кошка выбирает себе хозяина, и никак иначе.",
                 image: "p1",
                 likes: 280,
                 views: 330),
        DataPost(author: DataUser.setupUser(),
                 description: "Любить кошку можно только на ее условиях.",
                 image: "p2",
                 likes: 24,
                 views: 100),
        DataPost(author: DataUser.setupUser(),
                 description: "Тот, кто не может понять свою кошку, не может понять вообще ничего.",
                 image: "p3",
                 likes: 7,
                 views: 30),
        DataPost(author: DataUser.setupUser(),
                 description: "С эстетической точки зрения, в мире существует только две идеальные вещи: часы и кошки.",
                 image: "p4",
                 likes: 50,
                 views: 234)
    ]
}

