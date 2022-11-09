//
//  BaseTableViewCell.swift
//  Login App
//
//  Created by Adinay on 8/10/22.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setupConstraints() {
        
    }
     
}
