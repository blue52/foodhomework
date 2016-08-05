//
//  ViewController.swift
//  AddDataTableview
//
//  Created by sky on 2016/8/2.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dic:[String:String] = [:]
    
   
    @IBOutlet weak var showFoodname: UILabel!
    
    @IBOutlet weak var showFooddetail: UILabel!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        showFoodname.text = dic["name"]
        showFooddetail.text = dic["match"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationEditName = Notification.Name("editfoodNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(self.geteditNoti(noti:)), name: notificationEditName, object: nil)
    }

    func updateView() { //這function不懂
        // Update the user interface for the detail item.
        if let dicdetail = self.editdic {
            dic = dicdetail
            
            if let words = self.showFoodname {
                
                words.text = dic["name"]
                showFooddetail.text = dic["match"]
                
            }
        }
    }

    
    
    func geteditNoti(noti:Notification){
        let notiDic = noti.userInfo as! [String:String]
        self.editdic = notiDic
    }

    var editdic: Dictionary<String,String>? {
        didSet {
            // Update the view.
            updateView()
        }
    }//didset表設定的updateView功能資料變更後，會更新name和match資料。
//這editdic也不太懂


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destination as! EditTableViewController
        
        controller.dic = dic
        
    }


}

