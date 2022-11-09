//
//  SettingsViewController.swift
//  Login App
//
//  Created by Adinay on 6/10/22.
//

import UIKit
import SnapKit

class SettingsViewController: BaseViewController {
    
    private lazy var mainFirstLabel: UILabel = {
       let lb = UILabel()
        lb.text = "Журнал"
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector-20")
        iv.isUserInteractionEnabled = true
        
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(mainImageTapped))
        
        iv.addGestureRecognizer((imageTapped))
        
        return iv
    }()
    
    private lazy var mainSecondLabel: UILabel = {
       let lb = UILabel()
        lb.text = "Настройки"
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        return lb
    }()
    
    private lazy var mainFirstStackView: UIStackView = {
      let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 30
        sv.distribution = .fillEqually
        sv.layer.cornerRadius = 8
        sv.layer.masksToBounds = true
        
        sv.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1)
        
        return sv
        
    }()
    
    private lazy var firstImageView: UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector-1")
        iv.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1)
        
        iv.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        return iv
        
    }()
    
    private lazy var secondImageView: UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector-2")
        iv.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1)
        
        iv.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        return iv
        
    }()
    
    private lazy var thirdImageView: UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector 3")
        iv.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1)
        
        iv.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        return iv
        
    }()
    
    private lazy var fourthImageView: UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector-4")
        iv.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1)
        
        iv.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        return iv
        
    }()
    
    private lazy var mainSegmentedController: UISegmentedControl = {
       let sc = UISegmentedControl()
        sc.replaceSegments(segments: ["Контрагенты","Проекты","Направления","Кошельки"])
        sc.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1)
        sc.selectedSegmentIndex = 0
        
        sc.isUserInteractionEnabled = true
        sc.addTarget(self, action: #selector(scTapped), for: .valueChanged)
        
        return sc
        
    }()
    
    private lazy var mainAddView: UIView = {
        let view = MainAddView()
        view.viewTapped = {
            print("нажми кнопку")
        }
        return view
    }()
    
    
    // Создаем тейбл вью
    
    private lazy var mainTableView: UITableView = {
       let tv = UITableView()
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        tv.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)  // Регистрируем Ячейку
        tv.rowHeight = 50  // высота строки
        
        return tv
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        view.addSubview(mainFirstLabel)
        view.addSubview(mainImage)
        view.addSubview(mainSecondLabel)
        view.addSubview(mainFirstStackView)
        [firstImageView,
         secondImageView,
         thirdImageView,
         fourthImageView].forEach{mainFirstStackView.addArrangedSubview($0)}
        view.addSubview(mainSegmentedController)
        view.addSubview(mainAddView)
        view.addSubview(mainTableView)
        
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        mainFirstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.leading.equalToSuperview().offset(265)
            $0.height.equalTo(24)
            
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            $0.leading.equalTo(mainFirstLabel.snp.trailing).offset(34)
            $0.height.equalTo(18)
        }
        
        mainSecondLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(68)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(160)
            $0.height.equalTo(42)
        }
        
        
        mainFirstStackView.snp.makeConstraints {
            $0.top.equalTo(mainSecondLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(25)
        }
        
        mainSegmentedController.snp.makeConstraints {
            $0.top.equalTo(mainFirstStackView.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(25)
        }
        
        mainAddView.snp.makeConstraints {
            $0.top.equalTo(mainSegmentedController.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(50)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(mainAddView.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.bottom.equalToSuperview().offset(122)
        }
    }
}


extension SettingsViewController {
    @objc func mainImageTapped() {
        print("tap")
    }
    
    
    @objc func scTapped() {
        switch mainSegmentedController.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        case 3:
            print("3")
        default:
            print("tapped")
        }
    }
}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        
        return cell
    }
}

