function [fv] = levelgray_surface(p,filename,n)
%level_gray_surface Summary of this function goes here
%   Detailed explanation goes here
%p: 3D point cloud where p is a matrix N*3
%filename: must be a 'string' to name the stl file
%n: integer of the Figure
%In this file, a 3D cloud points is saved as an STR file. The STR file is
%the plotted as a level-gray metalic surface. 
filename0=strcat(filename,'.stl');
stlwrite(filename0,p(:,1),p(:,2),p(:,3));
fv = stlread(filename0);
figure(n)
patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);

% Add a camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');

% Fix the axes scaling, and set a nice view angle
axis('image');
view([-135 35]);

end

