//
//  ViewGiaoThong.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 09/06/2022.
//

import UIKit

class ViewGiaoThong: UIView {

    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var lblThongTin: UILabel!
    @IBOutlet weak var txtLoaiDichVu: UITextField!
    @IBOutlet weak var txtBienSo: UITextField!
    @IBOutlet weak var txtSoTien: UITextField!
    @IBOutlet weak var btnToggle: UIButton!
    @IBOutlet weak var lblLuuMau: UILabel!
    @IBOutlet weak var btnBienSo: UIButton!
    
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
        Bundle.main.loadNibNamed("ViewGiaoThong", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.frame = self.bounds
        viewContent.backgroundColor = .blue
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    private func commomXib(){
        Bundle.main.loadNibNamed("ViewGiaoThong", owner: self, options: nil)
        self.frame = viewContent.frame
        addSubview(viewContent)
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    

    @IBAction func clickSelected(_ sender: UIButton) {
        btnToggle.isSelected = !btnToggle.isSelected
    }
}
