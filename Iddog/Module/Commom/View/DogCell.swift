//
//  DogCell.swift
//  Iddog
//
//  Created by THIAGO on 02/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit
import Lightbox

class DogCell: CollectionCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var items: [String] = []
    
    var presenter: ItemPresenterInput!
    
    let activityIndicator = UIActivityIndicatorView(frame: .zero)
    
    override func setupViews() {
        setupColletionView()
        boxView()
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.isHidden = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        
        return collection
    }()
    
    let boxViewLoading = UIView()
    
    func boxView() {
        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.text = "Carregando ..."
        message.textAlignment = .center
        message.textColor = .gray
        message.font = UIFont.systemFont(ofSize: 16)
        addSubview(boxViewLoading)
        boxViewLoading.addSubview(message)
        boxViewLoading.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor.darkGray
        activityIndicator.startAnimating()
        boxViewLoading.translatesAutoresizingMaskIntoConstraints = false
        
        activeConstraint(constraints: [
            boxViewLoading.centerYAnchor.constraint(equalTo: centerYAnchor),
            boxViewLoading.centerXAnchor.constraint(equalTo: centerXAnchor),
            boxViewLoading.widthAnchor.constraint(equalTo: widthAnchor),
            boxViewLoading.heightAnchor.constraint(equalToConstant: 150),
            message.centerXAnchor.constraint(equalTo: boxViewLoading.centerXAnchor),
            message.leftAnchor.constraint(equalTo: boxViewLoading.leftAnchor),
            message.trailingAnchor.constraint(equalTo: boxViewLoading.trailingAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 22),
            activityIndicator.widthAnchor.constraint(equalToConstant: 22),
            activityIndicator.centerXAnchor.constraint(equalTo: boxViewLoading.centerXAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: boxViewLoading.topAnchor, constant: -6.0)
        ])
    }
    
    func setupColletionView() {
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: ItemCell.self), bundle: nil), forCellWithReuseIdentifier: ItemCell.identifier)
        activeConstraint(constraints: [
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        cell.setupImage(imageString: items[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let urls = items.map({ URL(string: $0 )! })
        let lightboxImage = urls.map({ LightboxImage(imageURL: $0) })
        
        let topController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.visibleViewController()
        
        let controller = LightboxController(images: lightboxImage, startIndex: indexPath.row)
        controller.dismissalDelegate = self
        LightboxConfig.CloseButton.text = "Fechar"
        
        topController?.present(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 200)
    }
}

extension DogCell: LightboxControllerDismissalDelegate {
    
    func lightboxControllerWillDismiss(_ controller: LightboxController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}

extension DogCell: ItemPresenterOutput {
    
    func loading() {
        collectionView.isHidden = true
        boxViewLoading.isHidden = false
    }
    
    func stopLoading() {
        collectionView.isHidden = false
        boxViewLoading.isHidden = true
    }
    
    func alert(title: String, message: String) {
        
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Tentar Novamente", style: .default, handler: { dados in
            self.presenter?.viewDidLoad()
        }))
        
        let topController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.visibleViewController()
        topController?.present(alert, animated: true)
    }
    
    func fecthed(list: [String]) {
        items = list
        collectionView.reloadData()
    }
}
