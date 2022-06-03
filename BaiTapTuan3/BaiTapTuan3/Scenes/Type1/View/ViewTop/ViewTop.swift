//
//  ViewTop.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 01/06/2022.
//

import UIKit

class ViewTop: UIView {

    @IBOutlet var viewContent: UIView!
    
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

}
