import UIKit

class MainScreenViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(UINib(nibName: CocktailTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CocktailTableViewCell.reuseIdentifier)
        }
    }
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    //MARK: - Properties
    
    private lazy var cocktailDataManager = CocktailDataManager()
    var coordinatorDelegate: MainVCCoordinatorProtocol?
    
    private var cocktailList: CocktailList?{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private var filterType: CocktailType? {
        didSet{
            getData()
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Cocktails"
        filterType = .unknown
    }
    
    //MARK: - Actions
    @IBAction func filterValueChanged(_ sender: Any) {
        guard let segment = sender as? UISegmentedControl else { return }
        let title = segment.titleForSegment(at: segment.selectedSegmentIndex) ?? ""
        let type = CocktailType(title: title)
        filterType = type
    }
}

//MARK: - Private methods
extension MainScreenViewController{
    private func getData(){
        activityIndicatorView.startAnimating()
        cocktailDataManager.fetchCocktails(type: filterType ?? .unknown) { [weak self] (result) in
            DispatchQueue.main.async {
                self?.activityIndicatorView.stopAnimating()
            }
            switch result{
            case .success(let cocktailList):
                self?.cocktailList = cocktailList
            case .failure(_):
                //TODO: Error handling here.
                print("error while loading the cocktail data")
            //show error message from here
            }
        }
    }
}

//MARK: - UITableView Delegates and Data Source
extension MainScreenViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cocktailList?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailList?.cocktailCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CocktailTableViewCell.reuseIdentifier, for: indexPath) as? CocktailTableViewCell else{
            fatalError("Can't dequeue Cocktail Table View Cell")
        }
        if let cocktailItem = cocktailList?.viewModel(for: indexPath.row) {
            cell.setupCell(cocktailPresentable: cocktailItem)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cocktailItem = cocktailList?.viewModel(for: indexPath.row) else { return }
        coordinatorDelegate?.cocktailSelected(cocktailItem: cocktailItem)
    }
}
