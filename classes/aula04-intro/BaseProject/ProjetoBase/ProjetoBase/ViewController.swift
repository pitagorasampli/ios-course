//
//  ViewController.swift
//  ProjetoBase
//
//  Created by Humberto Castro on 04/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var beforeLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Events
    @IBAction func actionButton(_ sender: UIButton) {
        UIView.animate(
            withDuration: 3,
            animations: {
                self.view.backgroundColor = sender.backgroundColor
            },
            completion: { _ in
                self.beforeLabel.text = self.currentLabel.text
                self.currentLabel.text = sender.titleLabel?.text
            }
        )
    }
    
    @IBAction func sendColorButton(_ sender: Any) {
        let viewController = ColorViewController(color: .gray)
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)
    }
}

