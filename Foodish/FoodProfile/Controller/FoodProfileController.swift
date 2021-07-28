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
    
    private var foodImages = [String]() {
        didSet {
            print("數量：",foodImages.count)
        }
    }
    
    private let foodCount: Int
    // MARK: - Init
    
    init(foodCount: Int) {
        self.foodCount = foodCount
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = foodProfileView
        foodProfileView.profileCollectionView.delegate = self
        foodProfileView.profileCollectionView.dataSource = self
        setNavigationItem()
        
        for _ in 0...foodCount-1 {
            self.fetchAPI()
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationItem() {
        navigationItem.title = "董恩志"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(handleReturn))
    }
    
    @objc func handleReturn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func fetchAPI() {
        let url = URL(string: "https://foodish-api.herokuapp.com/api/")!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error:",error.localizedDescription)
                } else if let response = response as? HTTPURLResponse,let data = data{
                    print("Status code:",response.statusCode)
                    
                    let decoder = JSONDecoder()
                    
                    if let food = try? decoder.decode(FoodModel.self, from: data){
                        self.foodImages.append(food.image)
                        self.foodProfileView.profileCollectionView.reloadData()
                    }
                }
            }
        }.resume()
        
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
extension FoodProfileController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.id, for: indexPath) as! ProfileCell
        
        let image = foodImages[indexPath.item]
        
        cell.configure(with: image)
        
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
