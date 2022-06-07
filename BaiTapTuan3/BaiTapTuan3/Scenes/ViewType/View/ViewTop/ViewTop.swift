//
//  ViewTop.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 01/06/2022.
//

import UIKit

class ViewTop: UIView {

    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var lblTKnguon: UILabel!
    @IBOutlet weak var lblStk: UILabel!
    @IBOutlet weak var lblSodu: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var btnEye: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDcoder: NSCoder){
        super.init(coder: aDcoder)
        commomInit()
    }
    
    private func commomInit(){
        Bundle.main.loadNibNamed("ViewTop", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    @IBAction func clickEye(_ sender: UIButton) {
        btnEye.isSelected = !btnEye.isSelected
    }
    
}
