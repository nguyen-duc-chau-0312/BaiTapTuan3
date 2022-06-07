//
//  PoupCityBuildingViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PoupCityBuildingPresentationLogic: AnyObject {
    func showListCellCity(listCellBill: [CityObj])
}

protocol PopupCityBuildingImpl {
    func getCityName(data: String)
}

// MARK: View
final class PoupCityBuildingViewController: UIViewController {
    var interactor: PoupCityBuildingInteractorLogic!
    var router: PoupCityBuildingRoutingLogic!
    var delegatePopup: PopupCityBuildingImpl?
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UIView!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var listCity: [CityObj]?
    var tempListCity: [CityObj] = []
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
        tempListCity = listCity!
    }
    
    // MARK: Fetch PoupCityBuilding
    private func fetchDataOnLoad() {
        interactor.fetchDataListCity(data: "Data City")
    }
    
    // MARK: SetupUI
    private func setupView() {
        let nib = UINib(nibName: "CellPopupTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    // MARK: IBAction
    @IBAction func CancelPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: Connect View, Interactor, and Presenter
extension PoupCityBuildingViewController: PoupCityBuildingPresentationLogic {
    func showListCellCity(listCellBill: [CityObj]) {
        self.listCity = listCellBill
    }
    
}

extension PoupCityBuildingViewController: UITableViewDelegate {
    
}

extension PoupCityBuildingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listCity!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellPopupTableViewCell
        cell.lblText.text = listCity![indexPath.row].cityName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = listCity![indexPath.row].cityName
        delegatePopup?.getCityName(data: cityName)
        self.dismiss(animated: true, completion: nil)
    }
}

extension PoupCityBuildingViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            listCity = tempListCity.filter{ $0.cityName.contains(searchText)}
            tableView.reloadData()
            
        } else {
            print("Khong co gi de tim kiem")
            listCity = tempListCity
            tableView.reloadData()
        }
    }
}
