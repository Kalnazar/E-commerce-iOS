import UIKit

class AuthorizationViewController: UIViewController {
    var users = [User.init("Sayat", "iosFinal"), User.init("Adiya", "beautiful")]
    
    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIn(_ sender: Any) {
        if let login = login.text, let password = password.text{
            for i in 0...(users.count-1){
                if users[i].login == login, users[i].password == password{
                    guard let vc = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else{
                        return
                    }
                    vc.login = login
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    
    @IBAction func registrationPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController else{
            return
        }
        vc.completion = { login, password in
            self.users.append(User.init(login, password))
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
