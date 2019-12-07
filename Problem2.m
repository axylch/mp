%inputs
x1 = input('Input X-COORDINATE of the FIRST POINT lying on a circle: ');
y1 = input('Input Y-COORDINATE of the FIRST POINT lying on a circle: ');
p1 = [x1,y1];
disp (p1);
x2 = input('Input X-COORDINATE of the SECOND POINT lying on a circle: ');
y2 = input('Input Y-COORDINATE of the SECOND POINT lying on a circle: ');
p2 = [x2,y2];
disp (p2);
x3 = input('Input X-COORDINATE of the THIRD POINT lying on a circle: ');
y3 = input('Input Y-COORDINATE of the THIRD POINT lying on a circle: ');
p3 = [x3,y3];
disp (p3);

syms x y z D E F

%equations
eq1 = x1*D + E + F == -((x1^2) + (y1^2));
eq2 = x2*D + E + F == -((x2^2) + (y2^2));
eq3 = x3*D + E + F == -((x3^2) + (y3^2));

%midpoints
mp1x = (x1+x2)/2;
mp1y = (y1+y2)/2;

mp2x = (x2+x3)/2;
mp2y = (y2+y3)/2;

%slope
s1 = (y2-y1)/(x2-x1);
s2 = (y3-y2)/(x3-x2);

s1r = -(1/s1);
s2r = -(1/s2);

%gradient-form equation & center
eq3 = y - s1r*x == -s1r*mp1x + mp1y;
eq4 = y - s2r*x == -s2r*mp2x + mp2y;

[C,D] = equationsToMatrix([eq3,eq4] , [x,y]);
[A,B] = equationsToMatrix([eq1,eq2,eq3] , [x,y,z]);

z = (C^(-1))*D;
cx = z(1,1);
cy = z(2,1);

%radius
r = ((x1-cx)^2 + (y1-cy)^2)^(1/2);

%vector DEF
D1 = [(x1^2 + y1^2),y1,1 ; 
    (x2^2 + y2^2),y2,1;
    (x3^2 + y3^2),y3,1];
D2 = (det(D1)/60);
D = -D2;

E1 = [(x1^2 + y1^2),x1,1 ; 
    (x2^2 + y2^2),x2,1;
    (x3^2 + y3^2),x3,1];
E2 = (det(E1)/60);
E = E2;

F1 = [(x1^2 + y1^2),x1,y1 ; 
    (x2^2 + y2^2),x2,y2;
    (x3^2 + y3^2),x3,y3];
F2 = (det(F1)/60);
F = -F2;
DEF = [D,E,F];

%display
disp("Center: ")
disp("x-coordinate = ")
disp(cx)
disp("y-coordinate = ")
disp(cy)

disp("Radius: ")
disp(r)

disp("Vector DEF: ")
disp(DEF)

