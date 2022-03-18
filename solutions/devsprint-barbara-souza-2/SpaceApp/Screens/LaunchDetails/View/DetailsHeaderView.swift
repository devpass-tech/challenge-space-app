//
//  DetailsHeaderView.swift
//  SpaceApp
//
//  Created by William Henrique Gonçalves Ribeiro on 15/03/22.
//

import UIKit

class DetailsHeaderView: UIView {

    lazy var badgeImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo vem aqui")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var shipNameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text =  "CRS-20"
       return label
    }()
    
    lazy var statusLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text =  "Success"
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.addSubview(self.badgeImageView)
        self.addSubview(self.shipNameLabel)
        self.addSubview(self.statusLabel)
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.badgeImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            self.badgeImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.badgeImageView.heightAnchor.constraint(equalToConstant: 125),
            self.badgeImageView.widthAnchor.constraint(equalToConstant: 125),

            self.shipNameLabel.topAnchor.constraint(equalTo: self.badgeImageView.bottomAnchor, constant: 20),
            self.shipNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.shipNameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            self.statusLabel.topAnchor.constraint(equalTo: self.shipNameLabel.bottomAnchor, constant: 10),
            self.statusLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.statusLabel.heightAnchor.constraint(equalToConstant: 30),

            
        ])
        
    }

}
