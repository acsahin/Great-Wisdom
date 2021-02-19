import SideMenu
import UIKit

class CustomSideMenuNavigationController: SideMenuNavigationController {
    
    override func viewDidLoad() {
        self.setNavigationBarHidden(true, animated: true)
        self.leftSide = true
        self.presentationStyle = .menuSlideIn
        self.presentationStyle.presentingEndAlpha = 0.1
        self.presentationStyle.backgroundColor = .black
        self.menuWidth = UIScreen.main.bounds.width/3+10
    }
}

class SideMenuController: UITableViewController {
    public var delegate: SideMenuControllerDelegate?
    
    let data = [["Home", "Favourites", "About"], ["Settings", "More Apps"]]
    let sections = ["Great Wisdom", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//MARK: - Register with custom cell
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        //TableView Header Image
        let header = UIView(frame : CGRect(x : 0,y : 0, width: (UIScreen.main.bounds.width/3)+10, height: (2*UIScreen.main.bounds.width/5)+50))
        let imageHeader = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/3, height: 2*UIScreen.main.bounds.width/5))
        imageHeader.image = UIImage(named: "Dostoevsky")
        
//MARK: - Header Image Effects
        let maskLayer = CAGradientLayer()
        maskLayer.frame = imageHeader.bounds
        maskLayer.shadowRadius = 3
        maskLayer.shadowPath = CGPath(roundedRect: imageHeader.bounds.insetBy(dx: 5, dy: 5), cornerWidth: 5, cornerHeight: 5, transform: nil)
        maskLayer.shadowOpacity = 1.0;
        maskLayer.shadowOffset = CGSize.zero;
        maskLayer.shadowColor = UIColor.systemBackground.cgColor
        imageHeader.layer.mask = maskLayer;
        imageHeader.center = header.center
        header.addSubview(imageHeader)
        tableView.tableHeaderView = header
        
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
    }

    
//MARK: - Cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TableViewCell
        cell.label.text = data[indexPath.section][indexPath.row]
        
        //Icons for sections
        switch data[indexPath.section][indexPath.row] {
        case data[0][0]:
            cell.imageIcon.image = UIImage(systemName: "house.fill")
        case data[0][1]:
            cell.imageIcon.image = UIImage(systemName: "star.fill")
        case data[0][2]:
            cell.imageIcon.image = UIImage(systemName: "info.circle.fill")
        case data[1][0]:
            cell.imageIcon.image = UIImage(systemName: "gearshape.fill")
        case data[1][1]:
            cell.imageIcon.image = UIImage(systemName: "apps.iphone")
        default:
            cell.imageIcon.image = UIImage(named: "Quote")
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = data[indexPath.section][indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }


    
//MARK: - Header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40.0))
        headerView.backgroundColor = .secondarySystemBackground
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 10, width: headerView.frame.width, height: headerView.frame.height-10)
        label.text = sections[section]
        label.font = .boldSystemFont(ofSize: 16)
        headerView.addSubview(label)

        return headerView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    

//MARK: - Section
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50.0))
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
}

protocol SideMenuControllerDelegate {
    func didSelectMenuItem(named: String)
}
