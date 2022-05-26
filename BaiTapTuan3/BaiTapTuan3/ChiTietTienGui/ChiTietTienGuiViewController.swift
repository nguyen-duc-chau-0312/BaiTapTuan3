//
//  ChiTietTienGuiViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 23/05/2022.
//

import UIKit

class ChiTietTienGuiViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
//    refactor code lại: ko tạo nhiều biến thế này
//    Cách 1: tạo 1 dictionary data:[String:String] = ["chủ tài khoản": account.userName,
//                                                     "số dư": account.balance,
//                                                        ...
//                                                    ]
//    Cách 2: tạo obj cellDataModel
//    parse properties của account sang cellDataModel
//    ...
//    xem thêm bên file MyData
    
    var account: Account?
    var userName = ""
    var branch = ""
    var ccy = ""
    var openDate = ""
    var expireDate = ""
    var term = ""
    var termType = ""
    
    
     data["title":DataLabelCell.text , "label":account.property]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TÀI KHOẢN TIỀN GỬI"

        tableView.delegate = self
        tableView.dataSource = self
        
        //register cell1
        let nib = UINib(nibName: "Cell3", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell3")
        
        //register cell2
        let nib2 = UINib(nibName: "Cell2", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "cell2")
        
        //register HeaderTT
        let nibHeader = UINib(nibName: "HeaderChiTiet", bundle: nil)
        self.tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
    }

}

extension ChiTietTienGuiViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //để data động
        //nếu dùng c1 return dict.allKeys.count
        //nếu dùng c2 return cells.count
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //refactor code: ko check theo index, data là dynamic
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! Cell3
            if let accountNo = account?.accountNo {
                cell.lblStk.text = accountNo
            }
            if let balance = account?.balance, let ccy = account?.ccy {
                cell.lblAmount.text = "\(balance) \(ccy)"
            }
            
            return cell
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            cell.lblTop.text = DataLabelCell.chuTaiKhoan
            cell.lblBottom.text = userName
            return cell
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            cell.lblTop.text = DataLabelCell.chiNhanhMo
            cell.lblBottom.text = branch
            return cell
        } else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            cell.lblTop.text = DataLabelCell.ccy
            cell.lblBottom.text = ccy
            return cell
        } else if indexPath.row == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            cell.lblTop.text = DataLabelCell.openDate
            cell.lblBottom.text = openDate
            return cell
        } else if indexPath.row == 5 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            cell.lblTop.text = DataLabelCell.expireDate
            cell.lblBottom.text = expireDate
            return cell
        } else if indexPath.row == 6 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            cell.lblTop.text = DataLabelCell.term
            cell.lblBottom.text = term
            return cell
        } else if indexPath.row == 7 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            cell.lblTop.text = DataLabelCell.termType
            cell.lblBottom.text = termType
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! HeaderChiTiet
        headerView.lblContent.text = DataHeaderTableView.accountTypeTT
        headerView.imgView.image = UIImage(named: DataHeaderTableView.imageWallet)
        headerView.contentView.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}
