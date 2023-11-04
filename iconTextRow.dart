class _IconTextRowState extends State<IconTextRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon and Text Row'),
      ),
      body: IconTextRowWidget(),

    );
  }
}


class IconTextRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Make the row take the full width of the screen
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconTextItem(
              iconData: Icons.home,
              text: 'feedback',
            ),
          ),
          Expanded(
            child: IconTextItem(
              iconData: Icons.business,
              text: 'ehr',
            ),
          ),
          Expanded(
            child: IconTextItem(
              iconData: Icons.school,
              text: 'ambulance',
            ),
          ),
          Expanded(
            child: IconTextItem(
              iconData: Icons.person,
              text: 'appointment',
            ),
          ),
        ],
      ),
    );
  }
}

class IconTextItem extends StatelessWidget {
  final IconData iconData;
  final String text;

  IconTextItem({
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData, size: 40.0),
        Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
      ],
    );
  }
}
