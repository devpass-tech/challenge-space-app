//
//  NextLaunchesView.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/03/22.
//

import UIKit

final class NextLaunchesView: UIView {
    
    private struct Configurations {
        static let contentInfoStackViewSpacing: CGFloat = 8
        static let contentBadgeStackViewSpacing: CGFloat = 16
        static let contentStackViewSpacing: CGFloat = 16
        static let titleLabel: CGFloat = 24
        static let infoLabel: CGFloat = 20
        static let infoColor: UIColor = UIColor(red: 0.56, green: 0.56, blue: 0.58, alpha: 1.00)
        static let backgroundCardColor: UIColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
        static let cornerRadiusIcon: CGFloat = 10
    }
    
    private lazy var upcomingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Configurations.titleLabel, weight: .bold)
        label.text = "Upcoming"
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Configurations.titleLabel, weight: .semibold)
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Configurations.infoLabel, weight: .regular)
        label.textColor = Configurations.infoColor
        return label
    }()
    
    private lazy var launchDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Configurations.infoLabel, weight: .regular)
        label.textColor = Configurations.infoColor
        return label
    }()
    
    private lazy var launchDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Configurations.infoLabel, weight: .regular)
        label.textColor = Configurations.infoColor
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var launchBadge: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = Configurations.cornerRadiusIcon
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var contentInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Configurations.contentInfoStackViewSpacing
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(launchDateLabel)
        return stackView
    }()
    
    private lazy var contentBadgeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Configurations.contentBadgeStackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        stackView.addArrangedSubview(launchBadge)
        stackView.addArrangedSubview(contentInfoStackView)
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = Configurations.backgroundCardColor
        stackView.layer.cornerRadius = 10.0
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 18, leading: 16, bottom: 18, trailing: 16)
        stackView.spacing = Configurations.contentStackViewSpacing
        stackView.addArrangedSubview(contentBadgeStackView)
        stackView.addArrangedSubview(launchDescriptionLabel)
        return stackView
    }()
    
    init() {
        
        super.init(frame: .zero)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NextLaunchesView {
    
    func setupViews() {
        
        self.backgroundColor = .backgroundColor
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        self.addSubview(upcomingLabel)
        self.addSubview(contentStackView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            upcomingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            upcomingLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 19),
            upcomingLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -19),
            
            contentStackView.topAnchor.constraint(equalTo: upcomingLabel.bottomAnchor, constant: 19),
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 19),
            contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -19),
        ])
    }
}

extension NextLaunchesView {
    
    func updateView(with nextLaunch: NextLaunch) {
        nameLabel.text = nextLaunch.name
        numberLabel.text = "#\(String(nextLaunch.launchNumber))"
        launchDateLabel.text = nextLaunch.launchDate
        launchDescriptionLabel.text = nextLaunch.description
        launchBadge.image = UIImage(systemName: nextLaunch.badge)
    }
}
