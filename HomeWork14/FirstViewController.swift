import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    
    @IBAction func nameTextChanged(_ sender: Any) {
        Persistance.shared.userName = nameTextField.text ?? ""
    }
    @IBAction func secondNameTextChanged(_ sender: Any) {
        Persistance.shared.userSecondName = secondNameTextField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        secondNameTextField.delegate = self
        nameTextField.text = Persistance.shared.userName
        secondNameTextField.text = Persistance.shared.userSecondName
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
        return true
    }
}

