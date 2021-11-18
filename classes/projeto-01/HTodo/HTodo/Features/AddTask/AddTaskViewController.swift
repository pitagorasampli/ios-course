//
//  AddTaskViewController.swift
//  HTodo
//
//  Created by Humberto Castro on 12/11/21.
//

import UIKit

final class AddTaskViewController: UIViewController {

    // MARK: Properties
    private let baseView = AddTaskView()
    private let presenter: AddTaskPresenter
    
    // MARK: Init
    init(presenter: AddTaskPresenter) {
        self.presenter = presenter
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
    
    // MARK: Private methods
    private func setup() {
        baseView.taskTextfield.delegate = self
        baseView.saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        setupUI()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = "Adicionar"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    @objc private func saveAction() {
        presenter.save(titleText: baseView.taskTextfield.text)
        navigationController?.popViewController(animated: true)
    }
}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        baseView.saveButton.isHidden = presenter.isSaveButtonHidden(text: textField.text)
    }
}

extension AddTaskViewController {
    func setupUI() {
        view.backgroundColor = UIColor(named: "background")

        view.addSubview(baseView)

        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            baseView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            baseView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            baseView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0),
        
        ])
    }
}
