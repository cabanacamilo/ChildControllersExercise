//
//  ViewController.swift
//  ChildControllersExercise
//
//  Created by Camilo Cabana on 1/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    weak var first: FirstController!
    weak var second: SecondController!
    weak var third: ThirdController!
    let mainView = MainView()
    
    var controllerNumber = 1
    
    lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backButtonTapped))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        setNavigationBar()
    }
    
    override func loadView() {
        super.loadView()
        first = mainView.first
        second = mainView.second
        third = mainView.third
        view = mainView
    }
    
    func setNavigationBar() {
        navigationItem.title = "Test"
    }
    
    func setControllers() {
        addChild(first)
        first.didMove(toParent: self)
        first.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        addChild(second)
        second.didMove(toParent: self)
        second.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        addChild(third)
        third.didMove(toParent: self)
    }
    
    @objc func backButtonTapped(_ sender: UIBarButtonItem) {
        controllerNumber -= 1
        if controllerNumber == 1 {
            navigationItem.leftBarButtonItem = nil
        }
        mainView.updatePreviousView()
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        navigationItem.leftBarButtonItem = backButton
        controllerNumber += 1
        mainView.updateNextView()
    }
}

