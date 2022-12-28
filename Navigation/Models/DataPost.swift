//
//  Post.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import Foundation

struct DataPost {

    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int

    static func arrayPosts() -> [DataPost] {
        let posts = [
            DataPost(author: "Хелен Браун",
                 description: "Кошка выбирает себе хозяина, и никак иначе.",
                 image: "Cat3",
                 likes: 280,
                 views: 330),
            DataPost(author: "Пол Грэй",
                 description: "Любить кошку можно только на ее условиях.",
                 image: "Cat4",
                 likes: 24,
                 views: 100),
            DataPost(author: "Уинстон Черчиль",
                 description: "Тот, кто не может понять свою кошку, не может понять вообще ничего.",
                 image: "Cat2",
                 likes: 7,
                 views: 30),
            DataPost(author: "Эмиль-Огюст Шартье",
                 description: "С эстетической точки зрения, в мире существует только две идеальные вещи: часы и кошки.",
                 image: "Cat1",
                 likes: 50,
                 views: 234)
        ]
        return posts
    }
}

