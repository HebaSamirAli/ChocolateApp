//
//  ComponentViewController.swift
//  chocolateApp
//
//  Created by HebaMac on 1/29/20.
//  Copyright © 2020 HSA. All rights reserved.
//

import UIKit

class ComponentViewController: UIViewController {

    @IBOutlet weak var ProCollectionView: UICollectionView!
    
    var product: [Products] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product = createArray()
        
        ProCollectionView.delegate = self
        ProCollectionView.dataSource = self
    }
    
    func createArray() -> [Products]
    {
        var tempProducts: [Products] = []
        
        let pro1 = Products(img: UIImage(named: "cafee")!, title: "cafee")
        let pro2 = Products(img: UIImage(named: "cupcake")!, title: "cupcake")
        let pro3 = Products(img: UIImage(named: "sandwich")!, title: "sandwich")
        let pro4 = Products(img: UIImage(named: "pasta")!, title: "pasta")
       
        tempProducts.append(pro1)
        tempProducts.append(pro2)
        tempProducts.append(pro3)
        tempProducts.append(pro4)
        
        return tempProducts
    }
    
    
    
}
extension ComponentViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pro = product[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ComViewCell
        
        cell.setProduct(product: pro)
        
        return cell
    }
    
    
    
    
}
