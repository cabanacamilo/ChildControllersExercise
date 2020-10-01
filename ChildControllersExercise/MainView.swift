//
//  MainView.swift
//  ChildControllersExercise
//
//  Created by Camilo Cabana on 1/10/20.
//

import UIKit

class MainView: UIView {
    
    let first: FirstController = {
        let controller = FirstController()
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    let second: SecondController = {
        let controller = SecondController()
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    let third: ThirdController = {
        let controller = ThirdController()
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    var animatedConstraint = NSLayoutConstraint()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    func setLayout() {
        backgroundColor = .white
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundView.addSubview(first.view)
        first.view.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        animatedConstraint = first.view.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor)
        animatedConstraint.isActive = true
        first.view.heightAnchor.constraint(equalTo: backgroundView.heightAnchor).isActive = true
        first.view.widthAnchor.constraint(equalTo: backgroundView.widthAnchor).isActive = true
        backgroundView.addSubview(second.view)
        second.view.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        second.view.leadingAnchor.constraint(equalTo: first.view.trailingAnchor).isActive = true
        second.view.heightAnchor.constraint(equalTo: backgroundView.heightAnchor).isActive = true
        second.view.widthAnchor.constraint(equalTo: backgroundView.widthAnchor).isActive = true
        backgroundView.addSubview(third.view)
        third.view.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        third.view.leadingAnchor.constraint(equalTo: second.view.trailingAnchor).isActive = true
        third.view.heightAnchor.constraint(equalTo: backgroundView.heightAnchor).isActive = true
        third.view.widthAnchor.constraint(equalTo: backgroundView.widthAnchor).isActive = true
    }
    
    func updateNextView() {
        let constant = animatedConstraint.constant - frame.width
        print(constant)
        animatedConstraint.constant = constant
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.layoutIfNeeded()
        }
    }
    
    func updatePreviousView() {
        let constant = animatedConstraint.constant + frame.width
        print(constant)
        animatedConstraint.constant = constant
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.layoutIfNeeded()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
