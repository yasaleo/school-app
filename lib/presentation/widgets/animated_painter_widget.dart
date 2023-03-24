
import 'package:flutter/material.dart';

class CustomColorPainterAnimated extends StatefulWidget {
  const CustomColorPainterAnimated({super.key});

  @override
  State<CustomColorPainterAnimated> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomColorPainterAnimated>
    with TickerProviderStateMixin {
  List<Color> colorsList = [
    Colors.red,
    Colors.yellow,
    Colors.cyan,
    Colors.green,
    Colors.teal,
    Colors.orangeAccent,
  ];
  int colorIndex = 0;
  late Animation<Color?> _colorAnimation;
  late AnimationController _colorController;



  bool reverse = false;
  @override
  void initState() {
    initColorAnimation();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (colorIndex!=0) {
          
        initColorAnimation();
        }
        _colorController.forward();
     
      },
      child: SizedBox(
        child: CustomPaint(
          foregroundPainter: CircleProgress(
            col: _colorAnimation.value!,
          ),
          child: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
           
            ),
            child: const Icon(
              Icons.color_lens,
              color: Colors.white54,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _colorController.dispose();

    super.dispose();
  }

  void initColorAnimation() {
    
    
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  

    _colorAnimation = ColorTween(
      begin: colorsList[colorIndex],
      end: colorsList[colorIndex + 1],
    ).animate(_colorController)
      ..addListener(() {
        setState(() {});

        reverseLogic();
      });
  }



  void reverseLogic() {
    
    if (_colorController.isCompleted) {
      if (colorIndex<=colorsList.length-3) {
        
      colorIndex++;
      
      }else {
        colorIndex=0;
        initColorAnimation();
        

        
      }
    } 
  }
}

class CircleProgress extends CustomPainter {
  Color col;

  CircleProgress({
    required this.col,
  });
  @override
  void paint(Canvas canvas, Size size) {
    //    paint circle
    Paint circle = Paint()
      ..strokeWidth = 10
      ..color = col
      ..style = PaintingStyle.stroke
      ..maskFilter= const MaskFilter.blur(BlurStyle.outer, 10);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 55;

    canvas.drawCircle(center, radius, circle);

    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
