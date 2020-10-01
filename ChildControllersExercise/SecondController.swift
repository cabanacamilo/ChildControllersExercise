//
//  SecondController.swift
//  ChildControllersExercise
//
//  Created by Camilo Cabana on 1/10/20.
//

import UIKit

class SecondController: UIViewController {

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .blue
        view.addSubview(nextButton)
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
