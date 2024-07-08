import 'package:flutter/material.dart';
import 'package:my_portfolio/Decoration/style.dart';
import '../Constants/colors.dart';
import '../Constants/skill_items.dart';

class AboutHeading extends StatelessWidget {
  const AboutHeading({super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: end),
      duration: const Duration(milliseconds: 900),
      builder: (context, value, child) {
        return RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 0,
              fontSize: value,
            ),
            children: [
              WidgetSpan(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: const Duration(milliseconds: 200),
                  builder: (context, tweenValue, child) {
                    return  Text(
                      'About',
                      style: TextStyle(
                        fontSize: tweenValue,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    );
                  },
                ),
              ),
              TextSpan(
                text: ' ',
                style: TextStyle(
                  fontSize: value,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              WidgetSpan(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: const Duration(milliseconds: 200),
                  builder: (context, tweenValue, child) {
                    return ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: <Color>[Colors.pinkAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        'US',
                        style: TextStyle(
                          fontSize: tweenValue,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

  class HoverContainer extends StatefulWidget {
    final String imagePath;
    final String title;
    final String description;

    const HoverContainer({
      required this.imagePath,
      required this.title,
      required this.description,
      super.key,
    });

    @override
    State<HoverContainer> createState() => _HoverContainerState();
  }

  class _HoverContainerState extends State<HoverContainer> {
    bool _isHovered = false;

    void _onHover(bool isHovered) {
      setState(() {
        _isHovered = isHovered;
      });
    }
    final String emailUrl = 'mailto:s2.abhijeet@example.com';

    @override
    Widget build(BuildContext context) {
      return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform:
          _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
          decoration: kskillsDecoration,
          width: 240,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 25,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 13,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
              SizedBox(height: 45,),
              ElevatedButton(
                  onPressed: ()
                  {
                  },
                  style: ElevatedButton.styleFrom(
                    primary: CustomColor.whitePrimary,
                      onPrimary: CustomColor.whitePrimary,// Button color, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5, // Shadow depth
                  ),
                  child: Text("Reach Out",style: TextStyle(color: CustomColor.maincolor4),))
            ],
          ),
        ),
      );
    }
  }

class HoverContainer2 extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  const HoverContainer2({super.key, required this.imagePath, required this.title, required this.description});

  @override
  State<HoverContainer2> createState() => _HoverContainer2State();
}

class _HoverContainer2State extends State<HoverContainer2> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
        _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: kskillsDecoration,
        width: 250,
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 25,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 13,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            SizedBox(height: 45,),
            ElevatedButton(
                onPressed: ()
                {
                },
                style: ElevatedButton.styleFrom(
                  primary: CustomColor.whitePrimary,
                  onPrimary: CustomColor.whitePrimary,// Button color, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5, // Shadow depth
                ),
                child: Text("Reach Out",style: TextStyle(color: CustomColor.maincolor4),))
          ],
        ),
      ),
    );
  }
}
class HoverContainer3 extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  const HoverContainer3({super.key, required this.imagePath, required this.title, required this.description});

  @override
  State<HoverContainer3> createState() => _HoverContainer3State();
}

class _HoverContainer3State extends State<HoverContainer3> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
        _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: kskillsDecoration,
        width: 250,
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 25,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 13,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            SizedBox(height: 45,),
            ElevatedButton(
                onPressed: ()
                {
                },
                style: ElevatedButton.styleFrom(
                  primary: CustomColor.whitePrimary,
                  onPrimary: CustomColor.whitePrimary,// Button color, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5, // Shadow depth
                ),
                child: Text("Reach Out",style: TextStyle(color: CustomColor.maincolor4),))
          ],
        ),
      ),
    );
  }
}


