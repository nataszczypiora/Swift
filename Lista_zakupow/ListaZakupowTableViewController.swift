//
//  ListaZakupowTableViewController.swift
//  Lista_zakupow
//
//  Created by Iga Łukiewska on 23/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//

import UIKit
import CoreData

class ListaZakupowTableViewController: UITableViewController, AddCellProtocol {
    func addInfo(info: String) {
        lista.append(info)
        tableView.reloadData()
        let user = User(context: self.context)
        user.zakupy = info
        save()
    }
    var users = [User]()
    
    var lista = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        users = fetch(User.self)
        users.forEach({
            lista.append($0.zakupy)
            })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lista.count + 1
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit list item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.lista[indexPath.row]
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                self.lista[indexPath.row] = alert.textFields!.first!.text!
                self.updateUsers(index: indexPath.row, new: alert.textFields!.first!.text!)
                self.tableView.reloadRows(at: [indexPath], with: .fade)
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
            
        })

        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.lista.remove(at: indexPath.row)
            self.deleteUser(index: indexPath.row)
            tableView.reloadData()
        })

        return [deleteAction, editAction]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(indexPath.row < lista.count)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ZakupoweCell", for: indexPath)
            cell.textLabel?.text = "\(lista[indexPath.row])"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath) as? EditableCell
            cell?.addDelegate = self
            return cell!
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    } */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lista.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert
        {
        }    
    }

    lazy var persistentContainer: NSPersistentContainer = {
          let container = NSPersistentContainer(name: "Lista_zakupow")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
      }()
    lazy var context = persistentContainer.viewContext
    func save()
    {
        if context.hasChanges {
            do {
                try context.save()
                print("saved successfully")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T]
    {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do{
            let fetchedObjects = try context.fetch(fetchRequest) as?[T]
            return fetchedObjects ?? [T]()
        }catch {
            print(error)
            return [T]()
        }
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateUsers(index: Int, new:String)
    {
        let firstUser = users[index]
        firstUser.zakupy = new
        self.save()
        
    }
    
    func deleteUser(index: Int)
    {
        let usr = users[index]
        context.delete(usr)
        self.save()
    }

}
