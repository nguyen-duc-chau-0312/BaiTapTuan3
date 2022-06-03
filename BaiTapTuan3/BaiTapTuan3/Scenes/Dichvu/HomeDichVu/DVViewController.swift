//
//  DichVuViewController.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 31/05/2022.
//

import UIKit

class DVViewController: UIViewController, BillPaymentImpl {

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
        myData.getDataListTruyenHinhSerivce()
        print(listBill)
        for item in listBill {
            listCell.append(CellBill(label: item.name, img: item.img, type: item.type))
        }
        
        let nib = UINib(nibName: "DichVuCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
    }
    
    func getDataBill(data: [BillPayment]) {
        for item in data {
            self.listBill.append(item)
        }
    }
    
    func initCollectionView(){
        
        
    }
    
}

extension DVViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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

extension DVViewController:UICollectionViewDelegateFlowLayout{
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
//for (int i=0; i<btnList.count; i++) {
//        NSString *btnName=[[btnList objectAtIndex:i] valueForKey:@"Ccy"];
//        NSInteger funTag=[[[btnList objectAtIndex:i] valueForKey:@"Denom"] integerValue];
//        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnWidth -3 , 48)];
//        [btn setTitle:btnName forState:UIControlStateNormal];
//        [btn setTag:funTag];
//        if(screenWidth > 350){
//            btn.titleLabel.font = [UIFont systemFontOfSize:14];
//        }else{
//            btn.titleLabel.font = [UIFont systemFontOfSize:12];
//        }
//        
//        [btn setTitleColor:kTextfieldColor forState:UIControlStateNormal];
//        [btn setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
//        btn.layer.cornerRadius=kRadius;
//        [btn setBackgroundColor:[UIColor whiteColor]];
//        [btn setClipsToBounds:YES];
//        btn.layer.borderColor = [UIColor colorWithHex:@"#BCC1C6"].CGColor;
//        btn.layer.borderWidth = 1;
//        xCenter=btnWidth/2+(i%3)*(btnWidth + 2);
//        yCenter=50/2+floor(i/3)*55;
//        [btn setCenter:CGPointMake(xCenter, yCenter)];
//        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        [view addSubview:btn];
//        
//    }
