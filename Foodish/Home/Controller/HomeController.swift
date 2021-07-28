//
//  HomeController.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/27.
//

import UIKit

class HomeController: UIViewController {

    // MARK: - Properties
    
    private let homeView = HomeView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setNavigationItem()
        setButtonAction()
    }

    // MARK: - Methods
    
    private func setNavigationItem() {
        navigationItem.title = "FaSwift Interview Project"
    }
    
    private func setButtonAction() {
        
        homeView.didTapRandomButton = { [weak self] in
            
            let randomNumber = Int.random(in: 1...100)
            
            self?.homeView.foodAmountField.text = String(randomNumber)
        }
        
        
        homeView.didTapProducedButton = { [weak self] in
            
            guard let text = self?.homeView.foodAmountField.text,let number = Int(text) else {
                return
            }
            
            let vc = FoodProfileController(foodCount: number)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


