EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 9
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
L Amplifier_Operational:OPA859xDSG U12
U 1 1 61178C80
P 6350 3400
AR Path="/612B1274/611783BC/61178C80" Ref="U12"  Part="1" 
AR Path="/612B1274/611E90A8/61178C80" Ref="U13"  Part="1" 
F 0 "U13" H 6500 3200 50  0000 C CNN
F 1 "OPA859xDSG" H 6700 3100 50  0000 C CNN
F 2 "Package_SON:WSON-8-1EP_2x2mm_P0.5mm_EP0.9x1.6mm" H 6250 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/opa859.pdf" H 6750 3800 50  0001 C CNN
	1    6350 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J?
U 1 1 611A4FDB
P 3550 3500
AR Path="/60B16D71/611A4FDB" Ref="J?"  Part="1" 
AR Path="/612B1274/611A4FDB" Ref="J?"  Part="1" 
AR Path="/612B1274/611783BC/611A4FDB" Ref="J6"  Part="1" 
AR Path="/612B1274/611E90A8/611A4FDB" Ref="J8"  Part="1" 
F 0 "J8" H 3650 3475 50  0000 L CNN
F 1 "BNC" H 3650 3384 50  0000 L CNN
F 2 "proj_footprints:BNC_Molex_0731713150" H 3550 3500 50  0001 C CNN
F 3 " ~" H 3550 3500 50  0001 C CNN
F 4 "0731713150" H 3550 3500 50  0001 C CNN "Part"
F 5 "Molex" H 3550 3500 50  0001 C CNN "Manufacturer"
	1    3550 3500
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 611A4FE1
P 3550 3850
AR Path="/612B1274/611A4FE1" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611783BC/611A4FE1" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611E90A8/611A4FE1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3550 3600 50  0001 C CNN
F 1 "GNDA" H 3555 3677 50  0000 C CNN
F 2 "" H 3550 3850 50  0001 C CNN
F 3 "" H 3550 3850 50  0001 C CNN
	1    3550 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 611A70F5
P 4150 3500
AR Path="/612B1274/611A70F5" Ref="R?"  Part="1" 
AR Path="/612B1274/611783BC/611A70F5" Ref="R47"  Part="1" 
AR Path="/612B1274/611E90A8/611A70F5" Ref="R49"  Part="1" 
F 0 "R49" V 3954 3500 50  0000 C CNN
F 1 "500k" V 4045 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4150 3500 50  0001 C CNN
F 3 "~" H 4150 3500 50  0001 C CNN
	1    4150 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 3500 4000 3500
Wire Wire Line
	4250 3500 4300 3500
Wire Wire Line
	6050 3300 5800 3300
Wire Wire Line
	6650 2900 6650 3300
$Comp
L power:-2V5 #PWR?
U 1 1 611CC3FB
P 6250 3800
AR Path="/6086F2E3/611CC3FB" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611783BC/611CC3FB" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611E90A8/611CC3FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6250 3900 50  0001 C CNN
F 1 "-2V5" H 6265 3973 50  0000 C CNN
F 2 "" H 6250 3800 50  0001 C CNN
F 3 "" H 6250 3800 50  0001 C CNN
	1    6250 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 3700 6250 3800
$Comp
L fmc:+2V5_analog #PWR?
U 1 1 611CD651
P 6250 2700
AR Path="/612B1274/611783BC/611CD651" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611E90A8/611CD651" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6250 2550 50  0001 C CNN
F 1 "+2V5_analog" H 6265 2873 50  0000 C CNN
F 2 "" H 6250 2700 50  0001 C CNN
F 3 "" H 6250 2700 50  0001 C CNN
	1    6250 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2700 6250 3050
Wire Wire Line
	6350 3100 6350 3050
Wire Wire Line
	6350 3050 6250 3050
Connection ~ 6250 3050
Wire Wire Line
	6250 3050 6250 3100
Wire Wire Line
	7250 5100 7400 5100
$Comp
L fmc:100nF_402 C?
U 1 1 611D1DE7
P 7400 4950
AR Path="/60AABC24/611D1DE7" Ref="C?"  Part="1" 
AR Path="/612B1274/611D1DE7" Ref="C?"  Part="1" 
AR Path="/612B1274/611783BC/611D1DE7" Ref="C70"  Part="1" 
AR Path="/612B1274/611E90A8/611D1DE7" Ref="C76"  Part="1" 
F 0 "C76" H 7450 5200 50  0000 L CNN
F 1 "100n" H 7400 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7438 4800 50  0001 C CNN
F 3 "~" H 7400 4920 50  0001 C CNN
F 4 "GRM155R61C104KA88D" H 7525 5150 50  0001 C CNN "Part"
F 5 "Murata" H 7625 5250 50  0001 C CNN "Manufacturer"
	1    7400 4950
	1    0    0    -1  
$EndComp
Connection ~ 7400 4800
Wire Wire Line
	7400 4800 7700 4800
Connection ~ 7400 5100
Wire Wire Line
	7400 5100 7700 5100
$Comp
L fmc:+2V5_analog #PWR?
U 1 1 611D1FCA
P 7200 4800
AR Path="/612B1274/611783BC/611D1FCA" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611E90A8/611D1FCA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7200 4650 50  0001 C CNN
F 1 "+2V5_analog" H 7215 4973 50  0000 C CNN
F 2 "" H 7200 4800 50  0001 C CNN
F 3 "" H 7200 4800 50  0001 C CNN
	1    7200 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4800 7400 4800
$Comp
L fmc:1uF_805 C?
U 1 1 611D4AAD
P 7700 4950
AR Path="/60B16D71/611D4AAD" Ref="C?"  Part="1" 
AR Path="/612B1274/611D4AAD" Ref="C?"  Part="1" 
AR Path="/612B1274/611783BC/611D4AAD" Ref="C71"  Part="1" 
AR Path="/612B1274/611E90A8/611D4AAD" Ref="C77"  Part="1" 
F 0 "C77" H 7650 5200 50  0000 L CNN
F 1 "1u" H 7650 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7738 4800 50  0001 C CNN
F 3 "~" H 7700 4950 50  0001 C CNN
F 4 "GCJ219R71C105KA01" H 7825 5150 50  0001 C CNN "Part"
F 5 "Murata" H 7925 5250 50  0001 C CNN "Manufacturer"
	1    7700 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5150 5600 5150
$Comp
L fmc:100nF_402 C?
U 1 1 611D5312
P 5600 5000
AR Path="/60AABC24/611D5312" Ref="C?"  Part="1" 
AR Path="/612B1274/611D5312" Ref="C?"  Part="1" 
AR Path="/612B1274/611783BC/611D5312" Ref="C68"  Part="1" 
AR Path="/612B1274/611E90A8/611D5312" Ref="C74"  Part="1" 
F 0 "C74" H 5650 5250 50  0000 L CNN
F 1 "100n" H 5600 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5638 4850 50  0001 C CNN
F 3 "~" H 5600 4970 50  0001 C CNN
F 4 "GRM155R61C104KA88D" H 5725 5200 50  0001 C CNN "Part"
F 5 "Murata" H 5825 5300 50  0001 C CNN "Manufacturer"
	1    5600 5000
	1    0    0    -1  
$EndComp
Connection ~ 5600 4850
Wire Wire Line
	5600 4850 5900 4850
Connection ~ 5600 5150
Wire Wire Line
	5600 5150 5900 5150
$Comp
L fmc:1uF_805 C?
U 1 1 611D532F
P 5900 5000
AR Path="/60B16D71/611D532F" Ref="C?"  Part="1" 
AR Path="/612B1274/611D532F" Ref="C?"  Part="1" 
AR Path="/612B1274/611783BC/611D532F" Ref="C69"  Part="1" 
AR Path="/612B1274/611E90A8/611D532F" Ref="C75"  Part="1" 
F 0 "C75" H 5850 5250 50  0000 L CNN
F 1 "1u" H 5850 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5938 4850 50  0001 C CNN
F 3 "~" H 5900 5000 50  0001 C CNN
F 4 "GCJ219R71C105KA01" H 6025 5200 50  0001 C CNN "Part"
F 5 "Murata" H 6125 5300 50  0001 C CNN "Manufacturer"
	1    5900 5000
	1    0    0    -1  
$EndComp
$Comp
L power:-2V5 #PWR?
U 1 1 611D6C3B
P 5350 4850
AR Path="/6086F2E3/611D6C3B" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611783BC/611D6C3B" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611E90A8/611D6C3B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5350 4950 50  0001 C CNN
F 1 "-2V5" H 5365 5023 50  0000 C CNN
F 2 "" H 5350 4850 50  0001 C CNN
F 3 "" H 5350 4850 50  0001 C CNN
	1    5350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4850 5600 4850
Text HLabel 7150 3400 2    50   Input ~ 0
OUT
Wire Wire Line
	7150 3400 6650 3400
$Comp
L fmc:100nF_603 C?
U 1 1 61207E57
P 4950 3650
AR Path="/6086F2E3/61207E57" Ref="C?"  Part="1" 
AR Path="/60B16D71/61207E57" Ref="C?"  Part="1" 
AR Path="/612B1274/61207E57" Ref="C?"  Part="1" 
AR Path="/612B1274/611783BC/61207E57" Ref="C67"  Part="1" 
AR Path="/612B1274/611E90A8/61207E57" Ref="C73"  Part="1" 
F 0 "C73" H 5150 3650 50  0000 C CNN
F 1 "15p" H 5150 3750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4988 3500 50  0001 C CNN
F 3 "~" H 4950 3650 50  0001 C CNN
F 4 "" H 5075 3850 50  0001 C CNN "Part"
F 5 "Murata" H 5175 3950 50  0001 C CNN "Manufacturer"
	1    4950 3650
	1    0    0    1   
$EndComp
$Comp
L fmc:100nF_603 C?
U 1 1 61208FD0
P 4150 3150
AR Path="/6086F2E3/61208FD0" Ref="C?"  Part="1" 
AR Path="/60B16D71/61208FD0" Ref="C?"  Part="1" 
AR Path="/612B1274/61208FD0" Ref="C?"  Part="1" 
AR Path="/612B1274/611783BC/61208FD0" Ref="C66"  Part="1" 
AR Path="/612B1274/611E90A8/61208FD0" Ref="C72"  Part="1" 
F 0 "C72" H 4350 3150 50  0000 C CNN
F 1 "20p" H 4350 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4188 3000 50  0001 C CNN
F 3 "~" H 4150 3150 50  0001 C CNN
F 4 "" H 4275 3350 50  0001 C CNN "Part"
F 5 "Murata" H 4375 3450 50  0001 C CNN "Manufacturer"
	1    4150 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 3150 4300 3500
Connection ~ 4300 3500
Wire Wire Line
	4000 3150 4000 3500
Connection ~ 4000 3500
Wire Wire Line
	4000 3500 4050 3500
Wire Wire Line
	3550 3800 3550 3700
Wire Wire Line
	3550 3800 3550 3850
Connection ~ 3550 3800
Wire Wire Line
	4300 3500 4500 3500
Wire Wire Line
	4500 3500 4950 3500
Connection ~ 4500 3500
$Comp
L Device:R_Small R?
U 1 1 611A713B
P 4500 3650
AR Path="/612B1274/611A713B" Ref="R?"  Part="1" 
AR Path="/612B1274/611783BC/611A713B" Ref="R48"  Part="1" 
AR Path="/612B1274/611E90A8/611A713B" Ref="R50"  Part="1" 
F 0 "R50" V 4304 3650 50  0000 C CNN
F 1 "500k" V 4395 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4500 3650 50  0001 C CNN
F 3 "~" H 4500 3650 50  0001 C CNN
	1    4500 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3550 3800 4500 3800
Wire Wire Line
	4500 3500 4500 3550
Wire Wire Line
	4500 3750 4500 3800
Connection ~ 4500 3800
Wire Wire Line
	4500 3800 4950 3800
$Comp
L Device:CTRIM_Small C98
U 1 1 60D14E8F
P 5350 3650
AR Path="/612B1274/611783BC/60D14E8F" Ref="C98"  Part="1" 
AR Path="/612B1274/611E90A8/60D14E8F" Ref="C99"  Part="1" 
F 0 "C99" H 5441 3696 50  0000 L CNN
F 1 "5-15p" H 5441 3605 50  0000 L CNN
F 2 "proj_footprints:C_Trimmer_EW_Electronics_SCG3S" H 5350 3650 50  0001 C CNN
F 3 "~" H 5350 3650 50  0001 C CNN
	1    5350 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3500 5350 3500
Connection ~ 4950 3500
Wire Wire Line
	4950 3800 5350 3800
Wire Wire Line
	5350 3800 5350 3750
Connection ~ 4950 3800
Wire Wire Line
	5350 3550 5350 3500
Connection ~ 5350 3500
Wire Wire Line
	5350 3500 6050 3500
Wire Wire Line
	5800 2900 5800 3300
$Comp
L power:GNDA #PWR?
U 1 1 60D1F160
P 5450 5150
AR Path="/612B1274/60D1F160" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611783BC/60D1F160" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611E90A8/60D1F160" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5450 4900 50  0001 C CNN
F 1 "GNDA" H 5455 4977 50  0000 C CNN
F 2 "" H 5450 5150 50  0001 C CNN
F 3 "" H 5450 5150 50  0001 C CNN
	1    5450 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60D1F949
P 7250 5100
AR Path="/612B1274/60D1F949" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611783BC/60D1F949" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611E90A8/60D1F949" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7250 4850 50  0001 C CNN
F 1 "GNDA" H 7255 4927 50  0000 C CNN
F 2 "" H 7250 5100 50  0001 C CNN
F 3 "" H 7250 5100 50  0001 C CNN
	1    7250 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R82
U 1 1 60F53174
P 6050 2900
AR Path="/612B1274/611E90A8/60F53174" Ref="R82"  Part="1" 
AR Path="/612B1274/611783BC/60F53174" Ref="R80"  Part="1" 
F 0 "R82" V 5854 2900 50  0000 C CNN
F 1 "750" V 5945 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6050 2900 50  0001 C CNN
F 3 "~" H 6050 2900 50  0001 C CNN
	1    6050 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R81
U 1 1 60F5371A
P 5550 2900
AR Path="/612B1274/611E90A8/60F5371A" Ref="R81"  Part="1" 
AR Path="/612B1274/611783BC/60F5371A" Ref="R79"  Part="1" 
F 0 "R81" V 5354 2900 50  0000 C CNN
F 1 "150" V 5445 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5550 2900 50  0001 C CNN
F 3 "~" H 5550 2900 50  0001 C CNN
	1    5550 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 2900 6650 2900
Wire Wire Line
	5950 2900 5800 2900
Connection ~ 5800 2900
Wire Wire Line
	5800 2900 5650 2900
$Comp
L power:GNDA #PWR?
U 1 1 60F54B66
P 5300 3100
AR Path="/612B1274/60F54B66" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611783BC/60F54B66" Ref="#PWR?"  Part="1" 
AR Path="/612B1274/611E90A8/60F54B66" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5300 2850 50  0001 C CNN
F 1 "GNDA" H 5305 2927 50  0000 C CNN
F 2 "" H 5300 3100 50  0001 C CNN
F 3 "" H 5300 3100 50  0001 C CNN
	1    5300 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3100 5300 2900
Wire Wire Line
	5300 2900 5450 2900
$EndSCHEMATC
