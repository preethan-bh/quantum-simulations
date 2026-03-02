% Quantum Teleportation Simulation
% Author: Preethan Bhattacherjee

clear;
clc;

% Basis states
zero = [1;0];
one = [0;1];

tensor = @(a,b) kron(a,b);

% Unknown state to teleport
alpha = 0.6;
beta = 0.8;

% Normalize
norm_factor = sqrt(alpha^2 + beta^2);
alpha = alpha / norm_factor;
beta = beta / norm_factor;

psi = alpha*zero + beta*one;

disp('Original state:');
disp(psi);

% Bell state between qubit 2 and 3
phi_plus = (tensor(zero,zero) + tensor(one,one)) / sqrt(2);

% Full system state
system_state = tensor(psi, phi_plus);

disp('Initial 3-qubit system state:');
disp(system_state);

% Gates
I = eye(2);
H = (1/sqrt(2))*[1 1; 1 -1];

% Apply CNOT (qubit 1 control, qubit 2 target)
CNOT_12 = kron([1 0 0 0;
                0 1 0 0;
                0 0 0 1;
                0 0 1 0], I);

system_state = CNOT_12 * system_state;

% Apply Hadamard on qubit 1
H1 = kron(kron(H,I),I);

system_state = H1 * system_state;

disp('State after teleportation operations:');
disp(system_state);

% Norm check
disp('Normalization check:');
disp(system_state' * system_state);
