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
        if sender == btn10VND {
            btn10VND.backgroundColor = .orange
            btn20VND.backgroundColor = .none
            btn50VND.backgroundColor = .none
            btn100VND.backgroundColor = .none
            btn200VND.backgroundColor = .none
            btn500VND.backgroundColor = .none
        } else if sender == btn20VND {
            btn10VND.backgroundColor = .none
            btn20VND.backgroundColor = .orange
            btn50VND.backgroundColor = .none
            btn100VND.backgroundColor = .none
            btn200VND.backgroundColor = .none
            btn500VND.backgroundColor = .none
        } else if sender == btn50VND {
            btn10VND.backgroundColor = .none
            btn20VND.backgroundColor = .none
            btn50VND.backgroundColor = .orange
            btn100VND.backgroundColor = .none
            btn200VND.backgroundColor = .none
            btn500VND.backgroundColor = .none
        } else if sender == btn100VND {
            btn10VND.backgroundColor = .none
            btn20VND.backgroundColor = .none
            btn50VND.backgroundColor = .none
            btn100VND.backgroundColor = .orange
            btn200VND.backgroundColor = .none
            btn500VND.backgroundColor = .none
        } else if sender == btn200VND {
            btn10VND.backgroundColor = .none
            btn20VND.backgroundColor = .none
            btn50VND.backgroundColor = .none
            btn100VND.backgroundColor = .none
            btn200VND.backgroundColor = .orange
            btn500VND.backgroundColor = .none
        } else if sender == btn500VND{
            btn10VND.backgroundColor = .none
            btn20VND.backgroundColor = .none
            btn50VND.backgroundColor = .none
            btn100VND.backgroundColor = .none
            btn200VND.backgroundColor = .none
            btn500VND.backgroundColor = .orange
        }
                
    }

}