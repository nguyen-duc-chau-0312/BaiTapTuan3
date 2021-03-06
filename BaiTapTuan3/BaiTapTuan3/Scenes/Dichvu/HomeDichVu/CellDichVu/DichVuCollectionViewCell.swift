//
//  DichVuCollectionViewCell.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 31/05/2022.
//

import UIKit

class DichVuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblContent: UILabel!

    @IBOutlet weak var imgView: UIImageView!
    
    static let identifer = "Cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configView()
        
    }
    
    func setupData(_ cell: BillPayment){
        lblContent.text = cell.name
        imgView.image = UIImage(named: cell.img)
    }
    
    private func configView() {
        self.clipsToBounds = false
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.2
       

    }


}
