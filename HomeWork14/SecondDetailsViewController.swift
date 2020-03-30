import UIKit

class SecondDetailsViewController: UIViewController {

    @IBOutlet weak var detailTextView: UITextView!
    var delegate : SecondViewControllerDelegate?

    var targetTask : Task?
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        delegate?.deleteTask(targetTask!)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextView.text = targetTask?.text
    }
}
