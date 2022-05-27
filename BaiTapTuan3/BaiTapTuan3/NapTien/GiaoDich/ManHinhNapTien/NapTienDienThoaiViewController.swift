//
//  NapTienDienThoaiViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 25/05/2022.
//

import UIKit

class NapTienDienThoaiViewController: UIViewController {
    @IBOutlet weak var viewNapTien: ViewTienDienThoai!
    @IBOutlet weak var btnHuy: UIButton!
    @IBOutlet weak var btnTiepTuc: UIButton!
    var account: Account?
    var sdtString = ""
    var balance = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadviewNapTien()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    func loadviewNapTien() {
        viewNapTien.lblTkNguon.text = DataText.lblTKN
        viewNapTien.lblStk.text = account?.accountNo
        viewNapTien.lblSdtDuocNap.text = DataText.lblSdtDuocNap
        viewNapTien.lblSdt.text = sdtString
        viewNapTien.lblMenhGia.text = DataText.lblMenhGiaNap
        viewNapTien.lblBalance.text = balance
    }
    
    @IBAction func btnTiepTuc(_ sender: UIButton) {
        let xacThucVC = XacThucViewController(nibName: "XacThucViewController", bundle: nil)
        self.navigationController?.pushViewController(xacThucVC, animated: true)
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
