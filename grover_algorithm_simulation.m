% Grover Algorithm Simulation (2 qubits)
% Author: Preethan Bhattacherjee

clear;
clc;

% Basis states
zero = [1;0];
one = [0;1];

tensor = @(a,b) kron(a,b);

% Computational basis
state00 = tensor(zero,zero);
state01 = tensor(zero,one);
state10 = tensor(one,zero);
state11 = tensor(one,one);

% Initial state |00>
psi = state00;

% Hadamard gate
H = (1/sqrt(2))*[1 1;1 -1];
H2 = kron(H,H);

% Step 1: Create equal superposition
psi = H2 * psi;

disp('Equal superposition state:');
disp(psi);

% Target state |11>
target = state11;

% Step 2: Oracle
Oracle = eye(4) - 2*(target*target');

psi = Oracle * psi;

disp('After Oracle:');
disp(psi);

% Step 3: Diffusion operator

s = (state00 + state01 + state10 + state11)/2;

Diffusion = 2*(s*s') - eye(4);

psi = Diffusion * psi;

disp('After Diffusion:');
disp(psi);

% Probabilities

probabilities = abs(psi).^2;

disp('Measurement probabilities:');
disp(probabilities);

% Plot
figure;
bar(probabilities);
title('Grover Algorithm Result');
xlabel('Basis State Index');
ylabel('Probability');

% Normalization check
disp('Normalization:');
disp(psi'*psi);
