//
//  FakeViewController.swift
//  HTodo
//
//  Created by Humberto Castro on 10/11/21.
//

import UIKit

struct Task {
    var name: String
    var isSelected: Bool
}

class TodoListViewController: UIViewController {
    
    // MARK: Properties
    private var taskList: [Task] = [
        Task(name: "Jobson", isSelected: false),
        Task(name: "Jefferson", isSelected: true),
        Task(name: "Julio", isSelected: false),
        Task(name: "Janderson", isSelected: true),
        Task(name: "Jailson", isSelected: false),
        Task(name: "Janiquadros", isSelected: false)
    ]
    
    private let taskTableView: UITableView = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setup() {
        setupViews()
        setupContraints()
        setupTableView()
        setupNavigationBar()
        continueButton.addTarget(self, action: #selector(addTaskAction), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        self.title = "H-TODO"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        taskTableView.dataSource = self
        taskTableView.delegate = self
    }
    
    @objc private func addTaskAction() {
        let viewController = AddTaskViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension TodoListViewController: AddTaskViewControllerDelegate {
    func didSave(task: Task) {
        taskList.append(task)
        taskTableView.reloadData()
    }
}

// =========================================================
// MARK: - UITableViewDataSource
// =========================================================

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath)
        
        let fakeCell = cell as? TaskTableViewCell
        let task = taskList[indexPath.row]
        fakeCell?.set(task: task)
                
        return cell
    }
}

// =========================================================
// MARK: - UITableViewDelegate
// =========================================================

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskList[indexPath.row].isSelected.toggle()
        tableView.reloadData()
    }
}

// =========================================================
// MARK: - UI
// =========================================================

extension TodoListViewController {
    func setupViews() {
        view.addSubview(taskTableView)
        view.addSubview(continueButton)
    }
    
    func setupContraints() {
        let safeArea = view.safeAreaLayoutGuide
        
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
