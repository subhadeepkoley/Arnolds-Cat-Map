function out = iarnold(in, iter)
%IARNOLD Performs Arnold descrambling
%
% in = 2D grayscale square scrambled image
% iter = Number of iteration
%
% out = Decrambled image
%
% REFERENCE
% ---------
% V. I. Arnold, A. Avez, Ergodic Problems of Classical Mechanics,
% first ed. W. A. Benjamin Inc., 1968

% Written by: Subhadeep Koley
% CC BY-NC-ND license 2021

if ~ismatrix(in)
    error('Oly two dimensions allowed');
end
[m, n] = size(in);
if (m ~= n)
    error(['Arnold Transform is defined only for squares. ' ...
        'Please complete empty rows or columns to make the square.']);
end
out = zeros(m);
n = n - 1;
for j = 1:iter
    for y = 0:n
        for x = 0:n
            p = [2 -1; -1 1] * [x; y ];
            out(mod(p(2), m) + 1, mod(p(1), m) + 1) = in(y+1, x+1);
        end
    end
    in = out;
end
end