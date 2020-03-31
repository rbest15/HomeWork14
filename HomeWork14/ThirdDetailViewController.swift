import UIKit

class ThirdDetailViewController: UIViewController {

    @IBOutlet weak var thirdDetailTextView: UITextView!
    
    var curentTask : TaskCD?
    var index : IndexPath?
    
    var delegate : ThirdDetailViewDelegate?
    
    @IBAction func thirdDeleteButtonPressed(_ sender: Any) {
        delegate?.deleteTask(index!)
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        thirdDetailTextView.text = curentTask?.text
    }
}
