EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_Small R?
U 1 1 60F26603
P 6900 4150
AR Path="/60DC28BD/60F26603" Ref="R?"  Part="1" 
AR Path="/60F26603" Ref="R?"  Part="1" 
AR Path="/60DB2574/60F26603" Ref="R?"  Part="1" 
AR Path="/60DB2574/60EF9F81/60F26603" Ref="R2004"  Part="1" 
AR Path="/60DB2574/60E556C7/60F26603" Ref="R2054"  Part="1" 
AR Path="/60E70F2C/60EF9F81/60F26603" Ref="R2004"  Part="1" 
AR Path="/60E70F2C/60E556C7/60F26603" Ref="R2054"  Part="1" 
AR Path="/60F0CD00/60F26603" Ref="R77"  Part="1" 
AR Path="/60AABC24/60F79994/60F26603" Ref="R78"  Part="1" 
F 0 "R78" H 6959 4196 50  0000 L CNN
F 1 "50" H 6959 4105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6900 4150 50  0001 C CNN
F 3 "~" H 6900 4150 50  0001 C CNN
	1    6900 4150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60F26C82
P 4300 4150
AR Path="/60DC28BD/60F26C82" Ref="R?"  Part="1" 
AR Path="/60F26C82" Ref="R?"  Part="1" 
AR Path="/60DB2574/60F26C82" Ref="R?"  Part="1" 
AR Path="/60DB2574/60EF9F81/60F26C82" Ref="R2003"  Part="1" 
AR Path="/60DB2574/60E556C7/60F26C82" Ref="R2053"  Part="1" 
AR Path="/60E70F2C/60EF9F81/60F26C82" Ref="R2003"  Part="1" 
AR Path="/60E70F2C/60E556C7/60F26C82" Ref="R2053"  Part="1" 
AR Path="/60F0CD00/60F26C82" Ref="R76"  Part="1" 
AR Path="/60AABC24/60F79994/60F26C82" Ref="R76"  Part="1" 
F 0 "R76" H 4359 4196 50  0000 L CNN
F 1 "100" H 4359 4105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4300 4150 50  0001 C CNN
F 3 "~" H 4300 4150 50  0001 C CNN
	1    4300 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 4150 4550 4150
Connection ~ 4900 4150
Text HLabel 4100 4150 0    50   BiDi ~ 0
DATA
Text HLabel 4100 4450 0    50   Input ~ 0
DIR
$Comp
L Device:C_Small C2001
U 1 1 60F2A5CB
P 9350 4800
AR Path="/60DB2574/60EF9F81/60F2A5CB" Ref="C2001"  Part="1" 
AR Path="/60DB2574/60E556C7/60F2A5CB" Ref="C2051"  Part="1" 
AR Path="/60E70F2C/60EF9F81/60F2A5CB" Ref="C2001"  Part="1" 
AR Path="/60E70F2C/60E556C7/60F2A5CB" Ref="C2051"  Part="1" 
AR Path="/60F0CD00/60F2A5CB" Ref="C104"  Part="1" 
AR Path="/60AABC24/60F79994/60F2A5CB" Ref="C104"  Part="1" 
F 0 "C104" H 9442 4846 50  0000 L CNN
F 1 "100n" H 9442 4755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9350 4800 50  0001 C CNN
F 3 "~" H 9350 4800 50  0001 C CNN
	1    9350 4800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9350 4900 9350 5000
$Comp
L Device:C_Small C2002
U 1 1 60F2C544
P 4500 2650
AR Path="/60DB2574/60EF9F81/60F2C544" Ref="C2002"  Part="1" 
AR Path="/60DB2574/60E556C7/60F2C544" Ref="C2052"  Part="1" 
AR Path="/60E70F2C/60EF9F81/60F2C544" Ref="C2002"  Part="1" 
AR Path="/60E70F2C/60E556C7/60F2C544" Ref="C2052"  Part="1" 
AR Path="/60F0CD00/60F2C544" Ref="C103"  Part="1" 
AR Path="/60AABC24/60F79994/60F2C544" Ref="C103"  Part="1" 
F 0 "C103" H 4592 2696 50  0000 L CNN
F 1 "100n" H 4592 2605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4500 2650 50  0001 C CNN
F 3 "~" H 4500 2650 50  0001 C CNN
	1    4500 2650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4500 2400 4500 2550
Wire Wire Line
	4500 2750 4500 2850
$Comp
L Connector:Conn_Coaxial J?
U 1 1 60E51E93
P 7650 4150
AR Path="/60B16D71/60E51E93" Ref="J?"  Part="1" 
AR Path="/612B1274/60E51E93" Ref="J?"  Part="1" 
AR Path="/612B1274/611783BC/60E51E93" Ref="J?"  Part="1" 
AR Path="/612B1274/611E90A8/60E51E93" Ref="J?"  Part="1" 
AR Path="/60DB2574/60EF9F81/60E51E93" Ref="J2001"  Part="1" 
AR Path="/60DB2574/60E556C7/60E51E93" Ref="J2051"  Part="1" 
AR Path="/60E70F2C/60EF9F81/60E51E93" Ref="J2001"  Part="1" 
AR Path="/60E70F2C/60E556C7/60E51E93" Ref="J2051"  Part="1" 
AR Path="/60F0CD00/60E51E93" Ref="J10"  Part="1" 
AR Path="/60AABC24/60F79994/60E51E93" Ref="J10"  Part="1" 
F 0 "J10" H 7750 4125 50  0000 L CNN
F 1 "BNC" H 7750 4034 50  0000 L CNN
F 2 "proj_footprints:BNC_Molex_0731713150" H 7650 4150 50  0001 C CNN
F 3 " ~" H 7650 4150 50  0001 C CNN
F 4 "0731713150" H 7650 4150 50  0001 C CNN "Part"
F 5 "Molex" H 7650 4150 50  0001 C CNN "Manufacturer"
	1    7650 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60F05839
P 6650 4500
AR Path="/60DC28BD/60F05839" Ref="R?"  Part="1" 
AR Path="/60F05839" Ref="R?"  Part="1" 
AR Path="/60DB2574/60F05839" Ref="R?"  Part="1" 
AR Path="/60DB2574/60EF9F81/60F05839" Ref="R2005"  Part="1" 
AR Path="/60DB2574/60E556C7/60F05839" Ref="R2055"  Part="1" 
AR Path="/60E70F2C/60EF9F81/60F05839" Ref="R2005"  Part="1" 
AR Path="/60E70F2C/60E556C7/60F05839" Ref="R2055"  Part="1" 
AR Path="/60F0CD00/60F05839" Ref="R78"  Part="1" 
AR Path="/60AABC24/60F79994/60F05839" Ref="R77"  Part="1" 
F 0 "R77" H 6709 4546 50  0000 L CNN
F 1 "100k" H 6709 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6650 4500 50  0001 C CNN
F 3 "~" H 6650 4500 50  0001 C CNN
	1    6650 4500
	1    0    0    -1  
$EndComp
Text Notes 3900 5400 0    50   ~ 0
XC3A (LVCMOS18) min pullup: 8.4k; max. pulldown: 3.3k\n2t45 VLmax: 0.35Vcc -> pulldown < 4.5k
Wire Wire Line
	4900 4050 4950 4050
Wire Wire Line
	4900 4050 4900 4150
Wire Wire Line
	4900 4250 4950 4250
Wire Wire Line
	4900 4150 4900 4250
Wire Wire Line
	5800 4250 5750 4250
Wire Wire Line
	5750 4050 5800 4050
Wire Wire Line
	5250 3550 5250 3600
Wire Wire Line
	5350 4650 5350 4850
$Comp
L Device:R_Small R?
U 1 1 60E4921E
P 4550 4650
AR Path="/60DC28BD/60E4921E" Ref="R?"  Part="1" 
AR Path="/60E4921E" Ref="R?"  Part="1" 
AR Path="/60DB2574/60E4921E" Ref="R?"  Part="1" 
AR Path="/60DB2574/60EF9F81/60E4921E" Ref="R2002"  Part="1" 
AR Path="/60DB2574/60E556C7/60E4921E" Ref="R2052"  Part="1" 
AR Path="/60E70F2C/60EF9F81/60E4921E" Ref="R2002"  Part="1" 
AR Path="/60E70F2C/60E556C7/60E4921E" Ref="R2052"  Part="1" 
AR Path="/60F0CD00/60E4921E" Ref="R75"  Part="1" 
AR Path="/60AABC24/60F79994/60E4921E" Ref="R75"  Part="1" 
F 0 "R75" H 4609 4696 50  0000 L CNN
F 1 "2k2" H 4609 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4550 4650 50  0001 C CNN
F 3 "~" H 4550 4650 50  0001 C CNN
	1    4550 4650
	1    0    0    -1  
$EndComp
Connection ~ 5350 4850
Wire Wire Line
	5350 4850 5350 4900
$Comp
L Device:R_Small R?
U 1 1 60E49E8E
P 4550 3950
AR Path="/60DC28BD/60E49E8E" Ref="R?"  Part="1" 
AR Path="/60E49E8E" Ref="R?"  Part="1" 
AR Path="/60DB2574/60E49E8E" Ref="R?"  Part="1" 
AR Path="/60DB2574/60EF9F81/60E49E8E" Ref="R2001"  Part="1" 
AR Path="/60DB2574/60E556C7/60E49E8E" Ref="R2051"  Part="1" 
AR Path="/60E70F2C/60EF9F81/60E49E8E" Ref="R2001"  Part="1" 
AR Path="/60E70F2C/60E556C7/60E49E8E" Ref="R2051"  Part="1" 
AR Path="/60F0CD00/60E49E8E" Ref="R74"  Part="1" 
AR Path="/60AABC24/60F79994/60E49E8E" Ref="R74"  Part="1" 
F 0 "R74" H 4609 3996 50  0000 L CNN
F 1 "100k" H 4609 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4550 3950 50  0001 C CNN
F 3 "~" H 4550 3950 50  0001 C CNN
	1    4550 3950
	1    0    0    -1  
$EndComp
Connection ~ 5250 3600
Wire Wire Line
	5250 3600 5250 3650
$Comp
L power:GND #PWR?
U 1 1 60F26CE8
P 7650 4500
AR Path="/6086F2E3/60F26CE8" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F26CE8" Ref="#PWR?"  Part="1" 
AR Path="/60F0CD00/60F26CE8" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F79994/60F26CE8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7650 4250 50  0001 C CNN
F 1 "GND" H 7655 4327 50  0000 C CNN
F 2 "" H 7650 4500 50  0001 C CNN
F 3 "" H 7650 4500 50  0001 C CNN
	1    7650 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F275E3
P 5350 4900
AR Path="/6086F2E3/60F275E3" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F275E3" Ref="#PWR?"  Part="1" 
AR Path="/60F0CD00/60F275E3" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F79994/60F275E3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5350 4650 50  0001 C CNN
F 1 "GND" H 5355 4727 50  0000 C CNN
F 2 "" H 5350 4900 50  0001 C CNN
F 3 "" H 5350 4900 50  0001 C CNN
	1    5350 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F27F41
P 4500 2850
AR Path="/6086F2E3/60F27F41" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F27F41" Ref="#PWR?"  Part="1" 
AR Path="/60F0CD00/60F27F41" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F79994/60F27F41" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4500 2600 50  0001 C CNN
F 1 "GND" H 4505 2677 50  0000 C CNN
F 2 "" H 4500 2850 50  0001 C CNN
F 3 "" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F2871C
P 9350 5000
AR Path="/6086F2E3/60F2871C" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F2871C" Ref="#PWR?"  Part="1" 
AR Path="/60F0CD00/60F2871C" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F79994/60F2871C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9350 4750 50  0001 C CNN
F 1 "GND" H 9355 4827 50  0000 C CNN
F 2 "" H 9350 5000 50  0001 C CNN
F 3 "" H 9350 5000 50  0001 C CNN
	1    9350 5000
	1    0    0    -1  
$EndComp
$Comp
L Logic_LevelTranslator:SN74LVC2T45DCUR U17
U 1 1 60F2A3F7
P 5350 4150
AR Path="/60F0CD00/60F2A3F7" Ref="U17"  Part="1" 
AR Path="/60AABC24/60F79994/60F2A3F7" Ref="U17"  Part="1" 
F 0 "U17" H 5050 3600 50  0000 C CNN
F 1 "SN74LVC2T45DCUR" H 4800 3300 50  0000 C CNN
F 2 "Package_SO:VSSOP-8_2.4x2.1mm_P0.5mm" H 5400 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2t45.pdf" H 4450 3600 50  0001 C CNN
	1    5350 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR?
U 1 1 60F3DEA2
P 5250 3550
AR Path="/6086F2E3/60F3DEA2" Ref="#PWR?"  Part="1" 
AR Path="/60F0CD00/60F3DEA2" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F79994/60F3DEA2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5250 3400 50  0001 C CNN
F 1 "+1V8" H 5265 3723 50  0000 C CNN
F 2 "" H 5250 3550 50  0001 C CNN
F 3 "" H 5250 3550 50  0001 C CNN
	1    5250 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR?
U 1 1 60F3E5CB
P 9350 4550
AR Path="/6086F2E3/60F3E5CB" Ref="#PWR?"  Part="1" 
AR Path="/60F0CD00/60F3E5CB" Ref="#PWR?"  Part="1" 
AR Path="/60AABC24/60F79994/60F3E5CB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9350 4400 50  0001 C CNN
F 1 "+1V8" H 9365 4723 50  0000 C CNN
F 2 "" H 9350 4550 50  0001 C CNN
F 3 "" H 9350 4550 50  0001 C CNN
	1    9350 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4550 9350 4700
Text HLabel 4100 2400 0    50   Input ~ 0
VCC_IO
Wire Wire Line
	4100 2400 4500 2400
Connection ~ 4500 2400
Wire Wire Line
	4500 2400 5450 2400
Wire Wire Line
	5450 2400 5450 3600
$Comp
L Device:D_Schottky_Small D?
U 1 1 60F6B1B6
P 6200 4500
AR Path="/612B1274/60F6B1B6" Ref="D?"  Part="1" 
AR Path="/60F0CD00/60F6B1B6" Ref="D14"  Part="1" 
AR Path="/60AABC24/60F79994/60F6B1B6" Ref="D14"  Part="1" 
F 0 "D14" V 6154 4570 50  0000 L CNN
F 1 "NSR0170HT1G" V 7150 4050 50  0001 L CNN
F 2 "Diode_SMD:D_SOD-323" V 6200 4500 50  0001 C CNN
F 3 "~" V 6200 4500 50  0001 C CNN
F 4 "NSR0170HT1G" V 6200 4500 50  0001 C CNN "Part"
F 5 "OnSemi" V 6200 4500 50  0001 C CNN "Manufacturer"
	1    6200 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 4050 5800 4150
$Comp
L Device:D_Schottky_Small D?
U 1 1 60F6CE22
P 6200 3850
AR Path="/612B1274/60F6CE22" Ref="D?"  Part="1" 
AR Path="/60F0CD00/60F6CE22" Ref="D13"  Part="1" 
AR Path="/60AABC24/60F79994/60F6CE22" Ref="D13"  Part="1" 
F 0 "D13" V 6154 3920 50  0000 L CNN
F 1 "NSR0170HT1G" V 7150 3400 50  0001 L CNN
F 2 "Diode_SMD:D_SOD-323" V 6200 3850 50  0001 C CNN
F 3 "~" V 6200 3850 50  0001 C CNN
F 4 "NSR0170HT1G" V 6200 3850 50  0001 C CNN "Part"
F 5 "OnSemi" V 6200 3850 50  0001 C CNN "Manufacturer"
	1    6200 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 4150 6200 4150
Connection ~ 5800 4150
Wire Wire Line
	5800 4150 5800 4250
Wire Wire Line
	6200 3950 6200 4150
Connection ~ 6200 4150
Wire Wire Line
	6200 4150 6650 4150
Wire Wire Line
	6200 4150 6200 4400
Wire Wire Line
	5450 3600 6200 3600
Wire Wire Line
	6200 3600 6200 3750
Connection ~ 5450 3600
Wire Wire Line
	5450 3600 5450 3650
Wire Wire Line
	5350 4850 6200 4850
Wire Wire Line
	6200 4850 6200 4600
Wire Wire Line
	7000 4150 7450 4150
Wire Wire Line
	6650 4400 6650 4150
Connection ~ 6650 4150
Wire Wire Line
	6650 4150 6800 4150
Wire Wire Line
	7650 4350 7650 4500
Wire Wire Line
	6650 4600 6650 4850
Wire Wire Line
	6650 4850 6200 4850
Connection ~ 6200 4850
Wire Wire Line
	4100 4150 4200 4150
Wire Wire Line
	4100 4450 4550 4450
Wire Wire Line
	4550 4050 4550 4150
Connection ~ 4550 4150
Wire Wire Line
	4550 4150 4900 4150
Wire Wire Line
	4550 4450 4550 4550
Connection ~ 4550 4450
Wire Wire Line
	4550 4450 4950 4450
Wire Wire Line
	4550 4750 4550 4850
Wire Wire Line
	4550 4850 5350 4850
Wire Wire Line
	4550 3850 4550 3600
Wire Wire Line
	4550 3600 5250 3600
$EndSCHEMATC