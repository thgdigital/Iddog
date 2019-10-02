//
//  ListDogController.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//


import UIKit

class ListDogController: UIViewController {
    
    let menuBar: MenuBar = {
        let menu = MenuBar()
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = true
        return collection
    }()
    
    var listDog: [String] = []
    var listCategory: [Category] = []
    var presenter: ListDogPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        title = "Listas de Dogs"
        setupLayout()
    }
    
    func setupLayout() {
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
        menuBar.backgroundColor = .white
        view.backgroundColor = .white
        view.addSubview(menuBar)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .never
        menuBar.delegate = self
        collectionView.register(DogCell.self, forCellWithReuseIdentifier: DogCell.identifier)
        NSLayoutConstraint.activate([
            menuBar.heightAnchor.constraint(equalToConstant: 40),
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let btnLogout = UIBarButtonItem(title: "Sair", style: .done, target: self, action: #selector(logoutUser))
        navigationItem.rightBarButtonItem = btnLogout
    }
    
    @objc func logoutUser() {
        presenter.logout()
    }
    
}

extension ListDogController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDog.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogCell.identifier, for: indexPath) as! DogCell
        cell.presenter = ItemPresenterBuilder.make(category: listCategory[indexPath.row], view: cell)
        cell.presenter.viewDidLoad()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
}

extension ListDogController: MenuBarDelegate {
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension ListDogController: ListDogPresenterOutput {
    func fetch(list: [String], category: [Category]) {
        listCategory = category
        listDog = list
        menuBar.items = listDog
        menuBar.category = category
        menuBar.reloadData()
        collectionView.reloadData()
    }
}
