# iOS-basics

Swift programmed layouts are view as

In app deligate

func application(_ application: UIApplication, didFinishLaunchingWithOptions 
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
        window?.rootViewController=startpage()//your page name as startpage()
        return true
    }
    
    
    navigation view controller
    
    window!.rootViewController = UINavigationController(rootViewController:
                                    mainScreen(collectionViewLayout: UICollectionViewFlowLayout()))//page name as mainScreen
