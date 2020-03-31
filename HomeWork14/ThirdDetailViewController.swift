import UIKit
import CoreData

class ThirdDetailViewController: UIViewController {

    @IBOutlet weak var thirdDetailTextView: UITextView!
    
    var index : IndexPath?
    var currentTaskText : String?
    var object : NSManagedObject?
    
    var delegate : ThirdDetailViewDelegate?
    
    @IBAction func thirdDeleteButtonPressed(_ sender: Any) {
        delegate?.deleteTask(object!, index!)
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        thirdDetailTextView.text = currentTaskText
    }
}
