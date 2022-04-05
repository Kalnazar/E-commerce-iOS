import UIKit

class ProfileViewController: UIViewController {
    
    var login: String?
    @IBOutlet var profileLogin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = login
        profileLogin.text = login
    }
    @IBAction func exitProfile(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
