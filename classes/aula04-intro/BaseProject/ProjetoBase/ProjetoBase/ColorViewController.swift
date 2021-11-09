//
//  ColorViewController.swift
//  ProjetoBase
//
//  Created by Humberto Castro on 05/11/21.
//

import UIKit

protocol ColorViewControllerDelegate {
    func didDismiss()
}

class ColorViewController: UIViewController {
    
    // MARK: Properties
    let colorInfo: ColorInfo
    var delegate: ColorViewControllerDelegate?
    var dismissed: (() -> Void)?
    
    // MARK: Subviews
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Voltar", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()
    
    // MARK: Constructor
    init(colorInfo: ColorInfo) {
        self.colorInfo = colorInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupData()
        setupViews()
        setupContraints()
    }
    
    func setupData() {
        view.backgroundColor = colorInfo.currentColor
        titleLabel.text = colorInfo.currentColorTitle
    }
    
    func setupViews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(dismissButton)
    }
    
    func setupContraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            dismissButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            dismissButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            dismissButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func back() {
        dismiss(animated: true) {
            self.delegate?.didDismiss()
            self.dismissed?()
        }
    }
    
}
