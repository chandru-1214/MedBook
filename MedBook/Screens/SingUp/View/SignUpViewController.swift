//
//  SignUpViewController.swift
//  MedBook
//
//  Created by Chandru M on 08/08/23.
//

import UIKit

class SignUpViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var signUpButtonView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var characterNumberCheckBox: UIImageView!
    @IBOutlet weak var specialCharacterCheckBox: UIImageView!
    @IBOutlet weak var uppercaseCharacterCheckBox: UIImageView!
    
    @IBOutlet weak var signUpButton: UIButton!
    var signUpViewModel: SignUpViewModel?
    var isValidPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpViewModel = SignUpViewModel()
        signUpViewModel?.delegate = self
        configureUI()
        loadCountryList()
    }
    
    private func configureUI() {
        addCurveView()
        showNavigationBar()
        addnavigationLeftBarButton()
        signUpButtonView.setBorder(radius: 12, color: .blackColor, width: 1)
        emailTextField.underlined()
        passwordTextField.underlined()
        pickerView.delegate = self
        pickerView.dataSource = self
        enableOrDisableSignUpButton()

    }
    
    private func loadCountryList() {
        signUpViewModel?.getCountryList()
    }
    
    @IBAction func actionOnSignUpAction(_ sender: Any) {
        let countryCode = signUpViewModel?.allContriesList[pickerView.selectedRow(inComponent: 0)]
        signUpViewModel?.addNewUser(email: emailTextField.text,
                                    password: passwordTextField.text,
                                    countryCode: countryCode) { [weak self] (flag, message) in
            guard let self = self else { return }
            if flag {
                self.navigateToHomeScreen()
            } else {
                self.showAlert(with: message)
            }
            
        }
    }
    
    
    func navigateToHomeScreen() {
        let signUpVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    
}
