import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/models/product_list.dart';

class ProductFilters extends StatefulWidget {
  const ProductFilters({Key? key}) : super(key: key);

  @override
  State<ProductFilters> createState() => _ProductFiltersState();
}

class _ProductFiltersState extends State<ProductFilters> {
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Wrap(
        spacing: 15,
        children: [
          FilterChip(
            label: const Text("All"),
            selected: _selectedFilter == 0,
            onSelected: (bool value) {
              if (value) setState(() => _selectedFilter = 0);
              _buildProductList(_selectedFilter);
            },
          ),
          FilterChip(
            label: const Text("Men"),
            selected: _selectedFilter == 1,
            onSelected: (bool value) {
              if (value) setState(() => _selectedFilter = 1);
              _buildProductList(_selectedFilter);
            },
          ),
          FilterChip(
            label: const Text("Women"),
            selected: _selectedFilter == 2,
            onSelected: (bool value) {
              if (value) setState(() => _selectedFilter = 2);
              _buildProductList(_selectedFilter);
            },
          ),
          FilterChip(
            label: const Text("Kid"),
            selected: _selectedFilter == 3,
            onSelected: (bool value) {
              if (value) setState(() => _selectedFilter = 3);
              _buildProductList(_selectedFilter);
            },
          ),
          FilterChip(
            label: const Text("Red"),
            selected: _selectedFilter == 4,
            onSelected: (bool value) {
              if (value) setState(() => _selectedFilter = 4);
              _buildProductList(_selectedFilter);
            },
          ),
          FilterChip(
            label: const Text("Blue"),
            selected: _selectedFilter == 5,
            onSelected: (bool value) {
              if (value) setState(() => _selectedFilter = 5);
              _buildProductList(_selectedFilter);
            },
          ),
          FilterChip(
            label: const Text("Purple"),
            selected: _selectedFilter == 6,
            onSelected: (bool value) {
              if (value) setState(() => _selectedFilter = 6);
              _buildProductList(_selectedFilter);
            },
          ),
        ],
      ),
    );
  }

  _buildProductList(int selectedFilter) {
    String? filter;
    if (selectedFilter == 1) {
      filter = "Men";
    } else if (selectedFilter == 2) {
      filter = "Women";
    } else if (selectedFilter == 3) {
      filter = "Kid";
    } else if (selectedFilter == 4) {
      filter = "Red";
    } else if (selectedFilter == 5) {
      filter = "Blue";
    } else if (selectedFilter == 6) {
      filter = "Purple";
    }
    context.read<ProductList>().filter(filter);
  }
}
