//
//  HoaDonGiaoThongViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol HoaDonGiaoThongPresentationLogic: AnyObject {
    
}

// MARK: View
final class HoaDonGiaoThongViewController: UIViewController {
    var interactor: HoaDonGiaoThongInteractorLogic!
    var router: HoaDonGiaoThongRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var viewTop: ViewTop!
    @IBOutlet weak var stackView: UIStackView!
    let viewGiaoThong = ViewGiaoThong()
    var account: AccountObj?
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        title = "NẠP TIỀN TÀI KHOẢN VETC"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.addSubview(viewGiaoThong)
        viewGiaoThong.heightAnchor.constraint(equalToConstant: viewGiaoThong.frame.height).isActive = true
        stackView.setNeedsLayout()
        stackView.layoutIfNeeded()
        stackView.insertArrangedSubview(viewGiaoThong, at: 1)
        loadViewGiaoThong()
      
    }
    
    // MARK: Fetch HoaDonGiaoThong
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    func loadViewGiaoThong() {
        viewGiaoThong.lblThongTin.text = DataText.lblThongTinDV
        viewGiaoThong.btnBienSo.addTarget(self, action: #selector(loadViewBienSo), for: .touchUpInside)

        viewGiaoThong.lblLuuMau.text = DataText.lblMauNap
    }
    
    // MARK: IBAction
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func loadViewBienSo() {
        
    }
}

// MARK: Connect View, Interactor, and Presenter
extension HoaDonGiaoThongViewController: HoaDonGiaoThongPresentationLogic {
    
}
