//
//  PopupDistrictViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupDistrictPresentationLogic: AnyObject {
    func showListCellDistrict(listCellDistrict: [DistrictObj])
}

protocol PopupDistrictBuildingImpl {
    func getDistrictName(data: String)
}

// MARK: View
final class PopupDistrictViewController: UIViewController {
    var interactor: PopupDistrictInteractorLogic!
    var router: PopupDistrictRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var listDistrict: [DistrictObj] = []
    var tempListDistrict: [DistrictObj] = []
    var delegateDistrict: PopupDistrictBuildingImpl?
    var districtName = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
        tempListDistrict = listDistrict
        lblTitle.text = "Quận/Huyện"
    }
    
    // MARK: Fetch PopupDistrict
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataListDistrict(data: "Du lieu JSON")
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        let nib = UINib(nibName: "CellPopupTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CellPopupTableViewCell.identifer)
    }
    
    // MARK: IBAction
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.view.window!.layer.add(AnimationDismiss.share.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

// MARK: Connect View, Interactor, and Presenter
extension PopupDistrictViewController: PopupDistrictPresentationLogic {
    func showListCellDistrict(listCellDistrict: [DistrictObj]) {
        listDistrict = listCellDistrict
    }
}

extension PopupDistrictViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let districtName = listDistrict[indexPath.row].districtName
        delegateDistrict?.getDistrictName(data: districtName)
        self.view.window!.layer.add(AnimationDismiss.share.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupDistrictViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDistrict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellPopupTableViewCell.identifer, for: indexPath) as! CellPopupTableViewCell
        cell.lblText.text = listDistrict[indexPath.row].districtName
        
        if districtName == listDistrict[indexPath.row].districtName {
            cell.btnCheckbox.setImage(UIImage(named:"correct"), for: .normal)
        } else {
            cell.btnCheckbox.setImage(UIImage(named:"checkbox"), for: .normal)
        }
        return cell
    }
}

extension PopupDistrictViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            listDistrict = tempListDistrict.filter{ $0.districtName.contains(searchText) }
            tableView.reloadData()
        } else {
            listDistrict = tempListDistrict
            tableView.reloadData()
        }
    }
}
