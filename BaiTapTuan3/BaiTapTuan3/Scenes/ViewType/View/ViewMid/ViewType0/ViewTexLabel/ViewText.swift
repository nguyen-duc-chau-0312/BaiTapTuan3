//
//  ViewText.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 02/06/2022.
//

import UIKit

class ViewText: UIView {
    @IBOutlet weak var lblLuuY: UILabel!
    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var lblUnderline: UILabel!
    @IBOutlet var viewContent: UIView!
    
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
        Bundle.main.loadNibNamed("ViewText", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.backgroundColor = .blue
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    private func commomXib(){
        Bundle.main.loadNibNamed("ViewText", owner: self, options: nil)
        self.frame = viewContent.frame
        addSubview(viewContent)
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
