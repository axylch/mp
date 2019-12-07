hi = input('What is the initial height? ');
vi = input('What is the initial velocity? ');
theta = input('What is the angle in degrees? ');
axi = input('What is the acceleration in x? ');
ayi = input('What is the acceleration in y?: ');

t = 0:0.01:10000;

if ayi ~= 0
    ayi = -ayi;
    axi = -axi;
    
    %x-component
    vix = vi*cosd(theta);
    x = vix.*t + (1/2)*axi*(t.^2);

    %y-component
    viy = vi*sind(theta);
    y = hi + viy.*t + (1/2)*ayi*(t.^2); 

    neg_y = y<0;
    x(neg_y) = [];
    y(neg_y) = [];

    plot(x,y,'--c');
    grid on;
    xlabel('Horizontal Distance');
    ylabel('Vertical Distance');
    title('Projectile Motion');
    
else
    disp ('Invalid Input. Acceleration in y must not be 0')
end
