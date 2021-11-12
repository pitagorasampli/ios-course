//
//  PrimaryButton.swift
//  HTodo
//
//  Created by Humberto Castro on 12/11/21.
//

import Foundation
import UIKit

final class PrimaryButton: UIButton {
    init() {
        super.init(frame: .zero)
        self.setTitle("Adicionar Tarefa", for: .normal)
        self.backgroundColor = UIColor(named: "accentColor")
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        self.tintColor = .white
        self.layer.cornerRadius = 8
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
