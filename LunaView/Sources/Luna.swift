//
//  Luna.swift
//  LunaView
//
//  Created by Rawand Ahmed Shaswar on 7/9/18.
//  Copyright © 2018 DreamLabs LLC. All rights reserved.
//

import UIKit

class Luna: UIView {
    
    
    typealias completionHandler = (_ success:Bool) -> Void
    
    
    // Not yet implemented
    open var touchOutsideToHide: Bool = true;
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    public func setLuna(inView: UIView, title messageTitle:String, message messageDescription:String, dissmiss dissmissDuration: TimeInterval) {
        
        let luna = UIView()

        let titleLabel = UILabel()
        titleLabel.text = messageTitle // "Introducing our new football notifications on the Guardian app"
        titleLabel.font = UIFont(name: "avenirnext-demibold", size: 13)
        titleLabel.textColor = UIColor(hexString: "4A4A4A")
        titleLabel.numberOfLines = 0 // whole idea of self-sizing
        
        let titleDesc = UILabel()
        titleDesc.text = messageDescription //
        titleDesc.font = UIFont(name: "avenirnext-regular", size: 9)
        titleDesc.textColor = UIColor(hexString: "4A4A4A")
        titleDesc.numberOfLines = 0
        
        // My mainView
        
        luna.backgroundColor = .white
        luna.addShadow(radius: 11, opacity: 0.2) // Some Shadow
        luna.layer.cornerRadius = 10
        
        let verticalStackView = UIStackView(arrangedSubviews: [titleLabel, titleDesc])
        verticalStackView.axis = .vertical
        
        let okButton = UIButton()
        okButton.setTitleColor(.blue, for: .normal)
       // okButton.setTitle("Okay", for: .normal)
        okButton.titleLabel?.font = UIFont.systemFont(ofSize: 8)
        okButton.setContentHuggingPriority(.defaultHigh, for: .horizontal) // to stretch the okay button horizontally
        
        let horizontalStackView = UIStackView(arrangedSubviews: [verticalStackView, okButton])
        horizontalStackView.axis = .horizontal
        
        luna.addSubview(horizontalStackView)
        inView.addSubview(luna)
        //self.addSubview(luna)
        
        luna.popIn()
        
        
        _ = Timer.scheduledTimer(withTimeInterval: dissmissDuration, repeats: false) { timer in
            luna.popOut()
        }
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false // when using autolayout from code, this property must be false, otherwise constraint won't work
        luna.translatesAutoresizingMaskIntoConstraints = false
        
        // This method activates all constraint (when you create a constraint with anchors, by default they are disabled)
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                horizontalStackView.topAnchor.constraint(equalTo: luna.topAnchor, constant: 8),
                horizontalStackView.bottomAnchor.constraint(equalTo: luna.bottomAnchor, constant: -8),
                horizontalStackView.leadingAnchor.constraint(equalTo: luna.leadingAnchor, constant: 8),
                horizontalStackView.trailingAnchor.constraint(equalTo: luna.trailingAnchor, constant: -8),
                
                luna.topAnchor.constraint(equalTo: inView.safeAreaLayoutGuide.topAnchor, constant: 30),
                luna.leadingAnchor.constraint(equalTo: inView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                luna.trailingAnchor.constraint(equalTo: inView.safeAreaLayoutGuide.trailingAnchor, constant: -30)
                ])
        } else {
            // Fallback on earlier versions
        }
       
        
        
        /*
        let luna = UIView()
       // luna.isUserInteractionEnabled = true
      
        
        let descStrWidth = messageDescription.stringWidth
        let descStrHeight = messageDescription.stringHeight
        
        let titleStrHeight = messageTitle.stringHeight
        let titleStrWidth = messageTitle.stringWidth

        
        
        let titleLabel = UILabel()
        titleLabel.text = messageTitle
        titleLabel.font = UIFont(name: "avenirnext-demibold", size: 13)
        titleLabel.textColor = UIColor(hexString: "4A4A4A")
        titleLabel.numberOfLines = 0
        
        
        let titleDesc = UILabel()
        titleDesc.text = messageDescription
        titleDesc.font = UIFont(name: "avenirnext-regular", size: 9)
        titleDesc.textColor = UIColor(hexString: "4A4A4A")
        titleDesc.numberOfLines = 0
        
        
        
        

        luna.frame = CGRect(x: 16, y: 40, width: screenWidth - 30, height: titleStrHeight + descStrHeight)
        luna.center.x = luna.center.x
        luna.backgroundColor = .white
        luna.addShadow(radius: 11, opacity: 0.2)
        luna.layer.cornerRadius = 10
        
        titleDesc.frame = CGRect(x: luna.frame.minX + 3, y: titleLabel.frame.maxY + titleStrHeight, width: luna.frame.width, height: descStrHeight)
        
        
        titleLabel.frame = CGRect(x: luna.frame.minX + 3, y: 8, width: titleStrWidth, height: titleStrHeight)
      
        luna.addSubview(titleLabel)
        luna.addSubview(titleDesc)
        self.addSubview(luna)
        luna.popIn()
        
        
        _ = Timer.scheduledTimer(withTimeInterval: dissmissDuration, repeats: false) { timer in
            luna.popOut()
        } */
        
       /* if touchOutsideToHide {
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tap.numberOfTapsRequired = 1
            self.addGestureRecognizer(tap)
            luna.addGestureRecognizer(tap)
            print("touch ouside is true")

        } else {
            print("touch ouside is false")
        } */
        
        
        
    }
    
    func imageForEmptyDataSet(in scrollView: UIScrollView) -> UIImage? {
        return nil
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch begin")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch ended")
        super.touchesEnded(touches, with: event)
    }


}

extension String {
    var stringWidth: CGFloat {
        let constraintRect = CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.trimmingCharacters(in: .whitespacesAndNewlines).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return boundingBox.width
    }
    
    var stringHeight: CGFloat {
        let constraintRect = CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.trimmingCharacters(in: .whitespacesAndNewlines).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return boundingBox.height
    }
}

extension UIView {
    func addShadow(radius:CGFloat,opacity:Float) {
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize.zero
        
        self.generateEllipticalShadow()
    }
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


