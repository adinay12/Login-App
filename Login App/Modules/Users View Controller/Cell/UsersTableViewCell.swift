//
//  UsersTableViewCell.swift
//  Login App
//
//  Created by Adinay on 14/10/22.
//

import UIKit
import SnapKit

class UsersTableViewCell: BaseTableViewCell {
    
    static let identifier = "UsersTableViewCell"
    
    private lazy var mainFirstImage: UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "user-2")
        
        return iv
        
    }()
    
    private lazy var mainFirstLabel: UILabel = {
       let lb = UILabel()
        lb.text = "Христофориди Д.И."
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lb.numberOfLines = 0
        
        return lb
    }()
    
    private lazy var mainSecondLabel: UILabel = {
       let lb = UILabel()
        lb.text = "dimitrios.khristoforidi@gmail.com"
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        lb.numberOfLines = 0
        
        return lb
    }()
    
    private lazy var mainSecondImage: UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector-25")
        iv.isUserInteractionEnabled = true

        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(furtherTapped))

        iv.addGestureRecognizer(imageTapped)
        
        return iv
        
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(mainFirstImage)
        contentView.addSubview(mainFirstLabel)
        contentView.addSubview(mainSecondLabel)
        contentView.addSubview(mainSecondImage)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        mainFirstImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(46)
            
        }
        
        mainFirstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalTo(mainFirstImage.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        mainSecondLabel.snp.makeConstraints {
            $0.top.equalTo(mainFirstLabel.snp.bottom).offset(4)
            $0.leading.equalTo(mainFirstImage.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(18)
        }
        
        mainSecondImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-26)
            $0.height.equalTo(16)
        }
        
    }
}


extension UsersTableViewCell {
    @objc func furtherTapped() {
        print("TAP")
    }
}
