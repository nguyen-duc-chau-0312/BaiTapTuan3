//
//  ViewManNap.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 25/05/2022.
//

import UIKit

class ViewTienDienThoai: UIView {
    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var lblTkNguon: UILabel!
    @IBOutlet weak var lblStk: UILabel!
    @IBOutlet weak var lblSdtDuocNap: UILabel!
    @IBOutlet weak var lblSdt: UILabel!
    @IBOutlet weak var lblMenhGia: UILabel!
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
        Bundle.main.loadNibNamed("ViewTienDienThoai", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
