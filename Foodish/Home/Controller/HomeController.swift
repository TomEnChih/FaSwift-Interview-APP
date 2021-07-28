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
    }

    // MARK: - Methods
    
    private func setNavigationItem() {
        navigationItem.title = "FaSwift Interview Project"
    }
    
}

