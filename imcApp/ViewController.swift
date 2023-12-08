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
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(red: 22.0/255.0, green: 180.0/255.0, blue: 198.0/255.0, alpha: 1)

        title1 = UILabel()
        title1.translatesAutoresizingMaskIntoConstraints = false
        title1.textAlignment = .center
        title1.text = "Cálculo do IMC"
        title1.textColor = .white
        view.addSubview(title1)
        
        subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textAlignment = .center
        subtitle.text = "Descubra o seu Índice de Massa Corpórea"
        subtitle.textColor = .white
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
        pesoTextField.textColor = .white
        view.addSubview(pesoTextField)
        
        alturaTextField = UITextField()
        alturaTextField.translatesAutoresizingMaskIntoConstraints = false
        alturaTextField.textAlignment = .center
        alturaTextField.placeholder = "Ex.: 1.99"
        alturaTextField.textColor = .white
        view.addSubview(alturaTextField)
        
        calcButton = UIButton()
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        calcButton.setTitle("Calcular", for: .normal)
        
        NSLayoutConstraint.activate([
            title1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            title1.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            subtitle.topAnchor.constraint(equalTo: title1.layoutMarginsGuide.bottomAnchor),
            subtitle.centerXAnchor.constraint(equalTo: title1.layoutMarginsGuide.centerXAnchor)
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

@available(iOS 14.0, *)
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
