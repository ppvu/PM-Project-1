//
//  ViewController.swift
//  MyUniverseApp
//
//  Created by spezza on 14.01.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    var parentName: String?
    var api: API?
    var timer: Int = 0
    var type: ElementNameForData = .universe
    
    var objects: [ElementsInfo] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    public func timeTick() {
        DispatchQueue.main.async {
            if let parentName = self.parentName {
                self.getNewData(fromPar: parentName, type: self.type)
            } else {
                self.setData()
            }
            self.collectionView?.reloadData()
        }
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width - 40,
                                 height: view.frame.size.width/3.2)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(RoundedCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.backgroundColor = .white
        view.addSubview(collectionView!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = objects[indexPath.row]
        let parentName = String(object.name)
        let dash = parentName.firstIndex(of: "-") ?? parentName.endIndex
        let parentPrefix = parentName[..<dash]
        if parentPrefix != "MS" && parentPrefix != "SPL" {
            let viewController = MainViewController()
            viewController.api = self.api
            viewController.parentName = parentName
            
            let chType = setChildrenType(type: self.type)
            viewController.type = chType
            viewController.getNewData(fromPar: String(object.name), type: chType)
            viewController.title = object.name
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RoundedCollectionViewCell
        cell.backgroundColor = .systemFill
        
        let object = objects[indexPath.row]
        cell.titleLabel.text = "\(object.name)"
        cell.secondaryLabel.text = "age: \(object.age)\n mass: \(object.mass)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width - 40,
                      height: view.frame.size.width/3)
    }
}

extension MainViewController {
    func setData() {
        if let res = self.api?.getUNNamesList() {
            self.objects = res
        }
    }
}

extension MainViewController {
    func getNewData(fromPar: String, type: ElementNameForData) {
        if let res = self.api?.getChildrenNamesList(parentName: fromPar, data: type, elemQuantity: 50, page: 1) {
            self.objects = res
        }
    }
}

extension MainViewController {
    func setChildrenType(type: ElementNameForData) -> ElementNameForData {
        var result: ElementNameForData = .universe
        
        switch type {
        case .universe: result = .galaxys
        case .galaxys: result = .sps
        case .sps: result = .planets
        case .planets: result = .satellites
        case .satellites: result = .satellites
        }
        return result
    }
}
