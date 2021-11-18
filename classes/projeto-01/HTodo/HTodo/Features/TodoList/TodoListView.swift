//
//  TodoListView.swift
//  HTodo
//
//  Created by Humberto Castro on 18/11/21.
//

import UIKit

class TodoListView: UIView {

    let taskTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
        view.separatorStyle = .none
        return view
    }()
    
    let continueButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Adicionar Tarefa", for: .normal)
        view.backgroundColor = UIColor(named: "accentColor")
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.tintColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
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

extension TodoListView {
    
    func setupUI() {
        setupViews()
        setupContraints()
    }
    
    func setupViews() {
        addSubview(taskTableView)
        addSubview(continueButton)
    }
    
    func setupContraints() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            taskTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            taskTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            taskTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
        ])
        
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: taskTableView.bottomAnchor, constant: 20),
            continueButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            continueButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
            continueButton.heightAnchor.constraint(equalToConstant: 45),
            continueButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
        ])
    }
}
