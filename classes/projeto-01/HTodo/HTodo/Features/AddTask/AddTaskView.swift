//
//  AddTaskView.swift
//  HTodo
//
//  Created by Humberto Castro on 18/11/21.
//

import UIKit

class AddTaskView: UIView {
    
    // MARK: Subview
    let taskTextfield: UITextField = {
        let view = UITextField(frame: .zero)
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.clearButtonMode = .whileEditing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let saveButton: PrimaryButton = {
        let view = PrimaryButton()
        view.setTitle("Salvar", for: .normal)
        view.isHidden = true
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// =========================================================
// MARK: - UI
// =========================================================

extension AddTaskView {
    
    private func setupUI() {
        setupViews()
        setupContraints()
    }
    
    private func setupViews() {
        addSubview(taskTextfield)
        addSubview(saveButton)
    }
    
    private func setupContraints() {
        let safeArea = safeAreaLayoutGuide
        
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
