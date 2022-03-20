//
//  ViewController.swift
//  TableViewRxSwift
//
//  Created by Nathaniel Whittington on 3/19/22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate {

    //This is my tableview.
    @IBOutlet weak var tableView: UITableView!
    //this is my data.
    var myDataSource: BehaviorRelay<[[String:String]]> = BehaviorRelay(value: [["name":"IOS"],
                                                                               ["name":"Android"],
                                                                               ["name":"React"],
                                                                               ["name":"Flutter"],
                                                                               ["name":"Ionic"],
                                                                               ["name":"RxSwift"],
                                                                               ["name":"Combine"],
                                                                               ["name":"XYZ"],
                                                                               ["name":"ABC"]])
    //created DisposeBag
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure Tableview
        setTableView()
        
    }

    func setTableView(){
        //Set the delegate
        //------->>>objTableView.delegate = self
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        //bind the datasource to tableview
        //like to bind the data to tableview cell
        myDataSource
        .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "CustomCell", cellType: CustomCell.self)) { index, element, cell in
                
                //Set the data here
                cell.tlbLabel.text = element["name"]
        }.disposed(by: disposeBag)
    }
}

