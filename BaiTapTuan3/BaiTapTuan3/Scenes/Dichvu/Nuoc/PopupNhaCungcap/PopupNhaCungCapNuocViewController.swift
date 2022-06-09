//
//  PopupNhaCungCapNuocViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupNhaCungCapNuocPresentationLogic: AnyObject {
    func showListCellNuoc(listCellNhaCungCap: [ServiceNuocObj])
}

protocol PopupNhaCungCapNuocImpl {
    func getNameNhaCungCapNuoc(serName: String)
}

// MARK: View
final class PopupNhaCungCapNuocViewController: UIViewController {
    var interactor: PopupNhaCungCapNuocInteractorLogic!
    var router: PopupNhaCungCapNuocRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var delegateNhaCungCapNuoc: PopupNhaCungCapNuocImpl?
    var listNCC: [ServiceNuocObj] = []
    var tempListNCC: [ServiceNuocObj] = []
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
        tempListNCC = listNCC
    }
    
    // MARK: Fetch PopupNhaCungCapNuoc
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataListNhaCungCapNuoc(data: "Data JSON")
        
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
extension PopupNhaCungCapNuocViewController: PopupNhaCungCapNuocPresentationLogic {
    func showListCellNuoc(listCellNhaCungCap: [ServiceNuocObj]) {
        listNCC = listCellNhaCungCap
    }
}

extension PopupNhaCungCapNuocViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameNCC = listNCC[indexPath.row].serName
        delegateNhaCungCapNuoc?.getNameNhaCungCapNuoc(serName: nameNCC)
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupNhaCungCapNuocViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNCC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellPopupTableViewCell.identifer, for: indexPath) as! CellPopupTableViewCell
            cell.lblText.text = listNCC[indexPath.row].serName
            if serName == listNCC[indexPath.row].serName {
                cell.btnCheckbox.setImage(UIImage(named:"correct"), for: .normal)
            } else {
                cell.btnCheckbox.setImage(UIImage(named:"checkbox"), for: .normal)
            }
            return cell
    }
}

extension PopupNhaCungCapNuocViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            listNCC = tempListNCC.filter{ $0.serName.contains(searchText) }
            tableView.reloadData()
        } else {
            listNCC = tempListNCC
            tableView.reloadData()
        }
    }
}
