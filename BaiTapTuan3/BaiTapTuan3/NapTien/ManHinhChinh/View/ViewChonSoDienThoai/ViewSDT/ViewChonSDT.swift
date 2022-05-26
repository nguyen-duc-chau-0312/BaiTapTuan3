//
//  ViewChonSDT.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 25/05/2022.
//

import UIKit

class ViewChonSDT: UIView {
    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var lblChonSDT: UILabel!
    @IBOutlet weak var txtNhapSDT: UITextField!
    @IBOutlet weak var lblLuuMauNap: UILabel!
    @IBOutlet weak var btnContact: UIButton!
    @IBOutlet weak var btnToggle: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDcoder: NSCoder){
        super.init(coder: aDcoder)
        commomInit()
    }
    
    private func commomInit(){
        Bundle.main.loadNibNamed("ViewChonSDT", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    @IBAction func TogglePressed(_ sender: UIButton) {
        btnToggle.isSelected = !btnToggle.isSelected
    }
    
}
