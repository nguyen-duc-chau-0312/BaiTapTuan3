//
//  XacThucViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 26/05/2022.
//

import UIKit

class XacThucViewController: UIViewController {
 
    @IBOutlet weak var viewXacThuc: ViewXacThuc!
    @IBOutlet weak var viewTouchID: ViewTouchID!
    @IBOutlet weak var btnHuy: UIButton!
    @IBOutlet weak var btnTiepTuc: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = DataText.titleXacThuc
        loadViewXacThuc()
        loadViewTouchID()
    }


    func loadViewXacThuc() {
        viewXacThuc.lblTextXacThuc.text = DataText.lblTextMaXacThuc
        viewXacThuc.lblMaXacThuc.text = DataText.lblMaXacThuc
    }
    
    func loadViewTouchID() {
        viewTouchID.lblText1.text = DataText.lblText1
        viewTouchID.lblText2.text = DataText.lblText2
    }

    @IBAction func cancelPressed(_ sender: UIButton) {
        viewXacThuc.txtPassword.text = ""
        viewXacThuc.txtMaXacThuc.text = ""
    }
}
