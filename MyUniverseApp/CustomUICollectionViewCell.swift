//
//  CustomUICollectionViewCell.swift
//  MyUniverseApp
//
//  Created by spezza on 16.01.2021.
//

import UIKit

class RoundedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sparkles")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "List"
        label.textColor = UIColor.black
        label.font = .preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var secondaryLabel: UILabel = {
        let label = UILabel()
//        label.text = "Age: \n Type: "
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 10)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton(type: .custom) as UIButton
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        button.tintColor = .black
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RoundedCollectionViewCell {
    
    // MARK: Setup Cell
    fileprivate func setupCell() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        roundCorner()
        
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
        self.addSubview(secondaryLabel)
        self.addSubview(infoButton)
        
        setLayoutConstraints()
    }
    
    // MARK: Setup Layout Constrains
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([

            iconImageView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 12),
            iconImageView.widthAnchor.constraint(equalToConstant: 38),
            iconImageView.heightAnchor.constraint(equalToConstant: 38),
            
            secondaryLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -34),
            secondaryLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 8),
            secondaryLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -8),
            
            
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: secondaryLabel.topAnchor, constant: -7),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -8),
            
//            infoButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 28),
            infoButton.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            infoButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -12),
            infoButton.widthAnchor.constraint(equalToConstant: 38),
            infoButton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    // MARK: Setup round corners for CollectionViewCell
    private func roundCorner() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
    }
}
