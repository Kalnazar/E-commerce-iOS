import UIKit

class ProductDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailName: UILabel!
    @IBOutlet var detailPrice: UILabel!
    @IBOutlet var detailDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
