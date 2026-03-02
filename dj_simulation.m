% Deutsch-Jozsa Algorithm Simulation
% Author: Preethan Bhattacherjee

clear;
clc;

% Basis states
zero = [1;0];
one = [0;1];

tensor = @(a,b) kron(a,b);

% Initial state |0>|1>
psi = tensor(zero, one);

% Hadamard gate
H = (1/sqrt(2))*[1 1;1 -1];
H2 = kron(H,H);

% Step 1: Create superposition
psi = H2 * psi;

disp('After Hadamard gates:');
disp(psi);

% Define oracle (Balanced function example)
% f(0)=0, f(1)=1

Uf = [1 0 0 0;
      0 1 0 0;
      0 0 0 1;
      0 0 1 0];

psi = Uf * psi;

disp('After Oracle:');
disp(psi);

% Apply Hadamard to first qubit
H1 = kron(H, eye(2));

psi = H1 * psi;

disp('Final state:');
disp(psi);

% Measurement probabilities
probabilities = abs(psi).^2;

disp('Measurement probabilities:');
disp(probabilities);

% Plot
figure;
bar(probabilities);
title('Deutsch-Jozsa Result');
xlabel('Basis index');
ylabel('Probability');
