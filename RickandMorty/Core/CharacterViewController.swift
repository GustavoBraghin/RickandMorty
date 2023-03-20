//
//  CharacterViewController.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 06/03/23.
//

import UIKit
import SDWebImage

class CharacterViewController: UIViewController {
    
    private var isStatusBarHidden: Bool = true
    private var viewModel = CharacterViewViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.bounds.width * 0.9, height: 140)
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var statusBar: UIView = {
        let view = UIView()
        view.backgroundColor = .rickAndMortyYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rickAndMortyYellow
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(collectionView)
        view.addSubview(statusBar)
        collectionView.delegate = self
        collectionView.dataSource = self
        configureConstraints()
        
//        DispatchQueue.global(qos: .userInitiated).async {
//            self.viewModel.getAllCharacters()
//        }
//        DispatchQueue.main.async {
//            while self.viewModel.nextUrl != nil {
//                self.viewModel.getAllCharacters()
////                print(self.viewModel.characters)
//            }
//        }
        
        print("View loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configureConstraints() {
        let collectionViewConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let statusBarConstraints = [
            statusBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBar.topAnchor.constraint(equalTo: view.topAnchor),
            statusBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // Depending on the iphone model, the status bar height changes
            statusBar.heightAnchor.constraint(equalToConstant: view.bounds.height > 800 ? 40 : 20)
        ]
        
        NSLayoutConstraint.activate(collectionViewConstraints)
        NSLayoutConstraint.activate(statusBarConstraints)
    }
}

extension CharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.contentView.backgroundColor = .rickAndMortyBlue
        cell.nameLabel.text = viewModel.characters[indexPath.item].name
        cell.specieTextLabel.text = viewModel.characters[indexPath.item].species
        cell.originTextLabel.text = viewModel.characters[indexPath.item].origin.name
//        cell.lastKnownLocationTextLabel.text = viewModel.characters[indexPath.item].location.name
        let url = URL(string: viewModel.characters[indexPath.item].image)
        cell.imageView.sd_setImage(with: url)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item \(indexPath.item)")
        let vc = CharacterInfoViewController(character: viewModel.characters[indexPath.item])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        
        if yPosition > -40 && isStatusBarHidden {
            isStatusBarHidden = false
            //            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear) { [weak self] in
            self.statusBar.layer.opacity = 1
            //            }
        } else if yPosition < -40 && !isStatusBarHidden {
            isStatusBarHidden = true
            //            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear) { [weak self] in
            self.statusBar.layer.opacity = 0
            //            }
        }
    }
    
}

extension CharacterViewController: CharacterCollectionViewCellDelegate {
    func characterCollectionViewDidTapFavorite() {
        print("Touch in favorite button")
    }
}
