import UIKit

final class TagsViewController: UIViewController {
		
    let data: [String] = Tags.allTags
    
	private lazy var collectionView: TagCollectionView = {
		let layout = TagCollectionViewFlowLayout()
		layout.isAutomaticItemSize = true
		layout.minimumInteritemSpacing = 12
		layout.minimumLineSpacing = 20
		return TagCollectionView(layout)
	}()
    
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupViews()
		setupLayout()
	}
	
    func setupLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        
        collectionView.register(TagViewCell.self, forCellWithReuseIdentifier: TagViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}


extension TagsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(withType: TagViewCell.self, for: indexPath) as? TagViewCell else {
            return UICollectionViewCell()
        }
        
        cell.tagButton.setTitle(data[indexPath.item], for: .normal)
        
        return cell
    }
}

