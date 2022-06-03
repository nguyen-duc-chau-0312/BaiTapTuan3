//
//  CustomCollectionViewCell.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 31/05/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    static let identifer = "Cell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
