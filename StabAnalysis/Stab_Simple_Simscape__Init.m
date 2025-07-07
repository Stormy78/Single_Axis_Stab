%% 

clearvars;



%% Sim Params

params.Sim.fSim = 10000; %[Hz]
params.Sim.dtSim =1/params.Sim.fSim; %[sec]
params.Sim.tSim = 10.0; %[s]

params.Sim.Source.baseRateAmp_DPS = 50.0; %[deg/s]
params.Sim.Source.baseRateFreq = 1.0; %[Hz]

%% Plant params

params.Plant.motorInertia = 0.1; %[g*cm^2]
params.Plant.motorCoulombFriction = 0.5; %[mNm]
params.Plant.motorStartFrictionFactor = 2.0; %[mNm]
params.Plant.motorMaxTorque = 1.0; %[mNm]

params.Plant.gearBacklashAngle = 0.1; %[deg]
params.Plant.gearRatio = 64;

params.Plant.bearingCoulombFriction = 8.0; %[mNm]
params.Plant.bearingStartFrictionFactor = 1.5; %[mNm]

params.Plant.harnessSpring = 50.0; %[mNm/rad]

params.Plant.payloadJ = 50.0*1e-6; %[km*m^2]

%% Control Params

params.Controller.fClock = 10000.0;
params.Controller.dtClock = 1./params.Controller.fClock;
params.Controller.rateP = 2.0;
params.Controller.rateI = 50.0;
