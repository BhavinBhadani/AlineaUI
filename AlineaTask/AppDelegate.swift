
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setupNavigationBarAppearacee()
        
        showTabBar()
        
        return true
    }
}

// MARK: - Helpers
extension AppDelegate {
    func showTabBar() {
        let vc = TabBarViewController()
        vc.view.backgroundColor = .white
        window!.rootViewController = vc
        window!.makeKeyAndVisible()
    }

    func showPagerView() {
        let vc = PagerTabViewController()
        vc.view.backgroundColor = .white
        let nvc = UINavigationController(rootViewController: vc)
        nvc.navigationBar.setBackgroundImage(UIImage(), for:.default)
        nvc.navigationBar.shadowImage = UIImage()
        nvc.navigationBar.layoutIfNeeded()
        window!.rootViewController = nvc
        window!.makeKeyAndVisible()
    }
    
    func setupNavigationBarAppearacee() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = .white
        navigationBarAppearace.barTintColor = .white
    
        let attrs = [
            NSAttributedString.Key.foregroundColor: ATColor.alineaGrey,
            NSAttributedString.Key.font: UIFont.boldFont(19)
        ]
        
        UINavigationBar.appearance().titleTextAttributes = attrs as [NSAttributedString.Key : Any]
    }
}
