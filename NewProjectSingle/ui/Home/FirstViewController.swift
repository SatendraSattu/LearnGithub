//
//  FirstViewController.swift
//  NewProjectSingle
//
//  Created by Satendra Pal Singh on 25/02/1943 Saka.
//

import UIKit

class FirstViewController: UIViewController {

    private var userAlbums: [UserAlbum]?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        var indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
//        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
//        indicator.center = view.center
//        view.addSubview(indicator)
//        indicator.bringSubviewToFront(view)
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Home"
        
        
        
        NetworkManager().fetchAlbum{ [weak self] (userAlbums) in
            
            self?.userAlbums = userAlbums
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

    }
    


}

extension FirstViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAlbums?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumTableViewCell
        
        let user = self.userAlbums?[indexPath.row]
//        cell.userImageName.text = user?.title
//
//        let url = URL(string: "http://i.imgur.com/w5rkSIj.jpg")
//        let data = try? Data(contentsOf: url)
       
        if(user != nil && user?.thumbnailUrl != nil){
        cell.userImage.image = UIImage(url: URL(string: user!.thumbnailUrl))
        }
//        if let imageData = data {
//            let image = UIImage(data: imageData)
//        }
//        cell.userImage.image =   UIImage(named: user?.thumbnailUrl ?? "")
        return cell
    }
    
    
}

extension FirstViewController : UITableViewDelegate{
    
}






extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
