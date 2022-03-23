//
//  RocketDetailsView.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/03/22.
//

import UIKit

class RocketDetailsView: UIView {
    
    lazy var shipNameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "titleColor")
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .natural
        label.text =  "Falcon Heavy"
       return label
    }()
    
    lazy var badgeImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "lançamento")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textLabelColor")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.text =  "With the ability to lift into orbit over 54 metric tons (119,000 lb)--a mass equivalent to a 737 jetliner loaded with passengers, crew, luggage and fuel--Falcon Heavy can lift more than twice the payload of the next closest operational vehicle, the Delta IV Heavy, at one-third the cost."
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "backgroundNextLaunchColor")
        self.addSubview(self.badgeImageView)
        self.addSubview(self.shipNameLabel)
        self.addSubview(self.descriptionLabel)
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.shipNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.shipNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.shipNameLabel.heightAnchor.constraint(equalToConstant: 41),
            self.shipNameLabel.widthAnchor.constraint(equalToConstant: 336),
            
            self.badgeImageView.topAnchor.constraint(equalTo: self.shipNameLabel.bottomAnchor, constant: 16),
            self.badgeImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.badgeImageView.heightAnchor.constraint(equalToConstant: 214),
            self.badgeImageView.widthAnchor.constraint(equalToConstant: 336),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.badgeImageView.bottomAnchor, constant: 56),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.descriptionLabel.heightAnchor.constraint(equalToConstant: 192),
            self.descriptionLabel.widthAnchor.constraint(equalToConstant: 340),

            
        ])
        
    }

}
