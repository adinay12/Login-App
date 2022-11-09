//
//  LoginViewController.swift
//  Login App
//
//  Created by Adinay on 30/9/22.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Frame 10")
        
        return iv
    }()
    
    private lazy var mainSystemLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Neo Finance System"
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.textAlignment = .left
        lb.font = .systemFont(ofSize: 24, weight: .semibold)
        
        return lb
    }()
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Войдите, чтобы продолжить"
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.axis = .vertical
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var mailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Почта"
        tf.font = .systemFont(ofSize: 18, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        return tf
        
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Пароль"
        tf.setLeftPaddingPoints(16)
        tf.font = .systemFont(ofSize: 18, weight: .regular)
        tf.delegate = self
        
        return tf
        
    }()
    
    private lazy var secureIconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Shape")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(imageIconTapped))
        
        iv.addGestureRecognizer((imageTapped))
        
        return iv
    }()
    
    private lazy var forgotPassButton: UIButton = {
        let button = UIButton ()
        button.setTitle("Забыли пароль?", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        
        button.setTitleColor(UIColor(red: 0.627, green: 0.627, blue: 0.627, alpha: 1), for: .normal)
        
        let buttonForgot = UITapGestureRecognizer(target: self, action: #selector(buttoForgotTapped))
        button.addGestureRecognizer(buttonForgot)
        
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        button.setTitle("Войти", for: .normal)
        button.setTitle("Ведите что-то другое", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.lightGray, for: .highlighted)
        
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    var viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(mainImage)
        view.addSubview(mainSystemLabel)
        view.addSubview(mainLabel)
        view.addSubview(mainStackView)
        view.addSubview(secureIconImage)
        view.addSubview(forgotPassButton)
        view.addSubview(loginButton)
        
        [mailTextField, passwordTextField].forEach {mainStackView.addArrangedSubview($0)}
        
    }
    
    override  func setupConstrains() {
        super.setupConstrains()
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(152)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(64)
        }
        
        mainSystemLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(28)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(mainSystemLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(20)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(46)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        secureIconImage.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.trailing.equalTo(passwordTextField.snp.trailing).inset(22)
            $0.height.equalTo(28)
        }
        
        forgotPassButton.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(18)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPassButton.snp.bottom).offset(24)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.height.equalTo(46)
        }
    }
    
    override func setupValues() {
        super.setupValues()
        viewModel.isUserAuthorized = { (isAuthorized) in // получаем некий обькт
            if  isAuthorized {
                self.appDelegate.mainPart()  // переходим на второй контроллер
            }else {
                self.forgotPassButton.setTitle("Попробуйте еще раз", for: .normal)
            }
        }
    }
}


extension LoginViewController {
    @objc func imageIconTapped() {
        self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
    }
    
    @objc func buttoForgotTapped() {
        let vc = ForgotViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginTapped() {
        guard let login = mailTextField.text,  let password = passwordTextField.text  else {return}  // обезапосились от нила
        
        if !login.isEmpty && !password.isEmpty {   // проверка на пустоту
            viewModel.autorizationUser(login: login, password: password)
        }
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
