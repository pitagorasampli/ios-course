//
//  FakeViewController.swift
//  HTodo
//
//  Created by Humberto Castro on 10/11/21.
//

import UIKit

class FakeViewController: UIViewController {
    
    let fakeNameList: [String] = ["Jobson", "Jefferson", "Julio", "Janderson", "Jailson", "Janiquadros"]
    
    let fakeTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(FakeTableViewCell.self, forCellReuseIdentifier: FakeTableViewCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setup()
    }
    
    func setup() {
        setupViews()
        setupContraints()
        setupTableView()
    }
    
    func setupTableView() {
        fakeTableView.dataSource = self
        fakeTableView.delegate = self
    }
}

// =========================================================
// MARK: - UITableViewDataSource
// =========================================================

extension FakeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FakeTableViewCell.identifier, for: indexPath)
        
        let fakeCell = cell as? FakeTableViewCell
        let name = fakeNameList[indexPath.row]
        fakeCell?.titleLabel.text = name
        
        return cell
    }
}

// =========================================================
// MARK: - UITableViewDelegate
// =========================================================

extension FakeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = fakeNameList[indexPath.row]
        print(name)
    }
}

// =========================================================
// MARK: - UI
// =========================================================

extension FakeViewController {
    func setupViews() {
        view.addSubview(fakeTableView)
    }
    
    func setupContraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            fakeTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            fakeTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            fakeTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            fakeTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
        ])
    }
}
