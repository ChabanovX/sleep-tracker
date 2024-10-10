import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_tracker_app/data/styles.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: Container(
          // Apply gradient background similar to home page
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CupertinoColors.white,
                CupertinoColors.white,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section for setting alarms
                  Text(
                    'Set Alarm',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
              
                  // Bed time setting
                  _buildTimeSettingRow(
                    context,
                    'Set Bed Time',
                    CupertinoIcons.moon_fill,
                    '10:00 PM',
                  ),
                  const SizedBox(height: 20),
              
                  // Wake up time setting
                  _buildTimeSettingRow(
                    context,
                    'Set Wake Up Time',
                    CupertinoIcons.bell_fill,
                    '6:00 AM',
                  ),
                  const SizedBox(height: 30),
              
                  // Section for Active Days
                  Text(
                    'Active Days:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildActiveDaysRow(),
              
                  const SizedBox(height: 30),
              
                  // Section for checking sleep stats
                  Text(
                    'Check Sleep on a Day:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSleepStatsRow(context),
              
                  const SizedBox(height: 30),
              
                  // Dark Mode Toggle
                                  Text(
                    'Other Settings:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildToggleOptionRow(
                    context,
                    'Dark Mode',
                    CupertinoIcons.moon_fill,
                    false, // Hardcoded to true, change for logic
                  ),
                  const SizedBox(height: 20),
              
                  // Sound Settings
                  _buildOptionRow(
                    context,
                    'Alarm Sound',
                    CupertinoIcons.volume_up,
                    'Classic',
                  ),
                  const SizedBox(height: 20),
              
                  // Vibration Toggle
                  _buildToggleOptionRow(
                    context,
                    'Vibration',
                    CupertinoIcons.device_phone_portrait,
                    true, // Hardcoded to false, change for logic
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Row to set times (bed or wake-up)
  Widget _buildTimeSettingRow(
      BuildContext context, String label, IconData icon, String time) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: CupertinoColors.activeBlue),
          const SizedBox(width: 10),
          Text(label, style: TextStyle(fontSize: 18)),
          Spacer(),
          GestureDetector(
            onTap: () {
              // Logic to set the time
            },
            child: Text(
              time,
              style: TextStyle(
                fontSize: 18,
                color: CupertinoColors.activeBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Row of active days (toggle buttons for each day)
  Widget _buildActiveDaysRow() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map(
            (day) => GestureDetector(
              onTap: () {
                // Toggle the active day (logic here)
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.activeBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  day,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  // Row to check sleep stats for a specific day
  Widget _buildSleepStatsRow(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Logic to check sleep stats
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Icon(CupertinoIcons.clock_fill, color: CupertinoColors.activeBlue),
            const SizedBox(width: 10),
            Text('Check sleep duration', style: TextStyle(fontSize: 18)),
            Spacer(),
            Text(
              'View Stats',
              style: TextStyle(
                fontSize: 18,
                color: CupertinoColors.activeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Option row for sound settings or other options
  Widget _buildOptionRow(
      BuildContext context, String label, IconData icon, String currentValue) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: CupertinoColors.activeBlue),
          const SizedBox(width: 10),
          Text(label, style: TextStyle(fontSize: 18)),
          Spacer(),
          Text(
            currentValue,
            style: TextStyle(
              fontSize: 18,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ],
      ),
    );
  }

  // Toggle option (e.g., dark mode, vibration)
  Widget _buildToggleOptionRow(
      BuildContext context, String label, IconData icon, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: CupertinoColors.activeBlue),
          const SizedBox(width: 10),
          Text(label, style: TextStyle(fontSize: 18)),
          Spacer(),
          CupertinoSwitch(
            value: isActive,
            onChanged: (bool value) {
              // Toggle dark mode, vibration, etc.
            },
          ),
        ],
      ),
    );
  }
}
