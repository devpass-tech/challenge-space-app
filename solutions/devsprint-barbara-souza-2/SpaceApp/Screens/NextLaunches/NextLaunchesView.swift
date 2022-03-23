//
//  NextLaunchesView.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/03/22.
//

import UIKit

final class NextLaunchesView: UIView {
    
    private struct Configurations {
        static let titleLabel: CGFloat = 24
        static let infoLabel: CGFloat = 20
        static let backgroundCardColor: UIColor? = .backgroundNextLaunchColor
        static let infoColor: UIColor? = .textLabelColor
        static let cornerRadiusIcon: CGFloat = 10
        static let cornerRadiusCard: CGFloat = 10
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
    
    private lazy var contentLabelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(numberLabel)
//        stackView.addArrangedSubview(launchDateLabel)
        return stackView
    }()
    
    private lazy var headerCardView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(launchBadge)
        contentView.addSubview(contentLabelStack)
        return contentView
    }()
    
    private lazy var cardContentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(headerCardView)
        contentView.addSubview(launchDescriptionLabel)
        contentView.layer.cornerRadius = Configurations.cornerRadiusCard
        contentView.backgroundColor = .backgroundNextLaunchColor
        return contentView
    }()
    
    init() {
        
        super.init(frame: .zero)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with nextLaunch: NextLaunch) {
        nameLabel.text = nextLaunch.name
        numberLabel.text = "#\(String(nextLaunch.launchNumber))"
        launchDescriptionLabel.text = nextLaunch.details ?? ""
        launchBadge.load(urlString: nextLaunch.links.patch.small)
    }
}

private extension NextLaunchesView {
    
    func setupViews() {
        
        self.backgroundColor = .black
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        self.addSubview(upcomingLabel)
        self.addSubview(cardContentView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            upcomingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            upcomingLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 19),
            upcomingLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -19),
            
            cardContentView.topAnchor.constraint(equalTo: upcomingLabel.bottomAnchor, constant: 16),
            cardContentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 19),
            cardContentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -19),
            cardContentView.heightAnchor.constraint(equalToConstant: 245),
            
            headerCardView.topAnchor.constraint(equalTo: cardContentView.topAnchor, constant: 16),
            headerCardView.leadingAnchor.constraint(equalTo: cardContentView.leadingAnchor, constant: 16),
            headerCardView.trailingAnchor.constraint(equalTo: cardContentView.trailingAnchor, constant:  -16),
            
            launchBadge.topAnchor.constraint(equalTo: headerCardView.topAnchor),
            launchBadge.leadingAnchor.constraint(equalTo: headerCardView.leadingAnchor),
            launchBadge.heightAnchor.constraint(equalToConstant: 125),
            launchBadge.widthAnchor.constraint(equalToConstant: 125),
            
            contentLabelStack.topAnchor.constraint(equalTo: launchBadge.topAnchor, constant: 18.5),
            contentLabelStack.leadingAnchor.constraint(equalTo: launchBadge.trailingAnchor, constant: 16),
            contentLabelStack.trailingAnchor.constraint(lessThanOrEqualTo: headerCardView.trailingAnchor),
            
            launchDescriptionLabel.topAnchor.constraint(equalTo: headerCardView.bottomAnchor, constant: 16),
            launchDescriptionLabel.leadingAnchor.constraint(equalTo: cardContentView.leadingAnchor, constant: 18),
            launchDescriptionLabel.trailingAnchor.constraint(equalTo: cardContentView.trailingAnchor, constant: -18),
            launchDescriptionLabel.bottomAnchor.constraint(equalTo: cardContentView.bottomAnchor, constant: -16)
        ])
    }
}

