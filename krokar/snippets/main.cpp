int main() {
  World world();
  UnitHandler units();
  BuildingHandler buildings();
  
  Graphics g(world, units, buildings);
  Logic logic(g, world, units, buildings);
  
  logic.run();
  
  return 0;
}