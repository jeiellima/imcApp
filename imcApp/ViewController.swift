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
    
    var textLabel: UILabel!
    
    override func loadView() {
        view = UIView()
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
        pesoTextField.isUserInteractionEnabled = false
        pesoTextField.textColor = .white
        pesoTextField.backgroundColor = .white
        pesoTextField.layer.cornerRadius = 5

        view.addSubview(pesoTextField)
        
        alturaTextField = UITextField()
        alturaTextField.translatesAutoresizingMaskIntoConstraints = false
        alturaTextField.textAlignment = .center
        alturaTextField.placeholder = "Ex.: 1.99"
        alturaTextField.isUserInteractionEnabled = false
        alturaTextField.textColor = .white
        alturaTextField.backgroundColor = .white
        alturaTextField.layer.cornerRadius = 5
        view.addSubview(alturaTextField)
        
        calcButton = UIButton()
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        calcButton.setTitle("Calcular", for: .normal)
        calcButton.setTitleColor(.white, for: .normal)
        calcButton.backgroundColor = UIColor(red: 10.0/255.0, green: 140.0/255.0, blue: 160.0/255.0, alpha: 1)
        calcButton.layer.cornerRadius = 5
        view.addSubview(calcButton)
        
        let screenSize: CGRect = UIScreen.main.bounds
        let myView = UIView(frame: CGRect(x: 0, y: 320, width: screenSize.width, height: screenSize.height))
        myView.backgroundColor = .white
        self.view.addSubview(myView)
        
        textLabel = UILabel()
        textLabel.text = "Seu índice de Massa Corpórea é"
        textLabel.textColor = .systemGray
        view.addSubview(textLabel)
        
        
        NSLayoutConstraint.activate([
            title1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 35),
            title1.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            subtitle.topAnchor.constraint(equalTo: title1.layoutMarginsGuide.bottomAnchor, constant: 25),
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
            
            textLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}



#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
        return
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

let deviceNames: [String] = [
    "iPhone 11 Pro Max",
]

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
  static var previews: some View {
    ForEach(deviceNames, id: \.self) { deviceName in
      UIViewControllerPreview {
        ViewController()
      }.previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
#endif
