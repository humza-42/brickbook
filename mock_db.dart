// Mock database for development
// This file is imported by mock_server.dart

final List<Map<String, dynamic>> projects = [
  {
    "id": "proj_001",
    "name": "DHA House Phase 2",
    "type": "residential",
    "totalBudget": 15000000,
    "totalSpent": 8200000,
    "location": "DHA Phase 6, Lahore",
    "startDate": "2025-01-15",
    "endDate": "2025-12-30",
    "status": "active",
    "description": "Two-story modern house with premium finishes",
    "currency": "PKR",
    "membersCount": 5,
    "createdAt": "2025-01-10T08:00:00Z",
    "phases": [
      {
        "id": "phase_001",
        "projectId": "proj_001",
        "name": "Foundation",
        "budgetAllocated": 2500000,
        "spent": 2400000,
        "startDate": "2025-01-20",
        "endDate": "2025-03-10",
        "status": "completed",
        "sortOrder": 1
      },
      {
        "id": "phase_002",
        "projectId": "proj_001",
        "name": "Structure",
        "budgetAllocated": 4000000,
        "spent": 3500000,
        "status": "active",
        "sortOrder": 2
      },
      {
        "id": "phase_003",
        "projectId": "proj_001",
        "name": "Roof",
        "budgetAllocated": 2000000,
        "spent": 1200000,
        "status": "active",
        "sortOrder": 3
      },
      {
        "id": "phase_004",
        "projectId": "proj_001",
        "name": "Finishing",
        "budgetAllocated": 4500000,
        "spent": 1100000,
        "status": "pending",
        "sortOrder": 4
      },
      {
        "id": "phase_005",
        "projectId": "proj_001",
        "name": "Electrical",
        "budgetAllocated": 1000000,
        "spent": 0,
        "status": "pending",
        "sortOrder": 5
      },
      {
        "id": "phase_006",
        "projectId": "proj_001",
        "name": "Plumbing",
        "budgetAllocated": 1000000,
        "spent": 0,
        "status": "pending",
        "sortOrder": 6
      },
      {
        "id": "phase_007",
        "projectId": "proj_001",
        "name": "Exterior",
        "budgetAllocated": 500000,
        "spent": 0,
        "status": "pending",
        "sortOrder": 7
      }
    ]
  },
  {
    "id": "proj_002",
    "name": "Commercial Plaza Bahria",
    "type": "commercial",
    "totalBudget": 25000000,
    "totalSpent": 18500000,
    "location": "Bahria Town, Lahore",
    "startDate": "2025-02-01",
    "endDate": "2025-11-15",
    "status": "active",
    "description": "4-story commercial plaza with parking",
    "currency": "PKR",
    "membersCount": 8,
    "createdAt": "2025-01-25T09:30:00Z",
    "phases": [
      {
        "id": "phase_101",
        "projectId": "proj_002",
        "name": "Foundation",
        "budgetAllocated": 5000000,
        "spent": 4800000,
        "status": "completed",
        "sortOrder": 1
      },
      {
        "id": "phase_102",
        "projectId": "proj_002",
        "name": "Structure",
        "budgetAllocated": 8000000,
        "spent": 7200000,
        "status": "active",
        "sortOrder": 2
      }
    ]
  },
  {
    "id": "proj_003",
    "name": "Old House Renovation",
    "type": "renovation",
    "totalBudget": 3500000,
    "totalSpent": 3800000,
    "location": "Gulberg, Lahore",
    "startDate": "2025-03-01",
    "endDate": "2025-07-30",
    "status": "on_hold",
    "description": "Complete renovation of 20-year old house",
    "currency": "PKR",
    "membersCount": 3,
    "createdAt": "2025-02-28T07:15:00Z",
    "phases": [
      {
        "id": "phase_201",
        "projectId": "proj_003",
        "name": "Demolition",
        "budgetAllocated": 500000,
        "spent": 600000,
        "status": "completed",
        "sortOrder": 1
      }
    ]
  }
];

final Map<String, dynamic> dashboardSummary = {
  "totalProjects": 3,
  "activeProjects": 2,
  "totalBudget": 43500000,
  "totalSpent": 30500000,
  "recentProjects": [],  // filled by server dynamically
  "monthlySpend": [
    {"month": "Jan", "amount": 1200000},
    {"month": "Feb", "amount": 4800000},
    {"month": "Mar", "amount": 5200000},
    {"month": "Apr", "amount": 6500000},
    {"month": "May", "amount": 7100000},
    {"month": "Jun", "amount": 4800000},
    {"month": "Jul", "amount": 2000000}
  ]
};
