import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

import 'about.dart';
import 'buttons.dart';
import 'cards.dart';
import 'footer.dart';
import 'forms.dart';
import 'layout.dart';
import 'list_group.dart';
import 'login.dart';
import 'overlay.dart';
import 'pagers.dart';
import 'side-nav.dart';
import 'sign-up.dart';
import 'tables.dart';
import 'tags.dart';
import 'themes.dart';
import 'toast.dart';
import 'top-nav.dart';
import 'typography.dart';

/// Top-level component for Modular Admin demo.
@Component(
    selector: 'body',
    styles: const ['''
        ma-top-nav form {
            position: relative;
            top: -5px;
        }
    '''],
    templateUrl: 'body.html',
    directives: const [CORE_DIRECTIVES, FaIcon, formDirectives, MA_DIRECTIVES,
        ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS, MA_PROVIDERS, DocumentService,
        LayoutService, TagsService,
        const Provider(LocationStrategy, useClass: HashLocationStrategy)]
)
@RouteConfig(const [
    const Route(path: '/about', name: 'About', component: AboutComponent, useAsDefault: true),
    const Route(path: '/buttons', name: 'Buttons', component: ButtonsComponent),
    const Route(path: '/cards', name: 'Cards', component: CardsComponent),
    const Route(path: '/footer', name: 'Footer', component: FooterComponent),
    const Route(path: '/forms', name: 'Forms', component: FormsComponent),
    const Route(path: '/layout', name: 'Layout', component: LayoutComponent),
    const Route(path: '/list-group', name: 'ListGroup', component: ListGroupComponent),
    const Route(path: '/login', name: 'Login', component: LoginComponent),
    const Route(path: '/overlay', name: 'Overlay', component: OverlayComponent),
    const Route(path: '/pagers', name: 'Pagers', component: PagersComponent),
    const Route(path: '/side-nav', name: 'SideNav', component: SideNavComponent),
    const Route(path: '/sign-up', name: 'SignUp', component: SignUpComponent),
    const Route(path: '/tables', name: 'Tables', component: TablesComponent),
    const Route(path: '/tags', name: 'Tags', component: TagsComponent),
    const Route(path: '/themes', name: 'Themes', component: ThemesComponent),
    const Route(path: '/toast', name: 'Toast', component: ToastComponent),
    const Route(path: '/top-nav', name: 'TopNav', component: TopNavComponent),
    const Route(path: '/typography', name: 'Typography', component: TypographyComponent),
])
class BodyComponent {
    /// Application layout service.
    LayoutService layoutService;

    /// Tags (a.k.a. badges) service.
    TagsService tagsService;

    /// Toast (a.k.a. pop-up notifications) service.
    ToastService toastService;

    /// Search term.
    String searchTerm;

    /// Constructor.
    BodyComponent(this.layoutService, this.tagsService, this.toastService);

    /// Search form submit handler.
    void handleSubmit() {
        window.alert('You searched for: "$searchTerm"');
    }
}
