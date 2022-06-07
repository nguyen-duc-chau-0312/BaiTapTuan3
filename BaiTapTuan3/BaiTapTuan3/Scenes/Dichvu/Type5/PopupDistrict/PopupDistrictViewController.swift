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

// MARK: View
final class PopupDistrictViewController: UIViewController {
    var interactor: PopupDistrictInteractorLogic!
    var router: PopupDistrictRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var mySearchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        tableView.delegate = self
        tableView.dataSource = self
        mySearchText.delegate = self
    }
    
    // MARK: Fetch PopupDistrict
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
    @IBAction func cancelPressed(_ sender: UIButton) {
        
    }
}

// MARK: Connect View, Interactor, and Presenter
extension PopupDistrictViewController: PopupDistrictPresentationLogic {
    
}

extension PopupDistrictViewController: UITableViewDelegate {
    
}

extension PopupDistrictViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension PopupDistrictViewController: UISearchBarDelegate {
    
}
