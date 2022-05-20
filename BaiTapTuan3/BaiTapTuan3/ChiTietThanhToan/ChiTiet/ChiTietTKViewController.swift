//
//  ChiTietTKViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 19/05/2022.
//

import UIKit
import SwiftyJSON

class ChiTietTKViewController: UIViewController, DataDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let jsonData = JSONData()
    var accountArr: [Acount] = []
    var accountArrTT: [Acount] = []
    var accountArrTK: [Acount] = []
    var accountType = ""
    var titleLblCell = ["Chủ tài khoản", "Chi nhánh mở"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        jsonData.delegateData = self
        jsonData.dataParseProcess()
        jsonData.getDataJSON()
        jsonData.getData(data: accountType)
        //register cell
        
        let nib = UINib(nibName: "TableViewCellChiTiet", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        
        //register HeaderTT
        let nibHeader = UINib(nibName: "HeaderChiTiet", bundle: nil)
        self.tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
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
    
    func getData(data: String) {
        self.accountType = data
    }
    
    
    
}

extension ChiTietTKViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! HeaderChiTiet
        headerView.lblContent.text = accountType
        headerView.imgView.image = UIImage(named: DataHeaderTableView.imageWallet)
        headerView.contentView.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

