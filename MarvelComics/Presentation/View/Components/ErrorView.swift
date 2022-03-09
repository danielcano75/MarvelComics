//
//  ErrorView.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 9/03/22.
//

import UIKit

class ErrorView: UIView {
    fileprivate enum ViewTraits {
        static let padding: CGFloat = 8
        static let imageSize: CGSize = CGSize(width: 207, height: 207)
        static let btnSize: CGSize = CGSize(width: 138, height: 35)
    }
    
    var message: String
    var background: UIColor
    
    let imgError: UIImageView = UIImageView(frame: .zero)
    let lblError: UILabel = UILabel(frame: .zero)
    let btnRetry: UIButton = UIButton(frame: .zero)
    
    init(frame: CGRect = .zero,
         message: String = "",
         background: UIColor = .background) {
        self.message = message
        self.background = background
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
        
        backgroundColor = background
        
        imgError.image = UIImage(named: "NotFound")
        imgError.contentMode = .scaleAspectFit
        
        lblError.text = message
        lblError.textColor = .secondary
        lblError.textAlignment = .center
        lblError.font = .marvel(size: .navigationTitle)
        lblError.numberOfLines = .zero
        lblError.sizeToFit()
        
        btnRetry.setTitle("RETRY", for: .normal) 
        btnRetry.tintColor = .text
        btnRetry.titleLabel?.font = .marvel(size: .navigationTitle)
        btnRetry.backgroundColor = .primary
        btnRetry.addTarget(self, action: #selector(retry(sender:)), for: .touchUpInside)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(imgError)
        addSubview(lblError)
        addSubview(btnRetry)
        
        imgError.autoCenterInSuperview()
        imgError.autoSetDimensions(to: ViewTraits.imageSize)
        
        lblError.autoPinEdge(toSuperviewEdge: .leading, withInset: ViewTraits.padding)
        lblError.autoPinEdge(.top, to: .bottom, of: imgError, withOffset: ViewTraits.padding)
        lblError.autoPinEdge(toSuperviewEdge: .trailing, withInset: ViewTraits.padding)
        
        btnRetry.autoPinEdge(.top, to: .bottom, of: lblError, withOffset: ViewTraits.padding)
        btnRetry.autoAlignAxis(toSuperviewAxis: .vertical)
        btnRetry.autoSetDimensions(to: ViewTraits.btnSize)
    }
    
    @objc func retry(sender : UIButton) {
        let notification = Notification(name: .retry, object: nil, userInfo: nil)
        NotificationCenter.default.post(notification)
    }
}
