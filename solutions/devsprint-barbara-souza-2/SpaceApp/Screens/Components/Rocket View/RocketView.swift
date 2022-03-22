//
//  RocketView.swift
//  SpaceApp
//
//  Created by Hyago Henrique on 21/03/22.
//

import Foundation
import UIKit

final class RocketView: UIView {
    
    private struct Configurations {
        static let mainTextColor: UIColor? = .textLabelColor
        static let rocketTitleLabelFontSize: CGFloat = 24
        static let rocketInfoLabelFontSize: CGFloat = 20
        static let spacingStackView: CGFloat = 16
        static let buttonCornerRadius: CGFloat = 14
        static let labelNumberOfLines: Int = 3
    }
    
    private lazy var rocketLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Configurations.rocketTitleLabelFontSize, weight: .bold)
        label.text = "Rocket"
        return label
    }()
    
    private lazy var nameRocketLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Configurations.rocketInfoLabelFontSize, weight: .regular)
        label.textColor = Configurations.mainTextColor
        return label
    }()
    
    private lazy var infoRocketLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Configurations.rocketInfoLabelFontSize, weight: .regular)
        label.numberOfLines = Configurations.labelNumberOfLines
        label.textColor = Configurations.mainTextColor
        return label
    }()
    
    private lazy var buttonView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See more", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = Configurations.buttonCornerRadius
        return button
    }()
    
    private lazy var stackContentView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Configurations.spacingStackView
        stackView.axis = .vertical
        stackView.addArrangedSubview(rocketLabel)
        stackView.addArrangedSubview(nameRocketLabel)
        stackView.addArrangedSubview(infoRocketLabel)
        stackView.addArrangedSubview(buttonView)
        return stackView
    }()
    
    init() {
        
        super.init(frame: .zero)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with rocketView: Rocket) {
        nameRocketLabel.text = rocketView.name
        infoRocketLabel.text = rocketView.details
    }
}

extension RocketView {
    private func setupViews() {
        
        self.backgroundColor = .black
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    private func configureSubviews() {
        self.addSubview(stackContentView)
    }
    
    private func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackContentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackContentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35.5),
            stackContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35.5),
            
            buttonView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
