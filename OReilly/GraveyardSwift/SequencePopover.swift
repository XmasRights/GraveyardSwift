//
//  SequencePopover.swift
//  GraveyardSwift
//
//  Created by ChrisHome on 18/09/2015.
//  Copyright © 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class SequencePopover: UITableViewController
{
    struct TableViewValues
    {
        static let identifier = "cell"
    }
    
    lazy var items: [String] =
    {
        var listOfItems = [String]()
        for counter in 1...100
        {
            listOfItems.append("Item \(counter)")
        }
        return listOfItems
    }()
    
    var cancelBarButtonItem: UIBarButtonItem!
    var selectionHandler: ((selectedItem: String) -> Void!)?

    // =============================================================
    // MARK: Initialisers
    // =============================================================
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: TableViewValues.identifier)
    }
    
    override init(style: UITableViewStyle)
    {
        super.init(style: style)
    }
    
    
    // =============================================================
    // MARK: View Handlers
    // =============================================================
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        cancelBarButtonItem = UIBarButtonItem(title: "Cancel",
                                              style: .Plain,
                                             target: self,
                                             action: "performCancel")
        
        navigationItem.leftBarButtonItem = cancelBarButtonItem
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        preferredContentSize = CGSizeMake(300, 200)
    }
    
    
    // =============================================================
    // MARK: Action Methods
    // =============================================================
    
    func performCancel()
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // =============================================================
    // MARK: UITableView Methods
    // =============================================================
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let selectedItem = items[indexPath.row]
        selectionHandler?(selectedItem: selectedItem)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        <#code#>
    }
}
