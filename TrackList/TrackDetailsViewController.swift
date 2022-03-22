import UIKit

class TrackDetailsViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var trackLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: track.track)
        trackLabel.text = track.track
    }
    
}
