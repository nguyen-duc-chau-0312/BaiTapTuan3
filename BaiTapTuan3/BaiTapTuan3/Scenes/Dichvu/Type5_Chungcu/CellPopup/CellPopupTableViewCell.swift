//
//  CellPopupTableViewCell.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 06/06/2022.
//

import UIKit

class CellPopupTableViewCell: UITableViewCell {
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var btnCheckbox: UIButton!
    static let identifer = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkBoxClick(_ sender: UIButton) {
        btnCheckbox.isSelected = !btnCheckbox.isSelected
    }
    
}
