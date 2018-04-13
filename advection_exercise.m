clear
close all
% Simple program for solving the advection equation

%%%%%%%%%%%%
%% Set up parameters

N = 50;                 % Number of grid points = 50

c = 1;                  % Wave speed
L = 1.0;                % Length of domain
h = L/N;                % Space grid size
x = -L/2+h/2+(0:N-1)*h; % Space coordinate
tau = h/c;             % Stability limit
disp(['Stability limit: ' tau]); 
tau=input('Enter timestep');
method=menu('Numerical method:','FTCS','Lax','Upwind','Lax Wendroff');

a = zeros(N+1,1);       % Numerical solution vector
xi = 1:N;               % Index counters
xp = _____;
xm = _____;

% Define initial pulse
a = 1./cosh(5*x.^2/h).^2; 

%%%%%%%%%%%%
%% Run the loop

plot(x,a,'-o'); ylim([-1,1.5]);
pause;

coeff_ftcs = -c*tau/(2.*h);
istep = 1;
while(istep <= 300)
    if( method == 1 )      % FTCS method %
        a(xi) = a(xi) + coeff_ftcs*(a(xp)-a(xm));  
    elseif( method == 2 )  % Lax method
        %a(xi) = 
    elseif( method == 3 )  % Upwind method
        %a(xi) = 
    else                   % Lax-Wendroff method
        %a(xi) =  
    end   
    istep = istep + 1;
    plot(x,a,'-o'); ylim([-1 1.5]); xlim([-0.5,0.5])
    pause(0.05);
end
