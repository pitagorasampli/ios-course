//
//  AddTaskViewController.swift
//  HTodo
//
//  Created by Humberto Castro on 12/11/21.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func didSave(task: Task)
}

class AddTaskViewController: UIViewController {

    // MARK: Properties
    weak var delegate: AddTaskViewControllerDelegate?
    
    // MARK: Subview
    private let taskTextfield: UITextField = {
        let view = UITextField(frame: .zero)
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.clearButtonMode = .whileEditing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let saveButton: PrimaryButton = {
        let view = PrimaryButton()
        view.setTitle("Salvar", for: .normal)
        view.isHidden = true
        view.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setup()
    }
    
    private func setup() {
        self.title = "Adicionar"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        taskTextfield.delegate = self
        setupViews()
        setupContraints()
    }
    
    @objc private func saveAction() {
        let text = taskTextfield.text ?? ""
        delegate?.didSave(task: Task(name: text, isCompleted: false))
        navigationController?.popViewController(animated: true)
    }
}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        saveButton.isHidden = text.isEmpty
    }
}

// =========================================================
// MARK: - UI
// =========================================================

extension AddTaskViewController {
    func setupViews() {
        view.addSubview(taskTextfield)
        view.addSubview(saveButton)
    }
    
    func setupContraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            taskTextfield.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            taskTextfield.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            taskTextfield.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            taskTextfield.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: taskTextfield.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}
