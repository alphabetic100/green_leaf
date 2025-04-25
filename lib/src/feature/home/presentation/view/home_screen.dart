import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
static const String routeName = "/home-screen";
  @override
  Widget build(BuildContext context) {
    // Set status bar to transparent and icons to dark
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.95),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              const Color(0xFF00F97B).withOpacity(0.1), // Light green background with 10% opacity
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildHeader(),
                const SizedBox(height: 8),
                _buildEnvironmentStatus(),
                const SizedBox(height: 32),
                _buildSectionTitle('My Places'),
                const SizedBox(height: 16),
                _buildPlaceCard(
                  title: 'Home',
                  status: 'Good',
                  statusColor: const Color(0xFF47BA80),
                  value: '652',
                  unit: 'ppm',
                  change: '+13%',
                  isIncrease: true,
                  occupancy: 32,
                ),
                const SizedBox(height: 16),
                _buildPlaceCard(
                  title: 'Office',
                  status: 'Healthy',
                  statusColor: const Color(0xFF47BA80),
                  value: '447',
                  unit: 'ppm',
                  change: '-37%',
                  isIncrease: false,
                  occupancy: 40,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF47BA80),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning',
              style: TextStyle(
                color: Color(0xFF838383),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Ahmed Ariyan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9).withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Center(
              child: Icon(
                Icons.person,
                color: Colors.grey[800],
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEnvironmentStatus() {
    return Row(
      children: [
        const Text(
          'You are in a ',
          style: TextStyle(
            color: Color(0xFF838383),
            fontSize: 16,
          ),
        ),
        const Text(
          'healthy',
          style: TextStyle(
            color: Color(0xFF47BA80),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          ' environment',
          style: TextStyle(
            color: Color(0xFF838383),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildPlaceCard({
    required String title,
    required String status,
    required Color statusColor,
    required String value,
    required String unit,
    required String change,
    required bool isIncrease,
    required int occupancy,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      color: Color(0xFF47BA80),
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 4),
                    child: Text(
                      unit,
                      style: TextStyle(
                        color: const Color(0xFF47BA80).withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isIncrease ? const Color(0xFF47BA80) : const Color(0xFF47BA80).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      isIncrease ? Icons.arrow_upward : Icons.arrow_downward,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      change,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: List.generate(
                  3,
                  (index) => Positioned(
                    left: index * 20.0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    Text(
                      occupancy.toString(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'View Details',
                      style: TextStyle(
                        color: Color(0xFF47BA80),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF47BA80),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}