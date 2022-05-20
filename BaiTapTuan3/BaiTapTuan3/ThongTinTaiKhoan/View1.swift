//
//  View1.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 18/05/2022.
//

import UIKit

class View1: UIView {
    
    @IBOutlet var viewContent: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    private func commomInit(){
        Bundle.main.loadNibNamed("View1", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
