//
//  UiViewStyleExtension.swift
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
            guard let label = self as? UILabel else { return }
            label.font = UIFont.preferredFont(forTextStyle: .headline)
            label.textColor = UIColor.black
        case .NewsArticleListAbstractLabelStyle:
            guard let label = self as? UILabel else { return }
            label.font = UIFont.preferredFont(forTextStyle: .footnote)
            label.textColor = UIColor.black
        case .NewsArticleByLineLabelStyle:
            guard let label = self as? UILabel else { return }
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.textColor = UIColor.lightGray
        case .NewsArticleTimestampLabelStyle:
            guard let label = self as? UILabel else { return }
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.textColor = UIColor.lightGray
        case .NewsArticleRefreshControleStyle:
            guard let refreshControle = self as? UIRefreshControl else { return }
            refreshControle.attributedTitle = NSAttributedString(string: kNewStoriesRefreshControleText, attributes: [NSAttributedStringKey.foregroundColor : UIColor.black,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 12)])
            refreshControle.tintColor = UIColor.black
        case .NewsArticleTableViewCellStyle:
            guard let tableViewCell = self as? UITableViewCell else { return }
            tableViewCell.selectionStyle = .gray
        case .NewsArticleTableViewStyle:
            guard let tableView = self as? UITableView else { return }
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 60
            tableView.tableFooterView = UIView(frame: CGRect.zero)
            tableView.separatorStyle = .none
        }
    }
}
