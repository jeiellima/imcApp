//
//  IMCResultView.swift
//  imcApp
//
//  Created by Jeiel Lima on 10/12/23.
//

import UIKit

final class IMCResultView: UIView {

    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Seu índice de Massa Corpórea é"
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor(red: 10.0/255.0, green: 85.0/255.0, blue: 93.0/255.0, alpha: 1)
        textLabel.font = UIFont.systemFont(ofSize: 20)
        return textLabel
    }()
    
    private lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = "Label"
        resultLabel.textColor = UIColor(red: 10.0/255.0, green: 85.0/255.0, blue: 93.0/255.0, alpha: 1)
        resultLabel.font = UIFont.boldSystemFont(ofSize: 35)
        return resultLabel
    }()
    
    private lazy var resultImageView:  UIImageView = {
        let resultImageView = UIImageView()
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.backgroundColor = UIColor(red: 136.0/255.0, green: 255.0/255.0, blue: 251.0/255.0, alpha: 1)
        resultImageView.layer.cornerRadius = 10
        resultImageView.contentMode = .scaleAspectFit
        return resultImageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(textLabel)
        addSubview(resultLabel)
        addSubview(resultImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 15),
            
            resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: textLabel.layoutMarginsGuide.bottomAnchor, constant: 10),
            
            resultImageView.widthAnchor.constraint(equalToConstant: 350),
            resultImageView.heightAnchor.constraint(equalToConstant: 350),
            resultImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resultImageView.topAnchor.constraint(equalTo: resultLabel.layoutMarginsGuide.bottomAnchor, constant: 25)
        ])
    }
    
    func update(resultText: String, resultImage: UIImage?) {
        resultLabel.text = resultText
        resultImageView.image = resultImage
    }
}
