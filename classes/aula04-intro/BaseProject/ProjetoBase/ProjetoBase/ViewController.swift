//
//  ViewController.swift
//  ProjetoBase
//
//  Created by Humberto Castro on 04/11/21.
//

import UIKit

struct ColorInfo {
    var currentColor: UIColor?
    var currentColorTitle: String?
}

class ViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var beforeLabel: UILabel?
    @IBOutlet weak var currentLabel: UILabel?
    @IBOutlet weak var sendButton: UIButton?
    var colorInfo = ColorInfo(currentColor: nil, currentColorTitle: nil)
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton?.isHidden = true
    }
}

// MARK: Buttons
extension ViewController {
    
    // Events
    @IBAction func actionButton(_ sender: UIButton) {
        UIView.animate(
            withDuration: 1,
            animations: {
                self.view.backgroundColor = sender.backgroundColor
            },
            completion: { _ in
                self.beforeLabel?.text = self.currentLabel?.text
                self.currentLabel?.text = sender.titleLabel?.text
                self.colorInfo.currentColor = sender.backgroundColor
                self.colorInfo.currentColorTitle = sender.titleLabel?.text
                self.sendButton?.isHidden = false
            }
        )
    }
    
    @IBAction func sendColorButton(_ sender: Any) {
        let viewController = ColorViewController(
            colorInfo: colorInfo
        )
        
        viewController.delegate = self
        viewController.dismissed = {
            print("DIMISSED")
        }
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)
    }
}

extension ViewController: ColorViewControllerDelegate {
    func didDismiss() {
        print("DISMISS")
    }
}
