//
//  MovieTableViewController.swift
//  AddDataTableview
//
//  Created by sky on 2016/8/2.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    //var foodArray = [["name":"黯然銷魂飯", "match": "牛雜湯"],["name":"奪命香雞腿", "match": "凍檸茶"]]
    
    var foodArray:Array<Dictionary<String,String>> = [] //如少掉Array就不能新增
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("AddfoodNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(MovieTableViewController.addfoodNoti(noti:)), name: notificationName, object: nil)
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
       let notificationEditName = Notification.Name("editfoodNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(MovieTableViewController.editfoodNoti(noti:)), name: notificationEditName, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodArray.count
    }
    
    func addfoodNoti(noti:Notification){
        //let foodData = noti.userInfo as! String
        
        let foodDic = noti.userInfo as! [String:String]
        //let foodData = noti.userInfo as! String
        //self.foodArray.insert(foodDic, at: 0)//這個語法比較不熟，故採用下面append新增
        self.foodArray.append(foodDic)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        self.tableView.reloadData()
    }
    func editfoodNoti(noti:Notification){
        let notiDic = noti.userInfo as! [String:String]
        let index = Int(notiDic["index"]!)//是為了將字串轉成Int，讓index變成數字
        foodArray[index!] = notiDic
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        
        //let dic = self.foodArray[indexPath.row]//也可不用設dic
        
        //設定cell
        
        cell.textLabel?.text = foodArray[indexPath.row]["name"]
        cell.detailTextLabel?.text = foodArray[indexPath.row]["match"]
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //新增刪除功能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.foodArray.remove(at: indexPath.row)//必需先從foodArray移除，否則會crash
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            
        }     
    }
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editview"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                var dic = foodArray[indexPath.row]
                dic["index"] = String(indexPath.row)
                controller.editdic = dic
                
            }
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
