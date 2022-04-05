import UIKit

class ProductsDetailsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var productDetails: ProductDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = productDetails?.name
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ProductsDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 764
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell else{
            return UITableViewCell()
        }
        cell.detailName.text = productDetails?.name
        cell.detailPrice.text = productDetails?.price
        cell.detailDescription.text = productDetails?.description
        cell.detailImage.image = UIImage(named: productDetails?.imageName ?? "")
        
        return cell
    }
}
