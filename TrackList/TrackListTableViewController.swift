//
//  TrackListTableViewController.swift
//  TrackList
//
//  Created by Артём Дмитриев on 22.03.2022.
//

import UIKit

class TrackListTableViewController: UITableViewController {
    
    var trackList = Track.getTrack()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = trackList[indexPath.row]

        cell.textLabel?.text = track.song
        cell.detailTextLabel?.text = track.artist
        cell.imageView?.image = UIImage(named: track.track)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trackDetailsVC = segue.destination as! TrackDetailsViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        trackDetailsVC.track = trackList[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentRow = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentRow, at: destinationIndexPath.row)
    }
}
