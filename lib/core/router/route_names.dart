class Routes {
  Routes._();

  // Auth
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String roleSelection = '/role-selection';

  // Main App
  static const String dashboard = '/dashboard';
  static const String projects = '/projects';
  static const String vendors = '/vendors';
  static const String settings = '/settings';

  // Projects
  static const String createProject = '/projects/create';
  static const String projectDetail = '/projects/:id';
  static const String expenseList = '/projects/:id/expenses';
  static const String addExpense = '/projects/:id/expenses/add';
  static const String expenseDetail = '/projects/:id/expenses/:expId';
  static const String analytics = '/projects/:id/analytics';
  static const String shareProject = '/projects/:id/share';
  static const String guestLinks = '/projects/:id/guest-links';
  static const String sitePhotos = '/projects/:id/photos';

  // Vendors
  static const String vendorDetail = '/vendors/:id';
  static const String addVendor = '/vendors/add';

   // Settings
   static const String profile = '/settings/profile';
   static const String language = '/settings/language';
   static const String notifications = '/settings/notifications';
 }
