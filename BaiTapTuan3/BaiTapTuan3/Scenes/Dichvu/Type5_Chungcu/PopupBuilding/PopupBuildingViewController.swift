//
//  PopupBuildingViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupBuildingPresentationLogic: AnyObject {
    func showListCellDistrict(listCellDistrict: [BuildingObj])
}

protocol PopupBuildingImpl {
    func getbuildingName(buildingName: String)
}

// MARK: View
final class PopupBuildingViewController: UIViewController {
    var interactor: PopupBuildingInteractorLogic!
    var router: PopupBuildingRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var listBuilding: [BuildingObj] = []
    var tempListBuilding: [BuildingObj] = []
    var delegateBuilding: PopupBuildingImpl?
    var buildingName = ""
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
        tempListBuilding = listBuilding
        lblTitle.text = "Toà nhà"
        
    }
    
    // MARK: Fetch PopupBuilding
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataListBuilding(data: "Du lieu JSON")
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
extension PopupBuildingViewController: PopupBuildingPresentationLogic {
    func showListCellDistrict(listCellDistrict: [BuildingObj]) {
        self.listBuilding = listCellDistrict
    }
    
    
}

extension PopupBuildingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let buildingName = listBuilding[indexPath.row].buildingName
        delegateBuilding?.getbuildingName(buildingName: buildingName)
        self.view.window!.layer.add(AnimationDismiss.share.animationDismiss(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupBuildingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listBuilding.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellPopupTableViewCell.identifer, for: indexPath) as! CellPopupTableViewCell
        cell.lblText.text = listBuilding[indexPath.row].buildingName
        
        if buildingName == listBuilding[indexPath.row].buildingName {
            cell.btnCheckbox.setImage(UIImage(named:"correct"), for: .normal)
        } else {
            cell.btnCheckbox.setImage(UIImage(named:"checkbox"), for: .normal)
        }
        return cell
    }
}

extension PopupBuildingViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            listBuilding = tempListBuilding.filter{ $0.buildingName.contains(searchText) }
            tableView.reloadData()
        } else {
            listBuilding = tempListBuilding
            tableView.reloadData()
        }
    }
}
