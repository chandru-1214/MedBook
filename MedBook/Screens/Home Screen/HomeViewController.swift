//
//  HomeViewController.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        hideNavigationBar()
    }
    @IBAction func actionOnLogoutButton(_ sender: Any) {
        homeViewModel?.logoutUser()
        UIUtils.showIntialViewController()
    }
}
