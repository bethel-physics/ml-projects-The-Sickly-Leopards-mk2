
% Simple program for solving the advection equation

%%%%%%%%%%%%
%% Set up parameters

N = 50;                 % Number of grid points = 50

c = 1;                  % Wave speed
L = 1.0;                % Length of domain
h = L/N;                % Space grid size
x = -L/2+h/2+(0:N-1)*h; % Space coordinate
tau = h/c;             % Stability limit
CFL = c*tau/h;
disp(['Stability limit: ' num2str(tau)]); 
disp(['CFL = ' num2str(CFL)]);
tau=input('Enter timestep');
method=menu('Numerical method:','FTCS','Lax','Upwind','Lax Wendroff');

a = zeros(N+1,1);       % Numerical solution vector
xi = 1:N;               % Index counters
xp = [2:N 1];
xm = [N 1:N-1];

% Define initial pulse
a = 1./cosh(5*x.^2/h).^2; 
t = zeros(1,300);
%%%%%%%%%%%%
%% Run the loop
% figure(1)
% plot(x,a,'-o'); ylim([-1,1.5]);
% pause;

coeff_ftcs = -c*tau/(2.*h);
istep = 1;
while(istep <= 300)
    if( method == 1 )      % FTCS method %
        a(xi) = a(xi) + coeff_ftcs*(a(xp)-a(xm));  
    elseif( method == 2 )  % Lax method
        a(xi) = .5*(a(xp)+a(xm)) + coeff_ftcs*(a(xp)-a(xm));
    elseif( method == 3 )  % Upwind method
        a(xi) = a(xi) - (tau/h)*(max(c,0)*(a(xi)-a(xm))+min(c,0)*(a(xp)-a(xi)));
    elseif( method == 4 )                  % Lax-Wendroff method
        a(xi) = a(xi)-((c*tau)/(2*h))*(a(xp)-a(xm))+(((c^2)*(tau^2))/(2*(h^2)))*(a(xp)-2*a(xi)+a(xm));
    end   
    istep = istep + 1;
%     plot(x,a,'-o'); ylim([-1 1.5]); xlim([-0.5,0.5])
%     pause(0.05);
    Dvec(istep) = a(25);
    t(istep+1) = t(istep)+tau;
end

if (method == 2||3||4)
    figure(2) 
subplot(3,1,method-1);

plot(t(1:301),Dvec)
xlabel('time (s)')
ylabel('Displacement (m)')
if (method == 2)
    title('Lax method')
elseif(method == 3)
    title('Upwind method')
elseif(method == 4)
    title('Lax-Wendroff method')
end
end