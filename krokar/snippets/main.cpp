int main() {
  World world();
  UnitHandler units();
  BuildingHandler buildings();
  
  Graphics graphics(world, units, buildings);
  Logic logic(&graphics, world, units, buildings);
  
  logic.run();
  
  return 0;
}