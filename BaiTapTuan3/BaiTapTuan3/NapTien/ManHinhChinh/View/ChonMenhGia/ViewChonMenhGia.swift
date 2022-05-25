//
//  ChonMenhGia.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 25/05/2022.
//

import UIKit

class ViewChonMenhGia: UIView {
    
    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var lblChonMenhGia: UILabel!
    @IBOutlet weak var btn10VND: UIButton!
    @IBOutlet weak var btn20VND: UIButton!
    @IBOutlet weak var btn50VND: UIButton!
    @IBOutlet weak var btn100VND: UIButton!
    @IBOutlet weak var btn200VND: UIButton!
    @IBOutlet weak var btn500VND: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDcoder: NSCoder){
        super.init(coder: aDcoder)
        commomInit()
    }
    
    private func commomInit(){
        Bundle.main.loadNibNamed("ViewChonMenhGia", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        
    }
    

}
