//
//  ViewController.swift
//  Demo
//
//  Created by sruthi c sankar on 11/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func onClickRegister(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func onClickRegistration(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

