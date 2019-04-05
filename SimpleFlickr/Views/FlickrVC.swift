//
//  FlickrVC.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 1/20/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


protocol FlickrVcDelegate {
    func flickrDidSelectRow(item: FlickrItem) -> FlickrDetailVC?
}

class FlickrVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageName: UILabel!
    
    fileprivate var viewModel: FlickrViewModel!
    var delegate: FlickrVcDelegate?
    fileprivate let disposeBag = DisposeBag()
        
    
    static func createWith(storyboard: UIStoryboard, viewModel: FlickrViewModel, title: String) -> FlickrVC {
        let vc = storyboard.instantiateViewController(withIdentifier: "FlickrVC") as! FlickrVC
        vc.viewModel = viewModel
        vc.title = title
        return vc        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        
        viewModel.loadModel { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    func setupVC() {
        tableView.dataSource = self
    }

}


extension FlickrVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.CellIdentifier, for: indexPath) as! MainTableViewCell
        cell.configure(item: viewModel.items[indexPath.row])
        return cell
    }
}

extension FlickrVC {
  
//    private func setupTableView() {
//
//        viewModel.items.asObservable()
//            .bind(to: tableView.rx.items(cellIdentifier: MainTableViewCell.CellIdentifier, cellType: MainTableViewCell.self)) { (row, item, cell) in
//                cell.configure(item: item)
//            }
//            .disposed(by: disposeBag)
//
//        tableView.rx.modelSelected(FlickrItem.self)
//            .asDriver()
//            .drive(onNext: { [weak self] (item) in
//                print("driver is on main thread: ", Thread.isMainThread)
//                guard let self = self else { return }
//                if let indexPath = self.tableView.indexPathForSelectedRow {
//                    self.tableView.deselectRow(at: indexPath, animated: true)
//                    self.delegate?.flickrDidSelectRow(item: item)?
//                        .titleSubject.asObservable()
//                        .subscribe(onNext: { [unowned self] (title) in
//                            self.imageName.text = title
//                        })
//                        .disposed(by: self.disposeBag)
//                }
//            })
//            .disposed(by: disposeBag)
//
//    }
 
}
