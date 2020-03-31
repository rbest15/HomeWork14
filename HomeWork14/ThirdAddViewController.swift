import UIKit

class ThirdAddViewController: UIViewController {
    
    @IBOutlet weak var addTextView: UITextView!
    var delegate : ThirdAddViewDelegate?

    @IBAction func thirdAddButtonPressed(_ sender: Any) {
        let newTask = TaskCD()
        newTask.text = addTextView.text
        print(delegate)
        delegate?.addTask(newTask)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextView.becomeFirstResponder()
    }
}
