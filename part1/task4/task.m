% Task 4 script
clear

% Reads the example vartice and triangle data 
vert = readmatrix('data/example_vertices.csv');
tri = readmatrix('data/example_triangles.csv');

% Sets default parameters
lambda = 0.9;
mu = -1.02*lambda;

% Smooth each mesh at 5, 10, 25 iterations
p5  = lowpass_mesh_smoothing(vert, tri, 5);
p10 = lowpass_mesh_smoothing(vert, tri, 10);
p25 = lowpass_mesh_smoothing(vert, tri, 25);
