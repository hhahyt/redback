// Gmsh project created on Wed Feb 24 14:27:50 2016

lc = 0.05;
R_out = 1.; // radius of outer circle
R_in = 0.05; // radius of inner circle 
H = 0.1; // height of cylinder
nb_layers_quarter_circle = 30; //number of layers in one THIRD OF CIRCLE
nb_rings = 40; // number of concentric cell rings
nb_layers_z = 1; // number of vertical layers
angle_crack = 0;
nb_layers_crack = 10;

Point(1) = {0,0,0,lc}; // Center

Point(2) = {R_in*Cos(angle_crack/2),R_in*Sin(angle_crack/2),0,lc};
Point(3) = {0,R_in,0,lc};
Point(4) = {-R_in,0,0,lc};
Point(5) = {R_out*Cos(angle_crack/2),R_out*Sin(angle_crack/2),0,lc};
Point(6) = {0,R_out,0,lc};
Point(7) = {-R_out,0,0,lc};

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {5, 1, 6};
Circle(4) = {6, 1, 7};
Line(5) = {2, 5};
Line(6) = {3, 6};
Line(7) = {4, 7};

Transfinite Line{1,2,3,4} = nb_layers_quarter_circle;
Transfinite Line{-5,-6,-7} = nb_rings+1 Using Progression 0.8;


Line Loop(8) = {1, 6, -3, -5};
Ruled Surface(9) = {8};
Recombine Surface(9);
Line Loop(10) = {2, 7, -4, -6};
Ruled Surface(11) = {10};
Transfinite Surface{9, 11};
Recombine Surface(11);


Physical Line(0) = {1, 2};
Physical Line(1) = {3, 4};
Physical Line(2) = {5};
Physical Line(3) = {7};
Physical Surface(0) = {9, 11};