//
//  ViewController.swift
//  Banking
//
//  Created by Nilesh Kumar on 12/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    let indicator = UIActivityIndicatorView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let loginView: UIView = {
        let loginView = UIView()
        //loginView.backgroundColor = .gray
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()
    
    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Username"
        textField.textColor = .black
        textField.layer.cornerRadius = 8.0
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 2.0
        textField.rightViewMode = .always
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .gray .withAlphaComponent(0.1)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.textColor = .black
        textField.layer.cornerRadius = 8.0
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 2.0
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .gray .withAlphaComponent(0.1)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("SignIn", for: .normal)
        signInButton.backgroundColor = .systemGreen
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.cornerRadius = 8.0
        signInButton.layer.masksToBounds = true
        signInButton.addTarget(self, action: #selector(didTapAddSignIn), for: .touchUpInside)
        
        return signInButton
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.isHidden = true
        label.text = "error message"
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        loginView.addSubview(imageView)
        loginView.addSubview(userNameTextField)
        loginView.addSubview(passwordTextField)
        loginView.addSubview(signInButton)
        loginView.addSubview(errorLabel)
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc func didTapAddSignIn (){
        guard let text = userNameTextField.text, !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              let passwordText = passwordTextField.text, !passwordText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                  errorLabel.isHidden = false
                  errorLabel.text = "Username/Password can't be nil"
                  return
              }
        
        print("\(text) and \(passwordText)")
        
        if text == "nilesh" && passwordText == "121212"{
            errorLabel.isHidden = true
           // signInButton.configuration?.showsActivityIndicator = true
            print("tapped")
        }else{
            errorLabel.isHidden = false
            errorLabel.text = "Username or password is incorrect"
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginView.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 10, width: view.frame.size.width - 20, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 10)
        let size = view.bounds.size.width
        imageView.frame = CGRect(x: 0, y: 0, width: size - 20, height: size / 1.4)
        userNameTextField.frame = CGRect(x: 0, y: imageView.bounds.height + 10, width: view.bounds.size.width - 20, height: 50.0)
        
        userNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userNameTextField.frame.height))
        userNameTextField.leftViewMode = .always
        
        passwordTextField.frame = CGRect(x: 0, y: imageView.bounds.height + 10 + 10 + 50, width: view.bounds.size.width - 20, height: 50.0)
        
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userNameTextField.frame.height))
        passwordTextField.leftViewMode = .always
        
        signInButton.frame = CGRect(x: 0, y: imageView.bounds.height + 10 + 10 + 50 + 10 + 50, width: view.bounds.size.width - 20, height: 50.0)
        
        errorLabel.frame = CGRect(x: 0, y: imageView.bounds.height + 10 + 10 + 50 + 10 + 50 + 10 + 50, width: view.bounds.size.width - 20, height: 50)
    }


}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
}
