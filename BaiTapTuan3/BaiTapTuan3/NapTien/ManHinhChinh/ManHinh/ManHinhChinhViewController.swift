//
//  ManHinhChinhViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 24/05/2022.
//

import UIKit

class ManHinhChinhViewController: UIViewController {
    @IBOutlet weak var viewTaiKhoan: ViewTaiKhoanNguon!
    @IBOutlet weak var viewSDT: ViewChonSDT!
    @IBOutlet weak var viewMenhGia: ViewChonMenhGia!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnTiepTuc: UIButton!
//    let imageicon = UIImageView()
    var iconClick = true
    var account: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load ViewTaiKhoan
        loadViewTK()
        loadViewSDT()
        loadViewMenhGia()
        
    
    }
    
    func loadViewTK() {
        viewTaiKhoan.lblStk.text = account?.accountNo
        viewTaiKhoan.lblBalance.text = "\((account?.balance)!) \((account?.ccy)!)"
        viewTaiKhoan.lblSoDu.text = DataText.lblsoDu
        viewTaiKhoan.lblTaiKhoanNguon.text = DataText.lblTKN
//        viewTaiKhoan.btnEye.setImage(UIImage(named: "ic24PxEye"), for: .normal)
        viewTaiKhoan.btnEye.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    
    func loadViewSDT(){
        viewSDT.lblChonSDT.text = DataText.lblSDT
        viewSDT.txtNhapSDT.layer.borderWidth = 0
        viewSDT.lblLuuMauNap.text = DataText.lblMauNap
        viewSDT.btnContact.setTitle("", for: .normal)
        viewTaiKhoan..addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        
    }
    
    func loadViewMenhGia() {
        viewMenhGia.lblChonMenhGia.text = DataText.lblMenhGia
        viewMenhGia.btn10VND.setTitle(DataText.btn10VND, for: .normal)
        viewMenhGia.btn20VND.setTitle(DataText.btn20VND, for: .normal)
        viewMenhGia.btn50VND.setTitle(DataText.btn50VND, for: .normal)
        viewMenhGia.btn100VND.setTitle(DataText.btn100VND, for: .normal)
        viewMenhGia.btn200VND.setTitle(DataText.btn200VND, for: .normal)
        viewMenhGia.btn500VND.setTitle(DataText.btn500VND, for: .normal)
    }

    @IBAction func CancelPressed(_ sender: UIButton) {
    }

    @IBAction func NextPressed(_ sender: UIButton) {
    }

    @objc func imageTapped(_ sender: UIButton) {

        if iconClick {
            iconClick = false
            viewTaiKhoan.lblBalance.text = "***********"
        } else {
            iconClick = true
            viewTaiKhoan.lblBalance.text = "\((account?.balance)!) \((account?.ccy)!)"
        }

    }
    
    
}

