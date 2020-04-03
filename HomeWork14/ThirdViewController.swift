import UIKit
import CoreData

class ThirdViewController: UIViewController, ThirdDetailViewDelegate, ThirdAddViewDelegate, ThirdCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(identifier: "add2") as! ThirdAddViewController
        vc.delegate = self
        present(vc, animated: true)
    }

    var tasksArrayCD : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TaskCoreData")
        do {
            tasksArrayCD = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Fetch error \(error), \(error.userInfo)")
        }
    }
    
    fileprivate func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func deleteTask(_ object: NSManagedObject, _ index: IndexPath) {
        removeFromData(object,index)
        reloadTableView()
    }

    func addTask(_ text: String) {
        saveTask(text)
        reloadTableView()
    }
    
    func saveTask(_ text: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TaskCoreData", in: managedContext)!
        let newTask = NSManagedObject(entity: entity, insertInto: managedContext)
        newTask.setValue(text, forKey: "text")
        newTask.setValue(false, forKey: "done")
        do {
            try managedContext.save()
            tasksArrayCD.append(newTask)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
    }
    func removeFromData(_ object: NSManagedObject, _ index: IndexPath){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(object)
        do {
            try managedContext.save()
            tasksArrayCD.remove(at: index.row)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        tableView.deleteRows(at: [index], with: .automatic)
    }
    
    func taskDoneChanged(_ index: IndexPath, _ state: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        tasksArrayCD[index.row].setValue(state, forKey: "done")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error, error.userInfo)
        }
    }
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArrayCD.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell") as! ThirdTableViewCell
        cell.thirdTextLable.text = tasksArrayCD[indexPath.row].value(forKey: "text") as? String
        cell.index = indexPath
        cell.delegate = self
        cell.doneSwitch.isOn = tasksArrayCD[indexPath.row].value(forKey: "done") as? Bool ?? false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "details2") as! ThirdDetailViewController
        vc.index = indexPath
        vc.currentTaskText = tasksArrayCD[indexPath.row].value(forKey: "text") as? String
        vc.delegate = self
        vc.index = indexPath
        vc.object = tasksArrayCD[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeFromData(tasksArrayCD[indexPath.row], indexPath)
            reloadTableView()
        }
    }
}

protocol ThirdDetailViewDelegate {
    func deleteTask(_ object: NSManagedObject, _ index: IndexPath)
}

protocol ThirdAddViewDelegate {
    func addTask(_ text: String)
}

protocol ThirdCellDelegate {
    func taskDoneChanged(_ index: IndexPath, _ state: Bool)
}
