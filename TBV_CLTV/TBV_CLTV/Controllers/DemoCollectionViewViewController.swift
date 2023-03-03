//
//  DemoCollectionViewViewController.swift
//  TBV_CLTV
//
//  Created by Vu Khanh on 03/03/2023.
//

import UIKit


class DemoCollectionViewViewController: UIViewController {

    @IBOutlet weak var cltvListPhotos: UICollectionView!
    
    let photoData: [PhotoModel] = [
        PhotoModel(imgUrl: "lisa", title: "Lisa"),
        PhotoModel(imgUrl: "rose", title: "Rose"),
        PhotoModel(imgUrl: "jennie", title: "Jennie"),
        PhotoModel(imgUrl: "jisoo", title: "Jisoo"),
        PhotoModel(imgUrl: "lisa", title: "Lisa"),
        PhotoModel(imgUrl: "lisa", title: "Lisa"),
        PhotoModel(imgUrl: "lisa", title: "Lisa"),
        PhotoModel(imgUrl: "rose", title: "Rose"),
        PhotoModel(imgUrl: "jennie", title: "Jennie"),
        PhotoModel(imgUrl: "jisoo", title: "Jisoo"),
        PhotoModel(imgUrl: "rose", title: "Rose"),
        PhotoModel(imgUrl: "jennie", title: "Jennie"),
        PhotoModel(imgUrl: "jisoo", title: "Jisoo")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        self.cltvListPhotos.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        self.cltvListPhotos.delegate = self
        self.cltvListPhotos.dataSource = self
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DemoCollectionViewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cltvListPhotos.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.configure(item: self.photoData[indexPath.item])
        return cell
    }
    
}

extension DemoCollectionViewViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width - 80)/3, height: (self.view.frame.width - 80)/3 + 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
