import UIKit

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var doneSwitch: UISwitch!
    @IBOutlet weak var thirdTextLable: UILabel!
    var index : IndexPath?
    var delegate : ThirdCellDelegate?
    
    @IBAction func doneChanged(_ sender: Any) {
        delegate?.taskDoneChanged(index!, doneSwitch.isOn)
    }
       
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
