//
//  ThongTinTaiKhoanViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 18/05/2022.
//

import UIKit
import SwiftyJSON

class ThongTinTaiKhoanViewController: UIViewController, DataDelegate {
    
    @IBOutlet weak var tableViewTT: UITableView!
    @IBOutlet weak var tableViewTK: UITableView!
    
    let myData = JSONData()
    var accountArr: [Account] = []
    var accountArrTT: [Account] = []
    var accountArrTK: [Account] = []
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = DataText.titleThongTinTK
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = .orange
        
        tableViewTT.delegate = self
        tableViewTT.dataSource = self
        tableViewTK.delegate = self
        tableViewTK.dataSource = self
        
        tableViewTT.rowHeight = 70
        tableViewTT.estimatedRowHeight = UITableView.automaticDimension
        
        tableViewTK.rowHeight = 70
        tableViewTK.estimatedRowHeight = UITableView.automaticDimension

        myData.delegateData = self
        myData.getDataJSON()
        myData.dataParseProcess()
        
        //register cell1
        let nib = UINib(nibName: "Cell", bundle: nil)
        self.tableViewTT.register(nib, forCellReuseIdentifier: "cell")
        
        //register HeaderTT
        let nibHeaderTT = UINib(nibName: "HeaderChiTiet", bundle: nil)
        self.tableViewTT.register(nibHeaderTT, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        let nibHeaderTK = UINib(nibName: "HeaderChiTiet", bundle: nil)
        self.tableViewTK.register(nibHeaderTK, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
    
    func getDataAccount(data: [Account]) {

        for item in data {
            self.accountArr.append(item)
        }
    }
    
    func dataProcess(accountArrTT: [Account], accountArrTK: [Account]) {
        for itemTT in accountArrTT {
            self.accountArrTT.append(itemTT)
        }
        
        for itemTK in accountArrTK {
            self.accountArrTK.append(itemTK)
        }
    }
    
    func getUsername(userName: String) {
        self.userName = userName
    }

}

extension ThongTinTaiKhoanViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewTT {
            return accountArrTT.count
        } else if tableView == tableViewTK {
            return accountArrTK.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableViewTT {
            let cell = tableViewTT.dequeueReusableCell(withIdentifier: "cell") as! Cell
            cell.lblStk.text = accountArrTT[indexPath.row].accountNo
            cell.lblAmount.text = "\(accountArrTT[indexPath.row].balance) \(accountArrTT[indexPath.row].ccy)"

            return cell
        } else if tableView == tableViewTK {

            let cell = tableViewTT.dequeueReusableCell(withIdentifier: "cell") as! Cell
            cell.lblStk.text = accountArrTK[indexPath.row].accountNo
            cell.lblAmount.text = "\(accountArrTK[indexPath.row].balance) \(accountArrTT[indexPath.row].ccy)"

            return cell
        }
        return UITableViewCell()
    
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 75
//    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if tableView == tableViewTT {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! HeaderChiTiet
            headerView.lblContent.text = DataHeaderTableView.accountTypeTT
            headerView.imgView.image = UIImage(named: DataHeaderTableView.imageWallet)
            headerView.contentView.backgroundColor = .white
            return headerView
            
        }
        else if tableView == tableViewTK {
            let headerView = tableViewTK.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! HeaderChiTiet
            headerView.contentView.backgroundColor = .white
            headerView.imgView.image = UIImage(named: DataHeaderTableView.imagePiggyBank)
            headerView.lblContent.text = DataHeaderTableView.accountTypeTK
            return headerView
        }
        
        return UIView()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewTT {
//            let chitietVC = ChiTietTKViewController()
            let chitietVC = ChiTietTKViewController(nibName: "ChiTietTKViewController", bundle: nil)
            chitietVC.account = accountArrTT[indexPath.row]
            chitietVC.userName = userName
            chitietVC.branch = accountArrTT[indexPath.row].branch
            self.navigationController?.pushViewController(chitietVC, animated: true)
        } else if tableView == tableViewTK {
            let chitietTienGuiVC = ChiTietTienGuiViewController(nibName: "ChiTietTienGuiViewController", bundle: nil)
            chitietTienGuiVC.account = accountArrTK[indexPath.row]
            chitietTienGuiVC.userName = userName
            chitietTienGuiVC.branch = accountArrTK[indexPath.row].branch
            chitietTienGuiVC.ccy = accountArrTK[indexPath.row].ccy
            chitietTienGuiVC.openDate = accountArrTK[indexPath.row].openDate
            chitietTienGuiVC.expireDate = accountArrTK[indexPath.row].expireDate
            chitietTienGuiVC.term = accountArrTK[indexPath.row].term
            chitietTienGuiVC.termType = accountArrTK[indexPath.row].termType
            self.navigationController?.pushViewController(chitietTienGuiVC, animated: true)
        }
    }
    

}


