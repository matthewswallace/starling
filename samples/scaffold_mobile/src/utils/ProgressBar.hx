package utils
{
import flash.display.GradientType;
import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.Matrix;

public class ProgressBar extends Sprite
{
    private var mBackground:Shape;
    private var mBar:Shape;

    public function ProgressBar(width:Int, height:Int)
    {
        init(width, height);
    }

    private function init(width:Int, height:Int):Void
    {
        var padding:Float = height * 0.2;
        var cornerRadius:Float = padding * 2;

        // create black rounded box for background

        mBackground = new Shape();
        mBackground.graphics.beginFill(0x0, 0.5);
        mBackground.graphics.drawRoundRect(0, 0, width, height, cornerRadius, cornerRadius);
        mBackground.graphics.endFill();
        addChild(mBackground);

        // create progress bar shape

        var barWidth:Float  = width  - 2 * padding;
        var barHeight:Float = height - 2 * padding;
        var barMatrix:Matrix = new Matrix();
        barMatrix.createGradientBox(barWidth, barHeight, Math.PI / 2);

        mBar = new Shape();
        mBar.graphics.beginGradientFill(GradientType.LINEAR,
            [0xeeeeee, 0xaaaaaa], [1, 1], [0, 255], barMatrix);
        mBar.graphics.drawRect(0, 0, barWidth, barHeight);
        mBar.x = padding;
        mBar.y = padding;
        mBar.scaleX = 0.0;
        addChild(mBar);
    }

    public function get ratio():Float { return mBar.scaleX; }
    public function set ratio(value:Float):Void
    {
        mBar.scaleX = Math.max(0.0, Math.min(1.0, value));
    }
}
}