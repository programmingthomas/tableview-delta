//
//  ViewController.m
//  Delta
//
//  Created by Thomas Denney on 12/02/2015.
//  Copyright (c) 2015 Programming Thomas. All rights reserved.
//

#import "ViewController.h"

#include <vector>
#include <iostream>

#import "Delta.h"
#import "Element.h"

@interface ViewController () {
    std::vector<Element> AllElements;
    std::vector<Element> NobleGases;
}

@property BOOL nobleGasesOnly;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AllElements.emplace_back("Hydrogen", "H", 1, 1.00794);
    AllElements.emplace_back("Helium", "He", 2, 4.002602);
    AllElements.emplace_back("Lithium", "Li", 3, 6.941);
    AllElements.emplace_back("Beryllium", "Be", 4, 9.01218);
    AllElements.emplace_back("Boron", "B", 5, 10.811);
    AllElements.emplace_back("Carbon", "C", 6, 12.011);
    AllElements.emplace_back("Nitrogen", "N", 7, 14.00674);
    AllElements.emplace_back("Oxygen", "O", 8, 15.9994);
    AllElements.emplace_back("Fluorine", "F", 9, 18.998403);
    AllElements.emplace_back("Neon", "Ne", 10, 20.1797);
    AllElements.emplace_back("Sodium", "Na", 11, 22.989768);
    AllElements.emplace_back("Magnesium", "Mg", 12, 24.305);
    AllElements.emplace_back("Aluminum", "Al", 13, 26.981539);
    AllElements.emplace_back("Silicon", "Si", 14, 28.0855);
    AllElements.emplace_back("Phosphorus", "P", 15, 30.973762);
    AllElements.emplace_back("Sulfur", "S", 16, 32.066);
    AllElements.emplace_back("Chlorine", "Cl", 17, 35.4527);
    AllElements.emplace_back("Argon", "Ar", 18, 39.948);
    AllElements.emplace_back("Potassium", "K", 19, 39.0983);
    AllElements.emplace_back("Calcium", "Ca", 20, 40.078);
    AllElements.emplace_back("Scandium", "Sc", 21, 44.95591);
    AllElements.emplace_back("Titanium", "Ti", 22, 47.88);
    AllElements.emplace_back("Vanadium", "V", 23, 50.9415);
    AllElements.emplace_back("Chromium", "Cr", 24, 51.9961);
    AllElements.emplace_back("Manganese", "Mn", 25, 54.93805);
    AllElements.emplace_back("Iron", "Fe", 26, 55.847);
    AllElements.emplace_back("Cobalt", "Co", 27, 58.9332);
    AllElements.emplace_back("Nickel", "Ni", 28, 58.6934);
    AllElements.emplace_back("Copper", "Cu", 29, 63.546);
    AllElements.emplace_back("Zinc", "Zn", 30, 65.39);
    AllElements.emplace_back("Gallium", "Ga", 31, 69.723);
    AllElements.emplace_back("Germanium", "Ge", 32, 72.61);
    AllElements.emplace_back("Arsenic", "As", 33, 74.92159);
    AllElements.emplace_back("Selenium", "Se", 34, 78.96);
    AllElements.emplace_back("Bromine", "Br", 35, 79.904);
    AllElements.emplace_back("Krypton", "Kr", 36, 83.8);
    AllElements.emplace_back("Rubidium", "Rb", 37, 85.4678);
    AllElements.emplace_back("Strontium", "Sr", 38, 87.62);
    AllElements.emplace_back("Yttrium", "Y", 39, 88.90585);
    AllElements.emplace_back("Zirconium", "Zr", 40, 91.224);
    AllElements.emplace_back("Niobium", "Nb", 41, 92.90638);
    AllElements.emplace_back("Molybdenum", "Mo", 42, 95.94);
    AllElements.emplace_back("Technetium", "Tc", 43, 97.9072);
    AllElements.emplace_back("Ruthenium", "Ru", 44, 101.07);
    AllElements.emplace_back("Rhodium", "Rh", 45, 102.9055);
    AllElements.emplace_back("Palladium", "Pd", 46, 106.42);
    AllElements.emplace_back("Silver", "Ag", 47, 107.8682);
    AllElements.emplace_back("Cadmium", "Cd", 48, 112.411);
    AllElements.emplace_back("Indium", "In", 49, 114.818);
    AllElements.emplace_back("Tin", "Sn", 50, 118.71);
    AllElements.emplace_back("Antimony", "Sb", 51, 121.76);
    AllElements.emplace_back("Tellurium", "Te", 52, 127.6);
    AllElements.emplace_back("Iodine", "I", 53, 126.90447);
    AllElements.emplace_back("Xenon", "Xe", 54, 131.29);
    AllElements.emplace_back("Cesium", "Cs", 55, 132.90543);
    AllElements.emplace_back("Barium", "Ba", 56, 137.327);
    AllElements.emplace_back("Lanthanum", "La", 57, 138.9055);
    AllElements.emplace_back("Cerium", "Ce", 58, 140.115);
    AllElements.emplace_back("Praseodymium", "Pr", 59, 140.90765);
    AllElements.emplace_back("Neodymium", "Nd", 60, 144.24);
    AllElements.emplace_back("Promethium", "Pm", 61, 144.9127);
    AllElements.emplace_back("Samarium", "Sm", 62, 150.36);
    AllElements.emplace_back("Europium", "Eu", 63, 151.965);
    AllElements.emplace_back("Gadolinium", "Gd", 64, 157.25);
    AllElements.emplace_back("Terbium", "Tb", 65, 158.92534);
    AllElements.emplace_back("Dysprosium", "Dy", 66, 162.5);
    AllElements.emplace_back("Holmium", "Ho", 67, 164.93032);
    AllElements.emplace_back("Erbium", "Er", 68, 167.26);
    AllElements.emplace_back("Thulium", "Tm", 69, 168.93421);
    AllElements.emplace_back("Ytterbium", "Yb", 70, 173.04);
    AllElements.emplace_back("Lutetium", "Lu", 71, 174.967);
    AllElements.emplace_back("Hafnium", "Hf", 72, 178.49);
    AllElements.emplace_back("Tantalum", "Ta", 73, 180.9479);
    AllElements.emplace_back("Tungsten", "W", 74, 183.84);
    AllElements.emplace_back("Rhenium", "Re", 75, 186.207);
    AllElements.emplace_back("Osmium", "Os", 76, 190.23);
    AllElements.emplace_back("Iridium", "Ir", 77, 192.22);
    AllElements.emplace_back("Platinum", "Pt", 78, 195.08);
    AllElements.emplace_back("Gold", "Au", 79, 196.96654);
    AllElements.emplace_back("Mercury", "Hg", 80, 200.59);
    AllElements.emplace_back("Thallium", "Tl", 81, 204.3833);
    AllElements.emplace_back("Lead", "Pb", 82, 207.2);
    AllElements.emplace_back("Bismuth", "Bi", 83, 208.98037);
    AllElements.emplace_back("Polonium", "Po", 84, 208.9824);
    AllElements.emplace_back("Astatine", "At", 85, 209.9871);
    AllElements.emplace_back("Radon", "Rn", 86, 222.0176);
    AllElements.emplace_back("Francium", "Fr", 87, 223.0197);
    AllElements.emplace_back("Radium", "Ra", 88, 226.0254);
    AllElements.emplace_back("Actinium", "Ac", 89, 227.0278);
    AllElements.emplace_back("Thorium", "Th", 90, 232.0381);
    AllElements.emplace_back("Protactinium", "Pa", 91, 231.03588);
    AllElements.emplace_back("Uranium", "U", 92, 238.0289);
    AllElements.emplace_back("Neptunium", "Np", 93, 237.048);
    AllElements.emplace_back("Plutonium", "Pu", 94, 244.0642);
    AllElements.emplace_back("Americium", "Am", 95, 243.0614);
    AllElements.emplace_back("Curium", "Cm", 96, 247.0703);
    AllElements.emplace_back("Berkelium", "Bk", 97, 247.0703);
    AllElements.emplace_back("Californium", "Cf", 98, 251.0796);
    AllElements.emplace_back("Einsteinium", "Es", 99, 252.083);
    AllElements.emplace_back("Fermium", "Fm", 100, 257.0951);
    AllElements.emplace_back("Mendelevium", "Md", 101, 258.1);
    AllElements.emplace_back("Nobelium", "No", 102, 259.1009);
    AllElements.emplace_back("Lawrencium", "Lr", 103, 262.11);
    AllElements.emplace_back("Rutherfordium", "Rf", 104,  261);
    AllElements.emplace_back("Dubnium", "Db", 105,  262);
    AllElements.emplace_back("Seaborgium", "Sg", 106,  266);
    AllElements.emplace_back("Bohrium", "Bh", 107,  264);
    AllElements.emplace_back("Hassium", "Hs", 108,  269);
    AllElements.emplace_back("Meitnerium", "Mt", 109,  268);
    AllElements.emplace_back("Ununnilium", "Uun", 110,  269);
    AllElements.emplace_back("Unununium", "Uuu", 111,  272);
    AllElements.emplace_back("Ununbium", "Uub", 112,  277);
    AllElements.emplace_back("Ununtrium", "Uut", 113,  0);
    AllElements.emplace_back("Ununquadium", "Uuq", 114,  289);
    AllElements.emplace_back("Ununpentium", "Uup", 115,  0);
    AllElements.emplace_back("Ununhexium", "Uuh", 116,  0);
    AllElements.emplace_back("Ununseptium", "Uus", 117,  0);
    AllElements.emplace_back("Ununoctium", "Uuo", 118,  0);
    
    NobleGases.emplace_back("Helium", "He", 2, 4.002602);
    NobleGases.emplace_back("Neon", "Ne", 10, 20.1797);
    NobleGases.emplace_back("Argon", "Ar", 18, 39.948);
    NobleGases.emplace_back("Krypton", "Kr", 36, 83.8);
    NobleGases.emplace_back("Xenon", "Xe", 54, 131.29);
    NobleGases.emplace_back("Radon", "Rn", 86, 222.0176);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.nobleGasesOnly) {
        return NobleGases.size();
    }
    return AllElements.size();
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    auto element = self.nobleGasesOnly ? NobleGases[indexPath.row] : AllElements[indexPath.row];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithUTF8String:element.Name.c_str()];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%s - %d - %f", element.Symbol.c_str(), element.Number, element.Weight];
    
    return cell;
}

- (IBAction)update:(id)sender {
    auto changes = self.nobleGasesOnly ? Delta<Element>::ChangesBetweenArrays(NobleGases, AllElements) : Delta<Element>::ChangesBetweenArrays(AllElements, NobleGases);
    
    [self.tableView beginUpdates];
    
    for (auto& change : changes) {
        switch (change.Type) {
            case DeltaType::Insert:
                [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:change.Index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            case DeltaType::Delete:
                [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:change.Index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            default:
                break;
        }
    }
    
    self.nobleGasesOnly = !self.nobleGasesOnly;
    
    [self.tableView endUpdates];
    
    self.title = self.nobleGasesOnly ? @"Noble gases" : @"All elements";
}


@end
