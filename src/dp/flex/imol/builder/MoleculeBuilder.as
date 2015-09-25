/*
 * Copyright (c) 2010.
 * Author: Denis Pavlov
 * Web: http://www.inspire-software.com/
 * iMolecule is an open source projects that is distributed on AS IS basis with no warranty under Lesser GPL or MIT license
 */

package dp.flex.imol.builder {
import dp.flex.imol.model.Atom;
import dp.flex.imol.model.Bond;
import dp.flex.imol.model.Molecule;

public class MoleculeBuilder {

    private static const V2000:String = "V2000";
    private static const TERM:String = "M  END";

    private var _molFileContents:String;
    private var _molSpec:XML;

    public function MoleculeBuilder(molFileContents:String, molSpec:XML) {
        _molFileContents = molFileContents != null ? molFileContents.replace("\r", "") : "";
        _molSpec = molSpec;
    }

    public function build():Molecule {

        var lines:Array = this._molFileContents.split("\n");
        var tabs:Boolean = this._molFileContents.indexOf("\t") != -1;

        var name:String = lines[0];

        var molecule:Molecule = null;
        var atomsCount:Number = 0;
        var bondsCount:Number = 0;
        for (var i:int = 1; i < lines.length || lines[i] == TERM; i++) {

            var line:String = lines[i];

            if (molecule == null && (line.indexOf(V2000) != -1)) {
                molecule = parseHeaderV2000(name, line);
            } else if (molecule != null && atomsCount < molecule.atomsCount) {
                parseAtomPosition(molecule, line);
                atomsCount++;
            } else if (molecule != null && bondsCount < molecule.bondsCount) {
                parseBondData(molecule, line);
                bondsCount++;
            }
        }

        return molecule;
    }

    private function parseAtomPosition(molecule:Molecule, position:String):void {
        var posParts:Array = position.split(/(\s+)/);
        var name:String = posParts[8];
        var moleculeXML:XML = getMoleculeXML(name);
        var radius:Number = moleculeXML.radius;
        var color:Number = moleculeXML.color;
        molecule.atoms.addItem(
                new Atom(molecule, name,
                        Number(posParts[2]), Number(posParts[4]), Number(posParts[6]),
                        radius, color));
    }

    private function parseBondData(molecule:Molecule, bond:String):void {
        var bondParts:Array = bond.split(/(\s+)/);
        molecule.bonds.addItem(
                new Bond(molecule, Number(bondParts[2]), Number(bondParts[4]), Number(bondParts[6]))
                );
    }

    private function parseHeaderV2000(name:String, header:String):Molecule {
        var atoms:Number = Number(header.substr(0, 3));
        var bonds:Number = Number(header.substr(3, 3));
        return new Molecule(name, V2000, atoms, bonds);
    }

    private function getMoleculeXML(name:String):XML {
        var currentMolecules:XMLList = _molSpec.molecule;
        for each (var item:XML in currentMolecules) {
            if (String(item.@id).toLowerCase() == name.toLowerCase()) {
                return item;
            }
        }
        return getMoleculeXML("Default");
    }

}
}