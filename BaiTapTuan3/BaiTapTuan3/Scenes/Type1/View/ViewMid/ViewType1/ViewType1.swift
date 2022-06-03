//
//  ViewType0.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 02/06/2022.
//

import UIKit

class ViewType1: UIView {

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
    
    required init?(coder aDcoder: NSCoder){
        super.init(coder: aDcoder)
        commomInit()
        
    }
    
    private func commomInit(){
        Bundle.main.loadNibNamed("ViewType1", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.backgroundColor = .blue
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    private func commomXib(){
        Bundle.main.loadNibNamed("ViewType1", owner: self, options: nil)
        self.frame = viewContent.frame
        addSubview(viewContent)
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func togglePressed(_ sender: UIButton) {
        btnToggle.isSelected = !btnToggle.isSelected
    }
}
