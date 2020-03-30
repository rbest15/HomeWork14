import UIKit

class SecondAddViewController: UIViewController {
    
    @IBOutlet weak var addTextView: UITextView!
    var delegate : SecondAddViewControllerDelegate?

    @IBAction func addButtonPressed(_ sender: Any) {
        let curTask = Task()
        curTask.text = addTextView.text
        delegate?.addTask(curTask)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextView.becomeFirstResponder()
    }
}
