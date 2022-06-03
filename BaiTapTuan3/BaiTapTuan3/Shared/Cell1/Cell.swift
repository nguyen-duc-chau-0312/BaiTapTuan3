//
//  Cell.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 18/05/2022.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var lblStk: UILabel!
    @IBOutlet weak var lblSodu: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
