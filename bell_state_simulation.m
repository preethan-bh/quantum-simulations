% Bell State Simulation in MATLAB
% Author: Preethan Bhattacherjee

clear;
clc;

% Basis states
zero = [1;0];
one = [0;1];

% Tensor product function
tensor = @(a,b) kron(a,b);

% Initial state |00>
psi = tensor(zero, zero);

% Hadamard gate
H = (1/sqrt(2)) * [1 1; 1 -1];

% Identity
I = eye(2);

% CNOT gate
CNOT = [1 0 0 0;
        0 1 0 0;
        0 0 0 1;
        0 0 1 0];

% Apply Hadamard on first qubit
H1 = kron(H, I);
psi = H1 * psi;

% Apply CNOT
psi = CNOT * psi;

disp('Bell State |Φ+>:');
disp(psi);

% Probabilities
probabilities = abs(psi).^2;

disp('Measurement Probabilities:');
disp(probabilities);

% Verify normalization

norm_value = psi' * psi;
disp('Normalization check (should be 1):');
disp(norm_value);

% Plot probabilities

figure;
bar(probabilities);
title('Measurement Probabilities of Bell State');
xlabel('Basis State Index');
ylabel('Probability');
