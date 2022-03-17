//
//  ErrorView.swift
//  SpaceApp
//
//  Created by Brenda Monteiro on 15/03/22.
//

import Foundation
import UIKit

class ErrorView: UIView {
    
    private struct viewConfig {
        static let imageWidth: CGFloat = 125
        static let imageHeight: CGFloat = 125
        static let subtitleLines: Int = 0

    }
    
    private lazy var image: UIImageView = {
        let variable = UIImageView()
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var titleLabel: UILabel = {
        let variable = UILabel()
        variable.textColor = .white
        variable.font = .systemFont(ofSize: Spacing.large, weight: .semibold)
        variable.textAlignment = .center
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let variable = UILabel()
        variable.textColor = UIColor(named: "primaryFontColor")
        variable.numberOfLines = viewConfig.subtitleLines
        variable.textAlignment = .center
        variable.font = .systemFont(ofSize: Spacing.mediumToLarge, weight: .regular)
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureConstraints()
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(image)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.large),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: viewConfig.imageHeight),
            image.widthAnchor.constraint(equalToConstant: viewConfig.imageWidth),
            
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: Spacing.small),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.large),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.large),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.small),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.large),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.large),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func updateView(data: ErrorViewEntity) {
        image.image = UIImage(named: data.image)
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }
    
}



    
