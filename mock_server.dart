// Dart Mock Server for BrickBook Development
// Run: dart run mock_server.dart
// Then change api_endpoints.dart baseUrl to 'http://localhost:8080'

import 'dart:convert';
import 'dart:io';

import 'mock_db.dart' as db;

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  print('🚀 BrickBook Mock API running on http://localhost:8080');
  print('📡 Endpoints:');
  print('   GET  /api/projects');
  print('   GET  /api/projects/:id');
  print('   GET  /api/dashboard/summary');
  print('   POST /api/projects');
  print('   PUT  /api/projects/:id');
  print('   DELETE /api/projects/:id');
  print('   GET  /api/projects/:id/phases');
  print('   GET  /api/projects/:id/members');
  print('');

  await for (HttpRequest request in server) {
    await _handleRequest(request);
  }
}

Future<void> _handleRequest(HttpRequest req) async {
  final path = req.uri.path;
  final method = req.method;

  try {
    // CORS headers
    req.response.headers.add('Access-Control-Allow-Origin', '*');
    req.response.headers.add('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
    req.response.headers.add('Access-Control-Allow-Headers', 'Content-Type, Authorization');

    if (method == 'OPTIONS') {
      req.response.statusCode = HttpStatus.ok;
      await req.response.close();
      return;
    }

    // Routes
    if (path == '/api/projects' && method == 'GET') {
      await _sendJson(req, {'data': db.projects});
    }
    else if (path.startsWith('/api/projects/') && method == 'GET') {
      final id = path.split('/').last;
      final project = db.projects.where((p) => p['id'] == id).firstOrNull;
      if (project != null) {
        await _sendJson(req, {'data': project});
      } else {
        _sendError(req, 404, 'Project not found');
      }
    }
    else if (path == '/api/dashboard/summary' && method == 'GET') {
      final recentProjects = db.projects
          .where((p) => p['status'] == 'active' || p['status'] == 'on_hold')
          .toList()
        ..sort((a, b) => DateTime.parse(b['createdAt']).compareTo(DateTime.parse(a['createdAt'])));
      
      final summary = Map<String, dynamic>.from(db.dashboardSummary);
      summary['recentProjects'] = recentProjects.take(3).toList();

      // Compute totals from actual projects
      final totalProjects = db.projects.length;
      final activeProjects = db.projects.where((p) => p['status'] == 'active').length;
      final totalBudget = db.projects.fold<double>(0, (sum, p) => sum + (p['totalBudget'] as num).toDouble());
      final totalSpent = db.projects.fold<double>(0, (sum, p) => sum + (p['totalSpent'] as num).toDouble());
      
      summary['totalProjects'] = totalProjects;
      summary['activeProjects'] = activeProjects;
      summary['totalBudget'] = totalBudget;
      summary['totalSpent'] = totalSpent;
      summary['monthlySpend'] = db.dashboardSummary['monthlySpend'];

      await _sendJson(req, {'data': summary});
    }
    else if (path == '/api/projects' && method == 'POST') {
      await _handleCreateProject(req);
    }
    else if (path.startsWith('/api/projects/') && method == 'PUT') {
      final id = path.split('/').last;
      await _handleUpdateProject(req, id);
    }
    else if (path.startsWith('/api/projects/') && method == 'DELETE') {
      final id = path.split('/').last;
      await _handleDeleteProject(req, id);
    }
    else if (path.startsWith('/api/projects/') && path.contains('/phases') && method == 'GET') {
      final projectId = path.split('/')[3];
      final project = db.projects.where((p) => p['id'] == projectId).firstOrNull;
      if (project != null) {
        await _sendJson(req, {'data': project['phases'] ?? []});
      } else {
        _sendError(req, 404, 'Project not found');
      }
    }
    else if (path.startsWith('/api/projects/') && path.contains('/members') && method == 'GET') {
      await _sendJson(req, {'data': []}); // Empty for now
    }
    else if (path == '/api/login' && method == 'POST') {
      await _handleLogin(req);
    }
    else if (path == '/api/register' && method == 'POST') {
      await _handleRegister(req);
    }
    else {
      _sendError(req, 404, 'Not found: $path');
    }
  } catch (e) {
    _sendError(req, 500, 'Server error: $e');
  }
}

Future<void> _sendJson(HttpRequest req, dynamic data) async {
  req.response
    ..statusCode = HttpStatus.ok
    ..headers.contentType = ContentType.json
    ..write(jsonEncode(data));
  await req.response.close();
}

void _sendError(HttpRequest req, int code, String message) async {
  req.response
    ..statusCode = code
    ..headers.contentType = ContentType.json
    ..write(jsonEncode({'error': message}));
  await req.response.close();
}

Future<void> _handleLogin(HttpRequest req) async {
  final body = await utf8.decodeStream(req);
  final data = jsonDecode(body) as Map<String, dynamic>;
  
  // Simple mock auth
  if (data['password'] == 'password123') {
    await _sendJson(req, {
      'data': {
        'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
        'user': {
          'id': 'user_001',
          'name': data['email']?.split('@')[0] ?? 'User',
          'role': 'admin',
          'email': data['email'],
        }
      }
    });
  } else {
    _sendError(req, 401, 'Invalid credentials');
  }
}

Future<void> _handleRegister(HttpRequest req) async {
  final body = await utf8.decodeStream(req);
  final data = jsonDecode(body) as Map<String, dynamic>;
  
  await _sendJson(req, {
    'data': {
      'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      'user': {
        'id': 'user_${DateTime.now().millisecondsSinceEpoch}',
        'name': data['name'],
        'role': data['role'] ?? 'viewer',
        'email': data['email'],
      }
    }
  });
}

Future<void> _handleCreateProject(HttpRequest req) async {
  final body = await utf8.decodeStream(req);
  final data = jsonDecode(body) as Map<String, dynamic>;
  
  final newProject = {
    'id': 'proj_${DateTime.now().millisecondsSinceEpoch}',
    ...data,
    'totalSpent': 0,
    'status': 'active',
    'membersCount': 1,
    'createdAt': DateTime.now().toIso8601String(),
      'phases': data['phases']?.isNotEmpty == true
          ? (data['phases'] as List)
              .map((p) => {
                    'id': 'phase_${DateTime.now().millisecondsSinceEpoch}_$p',
                    'name': p,
                    'spent': 0,
                    'budgetAllocated': 0,
                    'status': 'pending'
                  })
              .toList()
          : [],
  };
  
  db.projects.add(newProject);
  await _sendJson(req, {'data': newProject});
}

Future<void> _handleUpdateProject(HttpRequest req, String id) async {
  final body = await utf8.decodeStream(req);
  final data = jsonDecode(body) as Map<String, dynamic>;
  
  final index = db.projects.indexWhere((p) => p['id'] == id);
  if (index != -1) {
    db.projects[index] = {...db.projects[index], ...data};
    await _sendJson(req, {'data': db.projects[index]});
  } else {
    _sendError(req, 404, 'Project not found');
  }
}

Future<void> _handleDeleteProject(HttpRequest req, String id) async {
  db.projects.removeWhere((p) => p['id'] == id);
  await _sendJson(req, {'message': 'Deleted'});
}
