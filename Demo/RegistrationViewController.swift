//
//  RegistrationViewController.swift
//  Demo
//
//  Created by sruthi c sankar on 11/10/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var tvFName: UITextField!
    @IBOutlet weak var tvlName: UITextField!
    @IBOutlet weak var tvEmail: UITextField!
    @IBOutlet weak var tvPassword: UITextField!
    @IBOutlet weak var tvConfirmPassword: UITextField!
    @IBOutlet weak var tvFPhoneNo: UITextField!
    
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    
    @IBOutlet weak var btnFemale: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func maleBtnClicked(_ sender: UIButton) {
        
        self.btnMale.isSelected = !self.btnMale.isSelected
        self.btnFemale.isSelected = false
        self.btnOther.isSelected = false
        
    }
    @IBAction func femaleBtnClicked(_ sender: UIButton) {
        self.btnMale.isSelected = false
        self.btnFemale.isSelected = !self.btnFemale.isSelected
        self.btnOther.isSelected = false

    }
    @IBAction func otherBtnClicked(_ sender: UIButton) {
        self.btnMale.isSelected = false
        self.btnFemale.isSelected = false
        self.btnOther.isSelected = !self.btnOther.isSelected

    }
    
    
    
    
    @IBAction func onClickCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickRegister(_ sender: Any) {
        
        let fname = tvFName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lname = tvlName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = tvEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phoneno = tvFPhoneNo.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = tvPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confmPw = tvConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if fname == "" {
            showAlert(msg: "Please enter the first name")
        }
        else if lname == "" {
            showAlert(msg: "Please enter the last name")
        }
        else if email == "" {
            showAlert(msg: "Please enter the E-mail")
        }
        else if pass == "" || confmPw == "" {
            showAlert(msg: "Please enter the password and confirm password")
        }
        else if pass != confmPw {
            showAlert(msg: "Password confirm password doesn't match")
        }
        else if phoneno == "" {
            showAlert(msg: "Please enter the phone number")
        }
        else if !btnMale.isSelected && !btnFemale.isSelected && !btnOther.isSelected  {
            showAlert(msg: "Please select the gender")
        }
        else {
            
            var gender = ""
            if self.btnMale.isSelected {
                gender = "Male"
            }
            else if self.btnFemale.isSelected {
                gender = "Female"
            }
            else {
                gender = "Other"
            }
            
            //register
            
            DbManager.shared.saveUser(firstName: fname!, lastName: lname!, email: email!, password: pass!, phoneNumber: phoneno!, gender: gender)
            
            self.navigationController?.popViewController(animated: true)

        }
        
        
    }
    
    
    func showAlert(msg: String) {
        let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:     NSLocalizedString("Ok", comment: ""), style: .default, handler: { (pAlert) in
                })
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
