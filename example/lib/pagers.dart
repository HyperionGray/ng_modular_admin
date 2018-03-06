import 'package:angular/angular.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Layout component.
@Component(
    selector: 'pagers',
    templateUrl: 'pagers.html',
    directives: const [CORE_DIRECTIVES, MA_DIRECTIVES]
)
class PagersComponent {
    int currentPage = 1;
    int totalItems = 77;
    int itemsPerPage = 10;
    int maxPages = 5;
    List<String> items;

    DocumentService _doc;
    Page _lastPage;

    PagersComponent(this._doc) {
        this._doc.title = 'Pagers';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Components', icon: 'gears'),
            new Breadcrumb(name: 'Pagers'),
        ];
        this.updateItems();
    }

    void selectPage(Page page) {
        this._lastPage = page;
        this.currentPage = page.pageNumber;
        this.updateItems();
    }

    void setItemsPerPage(var event) {
        int itemsPerPage = int.parse(event.target.value, radix: 10);
        if (itemsPerPage > 0) {
            this.currentPage = 1;
            this._lastPage = null;
            this.itemsPerPage = itemsPerPage;
            this.updateItems();
        }
    }

    void setMaxPages(var event) {
        int maxPages = int.parse(event.target.value, radix: 10);
        if (maxPages > 0) {
            this.currentPage = 1;
            this._lastPage = null;
            this.maxPages = maxPages;
            this.updateItems();
        }
    }

    void updateItems() {
        if (this._lastPage == null) {
            this.items = new List<String>.generate(
                this.itemsPerPage,
                (i) => 'Item #' + (i + 1).toString()
            );
        } else {
            this.items = new List<String>.generate(
                this._lastPage.itemsOnPage,
                (i) => 'Item #' + (this._lastPage.firstItem + i).toString()
            );
        }
    }
}
