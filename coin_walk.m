% Coined Quantum Random Walk Simulation
% Author: Preethan Bhattacherjee

clear;
clc;

% Number of positions
N = 21;

% Coin states
coin0 = [1;0];
coin1 = [0;1];

% Initial coin state (superposition)
coin = (coin0 + coin1)/sqrt(2);

% Initial position (center)
position = zeros(N,1);
position(ceil(N/2)) = 1;

% Full state
psi = kron(coin, position);

% Hadamard coin operator
H = (1/sqrt(2))*[1 1;1 -1];

% Identity position
Ipos = eye(N);

% Coin operator on full system
CoinOp = kron(H, Ipos);

% Shift operators
ShiftRight = zeros(N);
ShiftLeft = zeros(N);

for i = 1:N-1
    ShiftRight(i+1,i) = 1;
    ShiftLeft(i,i+1) = 1;
end

% Periodic boundary
ShiftRight(1,N) = 1;
ShiftLeft(N,1) = 1;

% Conditional shift
Shift = kron([1 0;0 0], ShiftRight) + kron([0 0;0 1], ShiftLeft);

% Number of steps
steps = 50;

for t = 1:steps
    
    psi = CoinOp * psi;
    psi = Shift * psi;
    
end

% Compute probabilities

prob = zeros(N,1);

for i = 1:N
    
    prob(i) = abs(psi(i))^2 + abs(psi(i+N))^2;
    
end

% Plot

figure;
plot(prob,'LineWidth',2);
title('Quantum Coined Random Walk Probability Distribution');
xlabel('Position');
ylabel('Probability');

% Normalization check
disp('Normalization:');
disp(sum(prob));
