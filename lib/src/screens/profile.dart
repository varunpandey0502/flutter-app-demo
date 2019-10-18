import 'package:demo/src/bloc_providers/user_bloc_provider.dart';
import 'package:demo/src/blocs/user_bloc.dart';

import 'package:demo/src/models/usage_statistics.dart';
import 'package:demo/src/models/user.dart';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  BuildContext _buildContext;
  UserBloc _userBloc;

  User demoUser;
  UsageStatistics demoUsageStatistics;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    _userBloc = UserBlocProvider.of(context);

    demoUser = _userBloc.demoUser;
    demoUsageStatistics = _userBloc.demoUsageStatistics;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'PROFILE',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.white,
            ),
            title: Text(
              'Safe',
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            title: Text(
              'Report Issue',
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.white,
            ),
            title: Text(
              'Unsafe',
              style: Theme.of(context).textTheme.body1,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 24,
          right: 24,
        ),
        child: SingleChildScrollView(
          child: _buildBody(),
        ),
      ),
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        _buildUserDetail(),
        SizedBox(
          height: 20,
        ),
        _buildUsageStatistics(),
        SizedBox(
          height: 20,
        ),
        _buildProfileLevel(),
        SizedBox(
          height: 20,
        ),
        _buildReportsSection(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _buildUserDetail() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    style: Theme.of(_buildContext).textTheme.subhead,
                    children: [
                      TextSpan(text: demoUser.firstName),
                      TextSpan(text: ' '),
                      TextSpan(text: demoUser.lastName),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text.rich(
                  TextSpan(
                    style: Theme.of(_buildContext).textTheme.subtitle,
                    children: [
                      TextSpan(text: demoUser.role),
                      TextSpan(text: ' | '),
                      TextSpan(text: demoUser.branchName),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Hi! My name is John. I\'m a smart store supervisor from Victoria. I enjoy managing inventory and  ensuring ordrs are met.',
        ),
      ],
    );
  }

  _buildUsageStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildUsageStatisticsContainer(
            demoUsageStatistics.numberOfSubmissions.toString(), 'Reports'),
        _buildUsageStatisticsContainer(demoUsageStatistics.kudosGiven, 'Kudos'),
        _buildUsageStatisticsContainer(
            demoUsageStatistics.totalPoints.toString(), 'Points'),
      ],
    );
  }

  _buildUsageStatisticsContainer(String title, String subtitle) {
    return Container(
      color: Theme.of(_buildContext).highlightColor,
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Theme.of(_buildContext).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Theme.of(_buildContext).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _buildProfileLevel() {
    return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 10.0,
        children: _userBloc.levels.map((String level) {
          return new GridTile(
              footer: Center(
                child: Text(
                  level,
                  style: Theme.of(_buildContext).textTheme.body2,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2.0), // borde width
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF), // border color
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: level == _userBloc.usageStatistics.level
                          ? Colors.amber
                          : Theme.of(_buildContext).disabledColor,
                      child: Image.asset(
                        'assets/images/trophy.png',
                        height: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ));
        }).toList());
  }

  _buildReportsSection() {
    return Container(
      height: 110,
      color: Theme.of(_buildContext).indicatorColor,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildReportsTitleContainer('Open Reports'),
              _buildReportsTitleContainer('All Reports'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildReportsCountContainer('10', 10),
              _buildReportsCountContainer('90', 10),
            ],
          ),
        ],
      ),
    );
  }

  _buildReportsTitleContainer(String title) {
    return Container(
      width: 120,
      height: 30,
      color: Colors.orange[200],
      child: Center(
        child: Text(
          title,
          style: Theme.of(_buildContext).primaryTextTheme.body2,
        ),
      ),
    );
  }

  _buildReportsCountContainer(String count, double margin) {
    return Container(
      margin: EdgeInsets.only(left: margin, top: margin, right: margin),
      height: 60,
      width: 100,
      color: Theme.of(_buildContext).highlightColor,
      child: Center(
        child: Text(
          count,
          style: Theme.of(_buildContext).primaryTextTheme.display1,
        ),
      ),
    );
  }
}
