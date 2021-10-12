//
//  TableViewCell.swift
//  Demo
//
//  Created by sruthi c sankar on 12/10/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tvFName: UITextField!
    @IBOutlet weak var tvLname: UITextField!
    @IBOutlet weak var tvEmail: UITextField!
    @IBOutlet weak var tvPhoneNo: UITextField!
    @IBOutlet weak var tvGender: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
