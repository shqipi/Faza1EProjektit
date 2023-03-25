//
//  NewProfileViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 22.03.23.
//

import UIKit

class NewProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    var userArray: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        creatUsers()
    }
    
    func creatUsers() {
        let user1 = User(id: 1, profilPhoto: "1", name: "Shqiperim Ramadani", date: "Today - 06:02", mainPhoto: "london", photoLabel: "A visit in London", likeLabel: "You and 4 others like this.", minPhoto: "2")
        let user2 = User(id: 2, profilPhoto: "2", name: "Atdhe Ukaj", date: "Today - 12:10", mainPhoto: "canada", photoLabel: "Wild Canada and it's Beuty", likeLabel: "You and 10 others like this.", minPhoto: "2")
        let user3 = User(id: 3, profilPhoto: "3", name: "Jon Kikaj", date: "Yesterday - 13:00", mainPhoto: "france", photoLabel: "A view like this", likeLabel: "You and 30 others like this.", minPhoto: "2")
        let user4 = User(id: 4, profilPhoto: "4", name: "Fistek Fisteku", date: "Monday - 16:20", mainPhoto: "southafrica", photoLabel: "The colors of the Sky! To live for", likeLabel: "You and 8 others like this.", minPhoto: "2")
        let user5 = User(id: 5, profilPhoto: "5", name: "Filan Filani", date: "Thursday - 01:02", mainPhoto: "belgium", photoLabel: "Want to see more of belgium", likeLabel: "You and 20 others like this.", minPhoto: "2")
        let user6 = User(id: 6, profilPhoto: "6", name: "Edhe Une", date: "Saturday - 14:02", mainPhoto: "unitedarabemirates", photoLabel: "Modern meets desert and the heat", likeLabel: "You and 39 others like this.", minPhoto: "2")
        
        userArray = [user1, user2, user3, user4, user5, user6]
        tableView.reloadData()
    }
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        cell.setDetaisl(user: userArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

}
