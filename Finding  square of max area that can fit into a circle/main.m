clc; clear all; close all;

% Circle formula: (x-a)^2 + (y-b)^2 = r^2  
% For simplicity, we assume that a=b=0
r = 1;  
% 
% % Plot of the circle
% phi = 0:0.01:2*pi;
% x = r*cos(phi);
% y = r*sin(phi);
% 
% figure(1)
% plot(x, y)
% title('Circle')
% xlabel('x')
% ylabel('y')
% grid on
% axis equal

% Paramethers of genetic algorithm
N = 100; % Number of chromosomes in the population
L = 28; % Length of a single chromosome (the number of bits)
pm = 0.001; % Probability of mutation
pc = 0.9; % Probability of crossover
G = 0.8; % Generation gap

% Initial population
for i=1:N
    generation(i,:) = dec2bin(round(rand()*(2^L-1)),L);
end

% Array of corresponding square areas for this generation
areas = fitness_function(generation, L, r);

condition = true;
iter_num = 0;
maxareas = [];
while condition
    % Reproduction  - via roulette wheel
    N_repr = round((1-G)*N);
    N_cross = N - N_repr;
    if mod(N_cross,2)==1
        N_cross = N_cross + 1;
        N_repr = N_repr - 1;
    end
    
    new_gen1 = roulette_wheel(generation, areas, N_repr);
    
    % Crossover - Single point crossover
    new_gen2 = crossover(generation, areas, N_cross , pc, L);
    
    new_gen = [new_gen1; new_gen2];
    
    % mutacija
    for j = 1:N*pm*L
        mutation_instance = ceil(rand()*N);
        mutation_point = ceil(rand()*L);
        if new_gen(mutation_instance, mutation_point) == 1
            new_gen(mutation_instance, mutation_point) = 0;
        else
            new_gen(mutation_instance, mutation_point) = 1;
        end
    end
       
    generation = new_gen;   
    areas = fitness_function(new_gen, L, r);
    maxareas = [maxareas max(areas)];
    
    plot_squares(new_gen, L, r);
    pause(0.5);
    close all
  
    iter_num = iter_num+1;
    if iter_num >= 50
        condition = false;
    end
end

figure
plot(1:50, maxareas)
