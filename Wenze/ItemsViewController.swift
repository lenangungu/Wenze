//
//  ItemsViewController.swift
//  Wenze
//
//  Created by Lena Ngungu on 12/19/16.
//  Copyright © 2016 Lena Ngungu. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    var index: Int?
    
    let resuseIdentifier = "ItemsCollectionViewCell"
    @IBOutlet weak var ItemsCollectionView: UICollectionView!
    var items: [UIImage] = [ UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!, UIImage(named: "image4")!, UIImage(named: "image5")!, UIImage(named: "image6")!, UIImage(named: "image7")!, UIImage(named: "image8")!, UIImage(named: "image9")!, UIImage(named: "image10")!, UIImage(named: "image11")!, UIImage(named: "image12")!, UIImage(named: "image13")!, UIImage(named: "image14")!, UIImage(named: "image15")!, UIImage(named: "image16")!, UIImage(named: "image17")!, UIImage(named: "image18")!, UIImage(named: "image19")!, UIImage(named: "image20")!, UIImage(named: "image21")! , UIImage(named: "image22")!, UIImage(named: "image23")!, UIImage(named: "image24")!, UIImage(named: "image25")!, UIImage(named: "image26")!, UIImage(named: "image27")!, UIImage(named: "image28")!, UIImage(named: "image29")!, UIImage(named: "image30")!, UIImage(named: "image31")!, UIImage(named: "image32")!, UIImage(named: "image33")!, UIImage(named: "image34")!, UIImage(named: "image35")!, UIImage(named: "image36")!, UIImage(named: "image37")!]
    
    var prices: [String] = ["$25", "$75", "$45", "$30-$60", "$45", "$25", "$20", "$20", "$55", "$20", "$45", "","$90","$20", "$75","$20","$50", "$10", "$15", "$8-$12", "$8-$12", "","","","","","","","","","","","","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToAchatViewController(_ segue: UIStoryboardSegue)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "achat")
        {
            let origin = sender as! ItemsCollectionViewCell
            let nextVC = segue.destination as! AchatViewController
            nextVC.arNum = origin.cellIndex! + 1 

        }
    }
    

}
extension ItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as! ItemsCollectionViewCell
        
        cell.cellIndex = indexPath.row
        index = indexPath.row
        cell.image.image = items[indexPath.row]
        cell.priceLabel.text = prices[indexPath.row]
        
        return cell
        
    }
    
    
    
    // MARK: Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("Article \(indexPath.item + 1) was selected")
      //  let cell = collectionView.dequeueReusableCellWithReuseIdentifier(resuseIdentifier, forIndexPath: indexPath) as! ItemsCollectionViewCell
        index = indexPath.item
    
    }
    
   
    
}

extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    // Asks the delegate for the size of the specified item’s cell. cvWidth is the global var I created in the collectionView IBOutlet
    // RETURN: The width and height of the specified item. Both values must be greater than 0.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print(collectionView.frame.width)
        //print(collectionView.frame.height)
        return CGSize(width: (ItemsCollectionView.frame.width / 2.2), height: (ItemsCollectionView.frame.width/3.3))
    }
    
    // Asks the delegate for the margins to apply to content in the specified section.
    // RETURN: The margins to apply to items in the section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 10, bottom: 90, right: 10)
    }
    
    // Asks the delegate for the spacing between successive rows or columns of a section.
    // RETURN: The minimum space (measured in points) to apply between successive lines in a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  5  }
    
    // Asks the delegate for the spacing between successive items in the rows or columns of a section.
    // RETURN: The minimum space (measured in points) to apply between successive items in the lines of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Asks the delegate for the size of the header view in the specified section.
    // RETURN: The size of the header. If you return a value of size (0, 0), no header is added.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    // Asks the delegate for the size of the footer view in the specified section.
    // RETURN: The size of the footer. If you return a value of size (0, 0), no footer is added.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    
    
    
    
}
