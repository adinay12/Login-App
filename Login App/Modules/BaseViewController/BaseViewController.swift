//
//  BaseViewController.swift
//  Login App
//
//  Created by Adinay on 1/10/22.
//

// Mы создали свой вью контроллер BaseViewController , который унаследовал стандартный  ViewController

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {  // вызываем функции
        super.viewDidLoad()
        setupViews()
        setupConstrains()
        setupValues()
        
        
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
    }
    
    func setupConstrains(){
        
    }
    
    func setupValues() {
        
    }
}
