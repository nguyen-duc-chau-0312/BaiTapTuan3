//
//  ViewXacThuc.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 26/05/2022.
//

import UIKit

class ViewXacThuc: UIView {
    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var lblTextXacThuc: UILabel!
    @IBOutlet weak var lblMaXacThuc: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtMaXacThuc: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDcoder: NSCoder){
        super.init(coder: aDcoder)
        commomInit()
    }
    
    private func commomInit(){
        Bundle.main.loadNibNamed("ViewXacThuc", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
