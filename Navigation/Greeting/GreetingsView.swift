//
//  Greetings.swift
//  Navigation
//
//  Created by Алексей Колыченков on 10.03.2023.
//
import UIKit

final class Greetings: UIView {
    // MARK: - Properties
    private let imageAvatarView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Алексей Колыченков"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let nameQualification: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Junior IOS - Developer"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()

    private let textView: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.text = """
29 лет. Два высших образования по специальностям "Бизнес-Аналитик" квалификации Бакалавр и "Кинооператор" квалификации Специалист.\n Основатель видеостудии "Kolchfilm" с 2012 года. Работал в Оренбурге, Краснодаре, Санкт-Петербурге и Москве. \n С 2022 года увлекся программированием и мечтаю стать IOS - разработчиком.
"""
        text.font = UIFont.systemFont(ofSize: 14, weight: .light)
        text.textColor = .black
        text.textAlignment = .natural
        text.isEditable = false

        return text
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(imageAvatarView, nameLabel, nameQualification, textView)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
// MARK: - Constraints
extension Greetings {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageAvatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            imageAvatarView.heightAnchor.constraint(equalToConstant: 150),
            imageAvatarView.widthAnchor.constraint(equalToConstant: 150),
            imageAvatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),

            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: imageAvatarView.trailingAnchor, constant: 20),

            nameQualification.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            nameQualification.leadingAnchor.constraint(equalTo: imageAvatarView.trailingAnchor, constant: 20),

            textView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textView.topAnchor.constraint(equalTo: imageAvatarView.bottomAnchor, constant: 50),
            textView.leadingAnchor.constraint(equalTo: imageAvatarView.leadingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 200),
            textView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
