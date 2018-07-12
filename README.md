# Luna
A very simple yet nice looking style messages/notifications for iOS 7+.


### iPhone 6s / Landscape **GIF**

![alt text](https://res.cloudinary.com/dreamlabsaryan/image/upload/q_100/v1531382379/LunaiPhone_tpp9tz.gif "iPhone") ![alt text](http://res.cloudinary.com/dreamlabsaryan/image/upload/q_100/v1531382702/lunaiPhoneLandscape_uaoqrt.gif "iPhone") 


### iPhone X / Landscape **GIF**


![alt text](http://res.cloudinary.com/dreamlabsaryan/image/upload/q_100/v1531382910/lunaX_jsiyef.gif "iPhone X")
![alt text](http://res.cloudinary.com/dreamlabsaryan/image/upload/q_100/v1531382905/lunaXLandscape_m94t8w.gif "iPhone X")

### iPad Pro
![alt text](http://res.cloudinary.com/dreamlabsaryan/image/upload/q_100/v1531383028/Simulator_Screen_Shot_-_iPad_Pro_12.9-inch_2nd_generation_-_2018-07-12_at_10.32.36_kdphls.png "iPhone")

## Getting Started

Drag the **Sources** folder to your xcode project. 

And then use: 

```swift
@IBAction func presentLuna(_ sender: Any) {
        
   let luna = Luna()
   
   // Set Luna properties
   luna.setLuna(inView: self.view, title: "Introducing our new football notifications on the Guardian app", message: "Today we are excited to announce the launch of our new and improved football notifications in our latest update to the Guardian app.", dissmiss: 2)
   
   // Add luna to your view
   self.view.addSubview(luna)
   
}
```

| Parameters        | Definition 🍉          | Required ✅ |
| ------------- |:-------------:| -----:|
| InView | Usually means the view you're going to add Luna into. self.view works on ViewControllers | Required ✅ |
| title     | Bold-looking UILabel used as your notification Title      |   Required ✅ |
| message | Your notification message      |    Required ✅|
| dissmiss | For how many seconds should your message be visible?      |    Required ✅|

## Future plans  

You can see existing and add new feature proposals on the projects GitHub page.
Pull requests are welcome!
#### Roadmap
+ Adding UITapGesture
+ Buttons
+ More Styles 
+ Customizable alert

## Support  

If you need any assistance or find any bugs, feel free to contact me directly via email or create a new issue on the GitHub page.
