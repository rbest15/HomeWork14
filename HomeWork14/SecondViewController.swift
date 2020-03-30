import UIKit
import CoreData
import RealmSwift

class SecondViewController: UIViewController, SecondViewControllerDelegate, SecondAddViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "add") as! SecondAddViewController
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    var tasksArray = Persistance.shared.realm.objects(Task.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func deleteTask(_ task: Task) {
        try! Persistance.shared.realm.write {
            Persistance.shared.realm.delete(task)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func addTask(_ task: Task) {
        try! Persistance.shared.realm.write {
            Persistance.shared.realm.add(task)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

class Task : Object {
    @objc dynamic var text = ""
}

extension SecondViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell") as! SecondTableViewCell
        cell.secondSellLabel.text = tasksArray[indexPath.row].text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "detaills") as! SecondDetailsViewController
        vc.delegate = self
        vc.targetTask = tasksArray[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
}

protocol SecondViewControllerDelegate {
    func deleteTask(_ task: Task)
}
protocol SecondAddViewControllerDelegate {
    func addTask(_ task: Task)
}
