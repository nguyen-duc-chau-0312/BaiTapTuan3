//
//  ChiTietTKViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 19/05/2022.
//

import UIKit

class ChiTietTKViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    //refactor tương tự tk tiền gửi
    
    var account: AccountObj?
    var userName = ""
    var dictAccount = [CellDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TÀI KHOẢN THANH TOÁN"
        
        dictAccount = [
            CellDataModel(title: account!.accountNo, label: "Số dư: \((account?.balance)!) \((account?.ccy)!)"),
            CellDataModel(title: "Chủ tài khoản", label: userName),
            CellDataModel(title: "Chi nhánh mở", label: account?.branch ?? "")
        ]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //register cell2
        let nib2 = UINib(nibName: "Cell2", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "cell2")
        
        //register HeaderTT
        let nibHeader = UINib(nibName: "HeaderChiTiet", bundle: nil)
        self.tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(addTapped))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    @objc func addTapped() {
        let dichvuVC = DichVuConfigurator.viewcontroller()
        dichvuVC.account = account
        self.navigationController?.pushViewController(dichvuVC, animated: true)
    }
    
}

extension ChiTietTKViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictAccount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
