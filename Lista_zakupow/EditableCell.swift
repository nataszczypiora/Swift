//
//  EditableCell.swift
//  Lista_zakupow
//
//  Created by Iga Łukiewska on 23/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//

import UIKit

class EditableCell: UITableViewCell {

    weak var addDelegate : AddCellProtocol?
    
    @IBOutlet weak var textDelegate: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func okTouched(_ sender: Any)
    {
        addDelegate?.addInfo(info: textDelegate.text!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
