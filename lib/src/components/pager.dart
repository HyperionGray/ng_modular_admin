import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

/// A pager component.
///
/// In addition to rendering a pagination control widget, this is also
/// implements the logic to figure out which pages should be displayed.
@Component(
    selector: 'ma-pager',
    templateUrl: 'pager.html',
    styleUrls: const ['pager.css'],
    directives: const [CORE_DIRECTIVES, FaIcon]
)
class Pager implements OnInit, OnChanges {
    /// If true, the pager is automatically hidden when it only has one page.
    @Input()
    bool autohide = true;

    /// The currently selected page. This value will be clamped if if is out of
    /// bounds. (Required)
    @Input()
    int currentPage;

    /// If true, render the pager as disabled and don't process any clicks. You
    /// may want to disable a pager while you load a page of items.
    @Input()
    bool disabled = false;

    /// The number of items displayed on each page. (Default: 10)
    @Input()
    int itemsPerPage = 10;

    /// The maximum number of pages to put in the pager (exclusive of
    /// previous/next). (Default: 10)
    @Input()
    int maxPages = 10;

    /// If true, show "previous" and "next" buttons.
    @Input()
    bool showPreviousNext = true;

    /// If true, show "first" and "last" buttons.
    @Input()
    bool showFirstLast = true;

    /// The total number of itmms across all pages. (Required)
    @Input()
    int totalItems;

    /// When a page is clicked, emit a Page instance.
    final _onSelectPage = new StreamController<Page>.broadcast();
    @Output()
    Stream<Page> get selectPage => _onSelectPage.stream;

    /// Automatically hide this element when it has only 1 page.
    @HostBinding('hidden')
    bool get hidden => autohide && (pages == null || pages.length < 2);

    /// Non-numbered pages.
    Page firstPage, previousPage, nextPage, lastPage;

    /// Numbered pages.
    List<Page> pages;

    /// Handle click events by forwarding to `onPage` emitter.
    void handleClick(MouseEvent event, Page page) {
        event.stopPropagation();
        if (!page.isDisabled) {
            this._onSelectPage.add(page);
        }
    }

    /// Implementation of OnChanges.
    void ngOnChanges(var changes) {
        this._updatePages();
    }

    /// Implementation of OnInit.
    void ngOnInit() {
        this._updatePages();
    }

    /// Calculate which pages should be rendered.
    void _updatePages() {
        int totalPages = (this.totalItems / this.itemsPerPage).ceil();
        int currentPage = this.currentPage.clamp(1, totalPages);
        int shownPages = min(totalPages, this.maxPages);
        int startPage = (currentPage - shownPages / 2).ceil();

        if (startPage < 1) {
            startPage = 1;
        } else if (startPage > totalPages - shownPages + 1) {
            startPage = totalPages - shownPages + 1;
        }

        // Create first, previous, next, & last.
        this.firstPage = new Page(
            1,
            1,
            this.itemsPerPage,
            currentPage == 1
        );

        if (currentPage == 1) {
            this.previousPage = this.firstPage;
        } else {
            this.previousPage = new Page(
                currentPage - 1,
                (currentPage - 2) * this.itemsPerPage + 1,
                itemsPerPage,
                currentPage == 1
            );
        }

        this.lastPage = new Page(
            totalPages,
            (totalPages - 1) * this.itemsPerPage + 1,
            this.totalItems % this.itemsPerPage,
            currentPage == totalPages
        );

        if (currentPage == totalPages - 1) {
            this.nextPage = this.lastPage;
        } else {
            this.nextPage = new Page(
                currentPage + 1,
                (currentPage) * this.itemsPerPage + 1,
                itemsPerPage,
                currentPage == totalPages
            );
        }

        // Generate numbered pages.
        this.pages = new List<Page>.generate(
            shownPages,
            (index) {
                int pageNumber = index + startPage;
                int itemsOnPage = this.itemsPerPage;

                if (pageNumber == totalPages) {
                    itemsOnPage = this.totalItems % this.itemsPerPage;
                }

                Page page = new Page(
                    pageNumber,
                    (pageNumber - 1) * this.itemsPerPage + 1,
                    itemsOnPage,
                    pageNumber == currentPage
                );

                return page;
            }
        );
    }
}

/// A helper class that contains state for a single page element.
class Page {
    /// The displayed number for this page.
    int pageNumber;

    /// The position of the first item on this page. E.g. if we have 10 items
    /// per page, then the first item on page 2 is 11.
    int firstItem;

    /// The position of the last item on this page. E.g. if we have 10 items per
    /// page, then the last item on page 2 is 20.
    int lastItem;

    /// The number of items on this page.
    int itemsOnPage;

    /// True if this page should be rendered in a disabled state (e.g. we're
    /// already on that page).
    bool isDisabled;

    /// Constructor.
    Page(this.pageNumber, this.firstItem, this.itemsOnPage, this.isDisabled) {
        this.lastItem = this.firstItem + itemsOnPage - 1;
    }
}
