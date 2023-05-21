//
//  HistoryTableViewController.swift
//  Calculator2
//
//  Created by Денис Хафизов on 21.05.2023.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var historyArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // Set table view properties
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        self.tableView.tableFooterView = UIView()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count/4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var index = 0
        if indexPath.row != 0 {
            index = 4 * indexPath.row
        } else {
            index = 0
        }
        var tempArray: Array<String> = []
        var tempStr: String = ""
        for i in index..<index+4 {
            tempArray.append(historyArray[i])
        }
        tempStr += tempArray[0]
        switch tempArray[1] {
        case "14":
            tempStr += " ÷ "
        case "15":
            tempStr += " ✕ "
        case "16":
            tempStr += " - "
        case "17":
            tempStr += " + "
        default:
            break
        }
        tempStr += tempArray[2]
        tempStr += " = "
        tempStr += tempArray[3]
        
        cell.textLabel?.text = "\(tempStr)"
        
        return cell
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }    
     }
     */
    
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
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    //
    //            // Configure the cell...
    //            cell.textLabel?.text = "Cell \(indexPath.row + 1)"
    //
    //            return cell
    //        }
    
    override func loadView() {
        super.loadView()
        
        // Create and configure the table view
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        self.tableView = tableView
    }
}
