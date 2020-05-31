import 'package:flutter/material.dart';

class FeePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeeState();
}

class _FeeState extends State<FeePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                TapboxA(),
                ParentWidget(),
                ParentCWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}):super(key:key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            _active ? "TapboxA Active" : "TapboxA Inactive"
          ),
        ),
        margin: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700]: Colors.grey[600],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
      onTap: _handleTap,

    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {

  /// When creating API, consider using the @required annotation
  /// for any parameters that your code relies on. To use @required,
  /// import the foundation library (which re-exports Dart’s meta.dart library):
  TapboxB({Key key, this.active: false, @required this.onChanged}):
      super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
              active ? "TapboxB Active" : "TapboxB Inactive"
          ),
        ),
        margin: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightBlueAccent[700]: Colors.grey[600],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}

class ParentCWidget extends StatefulWidget {
  @override
  _ParentCWidgetState createState() => _ParentCWidgetState();
}

class _ParentCWidgetState extends State<ParentCWidget> {

  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TapBoxC(
        active: _active,
        onChanged: _handleTapboxChanged),
    );
  }
}

class TapBoxC extends StatefulWidget {

  TapBoxC({Key key, this.active: false, @required this.onChanged})
      :super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails tapDownDetails) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails tapUpDetails) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    setState(() {
      /// use the widget
      widget.onChanged(!widget.active);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
              widget.active ? "TapboxC Active" : "TapboxC Inactive"
          ),
        ),
        margin: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.limeAccent[700]: Colors.grey[600],
          border: _highlight
              ? Border.all(
                   color: Colors.red[700],
                   width: 10.0,
                )
              : null,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}





