import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';

class FakeData {
  static jobListingData() {
    return [
      {
        "name": "Talwar's Residency",
        "description": "Express security",
        "price_per_hour": "£20-\$25",
        "location": [
          {
            "name": "KITCHENER",
            "icon": Icons.pin_drop_outlined,
            "color": KColor.purple
          },
          {"name": "7 DAYS LEFT", "icon": Icons.circle, "color": KColor.orange},
        ],
        "avatar": [
          {"index": 0, "name": "Harry Sahir", "photo": "avatar.jpg"},
          {"index": 1, "name": "Harry Sahir", "photo": "avatar.jpg"},
          {"index": 2, "name": "Harry Sahir", "photo": "avatar.jpg"},
          {"index": 3, "name": "Harry Sahir", "photo": "avatar.jpg"}
        ]
      },
      {
        "name": "Zehr's Grocery",
        "description": "Express security",
        "price_per_hour": "£20-\$25",
        "location": [
          {
            "name": "KITCHENER",
            "icon": Icons.pin_drop_outlined,
            "color": KColor.purple
          },
          {"name": "7 DAYS LEFT", "icon": Icons.circle, "color": KColor.orange},
        ],
        "avatar": [
          {"index": 0, "name": "Harry Sahir", "photo": "avatar.jpg"},
          {"index": 1, "name": "Harry Sahir", "photo": "avatar.jpg"},
          {"index": 2, "name": "Harry Sahir", "photo": "avatar.jpg"}
        ]
      }
    ];
  }

  static savedDraftsData() {
    return [
      {
        "name": "Talwar's Residency",
        "description": "Express security",
        "price_per_hour": "£20-\$25",
        "location": [
          {
            "name": "KITCHENER",
            "icon": Icons.pin_drop_outlined,
            "color": KColor.purple
          },
        ],
      },
      {
        "name": "Talwar's Residency",
        "description": "",
        "price_per_hour": "£20-\$25",
        "location": [
          {
            "name": "KITCHENER",
            "icon": Icons.pin_drop_outlined,
            "color": KColor.purple
          },
        ],
      },
    ];
  }

  static financesData() {
    return [
      {
        "name": "Talwar's Residency",
        "type": "CONTRACT",
        "date": "15th JAN, 2021",
        "description": "Sameer Mahajan",
        "price": "£130.99",
        "stars": 4,
        "details": "invoice",
        "avatar": "avatar.jpg",
      },
      {
        "name": "Talwar's Residency",
        "type": "CONTRACT",
        "date": "15th JAN, 2021",
        "description": "Sameer Mahajan",
        "price": "£130.99",
        "stars": 4,
        "details": "invoice",
        "avatar": "avatar.jpg",
      },
      {
        "name": "Talwar's Residency",
        "type": "CONTRACT",
        "date": "15th JAN, 2021",
        "description": "Harry Sahir",
        "price": "£130.99",
        "stars": 4,
        "details": "invoice",
        "avatar": "avatar.jpg",
      },
      {
        "name": "Zehr's Grocery",
        "type": "CONTRACT",
        "date": "15th JAN, 2021",
        "description": "Sameer Mahajan",
        "price": "£130.99",
        "stars": 4,
        "details": "invoice",
        "avatar": "avatar.jpg",
      },
    ];
  }

  static inboxData() {
    return [
      {
        "name": "Talwar's Residency",
        "description": "Harry Sahir",
        "date": "6:58 PM",
        "avatar": "avatar.jpg",
        "message":
            "Hi, this is Harry, I am looking for your work and it's great. Congratulations!"
      },
      {
        "name": "Zehr's Grocery",
        "description": "Jai Prakash",
        "date": "6:58 PM",
        "avatar": "avatar.jpg",
        "message":
            "Hi, this is Jai, I am looking for your work and it's great. Congratulations!"
      },
      {
        "name": "Talwar's Residency",
        "description": "Tim Hortons",
        "date": "6:58 PM",
        "avatar": "avatar.jpg",
        "message":
            "Hi, this is Tim, I am looking for your work and it's great. Congratulations!"
      },
    ];
  }

  static exploreLabels() {
    return [
      {"icon": Icons.pin_drop_outlined, "name": "Location"},
      {"icon": Icons.filter, "name": "Filter"}
    ];
  }

  static exploreCards() {
    return [
      {
        "avatar": "avatar.jpg",
        "name": "Michelle Price",
        "location": "WATERLOO",
        "color": KColor.primary,
        "ratings": 4
      },
      {
        "avatar": "avatar.jpg",
        "name": "Michelle Price",
        "location": "WATERLOO",
        "color": KColor.purple,
        "ratings": 4
      },
    ];
  }

  static exploreMembers() {
    return [
      {
        "avatar": "avatar.jpg",
        "name": "Harry Sahir",
        "favorite": false,
        "price": "£12",
        "ratings": 4
      },
    ];
  }
}
