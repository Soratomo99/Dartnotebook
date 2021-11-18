## Type animation

There are two types of Flutter amination: Drawing-based animations, Code-based animations.

### What

- Code-based animations are widget focused, rooted in standard layout and style primitives like rows, columns, colors, or text styles. They are not boring or simple, but at their heart, they tend or enhance a particular existing widget's appearance or transition rather than acting as a standalone widget in their own right.

- Drawing-based animations, in contranst, look like someone drew them. There are often standalone sprites like game characters or involve transformantions that would be challenging to express purely in code.

### Why

When using raster or vester image assets -> use a third-party tool: Rive or Lottie and export it to Flutter.

If you just change colors, shapes or positions, you use Code-based animations (write Flutter code).

## Two flavors

Implicit animations and Explicit animations.

### What

Implicit animations are animations widget that FLutter made ready to use with their property.

Explicite animations are animations that made by yourself. It need animation controller. They start animating when explicitly asked to.

### Why

Input and animations rely on simply setting a new value for some widget property and Flutter will take care of animating it from a current value to the new value. Using implicit animations.

When need to manage animation's life circle or make it by like implicit animations but with a little more. Using explicit animations.

## How to choice the animation

- Does it repeat forever ? (in the same screen)

- Is it discontinous ? (the values in a animation are discontinuos, example, a circle repeatedly grows small to large, never shrinks back down again, this case, the circle's size is discontinous)

- Do multiple widgets animate together ?

If yes to any of them, use exclicit animations.

Is there a build in widget ? If not, using TweenAnimationBuilder to create a custom implicit animation.

Is there a build-in explicit animation ? Want a standalone, custom explicit animation -> should extend animation widget, othewise, use AnimatedBuilder.

If have performance problems, and the solution is animating with CustomPainter. CustomPainter paints directly to the canvas without the standard widget build paradigm.

### Notice

Can use Implicit animations inside FutureBuilder and StreamBuilder.

Some Implicit animations:

- Align -> AnimatedAlign

- Container -> AnimatedContainer

- DefaultTextStyle -> AnimatedDefaultTextStyle

- Opacity -> AnimatedOpacity

- Padding -> AnimatedPadding

- PhysicalModel -> AnimatedPhysicalModel

- Positioned -> AnimatedPositioned

- PositionedDirectional -> AnimatedPositionedDirectional

- Theme -> AnimatedThemeSize -> AnimatedSize

The Transition animation widgets are extensions of AnimatedWidget.

### Some build-in Explicitly animated widgets:

Align..., DecoratedBox..., DefaultTextStyle..., Fade..., Positioned..., RelativePositioned..., Rotation..., Scale..., Size..., Side..., Status... + Transition

## Ticker

Ticker is an object call a function every frame. But it will run until the app end.

SingleTickerProviderStateMixin manage the ticker

https://youtu.be/PbcILiN8rbo?list=PLjxrf2q8roU2v6UqYlt_KPaXlnjbYySua
