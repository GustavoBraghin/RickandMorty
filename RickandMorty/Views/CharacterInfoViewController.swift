//
//  CharacterInfoViewController.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 10/03/23.
//

import UIKit

class CharacterInfoViewController: UIViewController {
    
    var isFavorite: Bool = false
    private var character: CharacterModel
    
    lazy var avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.contentMode = .scaleToFill
        avatar.image = UIImage(systemName: "person")
        avatar.backgroundColor = .blue
        return avatar
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pickle Rick"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var specieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Specie:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var specieTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Human"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var originLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Origin:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var originTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Earth (C-137)"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Status:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var statusTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alive"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var genderTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Male"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var lastKnownLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Last known location:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var lastKnownLocationTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Interdimensional Cable"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()

    init(character: CharacterModel) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rickAndMortyBlue
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: isFavorite ? "heart.fill" : "heart"), style: .plain, target: self, action: #selector(didTapFavorite))
        navigationItem.rightBarButtonItem?.tintColor = .rickAndMortyPink
        
        addSubviews()
        configureConstraints()
        configureInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func didTapFavorite() {
//        delegate?.characterCollectionViewDidTapFavorite()
        isFavorite.toggle()
        if isFavorite {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
        }else{
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
        }
    }
    
    private func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(specieLabel)
        view.addSubview(specieTextLabel)
        view.addSubview(originLabel)
        view.addSubview(originTextLabel)
        view.addSubview(statusLabel)
        view.addSubview(statusTextLabel)
        view.addSubview(genderLabel)
        view.addSubview(genderTextLabel)
        view.addSubview(lastKnownLocationLabel)
        view.addSubview(lastKnownLocationTextLabel)
    }
    
    private func configureInfo() {
        let url = URL(string: character.image)
        avatarImageView.sd_setImage(with: url)
        nameLabel.text = character.name
        specieTextLabel.text = character.species
        originTextLabel.text = character.origin.name
        statusTextLabel.text = character.status
        genderTextLabel.text = character.gender
        lastKnownLocationTextLabel.text = character.location.name
    }

    private func configureConstraints() {
        let avatarImageViewContraints = [
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -2), //incorrect?
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        let specieLabelConstrains = [
            specieLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            specieLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        ]
        
        let specieTextLabelConstraints = [
            specieTextLabel.leadingAnchor.constraint(equalTo: specieLabel.trailingAnchor, constant: 5),
            specieTextLabel.topAnchor.constraint(equalTo: specieLabel.topAnchor)
        ]
        
        let originLabelConstrains = [
            originLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            originLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor, constant: 10)
        ]
        
        let originTextLabelConstraints = [
            originTextLabel.leadingAnchor.constraint(equalTo: originLabel.trailingAnchor, constant: 5),
            originTextLabel.topAnchor.constraint(equalTo: originLabel.topAnchor)
        ]
        
        let statusLabelConstrains = [
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10)
        ]
        
        let statusTextLabelConstraints = [
            statusTextLabel.leadingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 5),
            statusTextLabel.topAnchor.constraint(equalTo: statusLabel.topAnchor)
        ]
        
        let genderLabelConstrains = [
            genderLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            genderLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10)
        ]
        
        let genderTextLabelConstraints = [
            genderTextLabel.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor, constant: 5),
            genderTextLabel.topAnchor.constraint(equalTo: genderLabel.topAnchor)
        ]
        
        let lastKnownLocationLabelConstraints = [
            lastKnownLocationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            lastKnownLocationLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10)
        ]
        
        let lastKnownLocationTextLabelConstraints = [
            lastKnownLocationTextLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            lastKnownLocationTextLabel.topAnchor.constraint(equalTo: lastKnownLocationLabel.bottomAnchor, constant: 3)
        ]
        
        NSLayoutConstraint.activate(avatarImageViewContraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(specieLabelConstrains)
        NSLayoutConstraint.activate(specieTextLabelConstraints)
        NSLayoutConstraint.activate(originLabelConstrains)
        NSLayoutConstraint.activate(originTextLabelConstraints)
        NSLayoutConstraint.activate(statusLabelConstrains)
        NSLayoutConstraint.activate(statusTextLabelConstraints)
        NSLayoutConstraint.activate(genderLabelConstrains)
        NSLayoutConstraint.activate(genderTextLabelConstraints)
        NSLayoutConstraint.activate(lastKnownLocationLabelConstraints)
        NSLayoutConstraint.activate(lastKnownLocationTextLabelConstraints)
    }
}
