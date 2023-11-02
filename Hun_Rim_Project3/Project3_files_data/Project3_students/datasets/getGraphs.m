function [Barth,Airfoil,Crack] = getGraphs()
% function to get the Adjacency matrix and the coordinate list of various graphs
% dimosthenis.pasadakis@usi.ch
% ICS, USI.
clear all;
close all;


addpath Meshes
% 
load('barth.mat');
Barth.W   = Problem.A;
Barth.Pts = Problem.aux.coord;
% 
load('airfoil1.mat');
Airfoil.W   = Problem.A;
Airfoil.Pts = Problem.aux.coord;
% 
load('crack_dual.mat');
Crack.W   = Problem.A;
Crack.Pts = Problem.aux.coord;

figure;
subplot(131)
gplotLength(Barth.W,Barth.Pts,2);
subplot(132)
gplotLength(Airfoil.W,Airfoil.Pts,2);
subplot(133)
gplotLength(Crack.W,Crack.Pts,2);
end