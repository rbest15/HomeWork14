import UIKit

class ThirdAddViewController: UIViewController {
    
    @IBOutlet weak var addTextView: UITextView!
    var delegate : ThirdAddViewDelegate?

    @IBAction func thirdAddButtonPressed(_ sender: Any) {
        delegate?.addTask(addTextView.text)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextView.becomeFirstResponder()
    }
}
