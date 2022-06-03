//
//  ManHinhCKViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 01/06/2022.
//

import UIKit

class BillViewController: UIViewController {
    
    @IBOutlet weak var viewTaiKhoan: ViewTop!
    @IBOutlet weak var stackView: UIStackView!
    var account: AccountObj?
    var type = ""
    // @IBOutlet weak var viewBottom: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // stackView.addSubview(uiview)
        //        stackView.addArrangedSubview(uiview)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let viewType0 = ViewType0()
        self.view.addSubview(viewType0)
        viewType0.heightAnchor.constraint(equalToConstant: viewType0.frame.height).isActive = true
        stackView.setNeedsLayout()
        stackView.layoutIfNeeded()
        stackView.insertArrangedSubview(viewType0, at: 1)
        let viewText = ViewText()
        viewText.heightAnchor.constraint(equalToConstant:
                                            viewText.frame.height).isActive = true
        stackView.setNeedsLayout()
        stackView.layoutIfNeeded()
        stackView.insertArrangedSubview(viewText, at: 2)
        viewText.lblUnderline.text = "Cài đặt ngay"
        viewText.lblUnderline.textColor = .orange
        viewText.backgroundColor = .gray
        
        let stringValue = "SoftOTP để đảm bảo tính bảo mật và tiết kiệm thời\ngian hơn khi giao dịch tài chính trên Ứng dụng."
        viewText.lblOtp.text = stringValue
        
        viewType0.isHidden = true
        viewText.isHidden = true
        
        let viewType1 = ViewType1()
        self.view.addSubview(viewType1)
        viewType1.heightAnchor.constraint(equalToConstant: viewType1.frame.height).isActive = true
        stackView.setNeedsLayout()
        stackView.layoutIfNeeded()
        stackView.insertArrangedSubview(viewType1, at: 1)
    }

}

