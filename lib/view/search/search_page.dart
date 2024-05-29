import 'package:flutter/material.dart';
import 'package:heatlh_tourism/utils/constants/app/color_strings.dart';
import 'package:intl/intl.dart';
import '../../new/all_offers_main/components/offer_card.dart';
import '../../utils/models/offer_model.dart';
import '../../utils/models/treatment_model.dart';
import '../../utils/services/api_service.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<OfferModelItems> _offers = [];
  List<OfferModelItems> _filteredOffers = [];
  List<TreatmentModelItems> _treatments = [];
  List<String> _recentSearches = [];
  TextEditingController _searchController = TextEditingController();
  APIService apiService = APIService();

  String? _selectedTreatment;
  RangeValues _priceRange = RangeValues(0, 10000);
  DateTimeRange? _dateRange;
  String? _sortOption;

  @override
  void initState() {
    super.initState();
    _fetchOffers();
    _fetchTreatments();
  }

  Future<void> _fetchOffers() async {
    try {
      var offers = await apiService.getAllOffers();
      setState(() {
        _offers = offers ?? [];
        _filteredOffers = _offers;
      });
    } catch (e) {
      // Handle errors here
    }
  }

  Future<void> _fetchTreatments() async {
    try {
      var treatments = await apiService.getAllTreatments();
      setState(() {
        _treatments = treatments ?? [];
      });
    } catch (e) {
      // Handle errors here
    }
  }

  void _filterOffers() {
    String query = _searchController.text;

    setState(() {
      _filteredOffers = _offers.where((offer) {
        bool matchesQuery = (offer.description
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ??
                false) ||
            (offer.title?.toLowerCase().contains(query.toLowerCase()) ?? false);

        bool matchesTreatment =
            _selectedTreatment == null || offer.treatment == _selectedTreatment;

        bool matchesPrice = (offer.price ?? 0) >= _priceRange.start &&
            (offer.price ?? 0) <= _priceRange.end;

        bool matchesDate = true;
        if (_dateRange != null) {
          DateTime startDate =
              DateFormat('yyyy-MM-dd').parse(offer.startDate ?? '1970-01-01');
          DateTime endDate =
              DateFormat('yyyy-MM-dd').parse(offer.endDate ?? '1970-01-01');
          matchesDate = startDate.isAfter(_dateRange!.start) &&
              endDate.isBefore(_dateRange!.end);
        }

        return matchesQuery && matchesTreatment && matchesPrice && matchesDate;
      }).toList();

      if (_sortOption != null) {
        if (_sortOption == 'Price: Low to High') {
          _filteredOffers
              .sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
        } else if (_sortOption == 'Price: High to Low') {
          _filteredOffers
              .sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
        } else if (_sortOption == 'Date: Newest First') {
          _filteredOffers.sort((a, b) => DateFormat('yyyy-MM-dd')
              .parse(b.startDate ?? '1970-01-01')
              .compareTo(
                  DateFormat('yyyy-MM-dd').parse(a.startDate ?? '1970-01-01')));
        } else if (_sortOption == 'Date: Oldest First') {
          _filteredOffers.sort((a, b) => DateFormat('yyyy-MM-dd')
              .parse(a.startDate ?? '1970-01-01')
              .compareTo(
                  DateFormat('yyyy-MM-dd').parse(b.startDate ?? '1970-01-01')));
        }
      }

      // If no filters are applied, show all offers
      if (query.isEmpty &&
          _selectedTreatment == null &&
          _priceRange == RangeValues(0, 10000) &&
          _dateRange == null &&
          _sortOption == null) {
        _filteredOffers = _offers;
      }
    });
  }

  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty && !_recentSearches.contains(query)) {
      setState(() {
        _recentSearches.add(query);
      });
    }
    _filterOffers();
  }

  void _openFilterModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Filter Options',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  DropdownButton<String>(
                    value: _selectedTreatment,
                    hint: Text('Select Treatment'),
                    items: _treatments.map((treatment) {
                      return DropdownMenuItem<String>(
                        value: treatment.name,
                        child: Text(treatment.name ?? 'Unknown'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() {
                        _selectedTreatment = value;
                      });
                    },
                  ),
                  if (_selectedTreatment != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setModalState(() {
                            _selectedTreatment = null;
                          });
                        },
                      ),
                    ),
                  SizedBox(height: 10),
                  Text(
                      'Price Range: ${_priceRange.start.round()} - ${_priceRange.end.round()}'),
                  RangeSlider(
                    values: _priceRange,
                    min: 0,
                    max: 10000,
                    divisions: 100,
                    labels: RangeLabels('${_priceRange.start.round()}',
                        '${_priceRange.end.round()}'),
                    onChanged: (values) {
                      setModalState(() {
                        _priceRange = values;
                      });
                    },
                  ),
                  if (_priceRange != RangeValues(0, 10000))
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setModalState(() {
                            _priceRange = RangeValues(0, 10000);
                          });
                        },
                      ),
                    ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () async {
                      DateTimeRange? picked = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setModalState(() {
                          _dateRange = picked;
                        });
                      }
                    },
                    child: Text(
                      _dateRange == null
                          ? 'Select Date Range'
                          : '${DateFormat('yyyy-MM-dd').format(_dateRange!.start)} - ${DateFormat('yyyy-MM-dd').format(_dateRange!.end)}',
                    ),
                  ),
                  if (_dateRange != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setModalState(() {
                            _dateRange = null;
                          });
                        },
                      ),
                    ),
                  SizedBox(height: 10),
                  // DropdownButton<String>(
                  //   value: _sortOption,
                  //   hint: Text('Sort By'),
                  //   items: <String>[
                  //     'Price: Low to High',
                  //     'Price: High to Low',
                  //     'Date: Newest First',
                  //     'Date: Oldest First',
                  //   ].map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (value) {
                  //     setModalState(() {
                  //       _sortOption = value;
                  //     });
                  //   },
                  // ),
                  // if (_sortOption != null)
                  //   Align(
                  //     alignment: Alignment.centerRight,
                  //     child: IconButton(
                  //       icon: Icon(Icons.clear),
                  //       onPressed: () {
                  //         setModalState(() {
                  //           _sortOption = null;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _filterOffers();
                    },
                    child: Text('Apply Filters'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Search Offers',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search offers by description...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchController.text.isEmpty
                          ? null
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                _filterOffers();
                              },
                            ),
                    ),
                    onChanged: (query) => _filterOffers(),
                    onSubmitted: _onSearchSubmitted,
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: _openFilterModal,
                  icon: Icon(
                    Icons.filter_list_rounded,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_recentSearches.isNotEmpty) ...[
              SizedBox(height: 20),
              Text('Recent Searches:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8.0,
                children: _recentSearches.map((search) {
                  return GestureDetector(
                    onTap: () {
                      _searchController.text = search;
                      _filterOffers();
                    },
                    child: Chip(label: Text(search)),
                  );
                }).toList(),
              ),
            ],
            Expanded(
              child: _filteredOffers.isEmpty
                  ? Center(child: Text('No offers found'))
                  : ListView.builder(
                      itemCount: _filteredOffers.length,
                      itemBuilder: (context, index) {
                        final offer = _filteredOffers[index];
                        return OfferCard(
                          offer: offer,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 100,
                            height: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   List<OfferModelItems> _offers = [];
//   List<OfferModelItems> _filteredOffers = [];
//   List<TreatmentModelItems> _treatments = [];
//   List<String> _recentSearches = [];
//   TextEditingController _searchController = TextEditingController();
//   APIService apiService = APIService();
//
//   String? _selectedTreatment;
//   RangeValues _priceRange = RangeValues(0, 10000);
//   DateTimeRange? _dateRange;
//   String? _sortOption;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchOffers();
//     _fetchTreatments();
//   }
//
//   Future<void> _fetchOffers() async {
//     try {
//       var offers = await apiService.getAllOffers();
//       setState(() {
//         _offers = offers ?? [];
//         _filteredOffers = _offers;
//       });
//     } catch (e) {
//       // Handle errors here
//     }
//   }
//
//   Future<void> _fetchTreatments() async {
//     try {
//       var treatments = await apiService.getAllTreatments();
//       setState(() {
//         _treatments = treatments ?? [];
//       });
//     } catch (e) {
//       // Handle errors here
//     }
//   }
//
//   void _filterOffers() {
//     String query = _searchController.text;
//
//     setState(() {
//       _filteredOffers = _offers.where((offer) {
//         bool matchesQuery = (offer.description
//                     ?.toLowerCase()
//                     .contains(query.toLowerCase()) ??
//                 false) ||
//             (offer.title?.toLowerCase().contains(query.toLowerCase()) ?? false);
//
//         bool matchesTreatment =
//             _selectedTreatment == null || offer.treatment == _selectedTreatment;
//
//         bool matchesPrice = (offer.price ?? 0) >= _priceRange.start &&
//             (offer.price ?? 0) <= _priceRange.end;
//
//         bool matchesDate = true;
//         if (_dateRange != null) {
//           DateTime startDate =
//               DateFormat('yyyy-MM-dd').parse(offer.startDate ?? '1970-01-01');
//           DateTime endDate =
//               DateFormat('yyyy-MM-dd').parse(offer.endDate ?? '1970-01-01');
//           matchesDate = startDate.isAfter(_dateRange!.start) &&
//               endDate.isBefore(_dateRange!.end);
//         }
//
//         return matchesQuery && matchesTreatment && matchesPrice && matchesDate;
//       }).toList();
//
//       if (_sortOption != null) {
//         if (_sortOption == 'Price: Low to High') {
//           _filteredOffers
//               .sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
//         } else if (_sortOption == 'Price: High to Low') {
//           _filteredOffers
//               .sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
//         } else if (_sortOption == 'Date: Newest First') {
//           _filteredOffers.sort((a, b) => DateFormat('yyyy-MM-dd')
//               .parse(b.startDate ?? '1970-01-01')
//               .compareTo(
//                   DateFormat('yyyy-MM-dd').parse(a.startDate ?? '1970-01-01')));
//         } else if (_sortOption == 'Date: Oldest First') {
//           _filteredOffers.sort((a, b) => DateFormat('yyyy-MM-dd')
//               .parse(a.startDate ?? '1970-01-01')
//               .compareTo(
//                   DateFormat('yyyy-MM-dd').parse(b.startDate ?? '1970-01-01')));
//         }
//       }
//     });
//   }
//
//   void _onSearchSubmitted(String query) {
//     if (query.isNotEmpty && !_recentSearches.contains(query)) {
//       setState(() {
//         _recentSearches.add(query);
//       });
//     }
//     _filterOffers();
//   }
//
//   void _openFilterModal() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setModalState) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('Filter Options',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 20),
//                   DropdownButton<String>(
//                     value: _selectedTreatment,
//                     hint: Text('Select Treatment'),
//                     items: _treatments.map((treatment) {
//                       return DropdownMenuItem<String>(
//                         value: treatment.name,
//                         child: Text(treatment.name ?? 'Unknown'),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setModalState(() {
//                         _selectedTreatment = value;
//                       });
//                     },
//                   ),
//                   if (_selectedTreatment != null)
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           setModalState(() {
//                             _selectedTreatment = null;
//                           });
//                         },
//                       ),
//                     ),
//                   SizedBox(height: 10),
//                   Text(
//                       'Price Range: ${_priceRange.start.round()} - ${_priceRange.end.round()}'),
//                   RangeSlider(
//                     values: _priceRange,
//                     min: 0,
//                     max: 10000,
//                     divisions: 100,
//                     labels: RangeLabels('${_priceRange.start.round()}',
//                         '${_priceRange.end.round()}'),
//                     onChanged: (values) {
//                       setModalState(() {
//                         _priceRange = values;
//                       });
//                     },
//                   ),
//                   if (_priceRange != RangeValues(0, 10000))
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           setModalState(() {
//                             _priceRange = RangeValues(0, 10000);
//                           });
//                         },
//                       ),
//                     ),
//                   SizedBox(height: 10),
//                   TextButton(
//                     onPressed: () async {
//                       DateTimeRange? picked = await showDateRangePicker(
//                         context: context,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2101),
//                       );
//                       if (picked != null) {
//                         setModalState(() {
//                           _dateRange = picked;
//                         });
//                       }
//                     },
//                     child: Text(
//                       _dateRange == null
//                           ? 'Select Date Range'
//                           : '${DateFormat('yyyy-MM-dd').format(_dateRange!.start)} - ${DateFormat('yyyy-MM-dd').format(_dateRange!.end)}',
//                     ),
//                   ),
//                   if (_dateRange != null)
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           setModalState(() {
//                             _dateRange = null;
//                           });
//                         },
//                       ),
//                     ),
//                   SizedBox(height: 10),
//                   DropdownButton<String>(
//                     value: _sortOption,
//                     hint: Text('Sort By'),
//                     items: <String>[
//                       'Price: Low to High',
//                       'Price: High to Low',
//                       'Date: Newest First',
//                       'Date: Oldest First',
//                     ].map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setModalState(() {
//                         _sortOption = value;
//                       });
//                     },
//                   ),
//                   if (_sortOption != null)
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           setModalState(() {
//                             _sortOption = null;
//                           });
//                         },
//                       ),
//                     ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       _filterOffers();
//                     },
//                     child: Text('Apply Filters'),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.kPrimary,
//         centerTitle: true,
//         title: Text(
//           'Search Offers',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
//         child: Column(
//           children: [
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search offers by description...',
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: _searchController.text.isEmpty
//                     ? null
//                     : IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           _filterOffers();
//                         },
//                       ),
//               ),
//               onChanged: (query) => _filterOffers(),
//               onSubmitted: _onSearchSubmitted,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _openFilterModal,
//               child: Text('Filter'),
//             ),
//             SizedBox(height: 20),
//             if (_recentSearches.isNotEmpty) ...[
//               SizedBox(height: 20),
//               Text('Recent Searches:',
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//               Wrap(
//                 spacing: 8.0,
//                 children: _recentSearches.map((search) {
//                   return GestureDetector(
//                     onTap: () {
//                       _searchController.text = search;
//                       _filterOffers();
//                     },
//                     child: Chip(label: Text(search)),
//                   );
//                 }).toList(),
//               ),
//             ],
//             Expanded(
//               child: _filteredOffers.isEmpty
//                   ? Center(child: Text('No offers found'))
//                   : ListView.builder(
//                       itemCount: _filteredOffers.length,
//                       itemBuilder: (context, index) {
//                         final offer = _filteredOffers[index];
//                         return OfferCard(
//                           offer: offer,
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ShimmerList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child: ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return Container(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             height: 160,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AspectRatio(
//                   aspectRatio: 1.02,
//                   child: Shimmer.fromColors(
//                     baseColor: Colors.grey[300]!,
//                     highlightColor: Colors.grey[100]!,
//                     child: Container(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Shimmer.fromColors(
//                           baseColor: Colors.grey[300]!,
//                           highlightColor: Colors.grey[100]!,
//                           child: Container(
//                             width: double.infinity,
//                             height: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Shimmer.fromColors(
//                           baseColor: Colors.grey[300]!,
//                           highlightColor: Colors.grey[100]!,
//                           child: Container(
//                             width: double.infinity,
//                             height: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Shimmer.fromColors(
//                           baseColor: Colors.grey[300]!,
//                           highlightColor: Colors.grey[100]!,
//                           child: Container(
//                             width: 100,
//                             height: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
