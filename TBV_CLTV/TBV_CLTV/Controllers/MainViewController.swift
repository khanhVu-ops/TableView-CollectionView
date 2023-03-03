//
//  ViewController.swift
//  TBV_CLTV
//
//  Created by Vu Khanh on 03/03/2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnTableViewTapped(_ sender: Any) {
        let tbvVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTableViewController") as! CustomTableViewController
        self.navigationController?.pushViewController(tbvVC, animated: true)
    }
    @IBAction func btnCollectionViewTapped(_ sender: Any) {
        let cltvVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DemoCollectionViewViewController") as! DemoCollectionViewViewController
        self.navigationController?.pushViewController(cltvVC, animated: true)
    }
}

