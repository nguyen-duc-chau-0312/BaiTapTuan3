//
//  ViewTaiKhoanNguon.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 24/05/2022.
//

import UIKit

class ViewTaiKhoanNguon: UIView {
    
    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var imgdrop: UIImageView!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var lblTaiKhoanNguon: UILabel!
    @IBOutlet weak var lblStk: UILabel!
    @IBOutlet weak var lblSoDu: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDcoder: NSCoder){
        super.init(coder: aDcoder)
        commomInit()
    }
    
    private func commomInit(){
        Bundle.main.loadNibNamed("ViewTaiKhoanNguon", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    
    @IBAction func actionClickEye(_ sender: Any) {
        btnEye.isSelected = !btnEye.isSelected
        
    }
}




