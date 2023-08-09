//
//  ViewController.swift
//  MedBook
//
//  Created by Chandru M on 08/08/23.
//

import UIKit

class LandingViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
    }
    
    func configureUI() {
        addCurveView()
        loginButton.setBorder(radius: 12,
                              color: .blackColor,
                              width: 1)
        signUpButton.setBorder(radius: 12,
                              color: .blackColor,
                              width: 1)
        loginButton.backgroundColor = .whiteColor
        signUpButton.backgroundColor = .whiteColor
    }
    
    @IBAction func actionOnLoginButton(_ sender: UIButton) {
        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func actionOnSignUpButton(_ sender: UIButton) {
        let signUpVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}

