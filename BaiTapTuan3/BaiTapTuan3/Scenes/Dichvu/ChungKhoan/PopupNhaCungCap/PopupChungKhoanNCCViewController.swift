//
//  PopupChungKhoanNCCViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupChungKhoanNCCPresentationLogic: AnyObject {
    func showListCellChungKhoan(listCellNhaCungCap: [ChungKhoanService])
}

protocol PopupNhaCungCapChungKhoanImpl {
    func getNameNhaCungCapChungKhoan(serName: String)
}

// MARK: View
final class PopupChungKhoanNCCViewController: UIViewController {
    var interactor: PopupChungKhoanNCCInteractorLogic!
    var router: PopupChungKhoanNCCRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var delegateChungKhoan: PopupNhaCungCapChungKhoanImpl?
    var listChungKhoan: [ChungKhoanService] = []
    var tempListChungKhoan: [ChungKhoanService] = []
    var serName = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
        lblTitle.text = "Nhà cung cấp"
        tempListChungKhoan = listChungKhoan
    }
    
    // MARK: Fetch PopupChungKhoanNCC
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataListNhaCungCapChungKhoan(data: "Du Lieu JSON")
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
extension PopupChungKhoanNCCViewController: PopupChungKhoanNCCPresentationLogic {
    func showListCellChungKhoan(listCellNhaCungCap: [ChungKhoanService]) {
        self.listChungKhoan = listCellNhaCungCap
    }
    
}

extension PopupChungKhoanNCCViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameNCC = listChungKhoan[indexPath.row].serName
        delegateChungKhoan?.getNameNhaCungCapChungKhoan(serName: nameNCC)
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupChungKhoanNCCViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listChungKhoan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellPopupTableViewCell.identifer, for: indexPath) as! CellPopupTableViewCell
        cell.lblText.text = listChungKhoan[indexPath.row].serName
        if serName == listChungKhoan[indexPath.row].serName {
            cell.btnCheckbox.setImage(UIImage(named:"correct"), for: .normal)
        } else {
            cell.btnCheckbox.setImage(UIImage(named:"checkbox"), for: .normal)
        }
        return cell
    }
}

extension PopupChungKhoanNCCViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            listChungKhoan = tempListChungKhoan.filter{ $0.serName.contains(searchText) }
            tableView.reloadData()
        } else {
            listChungKhoan = tempListChungKhoan
            tableView.reloadData()
        }
    }
}
