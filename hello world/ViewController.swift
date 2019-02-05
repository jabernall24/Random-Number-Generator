//
//  ViewController.swift
//  hello world
//
//  Created by Jesus Andres Bernal Lopez on 1/31/19.
//  Copyright © 2019 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let randomNumberLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.boldSystemFont(ofSize: 36)
        l.textAlignment = .center
        return l
    }()
    
    let lowerBoundTextField: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = .cyan
        t.textAlignment = .center
        t.keyboardType = .numberPad
        return t
    }()

    let upperBoundTextField: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = .cyan
        t.textAlignment = .center
        t.keyboardType = .numberPad
        return t
    }()

    let generateNumberButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Generate", for: .normal)
        b.backgroundColor = .black
        b.addTarget(self, action: #selector(generateNumber), for: .touchUpInside)
        return b
    }()

    @objc func generateNumber(){
        guard let lowerBound = Int(lowerBoundTextField.text ?? "0") else {return}
        guard let upperBound = Int(upperBoundTextField.text ?? "0") else {return}

        if upperBound > lowerBound {
            let num = String(describing: Int.random(in: lowerBound...upperBound))
            randomNumberLabel.text = num
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        view.addSubview(lowerBoundTextField)
        lowerBoundTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        lowerBoundTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -8).isActive = true
        lowerBoundTextField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        lowerBoundTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        view.addSubview(upperBoundTextField)
        upperBoundTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 8).isActive = true
        upperBoundTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        upperBoundTextField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        upperBoundTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        view.addSubview(randomNumberLabel)
        randomNumberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        randomNumberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        randomNumberLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        randomNumberLabel.bottomAnchor.constraint(equalTo: lowerBoundTextField.topAnchor, constant: 25).isActive = true

        view.addSubview(generateNumberButton)
        generateNumberButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        generateNumberButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        generateNumberButton.topAnchor.constraint(equalTo: lowerBoundTextField.bottomAnchor, constant: 25).isActive = true
        generateNumberButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}

