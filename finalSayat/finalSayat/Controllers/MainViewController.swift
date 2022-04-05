import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var productData: ProductModel?
    var login: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadJson()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func loadJson() {
        if let path = Bundle.main.path(forResource: "Ecommerce", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                productData = try jsonDecoder.decode(ProductModel.self, from: jsonData)
            } catch{
                print("Error!")
            }
        }
    }
    
    func moveOnProductListing(index: Int) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListingViewController") as? ProductListingViewController else{
            return
        }
        vc.productListing = productData?.response?[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveOnProductDetails(tableIndex: Int, collectionIndex: Int) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsDetailsViewController") as? ProductsDetailsViewController else{
            return
        }
        vc.productDetails = productData?.response?[tableIndex].products?[collectionIndex]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func profilePressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else{
            return
        }
        vc.login = login
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 267
        return productData?.response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductsTableViewCell else {return UITableViewCell()}
        cell.products = productData?.response?[indexPath.row]
        cell.index = indexPath.row
        cell.onClickSeeAllClosure = { index in
            if let indexp = index{
                self.moveOnProductListing(index: indexp)
            }
        }
        
        cell.didSelectClosure = { tabIndex, colIndex in
            if let tabIndexp = tabIndex, let colIndexp = colIndex{
                self.moveOnProductDetails(tableIndex: tabIndexp, collectionIndex: colIndexp)
            }
        }
        
        return cell
    }
    
}
