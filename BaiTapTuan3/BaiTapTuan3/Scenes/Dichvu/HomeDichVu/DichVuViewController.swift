//
//  DichVuViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 03/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol DichVuPresentationLogic: class {
    func showListCellBill(listCellBill: [CellBill])
}

// MARK: View
final class DichVuViewController: UIViewController {
    
    var interactor: DichVuInteractorLogic!
    var router: DichVuRoutingLogic!

    // MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    var listBill: [BillPayment]?
    var account: AccountObj?
    var listCell: [CellBill] = []
    let myData = JSONData()
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        myData.getDataListBill()
    }
    
    // MARK: Fetch DichVu
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchDataListBill(data: "")
    }
    
    // MARK: SetupUI
    private func setupView() {
        let nib = UINib(nibName: "DichVuCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension DichVuViewController: DichVuPresentationLogic {
    func showListCellBill(listCellBill: [CellBill]) {
        listCell = listCellBill
    }
    
}

extension DichVuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DichVuCollectionViewCell
//        cell.lblContent.text = listCell.label
//        cell.imgView.image = UIImage(named: listCell.img)
        let temp = listCell[indexPath.row]
        cell.setupData(temp)
        return cell
    }
}

extension DichVuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellRow = listCell[indexPath.row]
        if cellRow.type == "0" {
            let billVC = BillViewController(nibName: "BillViewController", bundle: nil)
            billVC.account = account
            self.navigationController?.pushViewController(billVC, animated: true)
        }
        print(listCell)
        print(indexPath.row)
    }
}

extension DichVuViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.frame.size.width)
        let screenWidth = UIScreen.main.bounds.width - 60
        return CGSize(width: screenWidth/3, height: (screenWidth/3)*1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
