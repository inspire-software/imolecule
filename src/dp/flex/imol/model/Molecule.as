package dp.flex.imol.model {
import mx.collections.ArrayCollection;

public class Molecule {

    private var _name:String;
    private var _format:String;
    private var _atomsCount:Number;
    private var _bondsCount:Number;

    private var _atoms:ArrayCollection = new ArrayCollection();
    private var _bonds:ArrayCollection = new ArrayCollection();


    public function Molecule(name:String, format:String, atomsCount:Number, bondsCount:Number) {
        _name = name;
        _format = format;
        _atomsCount = atomsCount;
        _bondsCount = bondsCount;
    }

    public function get name():String {
        return _name;
    }

    public function get format():String {
        return _format;
    }

    public function get atomsCount():Number {
        return _atomsCount;
    }

    public function get bondsCount():Number {
        return _bondsCount;
    }

    public function get atoms():ArrayCollection {
        return _atoms;
    }

    public function get bonds():ArrayCollection {
        return _bonds;
    }
}
}