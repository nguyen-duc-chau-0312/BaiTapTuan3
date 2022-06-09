//
//  PopupChungKhoanMKHViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupChungKhoanMKHPresentationLogic: AnyObject {
    func showListCellChungKhoan(listCellKH: [ChungKhoanService])
}

protocol PopupMaKhachHangChungKhoanImpl{
    func getSerCode(serCode: String)
}

// MARK: View
final class PopupChungKhoanMKHViewController: UIViewController {
    var interactor: PopupChungKhoanMKHInteractorLogic!
    var router: PopupChungKhoanMKHRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var delegateChungKhoan: PopupMaKhachHangChungKhoanImpl?
    var listChungKhoan: [ChungKhoanService] = []
    var tempListChungKhoan: [ChungKhoanService] = []
    var serCode = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
        tempListChungKhoan = listChungKhoan
        lblTitle.text = "Mã khách hàng"
    }
    
    // MARK: Fetch PopupChungKhoanMKH
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataListMaKhangHang(data: "Data JSON")
    }
    
    // MARK: SetupUI
    private func setupView() {
        let nib = UINib(nibName: "CellPopupTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CellPopupTableViewCell.identifer)
    }
    
    // MARK: IBAction
    @IBAction func cancelPressed(_ sender: UIButton) {
        view.window?.layer.add(AnimationDismiss.shared.animationPresent(), forKey: kCATransition)
        self.dismiss(animated: false, completion: nil)
    }
}

// MARK: Connect View, Interactor, and Presenter
extension PopupChungKhoanMKHViewController: PopupChungKhoanMKHPresentationLogic {
    func showListCellChungKhoan(listCellKH: [ChungKhoanService]) {
        self.listChungKhoan = listCellKH
    }
    
}

extension PopupChungKhoanMKHViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let serCode = listChungKhoan[indexPath.row].serCode
        delegateChungKhoan?.getSerCode(serCode: serCode)
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupChungKhoanMKHViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listChungKhoan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellPopupTableViewCell.identifer, for: indexPath) as! CellPopupTableViewCell
        cell.lblText.text = listChungKhoan[indexPath.row].serCode
        if serCode == listChungKhoan[indexPath.row].serCode {
            cell.btnCheckbox.setImage(UIImage(named:"correct"), for: .normal)
        } else {
            cell.btnCheckbox.setImage(UIImage(named:"checkbox"), for: .normal)
        }
        return cell
    }
}

extension PopupChungKhoanMKHViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            listChungKhoan = tempListChungKhoan.filter{ $0.serCode.contains(searchText) }
            tableView.reloadData()
        } else {
            listChungKhoan = tempListChungKhoan
            tableView.reloadData()
        }
    }
}
