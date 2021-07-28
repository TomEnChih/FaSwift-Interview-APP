//
//  ProfileCell.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/28.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let id = "ProfileCell"
    
    // MARK: - IBOutlets
    
    private let foodImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    // MARK: - Autolayout
    
    private func autoLayout() {
        
        foodImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(foodImageView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(with model: String) {
        
        foodImageView.image = nil
        foodImageView.loadingImage(url: URL(string: model)!)
    }
    
}
