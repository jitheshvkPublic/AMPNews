//
//  NewsArticleTableViewCell.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import UIKit

class NewsArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var headLineLabel: UILabel!
    @IBOutlet weak var assetImageView: UIImageView!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    static let reuseIdentifier = "NewsArticleTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup() {
        applyStyle(.NewsArticleTableViewCellStyle)
        headLineLabel.applyStyle(.NewsArticleListHeaderLabelStyle)
        abstractLabel.applyStyle(.NewsArticleListAbstractLabelStyle)
        byLineLabel.applyStyle(.NewsArticleByLineLabelStyle)
        timestampLabel.applyStyle(.NewsArticleTimestampLabelStyle)
    }
    
    func configureWithNewsArticle(_ newsArticle:NewsArticleViewModel) {
        headLineLabel.text = newsArticle.headline
        abstractLabel.text = newsArticle.abstract
        byLineLabel.text = newsArticle.byLine
        assetImageView.setImageFromLink(newsArticle.smallestImageURL)
    }
}
