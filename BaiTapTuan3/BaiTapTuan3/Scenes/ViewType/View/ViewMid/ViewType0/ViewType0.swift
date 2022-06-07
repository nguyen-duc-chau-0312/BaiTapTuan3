//
//  ViewMid.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 01/06/2022.
//

import UIKit

class ViewType0: UIView {

    //Type0 Thanh toan truyen hinh cap, hoa don tien nuoc, hoa don tien dien
    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var btnToggle: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if (frame == CGRect(x: 0, y: 0, width: 0, height: 0)){
            commomXib()
        }else {
            commomInit()
        }
       
    }
    override class func awakeFromNib() {
        print("1")
    }
    
    required init?(coder aDcoder: NSCoder){
        super.init(coder: aDcoder)
        commomInit()
        
    }
  
    
    private func commomInit(){
        Bundle.main.loadNibNamed("ViewType0", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.backgroundColor = .blue
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    private func commomXib(){
        Bundle.main.loadNibNamed("ViewType0", owner: self, options: nil)
        self.frame = viewContent.frame
        addSubview(viewContent)
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }


    @IBAction func TogglePressed(_ sender: UIButton) {
        btnToggle.isSelected = !btnToggle.isSelected
    }
}
