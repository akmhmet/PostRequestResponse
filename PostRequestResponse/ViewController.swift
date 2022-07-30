import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTExtField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func responseButton(_ sender: Any) {
        postCall()
    }
    func postCall(){
        let username = usernameTExtField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let url = URL(string: "https://reqres.in/api/register")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let postString = "username=\(username)&email=\(email)&password=\(password)"
        request.httpBody = postString.data(using: String.Encoding.utf8);
        let task = URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            if let data = data,
               let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
        }
        
        task.resume()
    }
    
}





