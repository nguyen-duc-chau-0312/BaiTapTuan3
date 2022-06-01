//
//  DichVuViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 31/05/2022.
//

import UIKit

class DichVuViewController: UIViewController, BillPaymentImpl {

    @IBOutlet weak var collectionView: UICollectionView!
    let myData = JSONData()
    var listBill: [BillPayment] = []
    var account: AccountObj?
    var listCell: [CellBill] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        myData.delegateBill = self
        myData.getDataListBill()
        print(listBill)
        for item in listBill {
            listCell.append(CellBill(label: item.name, img: item.img))
        }
        print(listCell)

        let nib = UINib(nibName: "DichVuCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
//        initView()
//        initCollectionView()
//        collectionView.cellsize
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
//        layout.itemSize = CGSize(width: view.frame.size.width/3, height: (view.frame.size.width/3) + 20)
//
//        collectionView = UICollectionView(frame: .zero,
//                                          collectionViewLayout: layout)
//        collectionView.frame = view.bounds
//        //1
//        let screenWidth = UIScreen.main.bounds.width - 10
//        //2
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 15, right: 0)
//        layout.itemSize = CGSize(width: (screenWidth/3) ,
//                                 height: (screenWidth/3))
//        print(view.frame.size.width)
//        layout.minimumInteritemSpacing = 5
//        layout.minimumLineSpacing = 5
//        //3
//        collectionView!.collectionViewLayout = layout
    }
    
    func getDataBill(data: [BillPayment]) {
        for item in data {
            self.listBill.append(item)
        }
    }
    
    func initCollectionView(){
        
        
    }

    func initView(){
//        let scrollView = UIScrollView()
//        let horizonStackView = UIStackView()
//        horizonStackView.setup() //distribution Style....
//
//        scrollView.addSubview(horizonStackView)
//
//        //tao danh sach dich vu
//        data = [hoadon1(),...,hoadonn()]
//        let collums = 3
//        let row = data.count/collums
//
//        for j in 0..row{
//            let verticalStV = UIStackView()
//            verticalStV.setup()
//            for i in 0..collums{
//                let cellData = data[i+j]
//                cell = DichVuCollectionViewCell()
//                cell.setdata = hoadon
//                verticalStV.setup() //vertical
//                verticalStV.addSubview(cell)
//            }
//            horizonStackView.addsubview(verticalStV)
//        }
    
    }

    
}

extension DichVuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DichVuCollectionViewCell
        let listCell = listCell[indexPath.row]
        cell.lblContent.text = listCell.label
        cell.imgView.image = UIImage(named: listCell.img)
        return cell
    }
}

extension DichVuViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.frame.size.width)
        let screenWidth = UIScreen.main.bounds.width - 10
        return CGSize(width: screenWidth/3 - 15, height: (screenWidth/3) - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
