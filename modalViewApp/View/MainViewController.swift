
import UIKit

class MainViewController: UIViewController {
    
    private let actioButton: UIButton = {
        let actionButton = UIButton(type: .system)
        actionButton.setTitle("action button", for: .normal)
        return actionButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Presentation Modal"
        
        view.backgroundColor = .white
        view.addSubview(actioButton)
        
        view.setNeedsUpdateConstraints()
        
        actioButton.addTarget(self, action: #selector(actionButtonDidTap(_:)), for: .touchUpInside)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        actioButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            actioButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            actioButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
            .forEach { $0.isActive = true }
    }
}

// MARK: - Selector

extension MainViewController {
    
    @objc func actionButtonDidTap(_ sender: UIButton) {
        let presentationViewController = ModalViewController()
        
        presentationViewController.transitioningDelegate = self
        presentationViewController.modalPresentationStyle = .custom
        
        self.present(presentationViewController, animated: true, completion: nil)
    }
}

// MARK: - UIViewControllerTransitioning Delegate

extension MainViewController: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
