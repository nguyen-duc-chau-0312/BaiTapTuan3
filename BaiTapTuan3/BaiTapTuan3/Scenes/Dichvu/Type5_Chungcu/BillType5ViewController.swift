//
//  BillType5ViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol BillType5PresentationLogic: AnyObject {
    
}

// MARK: View
final class BillType5ViewController: UIViewController, PopupCityBuildingImpl, PopupDistrictBuildingImpl, PopupBuildingImpl {
 
    var interactor: BillType5InteractorLogic!
    var router: BillType5RoutingLogic!
    
    
    // MARK: IBOutlet
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var viewTop: ViewTop!
    var iconClick = true
    var account: AccountObj?
    var billPayment: BillPayment?
    let viewType5 = ViewType5()
    var cityName = ""
    var districtName = ""
    var buildingName = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HÓA ĐƠN PHÍ CHUNG CƯ"
        setupView()
        fetchDataOnLoad()
        loadViewTop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addSubview(viewType5)
        viewType5.heightAnchor.constraint(equalToConstant: viewType5.frame.height).isActive = true
        stackView.setNeedsLayout()
        stackView.layoutIfNeeded()
        stackView.insertArrangedSubview(viewType5, at: 1)
        loadViewType5()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.addSubview(viewType5)
        viewType5.heightAnchor.constraint(equalToConstant: viewType5.frame.height).isActive = true
        stackView.setNeedsLayout()
        stackView.layoutIfNeeded()
        stackView.insertArrangedSubview(viewType5, at: 1)
    }
    
    // MARK: Fetch BillType5
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    func getCityName(data: String) {
        cityName = data
        viewType5.txtCity.text = data
    }
    
    func getDistrictName(data: String) {
        districtName = data
        viewType5.txtDistrict.text = data
    }
    
    func getbuildingName(buildingName: String) {
        self.buildingName = buildingName
        viewType5.txtBuilding.text = buildingName
    }
    
    func loadViewType5() {
        viewType5.lblTitleHoaDon.text = DataText.lblTitleHoaDon
//        viewType5.txtCity.text = cityName
        viewType5.btnCity.addTarget(self, action: #selector(loadViewCity), for: .touchUpInside)
        viewType5.txtDistrict.text = districtName
        viewType5.btnDistrict.addTarget(self, action: #selector(loadViewDistrict), for: .touchUpInside)
        viewType5.txtBuilding.text = buildingName
        viewType5.btnBuilding.addTarget(self, action: #selector(loadViewBuilding), for: .touchUpInside)
        viewType5.lblThongtinHoaDon.text = DataText.lblLuuThongTin
    }
    
    //Chuyen man su dung cau lenh navigationcontroller.presentview
    
    private func loadViewTop(){
        viewTop.lblTKnguon.text = DataText.lblTKN
        viewTop.lblStk.text = account?.accountNo
        viewTop.lblSodu.text = DataText.lblsoDu
        viewTop.lblBalance.text = "\((account?.balance)!) \((account?.ccy)!)"
        viewTop.btnEye.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    
    // MARK: IBAction
    
    @objc func loadViewCity() {
        
        let popupVC = PoupCityBuildingConfigurator.viewcontroller()
        popupVC.delegatePopup = self
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.cityName = cityName
        view.window?.layer.add(AnimationDismiss.share.animationPresent(), forKey: kCATransition)
        self.present(popupVC, animated: false, completion: nil)
        
    }
    
    @objc func loadViewBuilding() {
        let popupVC = PopupBuildingConfigurator.viewcontroller()
        popupVC.delegateBuilding = self
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.buildingName = buildingName
        view.window?.layer.add(AnimationDismiss.share.animationPresent(), forKey: kCATransition)
        self.present(popupVC, animated: false, completion: nil)
    }
    
    @objc func loadViewDistrict() {
        let popupVC = PopupDistrictConfigurator.viewcontroller()
        popupVC.delegateDistrict = self
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.districtName = districtName
        view.window?.layer.add(AnimationDismiss.share.animationPresent(), forKey: kCATransition)
        self.present(popupVC, animated: false, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.view.window!.layer.add(AnimationDismiss.share.animationDismiss(), forKey: nil)
        self.navigationController?.popViewController(animated: false)
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
extension BillType5ViewController: BillType5PresentationLogic {
    
}
