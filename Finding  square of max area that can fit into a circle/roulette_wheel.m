% Inputs: current generation, the areas of the generation, N - number of chromosomes that goes into the new generation
% Outputs: an array of new chromosomes
function new_gen = roulette_wheel(generation, areas, N)
    cs = cumsum(areas);
    for i=1:N
        tmp = rand()*cs(end);
        ind = find(cs - tmp >= 0, 1);
        new_gen(i,:) = generation(ind,:);
    end
end
