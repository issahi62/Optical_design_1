%% INITIALIZE
clear all 
close all 
clc
figure
hold on

%% CONIC SECTION 


% e>1 -oblate ellipse 
% e=1 circle
% e =0.5 prolate ellipse 
% e = 0 parabolic 
% e<0 hyperbolic 

%*************
c=1/100;
Z = @(eps, y) (c.*y.^2)./(1+ sqrt(1- eps.*c.^2.*y.^2));
y_conic_plus=@(eps, z, c) sqrt(z.*(2/c-eps.*z));
y_conic_minus=@(eps, z, c) -sqrt(z.*(2/c-eps.*z));

eps = [-1,0, 0.5, 1, 2]; 
legend1={zeros(1, length(eps))}; 
z=linspace(0,400,400);

storer = [];

y = linspace(-200,200); 
for ind = 1:length(eps)
    storer =[(storer); Z(eps(ind), y)]; 
    legend1{ind} = ['eps = ', num2str(eps(ind))];   
end

for ind=1:length(eps)
    z_plot=[z, fliplr(z)];
    y_plot=[y_conic_minus(eps(ind),z,c), fliplr(y_conic_plus(eps(ind),z,c))];
    z_plot(abs(imag(y_plot))>0)=[];
    y_plot(abs(imag(y_plot))>0)=[];
    plot(z_plot,y_plot,'Linewidth', 2);
end
plot(real(storer), y, 'Linewidth', 2); 
legend(legend1, 'location', 'best'); 
ylabel('y');
xlabel('z(y)');
axis tight; 