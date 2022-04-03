//
//  HomeViewController.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import UIKit

class HomeViewController: UIViewController {

    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onPressButton(_ sender: UIButton) {
        print("Press Me")
    }
}
