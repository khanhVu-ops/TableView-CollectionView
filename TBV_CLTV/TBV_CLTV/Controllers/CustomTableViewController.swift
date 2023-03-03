//
//  CustomTableViewController.swift
//  TBV_CLTV
//
//  Created by Vu Khanh on 03/03/2023.
//

import UIKit


class CustomTableViewController: UIViewController {

    @IBOutlet weak var tbvNotifications: UITableView!
    
    var notificationData: [NotificationModel] = [
        NotificationModel(imgUrl: "jisoo", title: "Jisoo", detail: "mentioned you in her profile.", notifyType: .noButton),
        NotificationModel(imgUrl: "adam", title: "Adam & Eva", detail: "sent you a friend request.", notifyType: .hasButton),
        NotificationModel(imgUrl: "lisa", title: "Lisa", detail: "sent you a friend request.", notifyType: .hasButton),
        NotificationModel(imgUrl: "lisa", title: "Lisa", detail: "posted a new video: Hellooooo everybodyy posted a new video: Hellooooo everybodyyposted a new video: Hellooooo everybodyy", notifyType: .noButton),
        NotificationModel(imgUrl: "rose", title: "Rose", detail: "mentioned you in her profile.", notifyType: .noButton),
        NotificationModel(imgUrl: "jisoo", title: "Jisoo", detail: "mentioned you in her profile.", notifyType: .noButton),
        NotificationModel(imgUrl: "rose", title: "Rose", detail: "sent you a friend request.", notifyType: .hasButton),
        NotificationModel(imgUrl: "jennie", title: "Jennie", detail: "sent you a friend request.", notifyType: .hasButton),
        NotificationModel(imgUrl: "jisoo", title: "Jisoo", detail: "sent you a friend request.", notifyType: .hasButton)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    func setUpView() {
        self.tbvNotifications.register(UINib(nibName: "NoButtonNotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NoButtonNotificationTableViewCell")
        self.tbvNotifications.register(UINib(nibName: "HasButtonNotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "HasButtonNotificationTableViewCell")
        self.tbvNotifications.delegate = self
        self.tbvNotifications.dataSource = self
        self.tbvNotifications.estimatedRowHeight = 100
        self.tbvNotifications.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension CustomTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notificationData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.notificationData[indexPath.row].notifyType == .noButton {
            let cell = tbvNotifications.dequeueReusableCell(withIdentifier: "NoButtonNotificationTableViewCell", for: indexPath) as! NoButtonNotificationTableViewCell
            cell.configure(item: notificationData[indexPath.row])
            return cell
        }else {
            let cell = tbvNotifications.dequeueReusableCell(withIdentifier: "HasButtonNotificationTableViewCell", for: indexPath) as! HasButtonNotificationTableViewCell
            cell.configure(item: notificationData[indexPath.row], index: indexPath.row)
            cell.tapDelete = { [weak self] id in
                print(id)
                self?.notificationData.remove(at: id)
                let indexPath = IndexPath(item: id, section: 0)
                self?.tbvNotifications.deleteRows(at: [indexPath], with: .fade)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    // your code here
                    self?.tbvNotifications.reloadData()
                }
            }
            return cell
        }
        
    }
    
}

extension CustomTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tbvNotifications.deselectRow(at: indexPath, animated: true)
    }
}

//extension CustomTableViewProtocol {
//    func didTapBtnDelete() {
//        objects.remove(at: 0)
//        let indexPath = IndexPath(item: 0, section: 0)
//        tableView.deleteRows(at: [indexPath], with: .fade)
//    }
//}
