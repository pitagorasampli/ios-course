//
//  ColorViewController.swift
//  ProjetoBase
//
//  Created by Humberto Castro on 05/11/21.
//

import UIKit

class ColorViewController: UIViewController {
    
    let color: UIColor
    
    
    
    init(color: UIColor) {
        self.color = color
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        
    }
}
