//
//  CharacterCollectionViewCell.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 07/03/23.
//

import UIKit

protocol CharacterCollectionViewCellDelegate: AnyObject {
    func characterCollectionViewDidTapFavorite()
}

class CharacterCollectionViewCell: UICollectionViewCell {
    static let identifier = "characterCell"
    
    weak var delegate: CharacterCollectionViewCellDelegate?
    
    var isFavorite: Bool = false
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.backgroundColor = .rickAndMortyBlue
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pickle Rick"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .rickAndMortyPink
        button.isEnabled = true
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var specieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Specie:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var specieTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Human"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var originLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Origin:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var originTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Earth (C-137)"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    //    private lazy var lastKnownLocationLabel: UILabel = {
    //        let label = UILabel()
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.text = "Last known location:"
    //        label.textColor = .white
    //        label.font = .systemFont(ofSize: 14, weight: .bold)
    //        return label
    //    }()
    //
    //    lazy var lastKnownLocationTextLabel: UILabel = {
    //        let label = UILabel()
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.text = "Interdimensional Cable"
    //        label.textColor = .white
    //        label.font = .systemFont(ofSize: 14, weight: .regular)
    //        return label
    //    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 12
        
        addSubviews()
        configureContraints()
        configureFavoriteButton()
    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(specieLabel)
        contentView.addSubview(specieTextLabel)
        contentView.addSubview(originLabel)
        contentView.addSubview(originTextLabel)
        //        contentView.addSubview(lastKnownLocationLabel)
        //        contentView.addSubview(lastKnownLocationTextLabel)
    }
    
    func configureFavoriteButton() {
        favoriteButton.addTarget(self, action: #selector(didTapFavorite), for: .touchUpInside)
    }
    
    @objc private func didTapFavorite() {
        //        delegate?.characterCollectionViewDidTapFavorite()
        isFavorite.toggle()
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    private func configureContraints() {
        let imageViewContraints = [
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 140)
        ]
        
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 7),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ]
        
        let favoriteButtonConstraints = [
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            favoriteButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let specieLabelConstraints = [
            specieLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            specieLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)
        ]
        
        let specieTextLabelConstraints = [
            specieTextLabel.leadingAnchor.constraint(equalTo: specieLabel.trailingAnchor, constant: 5),
            specieTextLabel.topAnchor.constraint(equalTo: specieLabel.topAnchor)
        ]
        
        let originLabelConstraints = [
            originLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            originLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor, constant: 7)
        ]
        
        let originTextLabelConstraints = [
            originTextLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            originTextLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            originTextLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 3)
        ]
        
        //        let lastKnownLocationConstraints = [
        //            lastKnownLocationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
        //            lastKnownLocationLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 7)
        //        ]
        //
        //        let lastKnownLocationTextConstraints = [
        //
        //        ]
        
        NSLayoutConstraint.activate(imageViewContraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(favoriteButtonConstraints)
        NSLayoutConstraint.activate(specieLabelConstraints)
        NSLayoutConstraint.activate(specieTextLabelConstraints)
        NSLayoutConstraint.activate(originLabelConstraints)
        NSLayoutConstraint.activate(originTextLabelConstraints)
        //        NSLayoutConstraint.activate(lastKnownLocationConstraints)
        //        NSLayoutConstraint.activate(lastKnownLocationTextConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
