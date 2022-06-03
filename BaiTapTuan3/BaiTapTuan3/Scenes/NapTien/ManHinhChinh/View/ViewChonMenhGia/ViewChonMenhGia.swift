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
    @IBOutlet var priceBtns: [UIButton]!
    @IBOutlet weak var btn10VND: UIButton!
    @IBOutlet weak var btn20VND: UIButton!
    @IBOutlet weak var btn50VND: UIButton!
    @IBOutlet weak var btn100VND: UIButton!
    @IBOutlet weak var btn200VND: UIButton!
    @IBOutlet weak var btn500VND: UIButton!
    var delegateSendData: SendData?
    var menhGia = ""
    
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
       
        let priceLbls = ["10,000 VND","20,000 VND","50,000 VND","100,000 VND","200,000 VND","500,000 VND"]
        for (i, btn) in priceBtns.enumerated() {
            btn.setTitle(priceLbls[i], for: .normal)
        }
    }
    
//    func settileButton() {
//        let buttons = [btn10VND : "10.000VND", btn20VND : "20.000VND", btn50VND: "50.000VND", btn100VND : "100.000VND", btn200VND : "200.000VND", btn500VND : "500.000VND"]
//        for (key, value) in buttons {
//            key?.setTitle(value, for: .normal)
//        }
//        delegateSendData?.getButton(button: buttons)
//    }
    
    @IBAction func onClick(_ sender: UIButton) {
        for btn in priceBtns {
            if btn.tag == sender.tag {
                btn.backgroundColor = .orange
            }else{
                btn.backgroundColor = .none
            }
        }
        menhGia = sender.title(for: .normal)!
        
//        if sender == btn10VND {
//            btn10VND.backgroundColor = .orange
//            btn20VND.backgroundColor = .none
//            btn50VND.backgroundColor = .none
//            btn100VND.backgroundColor = .none
//            btn200VND.backgroundColor = .none
//            btn500VND.backgroundColor = .none
//            menhGia = sender.title(for: .normal)!
//        } else if sender == btn20VND {
//            btn10VND.backgroundColor = .none
//            btn20VND.backgroundColor = .orange
//            btn50VND.backgroundColor = .none
//            btn100VND.backgroundColor = .none
//            btn200VND.backgroundColor = .none
//            btn500VND.backgroundColor = .none
//            menhGia = sender.title(for: .normal)!
//        } else if sender == btn50VND {
//            btn10VND.backgroundColor = .none
//            btn20VND.backgroundColor = .none
//            btn50VND.backgroundColor = .orange
//            btn100VND.backgroundColor = .none
//            btn200VND.backgroundColor = .none
//            btn500VND.backgroundColor = .none
//            menhGia = sender.title(for: .normal)!
//        } else if sender == btn100VND {
//            btn10VND.backgroundColor = .none
//            btn20VND.backgroundColor = .none
//            btn50VND.backgroundColor = .none
//            btn100VND.backgroundColor = .orange
//            btn200VND.backgroundColor = .none
//            btn500VND.backgroundColor = .none
//            menhGia = sender.title(for: .normal)!
//        } else if sender == btn200VND {
//            btn10VND.backgroundColor = .none
//            btn20VND.backgroundColor = .none
//            btn50VND.backgroundColor = .none
//            btn100VND.backgroundColor = .none
//            btn200VND.backgroundColor = .orange
//            btn500VND.backgroundColor = .none
//            menhGia = sender.title(for: .normal)!
//        } else if sender == btn500VND{
//            btn10VND.backgroundColor = .none
//            btn20VND.backgroundColor = .none
//            btn50VND.backgroundColor = .none
//            btn100VND.backgroundColor = .none
//            btn200VND.backgroundColor = .none
//            btn500VND.backgroundColor = .orange
//            menhGia = sender.title(for: .normal)!
//        }
    }
    

}
