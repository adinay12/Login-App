//
//  MainAddView.swift
//  Login App
//
//  Created by Adinay on 24/10/22.
//

import UIKit
import SnapKit

class MainAddView: UIView {
    
    private lazy var mainAddButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor( UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 0.7), for: .normal)
        
    let buttonForgot = UITapGestureRecognizer(target: self, action: #selector(mainAddTapped))
                button.addGestureRecognizer(buttonForgot)
        
        
        return button
    }()
    
    
    private lazy var fifthImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Plus-1")
        
        
        return iv
    }()
    
    var viewTapped: (() -> Void)?  // Замыкание
        
    
    init() {  // точка входа
        super.init(frame: .zero)
        mainSetup()
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func  mainSetup() {
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        isUserInteractionEnabled = true
        
        let addView = UITapGestureRecognizer(target: self, action: #selector(addTappd))

        addGestureRecognizer(addView)
    }
    
    private func setupViews() {
        addSubview(mainAddButton)
        addSubview(fifthImageView)
        
    }
    
    private func setupConstrains() {
        
        mainAddButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(22)
        }
        
        fifthImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.trailing.equalToSuperview().offset(-22)
            $0.height.equalTo(14)
        }
        
    }
    
}


extension MainAddView {
    
    @objc func mainAddTapped() {
        print("asd")
    }
    
    @objc func addTappd() {
        viewTapped?()
    }
}
