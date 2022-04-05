import UIKit
import CoreData

class RegistrationViewController: UIViewController {
    
    @IBOutlet var newLogin: UITextField!
    @IBOutlet var newPassword: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUp(_ sender: Any) {
        let login = newLogin.text
        let password = newPassword.text
        let confirmPassword = confirmPassword.text
        
        if !login!.isEmpty, !password!.isEmpty, password == confirmPassword{
            completion?(login!, password!)
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else{
                return
            }
            vc.login = login!
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
