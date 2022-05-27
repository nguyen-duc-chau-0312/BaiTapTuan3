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
    
    //    var dicObj = ["account": AccountObj?, "userName": "", branch: "", ccy: "", openDate: "", expireDate: "", term: "", termType: "" ]
    
    var account: AccountObj?
    var userName = ""
    var dictAccount = [CellDataModel]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "TÀI KHOẢN TIỀN GỬI"
        dictAccount = [
            CellDataModel(title: account!.accountNo, label: "Số dư: \((account?.balance)!) \((account?.ccy)!)"),
            CellDataModel(title: "Chủ tài khoản", label: userName),
            CellDataModel(title: "Chi nhánh mở", label: account?.branch ?? ""),
            CellDataModel(title: "Loại tiền", label: account?.ccy ?? ""),
            CellDataModel(title: "Ngày mở", label: account?.openDate ?? ""),
            CellDataModel(title: "Ngày đến hạn", label: account?.expireDate ?? ""),
            CellDataModel(title: "Kỳ hạn", label: account?.term ?? ""),
            CellDataModel(title: "Loại kỳ hạn", label: account?.termType ?? "")
        ]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //register cell2
        let nib2 = UINib(nibName: "Cell2", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "cell2")
        
        //register HeaderTT
        let nibHeader = UINib(nibName: "HeaderChiTiet", bundle: nil)
        self.tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Nạp thẻ", style: .plain, target: self, action: #selector(addTapped))
        
    }
    
    @objc func addTapped() {
        let manHinhVC = ManHinhChinhViewController(nibName: "ManHinhChinhViewController", bundle: nil)
        manHinhVC.account = account
        self.navigationController?.pushViewController(manHinhVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
}

extension ChiTietTienGuiViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //để data động
        //nếu dùng c1 return dict.allKeys.count
        //nếu dùng c2 return cells.count
        return dictAccount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //refactor code: ko check theo index, data là dynamic
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
        cell.lblTop?.text = dictAccount[indexPath.row].title
        if indexPath.row == 0 {
            cell.lblTop.textColor = .orange
            
        }
        cell.lblBottom.text = dictAccount[indexPath.row].label
        
        return cell
        
        
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
