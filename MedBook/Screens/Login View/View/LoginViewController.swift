//
//  LoginViewController.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signUpButtonView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var loginViewModel: LoginViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel = LoginViewModel()
        configureUI()

    }
    
    private func configureUI() {
        showNavigationBar()
        addCurveView()
        addnavigationLeftBarButton()
        emailTextField.underlined()
        passwordTextField.underlined()
        passwordTextField.delegate = self
        emailTextField.delegate = self
        enableOrDisableSignUpButton()
        signUpButtonView.setBorder(radius: 12, color: .blackColor, width: 1)
    }

    @IBAction func actionOnLoginButton(_ sender: Any) {
        loginViewModel?.loginUser(emailTextField.text,
                                  passwordTextField.text,
                                  completionHandler: { [weak self] flag, message in
            guard let self = self else { return }
            if flag {
                self.navigateToHomeScreen()
            } else {
                self.showAlert(with: message)
            }
            
        })
    }
    
    func navigateToHomeScreen() {
        let signUpVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}
