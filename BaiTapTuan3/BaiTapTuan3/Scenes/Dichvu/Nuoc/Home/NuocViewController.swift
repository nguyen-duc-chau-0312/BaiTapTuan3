//
//  NuocViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol NuocPresentationLogic: AnyObject {
    
}

// MARK: View
final class NuocViewController: UIViewController, PopupNhaCungCapNuocImpl, PopupMaKhachHangNuocImpl {
    
    var interactor: NuocInteractorLogic!
    var router: NuocRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var viewTop: ViewTop!
    var iconClick = true
    var account: AccountObj?
    let viewType0 = ViewType0()
    var serName = ""
    var serCode = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        loadViewTop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
//        let stringValue = "SoftOTP để đảm bảo tính bảo mật và tiết kiệm thời\ngian hơn khi giao dịch tài chính trên Ứng dụng."
//        viewText.lblOtp.text = stringValue
        
        loadViewType0()
        
    }
    
    // MARK: Fetch Nuoc
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    func getNameNhaCungCapNuoc(serName: String) {
        self.serName = serName
        viewType0.txtNCC.text = serName
    }
    
    func getSerCode(serCode: String) {
        self.serCode = serCode
        viewType0.txtKH.text = serCode
    }
    
    
    private func loadViewTop(){
        viewTop.lblTKnguon.text = DataText.lblTKN
        viewTop.lblStk.text = account?.accountNo
        viewTop.lblSodu.text = DataText.lblsoDu
        viewTop.lblBalance.text = "\((account?.balance)!) \((account?.ccy)!)"
        viewTop.btnEye.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    
    func loadViewType0(){
        viewType0.lblThongtin.text = DataText.lblTitleHoaDon
        viewType0.btnNhaCungCap.addTarget(self, action: #selector(loadViewNhaCungCap), for: .touchUpInside)
        viewType0.btnMaKH.addTarget(self, action: #selector(loadViewMaKH), for: .touchUpInside)
        viewType0.lblLuuThongTin.text = DataText.lblLuuThongTin
    }
    
    // MARK: IBAction
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func loadViewNhaCungCap() {
        let popupVC = PopupNhaCungCapNuocConfigurator.viewcontroller()
        popupVC.delegateNhaCungCapNuoc = self
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.serName = serName
        view.window?.layer.add(AnimationDismiss.shared.animationPresent(), forKey: kCATransition)
        self.present(popupVC, animated: false, completion: nil)
        
    }
    
    @objc func loadViewMaKH() {
        let popupVC = PopupMKHNuocConfigurator.viewcontroller()
        popupVC.delegateNuoc = self
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.serCode = serCode
        view.window?.layer.add(AnimationDismiss.shared.animationPresent(), forKey: kCATransition)
        self.present(popupVC, animated: false, completion: nil)
    }
    
    @objc func imageTapped(_ sender: UIButton) {
        
        if iconClick {
            iconClick = false
            viewTop.lblBalance.text = "**********"
        } else {
            iconClick = true
            viewTop.lblBalance.text = "\((account?.balance)!) \((account?.ccy)!)"
        }
    }
}

// MARK: Connect View, Interactor, and Presenter
extension NuocViewController: NuocPresentationLogic {
    
}
