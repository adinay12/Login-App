//
//  UsersViewController.swift
//  Login App
//
//  Created by Adinay on 7/10/22.
//

import UIKit
import SnapKit

class UsersViewController: BaseViewController {
    
    private lazy var mainFirstLabel: UILabel = {
       let lb = UILabel()
        lb.text = "Журнал"
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lb.isUserInteractionEnabled = true
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(firstTapped))
        
        lb.addGestureRecognizer(tapped)
        
        return lb
    }()
    
    private lazy var mainFirstImage: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector-20")
        iv.isUserInteractionEnabled = true
        
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(magazineTapped))
        
        iv.addGestureRecognizer((imageTapped))
        
        return iv
    }()
    
    private lazy var mainSecondLabel: UILabel = {
       let lb = UILabel()
        lb.text = "Пользователи"
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        return lb
    }()
    
    private lazy var mainFirstView: UIView = {
       let uv = UIView()
        uv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        uv.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(addTappedView))   // нажатие
        
        uv.addGestureRecognizer(tap)
        
        return uv
    }()
    
    private lazy var mainSecondImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Group 2")
        
        
        return iv
    }()
    
    private lazy var mainAddButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1), for: .normal)
        let buttonForgot = UITapGestureRecognizer(target: self, action: #selector(addTapped))
        button.addGestureRecognizer(buttonForgot)
        
        return button
    }()
    
    private lazy var thirdImage: UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Plus-1")
        
        return iv
    }()
    
    
    // Создаем тейбл вью
    
    private lazy var mainTableView: UITableView = {
       let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.identifier)
        tv.rowHeight = 68
        
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(mainFirstLabel)
        view.addSubview(mainFirstImage)
        view.addSubview(mainSecondLabel)
        view.addSubview(mainFirstView)
        
        mainFirstView.addSubview(mainSecondImage)
        mainFirstView.addSubview(mainAddButton)
        mainFirstView.addSubview(thirdImage)
        
        view.addSubview(mainTableView)

       
        
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        mainFirstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(28)
            $0.leading.equalToSuperview().offset(265)
            $0.height.equalTo(24)
            
        }
        
        mainFirstImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            $0.leading.equalTo(mainFirstLabel.snp.trailing).offset(34)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(18)
        }
        
        mainSecondLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(68)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(98)
            $0.height.equalTo(42)
        }
        
        mainFirstView.snp.makeConstraints {
            $0.top.equalTo(mainSecondLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(68)
        }
        
        mainSecondImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(46)

        }
        
        mainAddButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(23)
            $0.leading.equalTo(mainSecondImage.snp.trailing).offset(18)
            $0.height.equalTo(22)
        }
        
        thirdImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(23)
            $0.trailing.equalToSuperview().offset(-21)
            $0.height.equalTo(14)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(mainFirstView.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-78)

        }
        
    }
}


extension UsersViewController {
    
    @objc func firstTapped() {
        print("нажми")
    }
    
    @objc func magazineTapped() {
        print("hello")
    }
    
    @objc func addTapped() {
        print("asd")
    }
    
    @objc func addTappedView() {
        let vc = UserViewController()
        present(vc, animated: true)
        
        print("TapPed")
    }
}


extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        
        return cell
    }  
}

