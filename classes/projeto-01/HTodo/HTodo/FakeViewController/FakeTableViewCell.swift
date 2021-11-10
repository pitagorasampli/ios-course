//
//  FakeTableViewCell.swift
//  HTodo
//
//  Created by Humberto Castro on 10/11/21.
//

import UIKit

class FakeTableViewCell: UITableViewCell {

    static let identifier = "fakeCellIdentifier"
    
    let titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupViews()
        setupContraints()
    }
}
// =========================================================
// MARK: - UI
// =========================================================

extension FakeTableViewCell {
    func setupViews() {
        addSubview(titleLabel)
    }
    
    func setupContraints() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
        ])
    }
}
