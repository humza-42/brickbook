class ApiEndpoints {
  ApiEndpoints._();

  // DEVELOPMENT: Use local mock server
  // Run: dart run mock_server.dart (port 8080)
  static const String baseUrl = 'http://localhost:8080/api';

  // PRODUCTION: Uncomment when deployed
  // static const String baseUrl = 'https://api.brickbook.app/api';

  // Auth
  static const String register = '/register';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String otpSend = '/otp/send';
  static const String otpVerify = '/otp/verify';
  static const String user = '/user';

  // Projects
  static const String projects = '/projects';
  static String projectById(String id) => '/projects/$id';
  static String projectSummary(String id) => '/projects/$id/summary';
  static String expenses(String pid) => '/projects/$pid/expenses';
  static String expenseById(String pid, String eid) => '/projects/$pid/expenses/$eid';
  static String expenseAttachments(String pid, String eid) => '/projects/$pid/expenses/$eid/attachments';
  static String analytics(String pid) => '/projects/$pid/analytics';
  static String analyticsVendors(String pid) => '/projects/$pid/analytics/vendors';
  static String dashboardSummary = '/dashboard/summary';
  static String projectPhases(String projectId) => '/projects/$projectId/phases';
  static String projectMembers(String projectId) => '/projects/$projectId/members';

  // Expense Categories
  static const String expenseCategories = '/expenses/categories';

  // Vendors
  static const String vendors = '/vendors';
  static String vendorById(String id) => '/vendors/$id';

  // Sharing
  static String exportPdf(String pid) => '/projects/$pid/export/pdf';
  static String exportExcel(String pid) => '/projects/$pid/export/excel';
  static String guestLinks(String pid) => '/projects/$pid/guest-links';
}
