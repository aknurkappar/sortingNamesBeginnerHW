//
//  ViewController.swift
//  sortingNamesBeginnerHW
//
//  Created by коня on 05.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentListTableView: UITableView!
    
    @IBOutlet weak var buttonsList: UIStackView!
    
    @IBOutlet weak var sortByNameButton: CustomOptionButton!
    @IBOutlet weak var sortBySurnameButton: CustomOptionButton!
    
    private var studentsList : [Student] = [
        Student(firstName: "Abai", surname: "Kunanbayuly"),
        Student(firstName: "Akhmet", surname: "Baitursynuly"),
        Student(firstName: "Mirzhaqyp", surname: "Dulatuly"),
        Student(firstName: "Marzhan", surname: "Zhumabayev"),
        Student(firstName: "Dulat", surname: "Isabekov"),
        Student(firstName: "Sultanmakhmud", surname: "Toraigyrov"),
        Student(firstName: "Mukhtar", surname: "Auezov"),
        Student(firstName: "Shokhan", surname: "Ualikhanov"),
        Student(firstName: "Saken", surname: "Seifullin"),
        
    ]
    
    private var sortedStudentsList : [Student] = []
    
    private var isSorted : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentListTableView.dataSource = self
        sortedStudentsList.append(contentsOf: studentsList)
        
    }
    
    func selectOneOption(_ button : CustomOptionButton){
        if(button.isSelectedOption){
            button.undoSelection()
            sortedStudentsList = studentsList
        } else {
            button.selectOption()
        }
        for buttonElement in buttonsList.arrangedSubviews {
            if let customButton = buttonElement as? CustomOptionButton {
                if customButton != button {
                    customButton.undoSelection()
                }
            }
        }
        studentListTableView.reloadData()
    }
    
    @IBAction func sortByNameAction(_ sender: Any) {
        sortedStudentsList = studentsList.sorted { studentFirst, studentSecond in
            return studentFirst.firstName < studentSecond.firstName
        }

        selectOneOption(sortByNameButton)
    }
    
    @IBAction func sortBySurnameAction(_ sender: Any) {
        sortedStudentsList = studentsList.sorted { studentFirst, studentSecond in
            return studentFirst.surname < studentSecond.surname
        }

        selectOneOption(sortBySurnameButton)
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedStudentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = studentListTableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as? StudentCell else {
            return UITableViewCell()
        }

        cell.firstName.text = sortedStudentsList[indexPath.row].firstName
        cell.surname.text = sortedStudentsList[indexPath.row].surname
        return cell
    }
    
    
}

