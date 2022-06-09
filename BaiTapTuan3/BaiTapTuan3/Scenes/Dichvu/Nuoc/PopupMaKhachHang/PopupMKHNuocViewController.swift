//
//  PopupMKHNuocViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupMKHNuocPresentationLogic: AnyObject {
    func showListCellNuoc(listCellKH: [ServiceNuocObj])
}

protocol PopupMaKhachHangNuocImpl{
    func getSerCode(serCode: String)
}

// MARK: View
final class PopupMKHNuocViewController: UIViewController {
    var interactor: PopupMKHNuocInteractorLogic!
    var router: PopupMKHNuocRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var delegateNuoc: PopupMaKhachHangNuocImpl?
    var listMaKH: [ServiceNuocObj] = []
    var tempListMaKH: [ServiceNuocObj] = []
    var serCode = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
        tempListMaKH = listMaKH
        lblTitle.text = "Mã khách hàng"
    }
    
    // MARK: Fetch PopupMKHNuoc
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataListMaKhangHangNuoc(data: "Data JSON")
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
extension PopupMKHNuocViewController: PopupMKHNuocPresentationLogic {
    func showListCellNuoc(listCellKH: [ServiceNuocObj]) {
        listMaKH = listCellKH
    }
}

extension PopupMKHNuocViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let serCode = listMaKH[indexPath.row].serCode
        delegateNuoc?.getSerCode(serCode: serCode)
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupMKHNuocViewController: UITableViewDataSource {
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

extension PopupMKHNuocViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            listMaKH = tempListMaKH.filter{ $0.serCode.contains(searchText) }
            tableView.reloadData()
        } else {
            listMaKH = tempListMaKH
            tableView.reloadData()
        }
    }
}
