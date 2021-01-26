//
//  ViewController.swift
//  MyUniverseApp
//
//  Created by spezza on 14.01.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    var api: API?
    var timer: Int = 0
    
    var type: ElementNames = .universe
    
    var objects: [ElementsInfo] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    func setData() {
//        if let res = api.getUNNamesList() {
//        var apiGet = self.api?.getUNNamesList()
//        self.objects = apiGet as [String]?
        if let res = self.api?.getUNNamesList() {
            self.objects = res
        }
    }
//
//    func setGLData() {
//        if let res = api.getGLNamesList() {
//            objects = res
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupCollectionView()
        
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
    
    func getNewData(fromPar: String, type: ElementNames) {
        
        if let res = self.api?.getChildrenNamesList(parentName: fromPar, data: type, elemQuantity: 50, page: 1) {
            print("for cell", res)
            self.objects = res
        }
    }
}

func setChildrenType(type: ElementNames) -> ElementNames {
    
    var result: ElementNames = .universe
    
    switch type {
    case .universe: result = .galaxys
    case .galaxys: result = .sps
    case .sps: result = .spsStars
    case .spsStars: result = .planets
    case .planets: result = .universe
    }
    
    return result
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = MainViewController()
        viewController.api = self.api
        let chType = setChildrenType(type: self.type)
        viewController.type = chType
        let object = objects[indexPath.row]
        viewController.getNewData(fromPar: String(object.name), type: chType)
        viewController.title = object.name

        self.navigationController?.pushViewController(viewController, animated: true)
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
//        print("11234", object)
        cell.titleLabel.text = "\(object.name)"
        cell.secondaryLabel.text = "\(object.name)\n age: \(object.age)"
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
