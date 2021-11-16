//
//  IntroView.swift
//  HTodo
//
//  Created by Humberto Castro on 16/11/21.
//

import UIKit

final class IntroView: UIView {
    private let titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        view.textColor = .black
        view.text = "Bem vindo ao app H-TODO"
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subtitleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.textColor = UIColor(named: "darkGray")
        view.text = "Esse é o app que irá organizar sua vida para sempre, você saberá tudo o que precisa fazer"
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let infoTaskView: IntroInfoView = {
        let view = IntroInfoView(
            iconImage: UIImage(named: "infoTask"),
            titleText: "Listagem de tarefas",
            subtitleText: "Você irá listar todas as tarefas que precisam ser feitas."
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let infoAddView: IntroInfoView = {
        let view = IntroInfoView(
            iconImage: UIImage(named: "infoAdd"),
            titleText: "Adicionar tarefas",
            subtitleText: "Poderá adicionar todas as tarefas que precisa."
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let infoOfflineView: IntroInfoView = {
        let view = IntroInfoView(
            iconImage: UIImage(named: "infoOffline"),
            titleText: "Tudo salvo offline",
            subtitleText: "Tudo ficará salvo localmente no seu device, não precisará se preocupar com conexão."
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let continueButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Continue", for: .normal)
        view.backgroundColor = UIColor(named: "accentColor")
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.tintColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupViews()
        setupContraints()
    }
}

// =========================================================
// MARK: - Setup Views
// =========================================================

extension IntroView {
    func setupViews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(infoTaskView)
        addSubview(infoAddView)
        addSubview(infoOfflineView)
        addSubview(continueButton)
    }
    
    func setupContraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            infoTaskView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            infoTaskView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            infoTaskView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            infoAddView.topAnchor.constraint(equalTo: infoTaskView.bottomAnchor, constant: 20),
            infoAddView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            infoAddView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            infoOfflineView.topAnchor.constraint(equalTo: infoAddView.bottomAnchor, constant: 20),
            infoOfflineView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            infoOfflineView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: infoOfflineView.bottomAnchor, constant: 20),
            continueButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            continueButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
            continueButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

