import Foundation
import Combine
import CoreData

/// NSFetchedResultsController support for Combine syntax.
/// Create a new CoreRecordController to get notified about changes in CoreData for a given Entity
public class CoreRecordController<Entity: ApplicationRecord>: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
    @Published public var values: [Entity] = []
    private let valuesController: NSFetchedResultsController<Entity>

    public init(fetchRequest: NSFetchRequest<Entity>? = nil) {
        var fetchRequest: NSFetchRequest! = fetchRequest

        if fetchRequest == nil {
            fetchRequest = (Entity.fetchRequest() as! NSFetchRequest<Entity>)
            fetchRequest.sortDescriptors = []
        }

        valuesController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: SwiftRecord.sharedRecord.managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )

        super.init()

        valuesController.delegate = self

        do {
            try valuesController.performFetch()
            values = valuesController.fetchedObjects ?? []
        } catch {
            print("❌❌❌❌") // TODO: handle properly or fail
        }
    }

    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let fetchResult = controller.fetchedObjects as? [Entity] else { return }

        values = fetchResult
    }
}
