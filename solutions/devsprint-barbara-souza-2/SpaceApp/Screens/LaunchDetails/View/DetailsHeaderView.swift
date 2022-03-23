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
        image.image = UIImage(named: "RocketNextLaunch")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var rocketNameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "titleColor")
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text =  "CRS-20"
       return label
    }()
    
    lazy var statusLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textLabelColor")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text =  "Success"
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "backgroundNextLaunchColor")
        self.addSubview(self.badgeImageView)
        self.addSubview(self.rocketNameLabel)
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

            self.rocketNameLabel.topAnchor.constraint(equalTo: self.badgeImageView.bottomAnchor, constant: 20),
            self.rocketNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.rocketNameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            self.statusLabel.topAnchor.constraint(equalTo: self.rocketNameLabel.bottomAnchor, constant: 10),
            self.statusLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.statusLabel.heightAnchor.constraint(equalToConstant: 30),

            
        ])
        
    }
    
    func updateLaunchView(model: LaunchDetailModel) {

        badgeImageView.image = UIImage(named: model.badgeImage)
        rocketNameLabel.text = model.rocketName
        statusLabel.text = model.status.rawValue
        
    }
}
