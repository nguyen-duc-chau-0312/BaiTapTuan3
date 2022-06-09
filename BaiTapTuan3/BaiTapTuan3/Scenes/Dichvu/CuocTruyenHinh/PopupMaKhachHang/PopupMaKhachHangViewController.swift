//
//  PopupMaKhachHangViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupMaKhachHangPresentationLogic: AnyObject {
    func showListCellTruyenHinh(listCellKH: [ServiceTruyenHinhObj])
}

protocol PopupMaKhachHangImpl{
    func getSerCode(serCode: String)
}

// MARK: View
final class PopupMaKhachHangViewController: UIViewController {
    var interactor: PopupMaKhachHangInteractorLogic!
    var router: PopupMaKhachHangRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var delegateKH: PopupMaKhachHangImpl?
    var listMaKH: [ServiceTruyenHinhObj] = []
    var tempListMaKH: [ServiceTruyenHinhObj] = []
    var serCode = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
        lblTitle.text = "Mã khách hàng"
        tempListMaKH = listMaKH
    }
    
    // MARK: Fetch PopupMaKhachHang
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataListMaKhangHang(data: "Du lieu JSON")
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        let nib = UINib(nibName: "CellPopupTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CellPopupTableViewCell.identifer)
    }
    
    // MARK: IBAction
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

// MARK: Connect View, Interactor, and Presenter
extension PopupMaKhachHangViewController: PopupMaKhachHangPresentationLogic {
    func showListCellTruyenHinh(listCellKH: [ServiceTruyenHinhObj]) {
        listMaKH = listCellKH
    }
    
}

extension PopupMaKhachHangViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let serCode = listMaKH[indexPath.row].serCode
        delegateKH?.getSerCode(serCode: serCode)
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupMaKhachHangViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMaKH.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellPopupTableViewCell.identifer, for: indexPath) as! CellPopupTableViewCell
        cell.lblText.text = listMaKH[indexPath.row].serCode
        if serCode == listMaKH[indexPath.row].serCode {
            cell.btnCheckbox.setImage(UIImage(named:"correct"), for: .normal)
        } else {
            cell.btnCheckbox.setImage(UIImage(named:"checkbox"), for: .normal)
        }
        return cell
    }
}

extension PopupMaKhachHangViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            tempListMaKH = listMaKH.filter{ $0.serCode.contains(searchText)}
            tableView.reloadData()
        } else {
            tempListMaKH = listMaKH
            tableView.reloadData()
        }
    }
}
