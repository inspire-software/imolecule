/*
 * Copyright (c) 2010.
 * Author: Denis Pavlov
 * Web: http://www.inspire-software.com/
 * iMolecule is an open source projects that is distributed on AS IS basis with no warranty under Lesser GPL or MIT license
 */

package dp.flex.imol {
import org.papervision3d.core.geom.renderables.Vertex3D;
import org.papervision3d.core.math.Number3D;

public class Math3D {

    public static function add(original:Number3D, x:Number = 0, y:Number = 0, z:Number = 0, multiplier:Number = 1):Number3D {
        return new Number3D(original.x + x * multiplier, original.y + y * multiplier, original.z + z * multiplier);
    }

    public static function point(x:Number, y:Number, z:Number, multiplier:Number = 1):Number3D {
        return new Number3D(x * multiplier, y * multiplier, z * multiplier);
    }

    public static function center(from:Number3D, to:Number3D):Number3D {
        var x:Number = to.x + from.x;
        var y:Number = to.y + from.y;
        var z:Number = to.z + from.z;
        return new Number3D(x == 0 ? 0 : x / 2, y == 0 ? 0 : y / 2, z == 0 ? 0 : z / 2);
    }

    public static function length(from:Number3D, to:Number3D):Number {
        return Math.sqrt(Math.pow(to.x - from.x, 2) + Math.pow(to.y - from.y, 2) + Math.pow(to.z - from.z, 2));    
    }

    public static function toVertex(point:Number3D):Vertex3D {
        return new Vertex3D(point.x, point.y, point.z);
    }

    public function Math3D() {
    }
}
}