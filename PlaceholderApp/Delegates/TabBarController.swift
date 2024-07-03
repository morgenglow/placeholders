import UIKit

final class TabBarController: UITabBarController {
    private enum TabBarItem: Int {
        case posts
        case albums
        case todos
        case photos

        var title: String {
            switch self {
            case .posts:
                return "Posts"
            case .albums:
                return "Albums"
            case .todos:
                return "Todos"
            case .photos:
                return "Photos"
            }
        }

        var iconName: String {
            switch self {
            case .posts:
                return "signpost.right"
            case .albums:
                return "square.stack.fill"
            case .todos:
                return "list.bullet.clipboard.fill"
            case .photos:
                return "photo.circle"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }

    private func setupTabBar() {
        let dataSource: [TabBarItem] = [.posts, .albums, .todos, .photos]
        self.viewControllers = dataSource.map {
            switch $0 {
            case .posts:
                let mainViewController = PostsViewController()
                return self.wrappedInNavigationController(with: mainViewController, title: $0.title)
            case .albums:
                let usersViewController = AlbumsViewController()
                return self.wrappedInNavigationController(with: usersViewController, title: $0.title)
            case .todos:
                let usersViewController = ToDosViewController()
                return self.wrappedInNavigationController(with: usersViewController, title: $0.title)
            case .photos:
                let usersViewController = PhotosViewController()
                return self.wrappedInNavigationController(with: usersViewController, title: $0.title)
            }
        }
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
        }
    }

    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
        return UINavigationController(rootViewController: with)
    }
}
