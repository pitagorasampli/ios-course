//
//  IntroInfoView.swift
//  HTodo
//
//  Created by Humberto Castro on 09/11/21.
//

import UIKit

class IntroInfoView: UIView {
    
    // =========================================================
    // MARK: - Subviews
    // =========================================================
    
    let iconImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.textColor = .black
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let subtitleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.textColor = .black
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // =========================================================
    // MARK: - Constructor
    // =========================================================
    
    init(iconImage: UIImage?, titleText: String, subtitleText: String) {
        super.init(frame: .zero)
        setup()
        setData(iconImage: iconImage, titleText: titleText, subtitleText: subtitleText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupViews()
        setupContraints()
    }
    
    func setData(iconImage: UIImage?, titleText: String, subtitleText: String) {
        iconImageView.image = iconImage
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }
}

// =========================================================
// MARK: - UI
// =========================================================

extension IntroInfoView {
    
    func setupViews() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 0),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            subtitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
}
