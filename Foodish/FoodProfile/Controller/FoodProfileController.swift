//
//  FoodProfileController.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/27.
//

import UIKit

class FoodProfileController: UIViewController {
    // MARK: - Properties
    
    private let foodProfileView = FoodProfileView()
    
    // MARK: - Init
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = foodProfileView
        foodProfileView.profileCollectionView.delegate = self
        foodProfileView.profileCollectionView.dataSource = self
        setNavigationItem()
    }
    
    // MARK: - Methods
    
    private func setNavigationItem() {
        navigationItem.title = "董恩志"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(handleReturn))
    }
    
    @objc func handleReturn() {
        dismiss(animated: true, completion: nil)
    }

}

//MARK: - UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
extension FoodProfileController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .blue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 4)/3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            //footer
            return UICollectionReusableView()
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeader.id, for: indexPath) as! ProfileHeader
        
        
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        
        return CGSize(width: width, height: 200)
    }
    
}
