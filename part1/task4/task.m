% Task 4 script
clear

% Reads the example vartice and triangle data 
vert = readmatrix('data/example_vertices.csv');
tri = readmatrix('data/example_triangles.csv');

% Sets default parameters
lambda = 0.9;
mu = -1.02*lambda;

% Smooth each mesh at 5, 10, 25 iterations
p5  = lowpass_mesh_smoothing(vert, tri, 5, lambda, mu);
p10 = lowpass_mesh_smoothing(vert, tri, 10, lambda, mu);
p25 = lowpass_mesh_smoothing(vert, tri, 25, lambda, mu);

% Plots the surface meshes
figure(1)
trisurf(tri, vert(:,1), vert(:,2), vert(:,3))
saveas(figure(1),'Mesh with no smoothing')
title('Mesh with no smoothing')
xlim([60 120])
ylim([60 110])
zlim([10 60])

figure(2)
trisurf(tri, p5(:,1), p5(:,2), p5(:,3))
saveas(figure(2),'Mesh with 5 iterations of smoothing')
title('Mesh with 5 iterations of smoothing')
xlim([60 120])
ylim([60 110])
zlim([10 60])

figure(3)
trisurf(tri, p10(:,1), p10(:,2), p10(:,3))
saveas(figure(3),'Mesh with 10 iterations of smoothing')
title('Mesh with 10 iterations of smoothing')
xlim([60 120])
ylim([60 110])
zlim([10 60])

figure(4)
trisurf(tri, p25(:,1), p25(:,2), p25(:,3))
saveas(figure(4),'Mesh with 25 iterations of smoothing')
title('Mesh with 25 iterations of smoothing')
xlim([60 120])
ylim([60 110])
zlim([10 60])
