//
//  MainViewController.swift
//  Login App
//
//  Created by Adinay on 6/10/22.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {
    
    private lazy var mainFirstImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Image")
        iv.isUserInteractionEnabled = true // наш обьект может быть нажат пользовотелям
    
        
        let mainTapped = UITapGestureRecognizer(target: self, action: #selector(mainIconTapped))
        
        iv.addGestureRecognizer(mainTapped)
        
        
        return iv
    }()
    
    private lazy var mainSecondImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "vector6")
        iv.isUserInteractionEnabled = true
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(exitTapped))
        
        iv.addGestureRecognizer(iconTapped)
        
        
        return iv
    }()
    
    private lazy var mainTransactionsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Транзакции"
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        return lb
        
    }()
    
    private lazy var firstStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 76
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var incomeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Доход"
        lb.textColor = UIColor(red: 0.627, green: 0.627, blue: 0.627, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        lb.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        
        return lb
        
        
    }()
    
    private lazy var consumptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Расход"
        lb.textColor = UIColor(red: 0.627, green: 0.627, blue: 0.627, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        lb.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        
        return lb
        
        
    }()
    
    private lazy var balanceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Баланс"
        lb.textColor = UIColor(red: 0.627, green: 0.627, blue: 0.627, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        lb.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        
        return lb
        
        
    }()
    
    private lazy var secondStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 22
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var mainFirstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "103 341,12"
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        lb.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        return lb
        
    }()
    
    private lazy var mainSecondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "13 250,10"
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        lb.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        return lb
        
    }()
    
    private lazy var mainThirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "+ 90 091,02"
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        lb.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        return lb
        
    }()
    
    private lazy var mainForgotLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Последние записи"
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        return lb
    }()
    
    private lazy var iconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector")
        iv.isUserInteractionEnabled = true
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(secureImageTapped))
        
        iv.addGestureRecognizer(iconTapped)
        
        return iv
    }()
    
    
    // Создаем тейбл вью
    
    private lazy var mainTableView: UITableView = {
       let tv = UITableView()
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.register(MainTableViewCell.self , forCellReuseIdentifier: MainTableViewCell.identifier)  // Регистрируем Ячейку
        tv.rowHeight = 76  // высота строки
        
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        AFNetworkManager().autorize(email: "admin@mail.com", password: "password") { (response) in
            if let refreshToken = response.refresh {
                AFNetworkManager().refreshToken(refreshToken: refreshToken) // Обновляем рефреш токен
            }
        } onError: { (error) in
            
        } 
        
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        
        view.addSubview(mainFirstImage)
        view.addSubview(mainSecondImage)
        view.addSubview(mainTransactionsLabel)
        view.addSubview(firstStackView)
        
        [incomeLabel, consumptionLabel, balanceLabel].forEach {firstStackView.addArrangedSubview($0)}
        
        view.addSubview(secondStackView)
        
        [mainFirstLabel, mainSecondLabel, mainThirdLabel].forEach{secondStackView.addArrangedSubview($0)}
        
        view.addSubview(mainForgotLabel)
        view.addSubview(iconImage)
        view.addSubview(mainTableView)
        
        
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        
        mainFirstImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(14)
            $0.leading.equalToSuperview().offset(291)
            $0.height.equalTo(18)
        }
        
        mainSecondImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            $0.leading.equalTo(mainFirstImage.snp.leading).offset(60)
            $0.height.equalTo(24)
        }
        
        
        mainTransactionsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(68)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(42)
        }
        
        firstStackView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        firstStackView.snp.makeConstraints {
            $0.top.equalTo(mainTransactionsLabel.snp.bottom).offset(22)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        
        secondStackView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        secondStackView.snp.makeConstraints {
            $0.top.equalTo(firstStackView.snp.bottom).offset(0)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        
        mainForgotLabel.snp.makeConstraints {
            $0.top.equalTo(secondStackView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
        }
        
        iconImage.snp.makeConstraints {
            $0.top.equalTo(secondStackView.snp.bottom).offset(18)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(18)
            
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(mainForgotLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-14)
        }
        
    }
    
    override func setupValues() {
        super.setupValues()
         
        
        // Запрос Транзакции вызываем в MainViewController
        
        AFNetworkManager().getAllTransactions()
        
    }
}

 
extension  MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell

        return cell
    }

}


extension MainViewController {
    
    @objc func secureImageTapped() {
        print("adfr")
    }
    
    @objc func mainIconTapped() {
        print("gh")
    }
    
    @objc func exitTapped() {
        
//        func showSimpleAlert() {
        
//            let alert = UIAlertController(title: "Выход?", message: "Вы уверены, что хотите выйти?", preferredStyle: UIAlertController.Style.alert)
//
//            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
//                   //Cancel Action
//               }))
//               alert.addAction(UIAlertAction(title: "Sign out",
//                                             style: UIAlertAction.Style.default,
//                                             handler: {(_: UIAlertAction!) in
//                                               //Sign out action
//               }))
//               self.present(alert, animated: true, completion: nil)
//           }

        DSGenerator.sharedInstance.removeAll()  // Удаление Пользователя
        self.appDelegate.loginPart()
        
        print("TAPPED")
    }
}
