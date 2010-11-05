package dp.flex.imol.model {
import dp.flex.imol.*;

public class Bond {

    private var _molecule:Molecule;

    private var _atomFromIndex:Number;
    private var _atomToIndex:Number;

    private var _bondType:Number;


    public function Bond(molecule:Molecule, atomFromIndex:Number, atomToIndex:Number, bondType:Number) {
        _molecule = molecule;
        _atomFromIndex = atomFromIndex;
        _atomToIndex = atomToIndex;
        _bondType = bondType;

        this.atomFrom.bondsFrom.addItem(this);
        this.atomTo.bondsTo.addItem(this);
    }


    public function get atomFrom():Atom {
        return Atom(_molecule.atoms.getItemAt(_atomFromIndex - 1));
    }

    public function get atomTo():Atom {
        return Atom(_molecule.atoms.getItemAt(_atomToIndex - 1));
    }

    public function get bondType():Number {
        return _bondType;
    }
}
}