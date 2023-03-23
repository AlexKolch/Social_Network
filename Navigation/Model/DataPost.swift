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
                 description: """
                 — Мама, папа, я полюбила цыгана!
                 — Ну ладно, хоть мир посмотришь...
                 """,
                 image: "p1",
                 likes: 280,
                 views: 330),
        DataPost(author: DataUser.setupUser(),
                 description: """
                 По гороскопу автор Водолей.
                 Воды он много льет в статье своей.
                 """,
                 image: "p2",
                 likes: 24,
                 views: 100),
        DataPost(author: DataUser.setupUser(),
                 description: "После диеты так приятно разжечь мангал ее распечаткой!",
                 image: "p3",
                 likes: 7,
                 views: 30),
        DataPost(author: DataUser.setupUser(),
                 description: """
                 У нашего соседа сверху перфоратор, а у нас фортепиано...
                 Так что я вам скажу: ремонт когда-то заканчивается, а музыка - она вечна!
                 """,
                 image: "p4",
                 likes: 50,
                 views: 234)
    ]
}

