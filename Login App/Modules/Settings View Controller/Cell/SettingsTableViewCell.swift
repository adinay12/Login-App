//
//  SettingsTableViewCell.swift
//  Login App
//
//  Created by Adinay on 26/10/22.
//

import UIKit
import SnapKit

class SettingsTableViewCell: BaseTableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Христофориди Дмитрий"
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Vector-26")
        
        return iv
    }()
   
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(mainLabel)
        contentView.addSubview(mainImage)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(22)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.leading.equalTo(mainLabel.snp.trailing).offset(127)
            $0.trailing.equalToSuperview().offset(-24)
        }
    }
}
