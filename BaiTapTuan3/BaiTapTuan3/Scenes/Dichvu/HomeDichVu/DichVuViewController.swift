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
    func showListCellBill(listCellBill: [BillPayment])
}

// MARK: View
final class DichVuViewController: UIViewController {
    
    var interactor: DichVuInteractorLogic!
    var router: DichVuRoutingLogic!

    // MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    var listBill: [BillPayment]?
    var account: AccountObj?
//    let myData = JSONData()
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        title = "THANH TOÁN HOÁ ĐƠN"
//        myData.getDataListBill()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
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
    func showListCellBill(listCellBill: [BillPayment]) {
        listBill = listCellBill
    }
    
}

extension DichVuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listBill!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DichVuCollectionViewCell
        let temp = listBill![indexPath.row]
        cell.setupData(temp)
        return cell
    }
}

extension DichVuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellRow = listBill![indexPath.row]
        switch cellRow.id {
        case "1" :
            let chungKhoanVC = ChungKhoanConfigurator.viewcontroller()
            chungKhoanVC.account = account
            self.navigationController?.pushViewController(chungKhoanVC, animated: true)
        case "2" :
            let cuocDienVC = HoaDonDienConfigurator.viewcontroller()
            cuocDienVC.account = account
            self.navigationController?.pushViewController(cuocDienVC, animated: true)
        case "7" :
            let cuocThVC = CuocTruyenHinhConfigurator.viewcontroller()
            cuocThVC.account = account
            self.navigationController?.pushViewController(cuocThVC, animated: true)
        case "11" :
            let cuocGiaoThongVC = HoaDonGiaoThongConfigurator.viewcontroller()
            cuocGiaoThongVC.account = account
            self.navigationController?.pushViewController(cuocGiaoThongVC, animated: true)
        case "16":
            let billVC = BillType5Configurator.viewcontroller()
            billVC.account = account
            billVC.billPayment = cellRow
            self.navigationController?.pushViewController(billVC, animated: true)
        default:
            break
        }
        
    }
}

extension DichVuViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print(collectionView.frame.size.width)
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
