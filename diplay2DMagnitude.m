function diplay2DMagnitude(signal2d, figureName)
% This function display the 2d signal at 3d space.
    figure('NumberTitle', 'off', 'Name', figureName);
    mesh(signal2d);
    colormap cool;
    colorbar;
end
