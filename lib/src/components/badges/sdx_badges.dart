import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class SdxBadges extends StatelessWidget {
  SdxBadges({
    Key? key,
    this.badgeContent,
    this.child,
    this.badgeColor = Colors.red,
    this.elevation = 2,
    this.toAnimate = true,
    this.position,
    this.shape = BadgeShape.circle,
    this.padding = const EdgeInsets.all(5.0),
    this.animationDuration = const Duration(milliseconds: 500),
    this.borderRadius = BorderRadius.zero,
    this.alignment = Alignment.center,
    this.animationType = BadgeAnimationType.slide,
    this.showBadge = true,
    this.ignorePointer = false,
    this.borderSide = BorderSide.none,
    this.stackFit = StackFit.loose,
    this.gradient,
  }) : super(key: key);

  /// It defines the widget that will be wrapped by this [badgeContent].
  final Widget? child;

  /// This defines alignment for your [child].
  ///
  /// The default value is [Alignment.center].
  final AlignmentGeometry alignment;

  /// Allows to set custom position of [badgeContent].
  /// according to [child].
  ///
  /// If [child] is null, it doesn't make sense to use it.
  final BadgePosition? position;

  /// Content of this badge widget
  final Widget? badgeContent;

  /// Can make your [badgeContent] interactive.
  ///
  /// The default value is false.
  final bool ignorePointer;

  /// Allows you to set the color for this [badgeContent].
  final Color badgeColor;

  /// Allows you to set the gradient color for this [badgeContent]
  final Gradient? gradient;

  /// This controls the size of the shadow below the material and the opacity.
  /// of the elevation overlay color if it is applied.
  final double elevation;

  /// This controls animation status.
  ///
  /// The default value is true.
  /// If true, the animation is allowed, if false, the animation is forbidden.
  ///
  /// See also:
  ///
  /// * [animationDuration]
  /// * [animationType]
  final bool toAnimate;

  /// This controls the duration of the animation.
  ///
  /// The default value is Duration(milliseconds: 500).
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationType]
  final Duration animationDuration;

  /// This controls the type of the animation.
  ///
  /// The default value is [BadgeAnimationType.slide].
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationDuration]
  final BadgeAnimationType animationType;

  /// Allows to set the shape to this [badgeContent].
  ///
  /// The default value is [BadgeShape.circle].
  final BadgeShape shape;

  /// Allows to set border side to this [badgeContent].
  ///
  /// The default value is [BorderSide.none].
  final BorderSide borderSide;

  /// Allows to edit fit parameter to [Stack] widget.
  ///
  /// The default value is [StackFit.loose].
  final StackFit stackFit;

  /// Allows to set border radius to this [badgeContent].
  ///
  /// The default value is [BorderRadius.zero].
  ///
  /// See also:
  ///
  /// * [borderSide]
  final BorderRadiusGeometry borderRadius;

  /// Specify padding for [badgeContent].
  ///
  /// The default value is EdgeInsets.all(5.0).
  final EdgeInsetsGeometry padding;

  /// Allows you to hide or show [badgeContent].
  ///
  /// The default value is true.
  /// If true, the badge will be displayed, if false, it doesn't.
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: badgeContent,
      position: position,
      child: child,
      showBadge: showBadge,
      shape: BadgeShape.circle,
    );
  }
}
