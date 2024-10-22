//
//  ViewController.swift
//  ShoppingList
//
//  Created by Rodrigo on 21-10-24.
//

import UIKit

class ViewController: UITableViewController {
    
    private var shoppingList  = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Shopping List"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearItems))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
        
    }
    
    @objc func addItem() {
        let ac = UIAlertController(title: "Enter your item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.shoppingList.insert(answer, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @objc func clearItems() {
        self.shoppingList.removeAll()
        tableView.reloadData()
    }

}

