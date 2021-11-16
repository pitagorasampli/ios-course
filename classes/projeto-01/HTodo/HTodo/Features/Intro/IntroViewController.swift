//
//  ViewController.swift
//  HTodo
//
//  Created by Humberto Castro on 08/11/21.
//

import UIKit

class IntroViewController: UIViewController {
    
    // =========================================================
    // MARK: - Properties
    // =========================================================
    
    let baseView = IntroView()
    
    // =========================================================
    // MARK: - Lifecycle
    // =========================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    // =========================================================
    // MARK: - Methods
    // =========================================================
    
    func setup() {
        setupViews()
        setupConstraints()
        baseView.continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
    }
    
    @objc private func continueAction() {
        UserDefaults.standard.set(true, forKey: "isOnboardingAppeared")
        
        let viewController = UINavigationController(rootViewController: TodoListViewController())
        viewController.modalPresentationStyle = .fullScreen
        self.showDetailViewController(viewController, sender: nil)
    }
}

extension IntroViewController {
    func setupViews() {
        view.addSubview(baseView)
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            baseView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            baseView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            baseView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0)
        ])
        
    }
}
