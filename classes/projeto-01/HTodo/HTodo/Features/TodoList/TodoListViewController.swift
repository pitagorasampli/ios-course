//
//  FakeViewController.swift
//  HTodo
//
//  Created by Humberto Castro on 10/11/21.
//

import UIKit

class TodoListViewController: UIViewController {
    
    // MARK: Properties
    private let presenter: TodoListPresenter
    private let baseView = TodoListView()
    
    // MARK: Constructor
    init(presenter: TodoListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        baseView.taskTableView.reloadData()
        setupNavigationBar()
    }
    
    // MARK: Private methods
    private func setup() {
        setupUI()
        setupTableView()
        setupNavigationBar()
        baseView.continueButton.addTarget(self, action: #selector(addTaskAction), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        self.title = "H-TODO"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        baseView.taskTableView.dataSource = self
        baseView.taskTableView.delegate = self
        
        presenter.reloadData = { [weak self] in
            self?.baseView.taskTableView.reloadData()
        }
    }
    
    @objc private func addTaskAction() {
        let viewController = DependencyManager.makeAddTaskViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// =========================================================
// MARK: - UITableViewDataSource
// =========================================================

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath)
        
        let fakeCell = cell as? TaskTableViewCell
        fakeCell?.set(task: presenter.getTask(row: indexPath.row))
                
        return cell
    }
}

// =========================================================
// MARK: - UITableViewDelegate
// =========================================================

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(row: indexPath.row)
    }
}

extension TodoListViewController {
    func setupUI() {
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
