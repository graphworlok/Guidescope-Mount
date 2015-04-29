/*
This ring should be a friction fit to attach to the baseplate, with an M3 bolt to hold it in place.

Bolts to grip the guidescope should be M4 ~50mm long, and will hopefully self-tap.

Captive nut holes are sized so that the nuts will require heating before being pressed in place

*/


$fn=120;

module ring() {

difference() {
cylinder(h=17,r=50);
cylinder(h=17,r=40); 
}
}

module hexagon(cle,h)
{
	angle = 360/6;		// 6 sides
	cote = cle * cot(angle);
	echo(angle, cot(angle), cote);
	echo(acos(.6));

	union()
	{
		rotate([0,0,0])
			cube([cle,cote,h],center=true);
		rotate([0,0,angle])
			cube([cle,cote,h],center=true);
		rotate([0,0,2*angle])
			cube([cle,cote,h],center=true);
	}


}


function cot(x)=1/tan(x);


module holes() {
  for (i = [0:2]) {
    rotate(i * 360 / 3, [0,0,1]) translate([35,0,8.5]) rotate([0,90,0]) cylinder(h=20,r=2.4);
 }
 for (i = [0:2]) {
    rotate(i * 360 / 3, [0,0,1]) translate([41,0,8.5]) rotate([0,90,0]) hexagon(8,4); 
 }
}

module base() {
    difference() {
    translate([-53,0,8.5]) cube([20,40,17], center = true);
    translate([-60,0,10.5]) cube([15,26,15], center = true);
    }
}

module base_indent(){
    translate([-60,0,10.5]) cube([15,26,15], center = true);
}

module base_bolt_hole(){
    rotate(180, [0,0,1]) translate([37,0,8.5])
    rotate([0,90,0]) cylinder(h=16,r=1.5);
    translate([-43.5,0,8.5]) rotate([0,90,0]) hexagon(5.4,4);
}

module trim_bottom() {
    translate([-60,0,11.5]) cube([6,40,11], center = true);
}

module complete_ring(){
difference(){
ring();
holes();
}
}


module everything(){
base();
translate([-2,0,0])complete_ring();
}

difference(){
everything();
trim_bottom();
base_bolt_hole();
}







