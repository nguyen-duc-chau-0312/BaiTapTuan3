//
//  PopupNhaCungCapViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupNhaCungCapPresentationLogic: AnyObject {
    func showListCellCity(listCellNhaCungCap: [ServiceTruyenHinhObj])
}

protocol PopupNhaCungCapImpl {
    func getNameNhaCungCap(serName: String)
}

// MARK: View
final class PopupNhaCungCapViewController: UIViewController {
    var interactor: PopupNhaCungCapInteractorLogic!
    var router: PopupNhaCungCapRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var delegateNhaCungCap: PopupNhaCungCapImpl?
    var listNCC: [ServiceTruyenHinhObj] = []
    var tempListNCC: [ServiceTruyenHinhObj] = []
    var name = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
        tempListNCC = listNCC
        lblTitle.text = "Nhà cung cấp dịch vụ"
    }
    
    // MARK: Fetch PopupNhaCungCap
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataNhaCungCap(data: "Du lieu JSON")
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
extension PopupNhaCungCapViewController: PopupNhaCungCapPresentationLogic {
    func showListCellCity(listCellNhaCungCap: [ServiceTruyenHinhObj]) {
        listNCC = listCellNhaCungCap
    }
    
}

extension PopupNhaCungCapViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameNCC = listNCC[indexPath.row].serName
        delegateNhaCungCap?.getNameNhaCungCap(serName: nameNCC)
        self.view.window!.layer.add(AnimationDismiss.shared.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupNhaCungCapViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listNCC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellPopupTableViewCell.identifer, for: indexPath) as! CellPopupTableViewCell
        cell.lblText.text = listNCC[indexPath.row].serName
        if name == listNCC[indexPath.row].serName {
            cell.btnCheckbox.setImage(UIImage(named:"correct"), for: .normal)
        } else {
            cell.btnCheckbox.setImage(UIImage(named:"checkbox"), for: .normal)
        }
        return cell
    }
}

extension PopupNhaCungCapViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            listNCC = tempListNCC.filter{ $0.serName.contains(searchText)}
            tableView.reloadData()
            
        } else {
            print("Khong co gi de tim kiem")
            listNCC = tempListNCC
            tableView.reloadData()
        }
    }
}


