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
    var accountArr: [Acount] = []
    var accountArrTT: [Acount] = []
    var accountArrTK: [Acount] = []
    var accountType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "THÔNG TIN TÀI KHOẢN"
        self.navigationController?.navigationBar.barTintColor = .orange
        
        tableViewTT.delegate = self
        tableViewTT.dataSource = self
        tableViewTK.delegate = self
        tableViewTK.dataSource = self
        
        myData.delegateData = self
        myData.getDataJSON()
        myData.dataParseProcess()
        myData.getData(data: accountType)
        
        //register cell1
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        self.tableViewTT.register(nib, forCellReuseIdentifier: "cell")
        
        //register HeaderTT
        let nibHeaderTT = UINib(nibName: "HeaderChiTiet", bundle: nil)
        self.tableViewTT.register(nibHeaderTT, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        let nibHeaderTK = UINib(nibName: "HeaderChiTiet", bundle: nil)
        self.tableViewTK.register(nibHeaderTK, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
    }
    
    func getDataAccount(data: [Acount]) {

        for item in data {
            self.accountArr.append(item)
        }
    }
    
    func dataProcess(accountArrTT: [Acount], accountArrTK: [Acount]) {
        for itemTT in accountArrTT {
            self.accountArrTT.append(itemTT)
        }
        
        for itemTK in accountArrTK {
            self.accountArrTK.append(itemTK)
        }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
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
            
            self.navigationController?.pushViewController(ChiTietTKViewController(nibName: "ChiTietTKViewController", bundle: nil), animated: true)
        }
    }

}
