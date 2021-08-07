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
      {
        "avatar": "avatar.jpg",
        "name": "Student Shair",
        "favorite": false,
        "price": "£12",
        "ratings": 5
      },
      {
        "avatar": "avatar.jpg",
        "name": "Edirh Sahir",
        "favorite": false,
        "price": "£20",
        "ratings": 3
      },
      {
        "avatar": "avatar.jpg",
        "name": "Harry Sahir",
        "favorite": false,
        "price": "£12",
        "ratings": 4
      },
    ];
  }

  static userReviews() {
    return [
      {
        "avatar": "avatar.jpg",
        "name": "Very Puntual",
        "rate": 3,
        "text":
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
      },
      {
        "avatar": "avatar.jpg",
        "name": "Very Puntual",
        "rate": 3,
        "text":
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
      },
      {
        "avatar": "avatar.jpg",
        "name": "Very Puntual",
        "rate": 3,
        "text":
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
      },
    ];
  }

  static cvData() {
    return [
      {
        "icon": "file.png",
        "name": "Harry_Sahir_resume_final.pdf",
      },
      {
        "icon": "file.png",
        "name": "Harry_Sahir_resume_final.pdf",
      },
    ];
  }

  static disputeData() {
    return [
      {
        'closed': false,
        'title': 'Punctuality',
        'date': '12/03/2021',
        'description':
            'Lorem ipsum is placeholder text that are provided to the next time.'
      },
      {
        'closed': false,
        'title': 'Punctuality',
        'date': '12/03/2021',
        'description':
            'Lorem ipsum is placeholder text that are provided to the next time.'
      },
      {
        'closed': true,
        'title': 'Punctuality',
        'date': '12/03/2021',
        'description':
            'Lorem ipsum is placeholder text that are provided to the next time.'
      }
    ];
  }

  static locationData() {
    return [
      {"id": 1, "name": "London (Greater London)"},
      {"id": 2, "name": "London (Greater London)"},
      {"id": 3, "name": "London (Greater London)"},
      {"id": 4, "name": "London (Greater London)"},
      {"id": 5, "name": "London (Greater London)"},
      {"id": 6, "name": "London (Greater London)"},
      {"id": 7, "name": "London (Greater London)"},
      {"id": 8, "name": "London (Greater London)"},
      {"id": 9, "name": "London (Greater London)"},
      {"id": 10, "name": "London (Greater London)"},
      {"id": 11, "name": "London (Greater London)"},
      {"id": 12, "name": "London (Greater London)"},
      {"id": 13, "name": "London (Greater London)"},
      {"id": 14, "name": "London (Greater London)"},
      {"id": 15, "name": "London (Greater London)"}
    ];
  }

  static hourlyRateData() {
    return [
      {"id": 1, "name": "Less than £10"},
      {"id": 2, "name": "£10-£20"},
      {"id": 3, "name": "£20-£30"},
      {"id": 4, "name": "More than £30"}
    ];
  }
}
