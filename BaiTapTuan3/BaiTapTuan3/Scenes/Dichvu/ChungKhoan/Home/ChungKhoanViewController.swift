//
//  ChungKhoanViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol ChungKhoanPresentationLogic: AnyObject {
    
}

// MARK: View
final class ChungKhoanViewController: UIViewController, PopupNhaCungCapChungKhoanImpl, PopupMaKhachHangChungKhoanImpl {
    
    var interactor: ChungKhoanInteractorLogic!
    var router: ChungKhoanRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var viewTop: ViewTop!
    var iconClick = true
    let viewChungKhoan = ViewChungKhoan()
    var account: AccountObj?
    var serName = ""
    var serCode = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        loadViewTop()
        title = "NẠP TIỀN CHỨNG KHOÁN"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.addSubview(viewChungKhoan)
        viewChungKhoan.heightAnchor.constraint(equalToConstant: viewChungKhoan.frame.height).isActive = true
        stackView.setNeedsLayout()
        stackView.layoutIfNeeded()
        stackView.insertArrangedSubview(viewChungKhoan, at: 1)
        loadViewChungKhoan()
      
    }
    
    // MARK: Fetch ChungKhoan
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    func getSerCode(serCode: String) {
        self.serCode = serCode
        viewChungKhoan.txtMaKH.text = serCode
    }
    
    func getNameNhaCungCapChungKhoan(serName: String) {
        self.serName = serName
        viewChungKhoan.txtNCC.text = serName
    }
    
    func loadViewChungKhoan() {
        viewChungKhoan.lblThongtin.text = DataText.lblTitleHoaDon
        viewChungKhoan.btnNCC.addTarget(self, action: #selector(loadViewNhaCungCap), for: .touchUpInside)
        viewChungKhoan.btnMaKH.addTarget(self, action: #selector(loadViewMaKH), for: .touchUpInside)
        viewChungKhoan.lblMauLuu.text = DataText.lblLuuThongTin
    }
    
    private func loadViewTop(){
        viewTop.lblTKnguon.text = DataText.lblTKN
        viewTop.lblStk.text = account?.accountNo
        viewTop.lblSodu.text = DataText.lblsoDu
        viewTop.lblBalance.text = "\((account?.balance)!) \((account?.ccy)!)"
        viewTop.btnEye.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    
    // MARK: IBAction
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func loadViewNhaCungCap() {
        let popupVC = PopupChungKhoanNCCConfigurator.viewcontroller()
        popupVC.delegateChungKhoan = self
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.serName = serName
        view.window?.layer.add(AnimationDismiss.shared.animationPresent(), forKey: kCATransition)
        self.present(popupVC, animated: false, completion: nil)
        
    }
    
    @objc func loadViewMaKH() {
        let popupVC = PopupChungKhoanMKHConfigurator.viewcontroller()
        popupVC.delegateChungKhoan = self
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
extension ChungKhoanViewController: ChungKhoanPresentationLogic {
    
}
