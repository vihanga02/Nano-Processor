@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Tue Mar 05 16:49:26 +0530 2024
REM SW Build 2700185 on Thu Oct 24 18:46:05 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim D_FF_Sim_behav -key {Behavioral:sim_1:Functional:D_FF_Sim} -tclbatch D_FF_Sim.tcl -log simulate.log"
call xsim  D_FF_Sim_behav -key {Behavioral:sim_1:Functional:D_FF_Sim} -tclbatch D_FF_Sim.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
