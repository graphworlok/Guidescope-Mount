/*
This is a baseplate designed to fit an EQ3 variant.

Hole spacing is designed so that the rings should line up with the grooves on a "standard" 8x50 finderscope

Use external perimeters first in Slic3r to remove sub-millimeter errors caused by the ooze being constrained to flow outside

Bolt holes are slightly larger than M3 in this part so that the bolt can apply tension to the connecting rings, rather than "biting". This may not actually work.

*/


$fn=120;
module mainplate() {
    cube([26,64,10], center = true);
}

module mainbolthole() {
    cylinder(h=15,r=3.5,center = true);
}

module ringbolt() {
    cylinder(h=16,r=1.6,center = true);
    translate([0,0,-5.5]) cylinder(h=3,r=3);
}

module indent() {
    translate([0,0,-5]) cube([26,43,5], center = true);
}

module ring_bolthole_front(){
    translate([0,27,0])
    ringbolt();
}

module ring_bolthole_rear(){
    translate([0,-27,0])
    ringbolt();
}

module basic_plate(){
difference(){
difference(){
difference(){
difference(){
    mainplate();
    mainbolthole();
}
indent();
}
ring_bolthole_front();

}
ring_bolthole_rear();
}
}
//basic_plate();
module flip() {
rotate(a=[0,180,0]) { 
    basic_plate();
}
}
flip();