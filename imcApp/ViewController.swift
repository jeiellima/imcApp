//
//  ViewController.swift
//  imcApp
//
//  Created by Jeiel Lima on 07/12/23.
//

import UIKit

class ViewController: UIViewController {

    var title1: UILabel!
    var subtitle: UILabel!
    var pesoLabel: UILabel!
    var alturaLabel: UILabel!
    var pesoTextField: UITextField!
    var alturaTextField: UITextField!
    var calcButton: UIButton!

    
    //MARK: - SeconView
    var imc = 0.0

    let screenSize: CGRect = UIScreen.main.bounds
    lazy var resultView: IMCResultView = {
        let frame = CGRect(x: 0, y: 320, width: screenSize.width, height: screenSize.height)
        let resultView = IMCResultView(frame: frame)
        resultView.backgroundColor = .white
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.isHidden = true
        return resultView
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            if let altura = Double(alturaTextField.text!), let peso = Double(pesoTextField.text!) {
                imc = peso / (altura * altura)
                showResult()
            }
            dismiss(animated: true, completion: nil)
            print("button clicked")
        }
    }
    
    func showResult() {
        let roundImc = String(format: "%.1f", imc)
        var result: String
        var image: String
        switch imc {
            case 0..<16:
                result = "\(roundImc) - Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "\(roundImc) - Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "\(roundImc) - Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "\(roundImc) - Sobrepeso"
                image = "sobre"
            default:
                result = "\(roundImc) - Obesidade"
                image = "obesidade"
        }
        
        resultView.update(resultText: result, resultImage: UIImage(named: image))
        resultView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupConstraints()
    }
    
    private func setupViewHierarchy() {
        view.backgroundColor = UIColor(red: 22.0/255.0, green: 180.0/255.0, blue: 198.0/255.0, alpha: 1)

        title1 = UILabel()
        title1.translatesAutoresizingMaskIntoConstraints = false
        title1.textAlignment = .center
        title1.text = "Cálculo do IMC"
        title1.textColor = .white
        title1.font = UIFont.boldSystemFont(ofSize: 35)
        view.addSubview(title1)
         
        subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textAlignment = .center
        subtitle.text = "Descubra o seu Índice de Massa Corpórea"
        subtitle.textColor = .white
        subtitle.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(subtitle)
        
        pesoLabel = UILabel()
        pesoLabel.translatesAutoresizingMaskIntoConstraints = false
        pesoLabel.textAlignment = .center
        pesoLabel.text = "Peso (Kg)"
        pesoLabel.textColor = .white
        view.addSubview(pesoLabel)
        
        alturaLabel = UILabel()
        alturaLabel.translatesAutoresizingMaskIntoConstraints = false
        alturaLabel.textAlignment = .center
        alturaLabel.text = "Altura (m)"
        alturaLabel.textColor = .white
        view.addSubview(alturaLabel)

        pesoTextField = UITextField()
        pesoTextField.translatesAutoresizingMaskIntoConstraints = false
        pesoTextField.textAlignment = .center
        pesoTextField.placeholder = "Ex.: 99"
        pesoTextField.isUserInteractionEnabled = true
        pesoTextField.textColor = UIColor(red: 9.0/255.0, green: 140.0/255.0, blue: 160.0/255.0, alpha: 1)
        pesoTextField.backgroundColor = .white
        pesoTextField.layer.cornerRadius = 5
        view.addSubview(pesoTextField)
        
        alturaTextField = UITextField()
        alturaTextField.translatesAutoresizingMaskIntoConstraints = false
        alturaTextField.textAlignment = .center
        alturaTextField.placeholder = "Ex.: 1.99"
        alturaTextField.isUserInteractionEnabled = true
        alturaTextField.textColor = UIColor(red: 9.0/255.0, green: 140.0/255.0, blue: 160.0/255.0, alpha: 1)
        alturaTextField.backgroundColor = .white
        alturaTextField.layer.cornerRadius = 5
        view.addSubview(alturaTextField)
        
        calcButton = UIButton()
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        calcButton.setTitle("Calcular", for: .normal)
        calcButton.setTitleColor(.white, for: .normal)
        calcButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        calcButton.tag = 1
        calcButton.backgroundColor = UIColor(red: 10.0/255.0, green: 140.0/255.0, blue: 160.0/255.0, alpha: 1)
        calcButton.layer.cornerRadius = 5
        view.addSubview(calcButton)


       //MARK: - SecondView
        self.view.addSubview(resultView)
    }
    
    private func setupConstraints() {
        //MARK: - Constrains
        NSLayoutConstraint.activate([
            
            title1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 35),
            title1.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            subtitle.topAnchor.constraint(equalTo: title1.layoutMarginsGuide.bottomAnchor, constant: 20),
            subtitle.centerXAnchor.constraint(equalTo: title1.layoutMarginsGuide.centerXAnchor),
            
            pesoLabel.topAnchor.constraint(equalTo: subtitle.layoutMarginsGuide.bottomAnchor, constant: 30),
            pesoLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30),
            
            pesoTextField.heightAnchor.constraint(equalToConstant: 30),
            pesoTextField.widthAnchor.constraint(equalToConstant: 80),
            pesoTextField.topAnchor.constraint(equalTo: pesoLabel.layoutMarginsGuide.bottomAnchor, constant: 25),
            pesoTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30),
            
            alturaLabel.topAnchor.constraint(equalTo: subtitle.layoutMarginsGuide.bottomAnchor, constant: 30),
            alturaLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -30),
            
            alturaTextField.heightAnchor.constraint(equalToConstant: 30),
            alturaTextField.widthAnchor.constraint(equalToConstant: 80),
            alturaTextField.topAnchor.constraint(equalTo: alturaLabel.layoutMarginsGuide.bottomAnchor, constant: 25),
            alturaTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -30),
            
            calcButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.65),
            calcButton.heightAnchor.constraint(equalToConstant: 60),
            calcButton.topAnchor.constraint(equalTo: alturaTextField.layoutMarginsGuide.bottomAnchor, constant: 40),
            calcButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            resultView.topAnchor.constraint(equalTo: calcButton.bottomAnchor, constant: 15),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
