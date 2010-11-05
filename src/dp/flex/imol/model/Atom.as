package dp.flex.imol.model {
import dp.flex.imol.*;

import mx.collections.ArrayCollection;

public class Atom {

    private var _molecule:Molecule;

    private var _name:String;
    private var _x:Number;
    private var _y:Number;
    private var _z:Number;
    private var _radius:Number;
    private var _color:Number;

    private var _bondsFrom:ArrayCollection = new ArrayCollection();
    private var _bondsTo:ArrayCollection = new ArrayCollection();


    public function Atom(molecule:Molecule, name:String, x:Number, y:Number, z:Number, radius:Number, color:Number) {
        _molecule = molecule;
        _name = name;
        _x = x;
        _y = y;
        _z = z;
        _radius = radius;
        _color = color;
    }

    public function get bondsFrom():ArrayCollection {
        return _bondsFrom;
    }

    public function get bondsTo():ArrayCollection {
        return _bondsTo;
    }

    public function get name():String {
        return _name;
    }

    public function get x():Number {
        return _x;
    }

    public function get y():Number {
        return _y;
    }

    public function get z():Number {
        return _z;
    }

    public function get radius():Number {
        return _radius;
    }

    public function get color():Number {
        return _color;
    }
}
}