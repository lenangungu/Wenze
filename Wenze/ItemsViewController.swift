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
    var items: [UIImage] = [ UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image2")!, UIImage(named: "image3")!, UIImage(named: "image4")!, UIImage(named: "image5")!, UIImage(named: "image6")!, UIImage(named: "image7")!, UIImage(named: "image8")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToAchatViewController(segue: UIStoryboardSegue)
    {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "achat")
        {
            let origin = sender as! ItemsCollectionViewCell
            let nextVC = segue.destinationViewController as! AchatViewController
            nextVC.arNum = origin.cellIndex! + 1 

        }
    }
    

}
extension ItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(resuseIdentifier, forIndexPath: indexPath) as! ItemsCollectionViewCell
        
        cell.cellIndex = indexPath.row
        index = indexPath.row
        cell.image.image = items[indexPath.row]
        
        return cell
        
    }
    
    
    
    // MARK: Delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print ("Folder \(indexPath.item + 1) was selected")
      //  let cell = collectionView.dequeueReusableCellWithReuseIdentifier(resuseIdentifier, forIndexPath: indexPath) as! ItemsCollectionViewCell
        index = indexPath.item
    
    }
    
   
    
}

extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    // Asks the delegate for the size of the specified item’s cell. cvWidth is the global var I created in the collectionView IBOutlet
    // RETURN: The width and height of the specified item. Both values must be greater than 0.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //print(collectionView.frame.width)
        //print(collectionView.frame.height)
        return CGSize(width: (ItemsCollectionView.frame.width / 2.2), height: (ItemsCollectionView.frame.width/3.3))
    }
    
    // Asks the delegate for the margins to apply to content in the specified section.
    // RETURN: The margins to apply to items in the section.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 10, bottom: 90, right: 10)
    }
    
    // Asks the delegate for the spacing between successive rows or columns of a section.
    // RETURN: The minimum space (measured in points) to apply between successive lines in a section.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return  5  }
    
    // Asks the delegate for the spacing between successive items in the rows or columns of a section.
    // RETURN: The minimum space (measured in points) to apply between successive items in the lines of a section.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    // Asks the delegate for the size of the header view in the specified section.
    // RETURN: The size of the header. If you return a value of size (0, 0), no header is added.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    // Asks the delegate for the size of the footer view in the specified section.
    // RETURN: The size of the footer. If you return a value of size (0, 0), no footer is added.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    
    
    
    
}