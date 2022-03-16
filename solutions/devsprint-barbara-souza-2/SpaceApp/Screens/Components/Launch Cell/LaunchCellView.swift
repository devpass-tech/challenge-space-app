//
//  LaunchCellView.swift
//  SpaceApp
//
//  Created by Isabella Bencardino on 15/03/2022.
//

import UIKit

class LaunchCellView: UITableViewCell {

    private let badgeView: UIImageView = {
        let badgeView = UIImageView()
        badgeView.image = UIImage(systemName: "location.north.line.fill")
        badgeView.frame = CGRect(x: 0, y: 0, width: 125, height: 125)
        badgeView.contentMode = .scaleAspectFit
        return badgeView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "CRS-20"
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        return titleLabel
    }()

    private let numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.text = "#91"
        numberLabel.font = .systemFont(ofSize: 20, weight: .regular)
        numberLabel.textColor = .gray
        return numberLabel
    }()

    private let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = "July 03, 2020"
        dateLabel.font = .systemFont(ofSize: 20, weight: .regular)
        dateLabel.textColor = .gray
        return dateLabel
    }()

    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Sucess"
        statusLabel.font = .systemFont(ofSize: 20, weight: .regular)
        statusLabel.textColor = .gray
        return statusLabel
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .backgroundColor
        layer.cornerRadius = 10
        setupViews()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {

        addSubview(badgeView)
        addSubview(numberLabel)

        configureSubviewsConstraints()
    }

    private func setupStackView() {
        addSubview(stackView)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(statusLabel)

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8

        configureStackViewConstraints()
    }

    private func configureStackViewConstraints() {

        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 34.5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34.5).isActive = true
        stackView.leadingAnchor.constraint(equalTo: badgeView.trailingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: numberLabel.leadingAnchor, constant: 16).isActive = true
    }

    private func configureSubviewsConstraints() {

        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        badgeView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        badgeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        badgeView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true

        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.widthAnchor.constraint(equalToConstant: 34).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        numberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    }
}
