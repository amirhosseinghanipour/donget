import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';

class GaugeChart extends StatelessWidget {
  final double defiPercentage;
  final double ethereumPercentage;

  const GaugeChart({
    super.key,
    required this.defiPercentage,
    required this.ethereumPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkCardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusXL),
      ),
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: AppDimensions.gaugeChartBottomSpacing),
          _buildChart(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(AppDimensions.spacingXL),
      child: Text("Defi to Ethereum Ratio", style: AppTextStyles.headingSmall),
    );
  }

  Widget _buildChart() {
    return Center(
      child: Builder(
        builder: (context) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [_buildChartCanvas(), _buildChartLegend()],
          );
        },
      ),
    );
  }

  Widget _buildChartCanvas() {
    return SizedBox(
      width: AppDimensions.chartWidth,
      height: AppDimensions.chartHeight,
      child: CustomPaint(
        painter: GaugeChartPainter(
          defiPercentage: defiPercentage,
          ethereumPercentage: ethereumPercentage,
        ),
        size: const Size(AppDimensions.chartWidth, AppDimensions.chartHeight),
      ),
    );
  }

  Widget _buildChartLegend() {
    return Positioned(
      bottom: AppDimensions.gaugeChartLegendBottomPosition,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLegendItem(ethereumPercentage, "Ethereum", AppColors.ethereum),
          const SizedBox(height: AppDimensions.gaugeChartLegendSpacing),
          _buildLegendItem(defiPercentage, "DeFi", AppColors.defi),
        ],
      ),
    );
  }

  Widget _buildLegendItem(double percentage, String label, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("${percentage.toInt()}%", style: AppTextStyles.chartPercentage),
        const SizedBox(width: AppDimensions.spacingS),
        Container(
          padding: const EdgeInsets.only(
            left: AppDimensions.spacingL,
            right: AppDimensions.spacingXL,
          ),
          decoration: BoxDecoration(
            color: AppColors.chipBackground,
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusXXXL),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: AppDimensions.gaugeChartLegendDotSize,
                height: AppDimensions.gaugeChartLegendDotSize,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.darkCardBackground,
                    width: AppDimensions.gaugeChartLegendBorderWidth,
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.spacingS),
              Text(label, style: AppTextStyles.chartLabel),
            ],
          ),
        ),
      ],
    );
  }
}

class GaugeChartPainter extends CustomPainter {
  final double defiPercentage;
  final double ethereumPercentage;

  GaugeChartPainter({
    required this.defiPercentage,
    required this.ethereumPercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = AppDimensions.chartStrokeWidth;
    final radius = size.width / 2 - strokeWidth;
    final gapSize = AppDimensions.chartGapSize;
    final backgroundOffset = AppDimensions.chartBackgroundOffset;

    final center = Offset(size.width / 2, size.height / 2);

    _drawBackgroundArc(canvas, center, radius, backgroundOffset);
    _drawDataArcs(canvas, center, radius, gapSize);
  }

  void _drawBackgroundArc(
    Canvas canvas,
    Offset center,
    double radius,
    double backgroundOffset,
  ) {
    final bgPaint = Paint()
      ..color = AppColors.chipBackground
      ..strokeWidth = AppDimensions.chartStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - backgroundOffset),
      math.pi + 0.05,
      math.pi - 0.1,
      false,
      bgPaint,
    );
  }

  void _drawDataArcs(
    Canvas canvas,
    Offset center,
    double radius,
    double gapSize,
  ) {
    final gapRadians = (gapSize / radius) * 2;
    final totalPercentage = defiPercentage + ethereumPercentage;
    final availableRadians = math.pi - gapRadians;

    final defiRadians = (defiPercentage / totalPercentage) * availableRadians;
    final ethRadians =
        (ethereumPercentage / totalPercentage) * availableRadians;

    _drawDefiArc(canvas, center, radius, defiRadians);
    _drawEthereumArc(
      canvas,
      center,
      radius,
      defiRadians,
      gapRadians,
      ethRadians,
    );
  }

  void _drawDefiArc(
    Canvas canvas,
    Offset center,
    double radius,
    double defiRadians,
  ) {
    final defiPaint = Paint()
      ..color = AppColors.defi
      ..strokeWidth = AppDimensions.chartStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      defiRadians,
      false,
      defiPaint,
    );
  }

  void _drawEthereumArc(
    Canvas canvas,
    Offset center,
    double radius,
    double defiRadians,
    double gapRadians,
    double ethRadians,
  ) {
    final ethPaint = Paint()
      ..color = AppColors.ethereum
      ..strokeWidth = AppDimensions.chartStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi + defiRadians + gapRadians,
      ethRadians,
      false,
      ethPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
