% Bell Basis Simulation in MATLAB
% Author: Preethan Bhattacherjee

clear;
clc;

% Define basis states
zero = [1;0];
one = [0;1];

% Tensor product shortcut
tensor = @(a,b) kron(a,b);

% Computational basis
state00 = tensor(zero, zero);
state01 = tensor(zero, one);
state10 = tensor(one, zero);
state11 = tensor(one, one);

% Bell states definitions

phi_plus  = (state00 + state11) / sqrt(2);
phi_minus = (state00 - state11) / sqrt(2);
psi_plus  = (state01 + state10) / sqrt(2);
psi_minus = (state01 - state10) / sqrt(2);

% Store in cell array
bell_states = {phi_plus, phi_minus, psi_plus, psi_minus};
names = {'Phi+', 'Phi-', 'Psi+', 'Psi-'};

% Display states and probabilities

for i = 1:4
    
    disp(['Bell State ', names{i}, ':']);
    disp(bell_states{i});
    
    probabilities = abs(bell_states{i}).^2;
    
    disp('Measurement probabilities:');
    disp(probabilities);
    
    % Normalization check
    norm_check = bell_states{i}' * bell_states{i};
    disp('Normalization:');
    disp(norm_check);
    
    % Plot
    figure;
    bar(probabilities);
    title(['Measurement Probabilities for Bell State ', names{i}]);
    xlabel('Basis index');
    ylabel('Probability');
    
end
