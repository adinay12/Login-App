//
//  ForgotViewController.swift
//  Login App
//
//  Created by Adinay on 3/10/22.
//

import UIKit
import SnapKit

class ForgotViewController: BaseViewController {
    
    private lazy var  mainIconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Icon")
        
        return iv
        
    }()
    
    private lazy var mainFinanceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Neo Finance System"
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lb.textAlignment = .left
        
        return lb
    }()
    
    private lazy var forgotPasswordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Забыли пароль?"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        return lb
    }()
    
    private lazy var mainFirstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Обратитесь к администратору для замены вашего пароля."
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lb.numberOfLines = 0
        
        return lb
    }()
    
    private lazy var mainSecondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Если вы являетесь администратором,то следует обратиться к супер администратору"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lb.numberOfLines = 0
        
        return lb
        
    }()
    
    private lazy var backButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(UIColor.lightGray, for: .highlighted)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        view.addSubview(mainIconImage)
        view.addSubview(mainFinanceLabel)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(mainFirstLabel)
        view.addSubview(mainSecondLabel)
        view.addSubview(backButton)
    }
    
    
    override func setupConstrains() {
        super.setupConstrains()
        
        mainIconImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(152)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(64)
        }
        
        mainFinanceLabel.snp.makeConstraints {
            $0.top.equalTo(mainIconImage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(28)
        }
        
        forgotPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(mainFinanceLabel.snp.bottom).offset(64)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
        }
        
        mainFirstLabel.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordLabel.snp.bottom).offset(18)
            $0.trailing.leading.equalToSuperview().inset(16)
            
        }
        
        mainSecondLabel.snp.makeConstraints {
            $0.top.equalTo(mainFirstLabel.snp.bottom).offset(22)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.height.equalTo(34)
    
            
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(mainSecondLabel.snp.bottom).offset(52)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(46)
        }
        
    }
}

extension ForgotViewController {
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
