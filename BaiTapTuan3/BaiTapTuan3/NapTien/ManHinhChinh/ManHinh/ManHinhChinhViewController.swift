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
    var checkIsSelected = false
    var iconClick = true
    var account: Account?
    var temp: [UIButton]?
    var currentButton: [UIButton]?
    var menhGia = ""
    var sdt = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load ViewTaiKhoan
        loadViewTK()
        loadViewSDT()
        loadViewMenhGia()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadViewSDT()
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
        viewMenhGia.btn10VND.setTitle(DataText.btn10VND, for: .normal)
//        viewMenhGia.btn10VND.addTarget(self, action: #selector(button1press), for: .touchUpInside)
        viewMenhGia.btn20VND.setTitle(DataText.btn20VND, for: .normal)
        viewMenhGia.btn50VND.setTitle(DataText.btn50VND, for: .normal)
        viewMenhGia.btn100VND.setTitle(DataText.btn100VND, for: .normal)
        viewMenhGia.btn200VND.setTitle(DataText.btn200VND, for: .normal)
        viewMenhGia.btn500VND.setTitle(DataText.btn500VND, for: .normal)
        temp = [viewMenhGia.btn10VND, viewMenhGia.btn20VND, viewMenhGia.btn50VND, viewMenhGia.btn100VND, viewMenhGia.btn200VND, viewMenhGia.btn500VND]
        if let temp1 = temp {
            for i in temp1 {
                viewMenhGia.onClick(i)
                if let text = i.titleLabel?.text {
                    menhGia = text
                }
//                i.addTarget(self, action: #selector(button1press), for: .touchUpInside)
                i.backgroundColor = .none
            }
        }
        
    }
    
    @objc func button1press(_ sender: UIButton) {
        if let button : UIButton = sender as? UIButton
        {
            button.isSelected = !button.isSelected

            if (button.isSelected)
            {
                button.backgroundColor = .orange
            }
            else
            {
                button.backgroundColor = .none
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
        napTienVC.balance = menhGia
        
        viewSDT.txtNhapSDT.text = ""
        self.navigationController?.pushViewController(napTienVC, animated: true)
    }
    
    @objc func contactTapped(_ sender: UIButton) {
        let contactVC = ContactViewController(nibName: "ContactViewController", bundle: nil)
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

