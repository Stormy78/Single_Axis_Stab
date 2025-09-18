%% 

<<<<<<< HEAD
% clearvars;
=======
clearvars;
>>>>>>> parent of d1274a9 (Merge branch 'main' into develop)

%% Sim Params

params.Sim.fSim = 10000; %[Hz]
params.Sim.dtSim =1/params.Sim.fSim; %[sec]
params.Sim.tSim = 10.0; %[s]

params.Sim.Source.baseRateAmp = deg2rad(50.0); %[rad/s]
params.Sim.Source.baseRateFreq = 1.0; %[Hz]

%% Plant params

params.Plant.motorInertia = 0.1e-7; %[kg*m^2]
params.Plant.motorCoulombFriction = 0.5e-3; %[Nm]
params.Plant.motorStartFrictionFactor = 2.0;
params.Plant.motorMaxTorque = 1.0e-3; %[mN]

params.Plant.gearBacklashAngle = deg2rad(0.1); %[rad]
params.Plant.gearRatio = 64;

params.Plant.bearingCoulombFriction = 8.0e-3; %[Nm]
params.Plant.bearingStartFrictionFactor = 1.5;

params.Plant.harnessSpring = 50.0e-3; %[Nm/rad]

params.Plant.payloadJ = 50.0e-6; %[km*m^2]

%% Control Params

params.Controller.fClock = 10000.0;
params.Controller.dtClock = 1./params.Controller.fClock;
params.Controller.rateP = 2.0;
params.Controller.rateI = 50.0;
