import UIKit

class ProductListingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var productListing: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = productListing?.categoryName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

}

extension ProductListingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 250
        return productListing?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell else{
            return UITableViewCell()
        }
        cell.detailName.text = productListing?.products?[indexPath.row].name
        cell.detailPrice.text = productListing?.products?[indexPath.row].price
        cell.detailDescription.text = productListing?.products?[indexPath.row].description
        cell.detailImage.image = UIImage(named: productListing?.products?[indexPath.row].imageName ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsDetailsViewController") as? ProductsDetailsViewController else{
            return
        }
        vc.productDetails = productListing?.products?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
