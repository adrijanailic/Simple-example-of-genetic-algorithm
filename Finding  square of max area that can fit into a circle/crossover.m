% Inputs: current generation, the areas of the generation, N - number of new chromosomes to make with crossover, 
% pc - probability of crossover, L - length of a single chromosome
% Outputs: an array of new chromosomes
function new_gen = crossover(generation, areas, N, pc, L)
   for i = 1:(N/2)
       rnd = rand();
       parents = roulette_wheel(generation, areas, 2);
       if rnd<pc
           crossover_point = 1 + floor(rand()*(L-1));
           child1 = [parents(1, 1:crossover_point) parents(2, crossover_point+1:end)];
           child2 = [parents(2, 1:crossover_point) parents(1, crossover_point+1:end)];
       else
           child1 = parents(1,:);
           child2 = parents(2,:);
       end
       new_gen((i-1)*2+1, :) = child1;
       new_gen(i*2, :) = child2;       
   end
end
