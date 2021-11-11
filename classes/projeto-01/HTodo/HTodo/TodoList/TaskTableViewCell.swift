//
//  FakeTableViewCell.swift
//  HTodo
//
//  Created by Humberto Castro on 10/11/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    // MARK: Properties
    static let identifier = "taskCellIdentifier"
    
    private let cardView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let circleView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 0
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Contructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        circleView.layer.cornerRadius = circleView.frame.height / 2
    }
    
    func set(task: Task) {
        self.titleLabel.text = task.name
        
        if task.isSelected {
            self.circleView.backgroundColor = UIColor(named: "accentColor")
        } else {
            self.circleView.backgroundColor = .white
        }
    }
    
    private func setup() {
        backgroundColor = UIColor(named: "background")
        selectionStyle = .none
        setupViews()
        setupContraints()
    }
}
// =========================================================
// MARK: - UI
// =========================================================

extension TaskTableViewCell {
    func setupViews() {
        addSubview(cardView)
        cardView.addSubview(circleView)
        cardView.addSubview(titleLabel)
    }
    
    func setupContraints() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 12),
            cardView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -12),
            cardView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            circleView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            circleView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0),
            circleView.widthAnchor.constraint(equalToConstant: 30),
            circleView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
        ])
    }
}
