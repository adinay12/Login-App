//
//  MainTableViewCell.swift
//  Login App
//
//  Created by Adinay on 8/10/22.
// Создаем Ячейку

import UIKit
import SnapKit

class MainTableViewCell: BaseTableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    private lazy var mainView: UIView = {
      let view = UIView()
        
        return view
        
    }()
    
    private lazy var mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Frame 14")
        
        return iv
    }()
    
    private lazy var mainFirstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Breez Pro"
        lb.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.textAlignment = .left
        lb.numberOfLines = 0
        
        return lb
        
    }()
    
    private lazy var mainSecondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Demir Bank"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.textAlignment = .left
        lb.numberOfLines = 0
        
        return lb
        
    }()
    
    private lazy var firstNumberLabel: UILabel = {
        let lb = UILabel()
        lb.text = "12.01.2021"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.textAlignment = .right
        lb.numberOfLines = 0
        
        return lb
        
    }()
    
    private lazy var secondNumberLabel: UILabel = {
        let lb = UILabel()
        lb.text = "15 389,1"
        lb.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lb.textColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 1)
        lb.numberOfLines = 0
        
        return lb
        
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(mainView )
        mainView.addSubview(mainImageView)
        mainView.addSubview(mainFirstLabel)
        mainView.addSubview(mainSecondLabel)
        mainView.addSubview(firstNumberLabel)
        mainView.addSubview(secondNumberLabel)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        
        mainImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(45)
            
        }
        
        mainFirstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(mainImageView.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(18)
            
            
        }
        
        mainSecondLabel.snp.makeConstraints {
            $0.top.equalTo(mainFirstLabel.snp.bottom).offset(2)
            $0.leading.equalTo(mainImageView.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        firstNumberLabel.snp.makeConstraints {
            $0.top.equalTo(mainSecondLabel.snp.bottom).offset(3)
            $0.leading.equalTo(mainImageView.snp.trailing).offset(18)
           
        }
        
        secondNumberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
            
        }
    }
}
