//
//  ManHinhChinhViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 24/05/2022.
//

import UIKit

class ManHinhChinhViewController: UIViewController, SendContactViewController, SendData {

    @IBOutlet weak var viewTaiKhoan: ViewTaiKhoanNguon!
    @IBOutlet weak var viewSDT: ViewChonSDT!
    @IBOutlet weak var viewMenhGia: ViewChonMenhGia!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnTiepTuc: UIButton!
    
    var buttons: [UIButton?: String]?
    var iconClick = true
    var account: Account?
    var sdt = ""
    let contactVC = ContactViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewTK()
        loadViewSDT()
        loadViewMenhGia()
        contactVC.delegateSend = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadViewSDT()
    }
    
    func getSdt(sdt: String) {
        self.sdt = sdt
    }
    
    func getButton(button: [UIButton? : String]) {
        self.buttons = button
    }

    func loadViewTK() {
        viewTaiKhoan.lblStk.text = account?.accountNo
        viewTaiKhoan.lblBalance.text = "\((account?.balance)!) \((account?.ccy)!)"
        viewTaiKhoan.lblSoDu.text = DataText.lblsoDu
        viewTaiKhoan.lblTaiKhoanNguon.text = DataText.lblTKN
        viewTaiKhoan.btnEye.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    
    func loadViewSDT(){
        viewSDT.lblChonSDT.text = DataText.lblSDT
        viewSDT.txtNhapSDT.layer.borderWidth = 0
        viewSDT.lblLuuMauNap.text = DataText.lblMauNap
        viewSDT.txtNhapSDT.text = sdt
        viewSDT.btnContact.setTitle("", for: .normal)
        viewSDT.btnContact.addTarget(self, action: #selector(contactTapped), for: .touchUpInside)
        
    }
    
    func loadViewMenhGia() {
        
        viewMenhGia.lblChonMenhGia.text = DataText.lblMenhGia
        viewMenhGia.settileButton()
        
        if let tempButton = buttons {
            for (key, value) in tempButton {
                if let key = key {
                    viewMenhGia.onClick(key)
                    key.backgroundColor = .none
                }
            }
        }
    }
    
    @IBAction func CancelPressed(_ sender: UIButton) {
        viewSDT.txtNhapSDT.text = ""
    }
    
    @IBAction func NextPressed(_ sender: UIButton) {
        let napTienVC = NapTienDienThoaiViewController(nibName: "NapTienDienThoaiViewController", bundle: nil)
        napTienVC.account = account
        napTienVC.sdtString = viewSDT.txtNhapSDT.text ?? ""
        napTienVC.balance = viewMenhGia.menhGia
        
        viewSDT.txtNhapSDT.text = ""
        self.navigationController?.pushViewController(napTienVC, animated: true)
    }
    
    @objc func contactTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(contactVC, animated: true)
    }
    
    @objc func imageTapped(_ sender: UIButton) {
        
        if iconClick {
            iconClick = false
            viewTaiKhoan.lblBalance.text = "**********"
        } else {
            iconClick = true
            viewTaiKhoan.lblBalance.text = "\((account?.balance)!) \((account?.ccy)!)"
        }
        
    }
    
}

