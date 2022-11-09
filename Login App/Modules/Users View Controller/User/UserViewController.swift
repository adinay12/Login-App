//
//  UserViewController.swift
//  Login App
//
//  Created by Adinay on 25/10/22.
//

import UIKit
import SnapKit

class UserViewController: BaseViewController {
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.setTitleColor(UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1), for: .normal)
        button.isUserInteractionEnabled = true
        
        button.addTarget(self, action: #selector(firstBackBurron), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Пользователь"
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        return lb
        
    }()
    
    private lazy var firstImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Rectangle 10-2")
        
        return iv
        
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 0
        
        return sv
    }()
    
    private lazy var firstTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Фамилия"
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tf.delegate = self
        tf.setLeftPaddingPoints(16)
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var secondTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Имя"
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tf.delegate = self
        tf.setLeftPaddingPoints(16)
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var thirdTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Отчество"
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tf.delegate = self
        tf.setLeftPaddingPoints(16)
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var fourthTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Почта"
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tf.delegate = self
        tf.setLeftPaddingPoints(16)
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var fifthTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Новый пароль"
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tf.delegate = self
        tf.setLeftPaddingPoints(16)
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var mainView: UIView = {
       let uv = UIView()
        uv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        uv.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(addView))   // нажатие
        
        uv.addGestureRecognizer(tap)
        
        return uv
    }()
    
    private lazy var deleteImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Vector (1)")
        
        return iv
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.749, green: 0.267, blue: 0.267, alpha: 1), for: .normal)
        button.setTitle("Удалить", for: .normal)
        
        button.addTarget(self, action: #selector(mainDeleteButton), for: .touchUpInside)
        
        return button
        
    }()
    
    private lazy var mainSaveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.4, green: 0.755, blue: 0.285, alpha: 1)
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(firstButton)
        view.addSubview(mainLabel)
        view.addSubview(firstImage)
        view.addSubview(mainStackView)
        
        [firstTextField, secondTextField, thirdTextField, fourthTextField, fifthTextField].forEach{mainStackView.addArrangedSubview($0)}
        
        view.addSubview(mainView)
        mainView.addSubview(deleteImage)
        mainView.addSubview(deleteButton)
        
        view.addSubview(mainSaveButton)

    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        firstButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(23)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(23)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(23)
            $0.leading.equalTo(firstButton.snp.trailing).offset(70)
            $0.height.equalTo(23)
        }
        
        firstImage.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(148)
            $0.height.equalTo(80)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(firstImage.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(0)

        }
        
        mainView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(0)
            $0.height.equalTo(50)
        }
        
        deleteImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(20)

        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalTo(deleteImage.snp.trailing).offset(13)
            $0.trailing.equalToSuperview().offset(-258)
            $0.height.equalTo(23)
        }
        
        mainSaveButton.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.bottom).offset(17)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-26)
            $0.height.equalTo(50)
            
        }
    }
}

extension UserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension UserViewController {
    @objc func firstBackBurron() {
        dismiss(animated: true)
        print("sdk")
    }
    
    @objc func addView() {
        print("dsf")
    }
    
    @objc func saveButtonTapped() {
        print("dwf")
    }
    
    @objc func mainDeleteButton() {
        print("удалить")
    }
}
