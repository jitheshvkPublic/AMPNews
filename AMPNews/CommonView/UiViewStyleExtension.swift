//
//  UIViewStyleExtension.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func applyStyle(_ style:Style) {
        switch style {
        case .NewsArticleListHeaderLabelStyle:
            if let label = self as? UILabel {
                label.font = UIFont.preferredFont(forTextStyle: .headline)
                label.textColor = UIColor.black
            }
        case .NewsArticleListAbstractLabelStyle:
            if let label = self as? UILabel {
                label.font = UIFont.preferredFont(forTextStyle: .footnote)
                label.textColor = UIColor.black
            }
        case .NewsArticleByLineLabelStyle:
            if let label = self as? UILabel {
                label.font = UIFont.boldSystemFont(ofSize: 12)
                label.textColor = UIColor.lightGray
            }
        case .NewsArticleTimestampLabelStyle:
            if let label = self as? UILabel {
                label.font = UIFont.boldSystemFont(ofSize: 12)
                label.textColor = UIColor.lightGray
            }
        case .NewsArticleRefreshControleStyle:
            if let refreshControle = self as? UIRefreshControl {
                refreshControle.attributedTitle = NSAttributedString(string: kNewStoriesRefreshControleText, attributes: [NSAttributedStringKey.foregroundColor : UIColor.black,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 12)])
                refreshControle.tintColor = UIColor.black
            }
        case .NewsArticleTableViewCellStyle:
            if let tableViewCell = self as? UITableViewCell {
                tableViewCell.selectionStyle = .gray
            }
        case .NewsArticleTableViewStyle:
            if let tableView = self as? UITableView {
                tableView.rowHeight = UITableViewAutomaticDimension
                tableView.estimatedRowHeight = 60
                tableView.tableFooterView = UIView(frame: CGRect.zero)
                tableView.separatorStyle = .singleLine
                tableView.separatorInset = UIEdgeInsets.zero
            }
        case .NewsArticleDetailsProgressViewStyle:
            if let progressView = self as? UIProgressView {
                progressView.progressTintColor = UIColor.blue
            }
        }
    }
}
