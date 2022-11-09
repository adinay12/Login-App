//
//  PlusViewController.swift
//  Login App
//
//  Created by Adinay on 7/10/22.
//

import UIKit
import SnapKit

class PlusViewController: BaseViewController {
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Отмена"
        lb.textColor =  UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return lb
    }()
    
    private lazy var mainFirstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Новая запись"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        return lb
    }()
    
    private lazy var mainSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.replaceSegments(segments: ["Доход",  "Расход",  "Перевод"])
        sc.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1)
        sc.selectedSegmentIndex = 0  // Индекс
        
        sc.isUserInteractionEnabled = true
        sc.addTarget(self, action: #selector(segmentedTapped), for: .valueChanged)  // нажатие
        
        return sc
        
    }()
    
    private lazy var mainFirstStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 0
        sv.axis = .vertical
        sv.distribution = .fillEqually
        
        return sv
        
    }()
    
    private lazy var secondStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 0
        sv.axis = .vertical
        sv.distribution = .fillEqually
        
        return sv
        
    }()
    
    private lazy var thirdStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 0
        sv.axis = .vertical
        sv.distribution = .fillEqually
        
        return sv
        
    }()
    
    private lazy var mainFirstTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "Дата"
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var mainSecondTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "Сумма"
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var mainThirdTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "Направление"
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var mainFourthTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "Категория"
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var mainFifthTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "Контрагент"
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var mainSixthTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "Проект"
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var mainSeventhTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "Кошелек"
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var mainEighthTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "Комментарий"
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(140)
        }
        
        return tf
    }()
    
    private lazy var mainSaveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.4, green: 0.755, blue: 0.285, alpha: 1)
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        
        view.addSubview(mainLabel)
        view.addSubview(mainFirstLabel)
        view.addSubview(mainSegmentedControl)
        view.addSubview(mainFirstStackView)
        
        [mainFirstTextField,
         mainSecondTextField,
         mainThirdTextField,
         mainFourthTextField,
         mainFifthTextField,
         mainSixthTextField,
         mainSeventhTextField,
         mainEighthTextField].forEach{mainFirstStackView.addArrangedSubview($0)}
        view.addSubview(mainSaveButton)
        
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
            
        }
        
        mainFirstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalTo(mainLabel.snp.trailing).offset(48)
            //            $0.trailing.equalToSuperview().offset(-129)
            $0.height.equalTo(24)
        }
        
        mainSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(mainFirstLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.height.equalTo(32)
        }
        
        mainFirstStackView.snp.makeConstraints {
            $0.top.equalTo(mainSegmentedControl.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            
        }
        
        mainSaveButton.snp.makeConstraints {
            $0.top.equalTo(mainFirstStackView.snp.bottom).offset(16)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        
    }
}


extension PlusViewController {
    @objc func saveTapped() {
        print("asd")
    }
    
    @objc func segmentedTapped() {
        switch mainSegmentedControl.selectedSegmentIndex {
        case 0:
            getNewOne()
            print("0")
        case 1:
            getNewOne()
            print("1")
        case 2:
            getNextOnes()
        default:
            print("tap tap")
        }
    }
}


extension PlusViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    private func getNewOne() {
        mainFirstStackView
        view.addSubview(mainFirstStackView)
        
        
        [mainFirstTextField,
         mainSecondTextField,
         mainThirdTextField,
         mainFourthTextField,
         mainFifthTextField,
         mainSixthTextField,
         mainSeventhTextField,
         mainEighthTextField].forEach{mainFirstStackView.addArrangedSubview($0)}
        
        
        mainFirstStackView.snp.makeConstraints {
            $0.top.equalTo(mainSegmentedControl.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            
            
        }
        
    }
    
    private func getNextOnes() {
        if view.subviews.contains(mainFirstStackView){
            mainFirstStackView.removeFromSuperview()
        }
        view.addSubview(secondStackView)
        mainFirstTextField.placeholder = "Дата"
        mainSecondTextField.placeholder = "Сумма"
        mainSixthTextField.placeholder = "С кошелька"
        mainSeventhTextField.placeholder = "На кошелек"
        mainEighthTextField.placeholder = "Комментарий"
        
        [mainFirstTextField,
         mainSecondTextField,
         mainSixthTextField,
         mainSeventhTextField,
         mainEighthTextField].forEach{secondStackView.addArrangedSubview($0)}
        
        
        secondStackView.snp.makeConstraints {
            $0.top.equalTo(mainSegmentedControl.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(450)
            
        }
    }
}
