//
//  ViewController.swift
//  StudentList
//
//  Created by Heesu Yun on 3/9/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! // #1
    
    var students = ["Eddard Stark",
                    "Robert Baratheon",
                    "Jaime Lannister",
                    "Catelyn Stark",
                    "Cersei Lannister",
                    "Daenerys Targaryen",
                    "Jorah Mormont",
                    "Viserys Targaryen",
                    "Jon Snow",
                    "Sansa Stark",
                    "Arya Stark",
                    "Robb Stark",
                    "Theon Greyjoy",
                    "Bran Stark",
                    "Joffrey Baratheon",
                    "Sandor Clegane",
                    "Tyrion Lannister",
                    "Khal Drogo",
                    "Petyr Baelish",
                    "Davos Seaworth",
                    "Samwell Tarly",
                    "Stannis Baratheon",
                    "Melisandre Spookywitch",
                    "Jeor Mormont",
                    "Margaery Tyrell",
                    "Tywin Lannister",
                    "Talisa Maegyr",
                    "Tormund Giantsbane",
                    "Brienne Tarth",
                    "Ramsay Bolton",
                    "Daario Naharis",
                    "Ellaria Sand",
                    "Tommen Baratheon",
                    "Jaqen H'ghar",
                    "Roose Bolton",
                    "Grey Worm"
    ] //#4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self //tableview에 꼭 필요하다! #2
        tableView.delegate = self // self=viewController
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //prepare to segway (passing data back and forth)
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! StudentDetailViewController //force it to type as StudentDetailViewController + find where we are  going
            let selectedIndexPath = tableView.indexPathForSelectedRow! // forced unwrapp
            destination.student = students[selectedIndexPath.row] // get selectedIndexPath
        }else{
            if let selectedIndexPath = tableView.indexPathForSelectedRow { //not nil
                tableView.deselectRow(at: selectedIndexPath, animated: true)
                //다른 app사용할때는, 다른 students, student, DetailViewConrtoller만 사용하면된다.
            }
        }
    }
    
    @IBAction func unwindFromStudentDetailTableViewController(segue: UIStoryboardSegue) { //이름을 save하고 main 화면으로 돌아가면 이름이 남아있게 하는 code ; save를 exit 에 drag 에서 unwind를 정해라
        let source = segue.source as! StudentDetailViewController // coming from detail
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            students[selectedIndexPath.row] = source.student //[] = at
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic) // with = animation
        }else{ // if there's no selectedrow (selection) --> add record to the end
            let newIndexPath = IndexPath(row: students.count, section: 0) //students.count = last element
            students.append(source.student) // update element
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
            
        }
        
    }
    
}

extension ViewController: UITableViewDelegate,  UITableViewDataSource {  // protocol = set of rules #3
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("👊🏻 numberOfRowsInSection was just called and there are \(students.count) rows in the tableView")
        return students.count //Int:# of elements inside the datasource (for new app, put a new array name on "students"
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) // scroll up and down 할때 새로운 이름들이 보이게 하는거
        cell.textLabel?.text = students[indexPath.row] //indexPath.row = element of the array which access data source to populate the text property of textlabel
        //idetifier은 main.storyboard에 attribute inspector에 있는 identifier이름
        //indexPath.row gives integer -> specific value we would like to display
        print("👍🏻 dequeueing the table view cell for indexPath.row = \(indexPath.row) where the cell contains item \(students[indexPath.row])")
        return cell
    }
    
    
}
