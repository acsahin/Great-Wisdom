//
//  ViewController.swift
//  Great Wisdom
//
//  Created by ACS on 16.02.2021.
//

import SideMenu
import UIKit

class ViewController: UIViewController {
    
    private let sideMenu = SideMenuNavigationController(rootViewController: SideMenuController())

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.setNavigationBarHidden(true, animated: true)
        sideMenu.leftSide = true
        sideMenu.presentationStyle = .menuSlideIn
        sideMenu.presentationStyle.presentingEndAlpha = 0.5
        sideMenu.presentationStyle.backgroundColor = .systemGray4
        sideMenu.menuWidth = UIScreen.main.bounds.width/3+10
    }
    
    @IBAction func didTapMenuButton() {
        present(sideMenu, animated: true)
    }
}

class SideMenuController: UITableViewController {
    let data = [["Home", "Today", "Favourites"], ["About", "More Apps"]]
    let sections = ["Great Wisdom", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        //TableView Header Image
        let header = UIView(frame : CGRect(x : 0,y : 0, width: (UIScreen.main.bounds.width/3)+10, height: (2*UIScreen.main.bounds.width/5)+50))
        let imageHeader = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/3, height: 2*UIScreen.main.bounds.width/5))
        imageHeader.image = UIImage(named: "Dostoevsky")
        
        //Image Effects
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TableViewCell
        cell.label.text = data[indexPath.section][indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
    //Custom header view
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
    
    
    //Space between sections
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50.0))
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
}
