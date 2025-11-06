%% 

clearvars;

%% Sim Params

params.Sim.fSim = 10000; %[Hz]
params.Sim.dtSim =1/params.Sim.fSim; %[sec]
params.Sim.tSim = 10.0; %[s]

params.Sim.Source.baseRateAmp = deg2rad(10.0); %[dps]
params.Sim.Source.baseRateFreq = 1.0; %[Hz]

%% Plant params

params.Plant.gearBacklashAngle = 5e-4; %[rad]
params.Plant.gearRatio = 30;

params.Plant.motorInertia = 1e-7; %[kg*m^2]
params.Plant.motorCoulombFriction = 1e-3; %[Nm]
params.Plant.motorStartFrictionFactor = 2.0;
params.Plant.motorMaxTorque = 1.0; %[mN]
params.Plant.motorKT = 0.8/params.Plant.gearRatio;

params.Plant.bearingCoulombFriction = 0.1; %[Nm]
params.Plant.bearingStartFrictionFactor = 1.5;

params.Plant.harnessSpring = 50.0e-3; %[Nm/rad]

params.Plant.payloadJ = 4000.0e-6; %[km*m^2]

%% Control Params

params.Controller.fClock = 10000.0;
params.Controller.dtClock = 1./params.Controller.fClock;
params.Controller.rateP = 1.0;
params.Controller.rateI = 128.0;
