//
//  ChiTietTKViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 19/05/2022.
//

import UIKit

class ChiTietTKViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var account: Account?
    var userName: String = ""
    var branch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TÀI KHOẢN THANH TOÁN"
                
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Nạp thẻ", style: .plain, target: self, action: #selector(addTapped))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    @objc func addTapped() {
        let manHinhVC = ManHinhChinhViewController(nibName: "ManHinhChinhViewController", bundle: nil)
        manHinhVC.account = account
        self.navigationController?.pushViewController(manHinhVC, animated: true)
    }
    
}

extension ChiTietTKViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
            cell.lblTop.text = DataText.chuTaiKhoan
            cell.lblBottom.text = userName
            return cell
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Cell2
            cell.lblTop.text = DataText.chiNhanhMo
            cell.lblBottom.text = branch
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
