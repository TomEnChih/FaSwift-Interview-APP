//
//  FoodProfileView.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/27.
//

import UIKit
import SnapKit

class FoodProfileView: UIView {

    // MARK: - Properties
    
    // MARK: - IBOutlets
    
    let profileCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
                
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.id)
        cv.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.id)
        cv.alwaysBounceVertical = true
        cv.backgroundColor = .white
        
        return cv
    }()
    
    // MARK: - Autolayout
    
    private func autoLayout() {
        
        profileCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.topMargin)
            make.right.left.bottom.equalTo(self)
        }
        
    }
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileCollectionView)
        
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

}
