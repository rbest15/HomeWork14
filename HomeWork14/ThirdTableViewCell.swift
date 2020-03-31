import UIKit
import CoreData

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var thirdTextLable: UILabel!
    @IBOutlet weak var objectDone: UISwitch!
    var object : NSManagedObject?
    @IBAction func doneChanged(_ sender: Any) {
        delegate?.taskDoneChanged(object!,objectDone.isOn)
    }
    var delegate : ThirdCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
