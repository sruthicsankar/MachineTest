//
//  RegisterViewController.swift
//  Demo
//
//  Created by sruthi c sankar on 11/10/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var tblVw: UITableView!
    
    var arrUser: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.tblVw.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tblVw.delegate = self
        self.tblVw.dataSource = self
        
        
        arrUser = DbManager.shared.getAllUser()
        tblVw.reloadData()
        
    }
    
    @IBAction func onClickCancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickRegistration(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }


}

extension RegisterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let user = arrUser[indexPath.row]
        
        cell.tvFName.text = user.firstName
        cell.tvLname.text = user.lastName
        cell.tvEmail.text = user.email
        cell.tvPhoneNo.text = user.phoneNumber
        cell.tvGender.text = user.gender
        
        return cell
    }
    
}
