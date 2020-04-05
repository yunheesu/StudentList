//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by Heesu Yun on 3/9/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    @IBOutlet weak var studentTextField: UITextField!
    
    var student: String! // catch value
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if student == nil { // passing empty string for starter 
            student = ""
        }
        studentTextField.text = student
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // saving new student name!
        student = studentTextField.text  // update student into student.text before we segway, we are getting what user wrote
        // then, control drag save to exit 'unwind function' 
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode { //modal presented segue
            dismiss(animated: true, completion: nil)
        }else{ //show segue
            navigationController!.popViewController(animated: true)
        }
        
    }
}
// bar button item = plus button or add or cancel or save 있는곳
// 맨처음에,tableViewCell 넣고, 노란색 왼쪽 클릭해서 editor에서 navigation bar 넣고, 그러면 왼쪽에 생긴다
// 새로운 viewController은 새로운 페이지고, 만들때마다 cocoapunch로 새로운 file 만들어서 연결하고, IBOutlet도 연결한다.then, embed tthe viewcontroller tot its own navigaiton controller <plus하면 go up to the NC, then go to viewController>
//table view cell segway to new viewcontroller (show)then give identifier
//put plus button to NC (present modally = bubbles up from bottom)
