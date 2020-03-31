import UIKit
import CoreData

class ThirdViewController: UIViewController, ThirdDetailViewDelegate, ThirdAddViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(identifier: "add2") as! ThirdAddViewController
        vc.delegate = self
        present(vc, animated: true)
    }
    var tasksArray : [TaskCD] = []
    var tasksArrayCD : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func deleteTask(_ index: IndexPath) {
        tasksArray.remove(at: index.row)
        reloadTableView()
    }

    func addTask(_ task: TaskCD) {
        tasksArray.append(task)
        reloadTableView()
    }
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArrayCD.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell") as! ThirdTableViewCell
        cell.thirdTextLable.text = tasksArray[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "details2") as! ThirdDetailViewController
        vc.curentTask = tasksArray[indexPath.row]
        vc.index = indexPath
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}

class TaskCD {
    var text = ""
}

protocol ThirdDetailViewDelegate {
    func deleteTask(_ index: IndexPath)
}

protocol ThirdAddViewDelegate {
    func addTask(_ task: TaskCD)
}
