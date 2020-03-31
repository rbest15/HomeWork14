import UIKit

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var thirdTextLable: UILabel!
    @IBOutlet weak var objectDone: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
