-- code generated from the following source code:
--   stdlib.ecl
--   code.ecl
--   main.ecl
--
-- with the following command:
--
--    C:\Users\DELL\Desktop\CA\Projet2-CA\Projet_CAM\eclat\eclat-compiler\eclat.exe -arg=true;true;false code.ecl main.ecl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.runtime.all;


entity main is
  
  port(signal clk    : in std_logic;
       signal reset  : in std_logic;
       signal argument : in value(0 to 0);
       signal result : out value(0 to 0));
       
end entity;
architecture rtl of main is

  type t_state is (IDLE581);
  signal \state%now\, \state%next\: t_state;
  type t_state_var770 is (IDLE584, \$1370\, PAUSE_GET586, PAUSE_GET589, PAUSE_GET592, PAUSE_GET595, PAUSE_GET604, PAUSE_GET607, PAUSE_GET616, PAUSE_GET619, PAUSE_GET625, PAUSE_GET628, PAUSE_GET634, PAUSE_GET637, PAUSE_GET643, PAUSE_GET646, PAUSE_GET652, PAUSE_GET655, PAUSE_GET661, PAUSE_GET664, PAUSE_GET670, PAUSE_GET673, PAUSE_GET679, PAUSE_GET682, PAUSE_GET693, PAUSE_SET598, PAUSE_SET601, PAUSE_SET610, PAUSE_SET613, PAUSE_SET622, PAUSE_SET631, PAUSE_SET640, PAUSE_SET649, PAUSE_SET658, PAUSE_SET667, PAUSE_SET676, PAUSE_SET685, PAUSE_SET688, PAUSE_SET698, PAUSE_SET702, PAUSE_SET706, PAUSE_SET710, PAUSE_SET714, PAUSE_SET718, PAUSE_SET722, PAUSE_SET726, PAUSE_SET730, PAUSE_SET734, PAUSE_SET738, PAUSE_SET742, PAUSE_SET746, PAUSE_SET750, PAUSE_SET754, PAUSE_SET758, PAUSE_SET762, PAUSE_SET766, Q_WAIT587, Q_WAIT590, Q_WAIT593, Q_WAIT596, Q_WAIT599, Q_WAIT602, Q_WAIT605, Q_WAIT608, Q_WAIT611, Q_WAIT614, Q_WAIT617, Q_WAIT620, Q_WAIT623, Q_WAIT626, Q_WAIT629, Q_WAIT632, Q_WAIT635, Q_WAIT638, Q_WAIT641, Q_WAIT644, Q_WAIT647, Q_WAIT650, Q_WAIT653, Q_WAIT656, Q_WAIT659, Q_WAIT662, Q_WAIT665, Q_WAIT668, Q_WAIT671, Q_WAIT674, Q_WAIT677, Q_WAIT680, Q_WAIT683, Q_WAIT686, Q_WAIT689, Q_WAIT694, Q_WAIT699, Q_WAIT703, Q_WAIT707, Q_WAIT711, Q_WAIT715, Q_WAIT719, Q_WAIT723, Q_WAIT727, Q_WAIT731, Q_WAIT735, Q_WAIT739, Q_WAIT743, Q_WAIT747, Q_WAIT751, Q_WAIT755, Q_WAIT759, Q_WAIT763, Q_WAIT767);
  signal \state_var770%now\, \state_var770%next\: t_state_var770;
  type array_value_32 is array (natural range <>) of value(0 to 31);
  type array_value_69 is array (natural range <>) of value(0 to 68);
  signal \$1101_code\ : array_value_69(0 to 17);
  signal \$$1101_code_value\ : value(0 to 68) := (others => '0');
  signal \$$1101_code_ptr\ : natural range 0 to 17 := 0;
  signal \$$1101_code_ptr_write\ : natural range 0 to 17 := 0;
  signal \$$1101_code_write\ : value(0 to 68) := (others => '0');
  signal \$$1101_code_write_request\ : std_logic := '0';
  signal \$1102_stack\ : array_value_32(0 to 255);
  signal \$$1102_stack_value\ : value(0 to 31) := (others => '0');
  signal \$$1102_stack_ptr\ : natural range 0 to 255 := 0;
  signal \$$1102_stack_ptr_write\ : natural range 0 to 255 := 0;
  signal \$$1102_stack_write\ : value(0 to 31) := (others => '0');
  signal \$$1102_stack_write_request\ : std_logic := '0';
  signal \$1356%next\, \$1356%now\ : value(0 to 32) := (others => '0');
  signal \$v585%next\, \$v585%now\ : value(0 to 63) := (others => '0');
  signal \$1373%next\, \$1373%now\ : value(0 to 68) := (others => '0');
  signal \$v692%next\, \$v692%now\ : value(0 to 4) := (others => '0');
  signal \$1370_id%next\, \$1370_id%now\ : value(0 to 11) := (others => '0');
  signal \$1370_arg%next\, \$1370_arg%now\ : value(0 to 97) := (others => '0');
  signal \$$1102_stack_lock%next\, \$$1102_stack_lock%now\, 
         \$$1101_code_lock%next\, \$$1101_code_lock%now\, \$v657%next\, 
         \$v657%now\, \$1385_w%next\, \$1385_w%now\, \$1399%next\, 
         \$1399%now\, \$1366%next\, \$1366%now\, \$v733%next\, \$v733%now\, 
         \$v752%next\, \$v752%now\, \$1367%next\, \$1367%now\, \$v645%next\, 
         \$v645%now\, \$1420%next\, \$1420%now\, \$1428%next\, \$1428%now\, 
         \$v753%next\, \$v753%now\, \$v700%next\, \$v700%now\, \$v612%next\, 
         \$v612%now\, \$1430%next\, \$1430%now\, \$1433%next\, \$1433%now\, 
         \$1357%next\, \$1357%now\, \$v666%next\, \$v666%now\, \$1378%next\, 
         \$1378%now\, \$1411%next\, \$1411%now\, \$v709%next\, \$v709%now\, 
         \$1396%next\, \$1396%now\, \result579%next\, \result579%now\, 
         \$1390%next\, \$1390%now\, \$1429%next\, \$1429%now\, \$v695%next\, 
         \$v695%now\, \$v725%next\, \$v725%now\, \$v624%next\, \$v624%now\, 
         \$v594%next\, \$v594%now\, \$v603%next\, \$v603%now\, \$1404%next\, 
         \$1404%now\, \$1403%next\, \$1403%now\, \$1421%next\, \$1421%now\, 
         \$v740%next\, \$v740%now\, \$v741%next\, \$v741%now\, \$v748%next\, 
         \$v748%now\, \$v669%next\, \$v669%now\, \$v675%next\, \$v675%now\, 
         \$v684%next\, \$v684%now\, \$v705%next\, \$v705%now\, \$v627%next\, 
         \$v627%now\, \$v729%next\, \$v729%now\, \$v708%next\, \$v708%now\, 
         \rdy583%next\, \rdy583%now\, \$v765%next\, \$v765%now\, 
         \$v712%next\, \$v712%now\, \$1408%next\, \$1408%now\, \$1416%next\, 
         \$1416%now\, \$v672%next\, \$v672%now\, \$1374%next\, \$1374%now\, 
         \$v704%next\, \$v704%now\, \$v615%next\, \$v615%now\, 
         \$1386_w%next\, \$1386_w%now\, \$1412%next\, \$1412%now\, 
         \$1368%next\, \$1368%now\, \$v660%next\, \$v660%now\, \$v690%next\, 
         \$v690%now\, \$v717%next\, \$v717%now\, \$v728%next\, \$v728%now\, 
         \$1359%next\, \$1359%now\, \$v618%next\, \$v618%now\, \$v701%next\, 
         \$v701%now\, \$1426%next\, \$1426%now\, \$1419%next\, \$1419%now\, 
         \$v633%next\, \$v633%now\, \$v642%next\, \$v642%now\, \$v757%next\, 
         \$v757%now\, \$1407%next\, \$1407%now\, \$1425%next\, \$1425%now\, 
         \$v713%next\, \$v713%now\, \$v609%next\, \$v609%now\, \$1363%next\, 
         \$1363%now\, \$1424%next\, \$1424%now\, \$v732%next\, \$v732%now\, 
         \$v663%next\, \$v663%now\, \$1369%next\, \$1369%now\, \$1431%next\, 
         \$1431%now\, \$v724%next\, \$v724%now\, \rdy580%next\, \rdy580%now\, 
         \$v636%next\, \$v636%now\, \$v720%next\, \$v720%now\, \$v744%next\, 
         \$v744%now\, \$v756%next\, \$v756%now\, \$v648%next\, \$v648%now\, 
         \$1391%next\, \$1391%now\, \$1364%next\, \$1364%now\, \$1432%next\, 
         \$1432%now\, \$v697%next\, \$v697%now\, \$1400%next\, \$1400%now\, 
         \$v577%next\, \$v577%now\, \$1392%next\, \$1392%now\, \$1360%next\, 
         \$1360%now\, \$v681%next\, \$v681%now\, \$v591%next\, \$v591%now\, 
         \$v654%next\, \$v654%now\, \$v687%next\, \$v687%now\, \$v651%next\, 
         \$v651%now\, \$v597%next\, \$v597%now\, \$1382%next\, \$1382%now\, 
         \$v716%next\, \$v716%now\, \$v768%next\, \$v768%now\, \$v588%next\, 
         \$v588%now\, \$v721%next\, \$v721%now\, \$v621%next\, \$v621%now\, 
         \$1358%next\, \$1358%now\, \$1387%next\, \$1387%now\, \$v736%next\, 
         \$v736%now\, \$v749%next\, \$v749%now\, \$1434%next\, \$1434%now\, 
         \$1395%next\, \$1395%now\, \$1435%next\, \$1435%now\, \$v630%next\, 
         \$v630%now\, \$v639%next\, \$v639%now\, \$1415%next\, \$1415%now\, 
         \$v696%next\, \$v696%now\, \$v606%next\, \$v606%now\, \$v600%next\, 
         \$v600%now\, \$v760%next\, \$v760%now\, \$v764%next\, \$v764%now\, 
         \$v678%next\, \$v678%now\, \$1362%next\, \$1362%now\, \$1361%next\, 
         \$1361%now\, \$1427%next\, \$1427%now\, \$1380%next\, \$1380%now\, 
         \$1422_b%next\, \$1422_b%now\ : value(0 to 0) := (others => '0');
  signal \$1423_v%next\, \$1423_v%now\, \$1409_x1%next\, \$1409_x1%now\, 
         \$1405_x1%next\, \$1405_x1%now\, \$1413_x1%next\, \$1413_x1%now\, 
         \$1417_x1%next\, \$1417_x1%now\, \$1383_a%next\, \$1383_a%now\, 
         \$v737%next\, \$v737%now\, \$1406_x2%next\, \$1406_x2%now\, 
         \$1365_acc_final%next\, \$1365_acc_final%now\, \$1381_u%next\, 
         \$1381_u%now\, \$1436%next\, \$1436%now\, \result582%next\, 
         \result582%now\, \$v761%next\, \$v761%now\, \$1389_u%next\, 
         \$1389_u%now\, \$1414_x2%next\, \$1414_x2%now\, \$1375_arg%next\, 
         \$1375_arg%now\, \$1394_x2%next\, \$1394_x2%now\, \$1402_x2%next\, 
         \$1402_x2%now\, \$1384_b%next\, \$1384_b%now\, \$1418_x2%next\, 
         \$1418_x2%now\, \$1410_x2%next\, \$1410_x2%now\, 
         \$1376_code_ptr%next\, \$1376_code_ptr%now\, \$1393_x1%next\, 
         \$1393_x1%now\, \$1398_x2%next\, \$1398_x2%now\, \$1397_x1%next\, 
         \$1397_x1%now\, \$v745%next\, \$v745%now\, \$1355_cy%next\, 
         \$1355_cy%now\, \$1379_v%next\, \$1379_v%now\, \$1401_x1%next\, 
         \$1401_x1%now\, \$1377_n%next\, \$1377_n%now\, \$1370_result%next\, 
         \$1370_result%now\, \$1388_v%next\, \$1388_v%now\ : value(0 to 31) := (others => '0');
  
  begin
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1101_code_write_request\ = '1' then
                    \$1101_code\(\$$1101_code_ptr_write\) <= \$$1101_code_write\;
                 end if;
                 \$$1101_code_value\ <= \$1101_code\(\$$1101_code_ptr\);
            end if;
        end process;
    
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1102_stack_write_request\ = '1' then
                    \$1102_stack\(\$$1102_stack_ptr_write\) <= \$$1102_stack_write\;
                 end if;
                 \$$1102_stack_value\ <= \$1102_stack\(\$$1102_stack_ptr\);
            end if;
        end process;
    
    process (reset,clk)
      begin
      if reset = '1' then
        \$1422_b%now\ <= (others => '0');
        \$1380%now\ <= (others => '0');
        \$1388_v%now\ <= (others => '0');
        \$1427%now\ <= (others => '0');
        \$1370_result%now\ <= (others => '0');
        \$1361%now\ <= (others => '0');
        \$1362%now\ <= (others => '0');
        \$1377_n%now\ <= (others => '0');
        \$v678%now\ <= (others => '0');
        \$1401_x1%now\ <= (others => '0');
        \$1379_v%now\ <= (others => '0');
        \$v764%now\ <= (others => '0');
        \$v760%now\ <= (others => '0');
        \$v600%now\ <= (others => '0');
        \$v606%now\ <= (others => '0');
        \$1355_cy%now\ <= (others => '0');
        \$v696%now\ <= (others => '0');
        \$1415%now\ <= (others => '0');
        \$v745%now\ <= (others => '0');
        \$v639%now\ <= (others => '0');
        \$v630%now\ <= (others => '0');
        \$1397_x1%now\ <= (others => '0');
        \$1435%now\ <= (others => '0');
        \$1395%now\ <= (others => '0');
        \$1434%now\ <= (others => '0');
        \$1398_x2%now\ <= (others => '0');
        \$v749%now\ <= (others => '0');
        \$1370_arg%now\ <= (others => '0');
        \$v736%now\ <= (others => '0');
        \$1387%now\ <= (others => '0');
        \$1393_x1%now\ <= (others => '0');
        \$1376_code_ptr%now\ <= (others => '0');
        \$1358%now\ <= (others => '0');
        \$v621%now\ <= (others => '0');
        \$v721%now\ <= (others => '0');
        \$v588%now\ <= (others => '0');
        \$v768%now\ <= (others => '0');
        \$v716%now\ <= (others => '0');
        \$1382%now\ <= (others => '0');
        \$v597%now\ <= (others => '0');
        \$v651%now\ <= (others => '0');
        \$v687%now\ <= (others => '0');
        \$v654%now\ <= (others => '0');
        \$v591%now\ <= (others => '0');
        \$v681%now\ <= (others => '0');
        \$v585%now\ <= (others => '0');
        \$1410_x2%now\ <= (others => '0');
        \$1360%now\ <= (others => '0');
        \$1392%now\ <= (others => '0');
        \$1418_x2%now\ <= (others => '0');
        \$v577%now\ <= (others => '0');
        \$1384_b%now\ <= (others => '0');
        \$1400%now\ <= (others => '0');
        \$1402_x2%now\ <= (others => '0');
        \$v697%now\ <= (others => '0');
        \$1432%now\ <= (others => '0');
        \$1364%now\ <= (others => '0');
        \$1391%now\ <= (others => '0');
        \$v648%now\ <= (others => '0');
        \$1356%now\ <= (others => '0');
        \$v756%now\ <= (others => '0');
        \$v744%now\ <= (others => '0');
        \$v720%now\ <= (others => '0');
        \$1394_x2%now\ <= (others => '0');
        \$v636%now\ <= (others => '0');
        \rdy580%now\ <= (others => '0');
        \$v724%now\ <= (others => '0');
        \$1431%now\ <= (others => '0');
        \$1369%now\ <= (others => '0');
        \$v663%now\ <= (others => '0');
        \$1375_arg%now\ <= (others => '0');
        \$v732%now\ <= (others => '0');
        \$1424%now\ <= (others => '0');
        \$1370_id%now\ <= (others => '0');
        \$1363%now\ <= (others => '0');
        \$v609%now\ <= (others => '0');
        \$v713%now\ <= (others => '0');
        \$1425%now\ <= (others => '0');
        \$1414_x2%now\ <= (others => '0');
        \$1389_u%now\ <= (others => '0');
        \$1407%now\ <= (others => '0');
        \$v761%now\ <= (others => '0');
        \$v757%now\ <= (others => '0');
        \$v642%now\ <= (others => '0');
        \$v633%now\ <= (others => '0');
        \$1419%now\ <= (others => '0');
        \$1426%now\ <= (others => '0');
        \$v701%now\ <= (others => '0');
        \$v618%now\ <= (others => '0');
        \$1359%now\ <= (others => '0');
        \$v728%now\ <= (others => '0');
        \$v692%now\ <= (others => '0');
        \$1373%now\ <= (others => '0');
        \$v717%now\ <= (others => '0');
        \$v690%now\ <= (others => '0');
        \$v660%now\ <= (others => '0');
        \$1368%now\ <= (others => '0');
        \$1412%now\ <= (others => '0');
        \$1386_w%now\ <= (others => '0');
        \$v615%now\ <= (others => '0');
        \result582%now\ <= (others => '0');
        \$v704%now\ <= (others => '0');
        \$1374%now\ <= (others => '0');
        \$v672%now\ <= (others => '0');
        \$1416%now\ <= (others => '0');
        \$1408%now\ <= (others => '0');
        \$v712%now\ <= (others => '0');
        \$v765%now\ <= (others => '0');
        \rdy583%now\ <= (others => '0');
        \$1436%now\ <= (others => '0');
        \$1381_u%now\ <= (others => '0');
        \$1365_acc_final%now\ <= (others => '0');
        \$v708%now\ <= (others => '0');
        \$v729%now\ <= (others => '0');
        \$v627%now\ <= (others => '0');
        \$v705%now\ <= (others => '0');
        \$1406_x2%now\ <= (others => '0');
        \$v737%now\ <= (others => '0');
        \$v684%now\ <= (others => '0');
        \$v675%now\ <= (others => '0');
        \$v669%now\ <= (others => '0');
        \$v748%now\ <= (others => '0');
        \$v741%now\ <= (others => '0');
        \$v740%now\ <= (others => '0');
        \$1421%now\ <= (others => '0');
        \$1403%now\ <= (others => '0');
        \$1404%now\ <= (others => '0');
        \$v603%now\ <= (others => '0');
        \$v594%now\ <= (others => '0');
        \$1383_a%now\ <= (others => '0');
        \$1417_x1%now\ <= (others => '0');
        \$v624%now\ <= (others => '0');
        \$v725%now\ <= (others => '0');
        \$1413_x1%now\ <= (others => '0');
        \$1405_x1%now\ <= (others => '0');
        \$v695%now\ <= (others => '0');
        \$1429%now\ <= (others => '0');
        \$1390%now\ <= (others => '0');
        \result579%now\ <= (others => '0');
        \$1396%now\ <= (others => '0');
        \$v709%now\ <= (others => '0');
        \$1411%now\ <= (others => '0');
        \$1378%now\ <= (others => '0');
        \$1409_x1%now\ <= (others => '0');
        \$v666%now\ <= (others => '0');
        \$1357%now\ <= (others => '0');
        \$1433%now\ <= (others => '0');
        \$1430%now\ <= (others => '0');
        \$v612%now\ <= (others => '0');
        \$v700%now\ <= (others => '0');
        \$v753%now\ <= (others => '0');
        \$1428%now\ <= (others => '0');
        \$1423_v%now\ <= (others => '0');
        \$1420%now\ <= (others => '0');
        \$v645%now\ <= (others => '0');
        \$1367%now\ <= (others => '0');
        \$v752%now\ <= (others => '0');
        \$v733%now\ <= (others => '0');
        \$1366%now\ <= (others => '0');
        \$1399%now\ <= (others => '0');
        \$1385_w%now\ <= (others => '0');
        \$v657%now\ <= (others => '0');
        \$$1101_code_lock%now\ <= (others => '0');
        \$$1102_stack_lock%now\ <= (others => '0');
        \state%now\ <= idle581;
        \state_var770%now\ <= idle584;
      elsif (rising_edge(clk)) then
        \$1422_b%now\ <= \$1422_b%next\;
        \$1380%now\ <= \$1380%next\;
        \$1388_v%now\ <= \$1388_v%next\;
        \$1427%now\ <= \$1427%next\;
        \$1370_result%now\ <= \$1370_result%next\;
        \$1361%now\ <= \$1361%next\;
        \$1362%now\ <= \$1362%next\;
        \$1377_n%now\ <= \$1377_n%next\;
        \$v678%now\ <= \$v678%next\;
        \$1401_x1%now\ <= \$1401_x1%next\;
        \$1379_v%now\ <= \$1379_v%next\;
        \$v764%now\ <= \$v764%next\;
        \$v760%now\ <= \$v760%next\;
        \$v600%now\ <= \$v600%next\;
        \$v606%now\ <= \$v606%next\;
        \$1355_cy%now\ <= \$1355_cy%next\;
        \$v696%now\ <= \$v696%next\;
        \$1415%now\ <= \$1415%next\;
        \$v745%now\ <= \$v745%next\;
        \$v639%now\ <= \$v639%next\;
        \$v630%now\ <= \$v630%next\;
        \$1397_x1%now\ <= \$1397_x1%next\;
        \$1435%now\ <= \$1435%next\;
        \$1395%now\ <= \$1395%next\;
        \$1434%now\ <= \$1434%next\;
        \$1398_x2%now\ <= \$1398_x2%next\;
        \$v749%now\ <= \$v749%next\;
        \$1370_arg%now\ <= \$1370_arg%next\;
        \$v736%now\ <= \$v736%next\;
        \$1387%now\ <= \$1387%next\;
        \$1393_x1%now\ <= \$1393_x1%next\;
        \$1376_code_ptr%now\ <= \$1376_code_ptr%next\;
        \$1358%now\ <= \$1358%next\;
        \$v621%now\ <= \$v621%next\;
        \$v721%now\ <= \$v721%next\;
        \$v588%now\ <= \$v588%next\;
        \$v768%now\ <= \$v768%next\;
        \$v716%now\ <= \$v716%next\;
        \$1382%now\ <= \$1382%next\;
        \$v597%now\ <= \$v597%next\;
        \$v651%now\ <= \$v651%next\;
        \$v687%now\ <= \$v687%next\;
        \$v654%now\ <= \$v654%next\;
        \$v591%now\ <= \$v591%next\;
        \$v681%now\ <= \$v681%next\;
        \$v585%now\ <= \$v585%next\;
        \$1410_x2%now\ <= \$1410_x2%next\;
        \$1360%now\ <= \$1360%next\;
        \$1392%now\ <= \$1392%next\;
        \$1418_x2%now\ <= \$1418_x2%next\;
        \$v577%now\ <= \$v577%next\;
        \$1384_b%now\ <= \$1384_b%next\;
        \$1400%now\ <= \$1400%next\;
        \$1402_x2%now\ <= \$1402_x2%next\;
        \$v697%now\ <= \$v697%next\;
        \$1432%now\ <= \$1432%next\;
        \$1364%now\ <= \$1364%next\;
        \$1391%now\ <= \$1391%next\;
        \$v648%now\ <= \$v648%next\;
        \$1356%now\ <= \$1356%next\;
        \$v756%now\ <= \$v756%next\;
        \$v744%now\ <= \$v744%next\;
        \$v720%now\ <= \$v720%next\;
        \$1394_x2%now\ <= \$1394_x2%next\;
        \$v636%now\ <= \$v636%next\;
        \rdy580%now\ <= \rdy580%next\;
        \$v724%now\ <= \$v724%next\;
        \$1431%now\ <= \$1431%next\;
        \$1369%now\ <= \$1369%next\;
        \$v663%now\ <= \$v663%next\;
        \$1375_arg%now\ <= \$1375_arg%next\;
        \$v732%now\ <= \$v732%next\;
        \$1424%now\ <= \$1424%next\;
        \$1370_id%now\ <= \$1370_id%next\;
        \$1363%now\ <= \$1363%next\;
        \$v609%now\ <= \$v609%next\;
        \$v713%now\ <= \$v713%next\;
        \$1425%now\ <= \$1425%next\;
        \$1414_x2%now\ <= \$1414_x2%next\;
        \$1389_u%now\ <= \$1389_u%next\;
        \$1407%now\ <= \$1407%next\;
        \$v761%now\ <= \$v761%next\;
        \$v757%now\ <= \$v757%next\;
        \$v642%now\ <= \$v642%next\;
        \$v633%now\ <= \$v633%next\;
        \$1419%now\ <= \$1419%next\;
        \$1426%now\ <= \$1426%next\;
        \$v701%now\ <= \$v701%next\;
        \$v618%now\ <= \$v618%next\;
        \$1359%now\ <= \$1359%next\;
        \$v728%now\ <= \$v728%next\;
        \$v692%now\ <= \$v692%next\;
        \$1373%now\ <= \$1373%next\;
        \$v717%now\ <= \$v717%next\;
        \$v690%now\ <= \$v690%next\;
        \$v660%now\ <= \$v660%next\;
        \$1368%now\ <= \$1368%next\;
        \$1412%now\ <= \$1412%next\;
        \$1386_w%now\ <= \$1386_w%next\;
        \$v615%now\ <= \$v615%next\;
        \result582%now\ <= \result582%next\;
        \$v704%now\ <= \$v704%next\;
        \$1374%now\ <= \$1374%next\;
        \$v672%now\ <= \$v672%next\;
        \$1416%now\ <= \$1416%next\;
        \$1408%now\ <= \$1408%next\;
        \$v712%now\ <= \$v712%next\;
        \$v765%now\ <= \$v765%next\;
        \rdy583%now\ <= \rdy583%next\;
        \$1436%now\ <= \$1436%next\;
        \$1381_u%now\ <= \$1381_u%next\;
        \$1365_acc_final%now\ <= \$1365_acc_final%next\;
        \$v708%now\ <= \$v708%next\;
        \$v729%now\ <= \$v729%next\;
        \$v627%now\ <= \$v627%next\;
        \$v705%now\ <= \$v705%next\;
        \$1406_x2%now\ <= \$1406_x2%next\;
        \$v737%now\ <= \$v737%next\;
        \$v684%now\ <= \$v684%next\;
        \$v675%now\ <= \$v675%next\;
        \$v669%now\ <= \$v669%next\;
        \$v748%now\ <= \$v748%next\;
        \$v741%now\ <= \$v741%next\;
        \$v740%now\ <= \$v740%next\;
        \$1421%now\ <= \$1421%next\;
        \$1403%now\ <= \$1403%next\;
        \$1404%now\ <= \$1404%next\;
        \$v603%now\ <= \$v603%next\;
        \$v594%now\ <= \$v594%next\;
        \$1383_a%now\ <= \$1383_a%next\;
        \$1417_x1%now\ <= \$1417_x1%next\;
        \$v624%now\ <= \$v624%next\;
        \$v725%now\ <= \$v725%next\;
        \$1413_x1%now\ <= \$1413_x1%next\;
        \$1405_x1%now\ <= \$1405_x1%next\;
        \$v695%now\ <= \$v695%next\;
        \$1429%now\ <= \$1429%next\;
        \$1390%now\ <= \$1390%next\;
        \result579%now\ <= \result579%next\;
        \$1396%now\ <= \$1396%next\;
        \$v709%now\ <= \$v709%next\;
        \$1411%now\ <= \$1411%next\;
        \$1378%now\ <= \$1378%next\;
        \$1409_x1%now\ <= \$1409_x1%next\;
        \$v666%now\ <= \$v666%next\;
        \$1357%now\ <= \$1357%next\;
        \$1433%now\ <= \$1433%next\;
        \$1430%now\ <= \$1430%next\;
        \$v612%now\ <= \$v612%next\;
        \$v700%now\ <= \$v700%next\;
        \$v753%now\ <= \$v753%next\;
        \$1428%now\ <= \$1428%next\;
        \$1423_v%now\ <= \$1423_v%next\;
        \$1420%now\ <= \$1420%next\;
        \$v645%now\ <= \$v645%next\;
        \$1367%now\ <= \$1367%next\;
        \$v752%now\ <= \$v752%next\;
        \$v733%now\ <= \$v733%next\;
        \$1366%now\ <= \$1366%next\;
        \$1399%now\ <= \$1399%next\;
        \$1385_w%now\ <= \$1385_w%next\;
        \$v657%now\ <= \$v657%next\;
        \$$1101_code_lock%now\ <= \$$1101_code_lock%next\;
        \$$1102_stack_lock%now\ <= \$$1102_stack_lock%next\;
        \state_var770%now\ <= \state_var770%next\;
        \state%now\ <= \state%next\;
      end if;
    end process;
      
      process(argument,\state%now\, clk,\state_var770%now\, \$$1101_code_value\, \$$1102_stack_value\, \$1422_b%now\, \$1380%now\, \$1388_v%now\, \$1427%now\, \$1370_result%now\, \$1361%now\, \$1362%now\, \$1377_n%now\, \$v678%now\, \$1401_x1%now\, \$1379_v%now\, \$v764%now\, \$v760%now\, \$v600%now\, \$v606%now\, \$1355_cy%now\, \$v696%now\, \$1415%now\, \$v745%now\, \$v639%now\, \$v630%now\, \$1397_x1%now\, \$1435%now\, \$1395%now\, \$1434%now\, \$1398_x2%now\, \$v749%now\, \$1370_arg%now\, \$v736%now\, \$1387%now\, \$1393_x1%now\, \$1376_code_ptr%now\, \$1358%now\, \$v621%now\, \$v721%now\, \$v588%now\, \$v768%now\, \$v716%now\, \$1382%now\, \$v597%now\, \$v651%now\, \$v687%now\, \$v654%now\, \$v591%now\, \$v681%now\, \$v585%now\, \$1410_x2%now\, \$1360%now\, \$1392%now\, \$1418_x2%now\, \$v577%now\, \$1384_b%now\, \$1400%now\, \$1402_x2%now\, \$v697%now\, \$1432%now\, \$1364%now\, \$1391%now\, \$v648%now\, \$1356%now\, \$v756%now\, \$v744%now\, \$v720%now\, \$1394_x2%now\, \$v636%now\, \rdy580%now\, \$v724%now\, \$1431%now\, \$1369%now\, \$v663%now\, \$1375_arg%now\, \$v732%now\, \$1424%now\, \$1370_id%now\, \$1363%now\, \$v609%now\, \$v713%now\, \$1425%now\, \$1414_x2%now\, \$1389_u%now\, \$1407%now\, \$v761%now\, \$v757%now\, \$v642%now\, \$v633%now\, \$1419%now\, \$1426%now\, \$v701%now\, \$v618%now\, \$1359%now\, \$v728%now\, \$v692%now\, \$1373%now\, \$v717%now\, \$v690%now\, \$v660%now\, \$1368%now\, \$1412%now\, \$1386_w%now\, \$v615%now\, \result582%now\, \$v704%now\, \$1374%now\, \$v672%now\, \$1416%now\, \$1408%now\, \$v712%now\, \$v765%now\, \rdy583%now\, \$1436%now\, \$1381_u%now\, \$1365_acc_final%now\, \$v708%now\, \$v729%now\, \$v627%now\, \$v705%now\, \$1406_x2%now\, \$v737%now\, \$v684%now\, \$v675%now\, \$v669%now\, \$v748%now\, \$v741%now\, \$v740%now\, \$1421%now\, \$1403%now\, \$1404%now\, \$v603%now\, \$v594%now\, \$1383_a%now\, \$1417_x1%now\, \$v624%now\, \$v725%now\, \$1413_x1%now\, \$1405_x1%now\, \$v695%now\, \$1429%now\, \$1390%now\, \result579%now\, \$1396%now\, \$v709%now\, \$1411%now\, \$1378%now\, \$1409_x1%now\, \$v666%now\, \$1357%now\, \$1433%now\, \$1430%now\, \$v612%now\, \$v700%now\, \$v753%now\, \$1428%now\, \$1423_v%now\, \$1420%now\, \$v645%now\, \$1367%now\, \$v752%now\, \$v733%now\, \$1366%now\, \$1399%now\, \$1385_w%now\, \$v657%now\, \$$1101_code_lock%now\, \$$1102_stack_lock%now\)
        variable \$1356\ : value(0 to 32) := (others => '0');
        variable \$v585\ : value(0 to 63) := (others => '0');
        variable \$1373\ : value(0 to 68) := (others => '0');
        variable \$v692\ : value(0 to 4) := (others => '0');
        variable \$1370_id\ : value(0 to 11) := (others => '0');
        variable \$1370_arg\ : value(0 to 97) := (others => '0');
        variable \$v657\, \$1385_w\, \$1399\, \$1366\, \$v733\, \$v752\, 
                 \$1367\, \$v645\, \$1420\, \$1428\, \$v753\, \$v700\, 
                 \$v612\, \$1430\, \$1433\, \$1357\, \$v666\, \$1378\, 
                 \$1411\, \$v709\, \$1396\, result579, \$1390\, \$1429\, 
                 \$v695\, \$v725\, \$v624\, \$v594\, \$v603\, \$1404\, 
                 \$1403\, \$1421\, \$v740\, \$v741\, \$v748\, \$v669\, 
                 \$v675\, \$v684\, \$v705\, \$v627\, \$v729\, \$v708\, 
                 rdy583, \$v765\, \$v712\, \$1408\, \$1416\, \$v672\, 
                 \$1374\, \$v704\, \$v615\, \$1386_w\, \$1412\, \$1368\, 
                 \$v660\, \$v690\, \$v717\, \$v728\, \$1359\, \$v618\, 
                 \$v701\, \$1426\, \$1419\, \$v633\, \$v642\, \$v757\, 
                 \$1407\, \$1425\, \$v713\, \$v609\, \$1363\, \$1424\, 
                 \$v732\, \$v663\, \$1369\, \$1431\, \$v724\, rdy580, 
                 \$v636\, \$v720\, \$v744\, \$v756\, \$v648\, \$1391\, 
                 \$1364\, \$1432\, \$v697\, \$1400\, \$v577\, \$1392\, 
                 \$1360\, \$v681\, \$v591\, \$v654\, \$v687\, \$v651\, 
                 \$v597\, \$1382\, \$v716\, \$v768\, \$v588\, \$v721\, 
                 \$v621\, \$1358\, \$1387\, \$v736\, \$v749\, \$1434\, 
                 \$1395\, \$1435\, \$v630\, \$v639\, \$1415\, \$v696\, 
                 \$v606\, \$v600\, \$v760\, \$v764\, \$v678\, \$1362\, 
                 \$1361\, \$1427\, \$1380\, \$1422_b\ : value(0 to 0) := (others => '0');
        variable \$1423_v\, \$1409_x1\, \$1405_x1\, \$1413_x1\, \$1417_x1\, 
                 \$1383_a\, \$v737\, \$1406_x2\, \$1365_acc_final\, 
                 \$1381_u\, \$1436\, result582, \$v761\, \$1389_u\, 
                 \$1414_x2\, \$1375_arg\, \$1394_x2\, \$1402_x2\, \$1384_b\, 
                 \$1418_x2\, \$1410_x2\, \$1376_code_ptr\, \$1393_x1\, 
                 \$1398_x2\, \$1397_x1\, \$v745\, \$1355_cy\, \$1379_v\, 
                 \$1401_x1\, \$1377_n\, \$1370_result\, \$1388_v\ : value(0 to 31) := (others => '0');
        variable state : t_state;
        variable state_var770 : t_state_var770;
        variable \$$1101_code_lock\ : value(0 to 0);
        variable \$$1102_stack_lock\ : value(0 to 0);
        
    begin
      \$1422_b\ := \$1422_b%now\;
      \$1380\ := \$1380%now\;
      \$1388_v\ := \$1388_v%now\;
      \$1427\ := \$1427%now\;
      \$1370_result\ := \$1370_result%now\;
      \$1361\ := \$1361%now\;
      \$1362\ := \$1362%now\;
      \$1377_n\ := \$1377_n%now\;
      \$v678\ := \$v678%now\;
      \$1401_x1\ := \$1401_x1%now\;
      \$1379_v\ := \$1379_v%now\;
      \$v764\ := \$v764%now\;
      \$v760\ := \$v760%now\;
      \$v600\ := \$v600%now\;
      \$v606\ := \$v606%now\;
      \$1355_cy\ := \$1355_cy%now\;
      \$v696\ := \$v696%now\;
      \$1415\ := \$1415%now\;
      \$v745\ := \$v745%now\;
      \$v639\ := \$v639%now\;
      \$v630\ := \$v630%now\;
      \$1397_x1\ := \$1397_x1%now\;
      \$1435\ := \$1435%now\;
      \$1395\ := \$1395%now\;
      \$1434\ := \$1434%now\;
      \$1398_x2\ := \$1398_x2%now\;
      \$v749\ := \$v749%now\;
      \$1370_arg\ := \$1370_arg%now\;
      \$v736\ := \$v736%now\;
      \$1387\ := \$1387%now\;
      \$1393_x1\ := \$1393_x1%now\;
      \$1376_code_ptr\ := \$1376_code_ptr%now\;
      \$1358\ := \$1358%now\;
      \$v621\ := \$v621%now\;
      \$v721\ := \$v721%now\;
      \$v588\ := \$v588%now\;
      \$v768\ := \$v768%now\;
      \$v716\ := \$v716%now\;
      \$1382\ := \$1382%now\;
      \$v597\ := \$v597%now\;
      \$v651\ := \$v651%now\;
      \$v687\ := \$v687%now\;
      \$v654\ := \$v654%now\;
      \$v591\ := \$v591%now\;
      \$v681\ := \$v681%now\;
      \$v585\ := \$v585%now\;
      \$1410_x2\ := \$1410_x2%now\;
      \$1360\ := \$1360%now\;
      \$1392\ := \$1392%now\;
      \$1418_x2\ := \$1418_x2%now\;
      \$v577\ := \$v577%now\;
      \$1384_b\ := \$1384_b%now\;
      \$1400\ := \$1400%now\;
      \$1402_x2\ := \$1402_x2%now\;
      \$v697\ := \$v697%now\;
      \$1432\ := \$1432%now\;
      \$1364\ := \$1364%now\;
      \$1391\ := \$1391%now\;
      \$v648\ := \$v648%now\;
      \$1356\ := \$1356%now\;
      \$v756\ := \$v756%now\;
      \$v744\ := \$v744%now\;
      \$v720\ := \$v720%now\;
      \$1394_x2\ := \$1394_x2%now\;
      \$v636\ := \$v636%now\;
      rdy580 := \rdy580%now\;
      \$v724\ := \$v724%now\;
      \$1431\ := \$1431%now\;
      \$1369\ := \$1369%now\;
      \$v663\ := \$v663%now\;
      \$1375_arg\ := \$1375_arg%now\;
      \$v732\ := \$v732%now\;
      \$1424\ := \$1424%now\;
      \$1370_id\ := \$1370_id%now\;
      \$1363\ := \$1363%now\;
      \$v609\ := \$v609%now\;
      \$v713\ := \$v713%now\;
      \$1425\ := \$1425%now\;
      \$1414_x2\ := \$1414_x2%now\;
      \$1389_u\ := \$1389_u%now\;
      \$1407\ := \$1407%now\;
      \$v761\ := \$v761%now\;
      \$v757\ := \$v757%now\;
      \$v642\ := \$v642%now\;
      \$v633\ := \$v633%now\;
      \$1419\ := \$1419%now\;
      \$1426\ := \$1426%now\;
      \$v701\ := \$v701%now\;
      \$v618\ := \$v618%now\;
      \$1359\ := \$1359%now\;
      \$v728\ := \$v728%now\;
      \$v692\ := \$v692%now\;
      \$1373\ := \$1373%now\;
      \$v717\ := \$v717%now\;
      \$v690\ := \$v690%now\;
      \$v660\ := \$v660%now\;
      \$1368\ := \$1368%now\;
      \$1412\ := \$1412%now\;
      \$1386_w\ := \$1386_w%now\;
      \$v615\ := \$v615%now\;
      result582 := \result582%now\;
      \$v704\ := \$v704%now\;
      \$1374\ := \$1374%now\;
      \$v672\ := \$v672%now\;
      \$1416\ := \$1416%now\;
      \$1408\ := \$1408%now\;
      \$v712\ := \$v712%now\;
      \$v765\ := \$v765%now\;
      rdy583 := \rdy583%now\;
      \$1436\ := \$1436%now\;
      \$1381_u\ := \$1381_u%now\;
      \$1365_acc_final\ := \$1365_acc_final%now\;
      \$v708\ := \$v708%now\;
      \$v729\ := \$v729%now\;
      \$v627\ := \$v627%now\;
      \$v705\ := \$v705%now\;
      \$1406_x2\ := \$1406_x2%now\;
      \$v737\ := \$v737%now\;
      \$v684\ := \$v684%now\;
      \$v675\ := \$v675%now\;
      \$v669\ := \$v669%now\;
      \$v748\ := \$v748%now\;
      \$v741\ := \$v741%now\;
      \$v740\ := \$v740%now\;
      \$1421\ := \$1421%now\;
      \$1403\ := \$1403%now\;
      \$1404\ := \$1404%now\;
      \$v603\ := \$v603%now\;
      \$v594\ := \$v594%now\;
      \$1383_a\ := \$1383_a%now\;
      \$1417_x1\ := \$1417_x1%now\;
      \$v624\ := \$v624%now\;
      \$v725\ := \$v725%now\;
      \$1413_x1\ := \$1413_x1%now\;
      \$1405_x1\ := \$1405_x1%now\;
      \$v695\ := \$v695%now\;
      \$1429\ := \$1429%now\;
      \$1390\ := \$1390%now\;
      result579 := \result579%now\;
      \$1396\ := \$1396%now\;
      \$v709\ := \$v709%now\;
      \$1411\ := \$1411%now\;
      \$1378\ := \$1378%now\;
      \$1409_x1\ := \$1409_x1%now\;
      \$v666\ := \$v666%now\;
      \$1357\ := \$1357%now\;
      \$1433\ := \$1433%now\;
      \$1430\ := \$1430%now\;
      \$v612\ := \$v612%now\;
      \$v700\ := \$v700%now\;
      \$v753\ := \$v753%now\;
      \$1428\ := \$1428%now\;
      \$1423_v\ := \$1423_v%now\;
      \$1420\ := \$1420%now\;
      \$v645\ := \$v645%now\;
      \$1367\ := \$1367%now\;
      \$v752\ := \$v752%now\;
      \$v733\ := \$v733%now\;
      \$1366\ := \$1366%now\;
      \$1399\ := \$1399%now\;
      \$1385_w\ := \$1385_w%now\;
      \$v657\ := \$v657%now\;
      \$$1101_code_lock\ := \$$1101_code_lock%now\;
      \$$1102_stack_lock\ := \$$1102_stack_lock%now\;
      state := \state%now\;
      state_var770 := \state_var770%now\;
      case state is
      when IDLE581 =>
        rdy580 := eclat_false;
        if \$v577\(0) = '1' then
          
        else
          \$v577\ := eclat_true;
          \$1436\ := X"0000000" & X"0";
        end if;
        \$1436\ := work.Int.add(\$1436\, X"0000000" & X"1");
        \$1355_cy\ := \$1436\;
        case state_var770 is
        when \$1370\ =>
          \$v696\ := work.Int.ge(\$1370_arg\(0 to 31), std_logic_vector(to_unsigned(\$1101_code\'length,32)));
          if \$v696\(0) = '1' then
            \$1370_result\ := \$1370_arg\(64 to 95);
            \$1365_acc_final\ := \$1370_result\;
            \$1366\ := work.Print.print_string(clk,of_string("Résultat = "));
            \$1367\ := work.Int.print(clk,work.Int.sub(\$1365_acc_final\, X"0000000" & X"1"));
            \$1368\ := work.Print.print_newline(clk,eclat_unit);
            \$1369\ := work.Print.print_string(clk,of_string("fin \n"));
            result582 := X"000000" & X"2a";
            rdy583 := eclat_true;
            state_var770 := IDLE584;
          else
            \$v695\ := \$$1101_code_lock\;
            if \$v695\(0) = '1' then
              state_var770 := Q_WAIT694;
            else
              acquire(\$$1101_code_lock\);
              \$$1101_code_ptr\ <= to_integer(unsigned(\$1370_arg\(0 to 31)));
              state_var770 := PAUSE_GET693;
            end if;
          end if;
        when PAUSE_GET586 =>
          \$1376_code_ptr\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$1370_arg\ := \$1376_code_ptr\ & work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2") & \$1375_arg\ & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_GET589 =>
          \$1375_arg\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v588\ := \$$1102_stack_lock\;
          if \$v588\(0) = '1' then
            state_var770 := Q_WAIT587;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET586;
          end if;
        when PAUSE_GET592 =>
          \$1379_v\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & \$1370_arg\(32 to 63) & \$1379_v\ & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_GET595 =>
          \$1381_u\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & \$1370_arg\(32 to 63) & \$1381_u\ & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_GET604 =>
          \$1384_b\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v603\ := \$$1102_stack_lock\;
          if \$v603\(0) = '1' then
            state_var770 := Q_WAIT602;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"1")));
            \$$1102_stack_write\ <= \$1384_b\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET601;
          end if;
        when PAUSE_GET607 =>
          \$1383_a\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v606\ := \$$1102_stack_lock\;
          if \$v606\(0) = '1' then
            state_var770 := Q_WAIT605;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET604;
          end if;
        when PAUSE_GET616 =>
          \$1389_u\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v615\ := \$$1102_stack_lock\;
          if \$v615\(0) = '1' then
            state_var770 := Q_WAIT614;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= \$1389_u\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET613;
          end if;
        when PAUSE_GET619 =>
          \$1388_v\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v618\ := \$$1102_stack_lock\;
          if \$v618\(0) = '1' then
            state_var770 := Q_WAIT617;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET616;
          end if;
        when PAUSE_GET625 =>
          \$1394_x2\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v624\ := \$$1102_stack_lock\;
          if \$v624\(0) = '1' then
            state_var770 := Q_WAIT623;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= eclat_if(work.Int.gt(\$1394_x2\, \$1393_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET622;
          end if;
        when PAUSE_GET628 =>
          \$1393_x1\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v627\ := \$$1102_stack_lock\;
          if \$v627\(0) = '1' then
            state_var770 := Q_WAIT626;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET625;
          end if;
        when PAUSE_GET634 =>
          \$1398_x2\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v633\ := \$$1102_stack_lock\;
          if \$v633\(0) = '1' then
            state_var770 := Q_WAIT632;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= eclat_if(work.Int.lt(\$1398_x2\, \$1397_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET631;
          end if;
        when PAUSE_GET637 =>
          \$1397_x1\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v636\ := \$$1102_stack_lock\;
          if \$v636\(0) = '1' then
            state_var770 := Q_WAIT635;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET634;
          end if;
        when PAUSE_GET643 =>
          \$1402_x2\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v642\ := \$$1102_stack_lock\;
          if \$v642\(0) = '1' then
            state_var770 := Q_WAIT641;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= eclat_if(work.Int.eq(\$1402_x2\, \$1401_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET640;
          end if;
        when PAUSE_GET646 =>
          \$1401_x1\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v645\ := \$$1102_stack_lock\;
          if \$v645\(0) = '1' then
            state_var770 := Q_WAIT644;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET643;
          end if;
        when PAUSE_GET652 =>
          \$1406_x2\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v651\ := \$$1102_stack_lock\;
          if \$v651\(0) = '1' then
            state_var770 := Q_WAIT650;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= work.Int.div(\$1406_x2\, \$1405_x1\); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET649;
          end if;
        when PAUSE_GET655 =>
          \$1405_x1\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v654\ := \$$1102_stack_lock\;
          if \$v654\(0) = '1' then
            state_var770 := Q_WAIT653;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET652;
          end if;
        when PAUSE_GET661 =>
          \$1410_x2\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v660\ := \$$1102_stack_lock\;
          if \$v660\(0) = '1' then
            state_var770 := Q_WAIT659;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= work.Int.mul(\$1410_x2\, \$1409_x1\); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET658;
          end if;
        when PAUSE_GET664 =>
          \$1409_x1\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v663\ := \$$1102_stack_lock\;
          if \$v663\(0) = '1' then
            state_var770 := Q_WAIT662;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET661;
          end if;
        when PAUSE_GET670 =>
          \$1414_x2\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v669\ := \$$1102_stack_lock\;
          if \$v669\(0) = '1' then
            state_var770 := Q_WAIT668;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= work.Int.sub(\$1414_x2\, \$1413_x1\); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET667;
          end if;
        when PAUSE_GET673 =>
          \$1413_x1\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v672\ := \$$1102_stack_lock\;
          if \$v672\(0) = '1' then
            state_var770 := Q_WAIT671;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET670;
          end if;
        when PAUSE_GET679 =>
          \$1418_x2\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v678\ := \$$1102_stack_lock\;
          if \$v678\(0) = '1' then
            state_var770 := Q_WAIT677;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= work.Int.add(\$1418_x2\, \$1417_x1\); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET676;
          end if;
        when PAUSE_GET682 =>
          \$1417_x1\ := \$$1102_stack_value\;
          release(\$$1102_stack_lock\);
          \$v681\ := \$$1102_stack_lock\;
          if \$v681\(0) = '1' then
            state_var770 := Q_WAIT680;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET679;
          end if;
        when PAUSE_GET693 =>
          \$1373\ := \$$1101_code_value\;
          release(\$$1101_code_lock\);
          \$v692\ := \$1373\(0 to 4);
          \$v585\ := \$1373\(5 to 68);
          case \$v692\ is
          when "01000" =>
            \$1374\ := \$v585\(0 to 0);
            \$v591\ := \$$1102_stack_lock\;
            if \$v591\(0) = '1' then
              state_var770 := Q_WAIT590;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET589;
            end if;
          when "01010" =>
            \$1377_n\ := \$v585\(0 to 31);
            \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & \$1370_arg\(32 to 63) & \$1377_n\ & eclat_unit & eclat_unit;
            state_var770 := \$1370\;
          when "00110" =>
            \$1378\ := \$v585\(0 to 0);
            \$v594\ := \$$1102_stack_lock\;
            if \$v594\(0) = '1' then
              state_var770 := Q_WAIT593;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET592;
            end if;
          when "00101" =>
            \$1380\ := \$v585\(0 to 0);
            \$v597\ := \$$1102_stack_lock\;
            if \$v597\(0) = '1' then
              state_var770 := Q_WAIT596;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"2")));
              state_var770 := PAUSE_GET595;
            end if;
          when "00111" =>
            \$1382\ := \$v585\(0 to 0);
            \$v609\ := \$$1102_stack_lock\;
            if \$v609\(0) = '1' then
              state_var770 := Q_WAIT608;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET607;
            end if;
          when "00100" =>
            \$1387\ := \$v585\(0 to 0);
            \$v621\ := \$$1102_stack_lock\;
            if \$v621\(0) = '1' then
              state_var770 := Q_WAIT620;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET619;
            end if;
          when "10001" =>
            \$1392\ := \$v585\(0 to 0);
            \$v630\ := \$$1102_stack_lock\;
            if \$v630\(0) = '1' then
              state_var770 := Q_WAIT629;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET628;
            end if;
          when "10000" =>
            \$1396\ := \$v585\(0 to 0);
            \$v639\ := \$$1102_stack_lock\;
            if \$v639\(0) = '1' then
              state_var770 := Q_WAIT638;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET637;
            end if;
          when "01111" =>
            \$1400\ := \$v585\(0 to 0);
            \$v648\ := \$$1102_stack_lock\;
            if \$v648\(0) = '1' then
              state_var770 := Q_WAIT647;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET646;
            end if;
          when "01110" =>
            \$1404\ := \$v585\(0 to 0);
            \$v657\ := \$$1102_stack_lock\;
            if \$v657\(0) = '1' then
              state_var770 := Q_WAIT656;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET655;
            end if;
          when "01101" =>
            \$1408\ := \$v585\(0 to 0);
            \$v666\ := \$$1102_stack_lock\;
            if \$v666\(0) = '1' then
              state_var770 := Q_WAIT665;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET664;
            end if;
          when "01100" =>
            \$1412\ := \$v585\(0 to 0);
            \$v675\ := \$$1102_stack_lock\;
            if \$v675\(0) = '1' then
              state_var770 := Q_WAIT674;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET673;
            end if;
          when "01011" =>
            \$1416\ := \$v585\(0 to 0);
            \$v684\ := \$$1102_stack_lock\;
            if \$v684\(0) = '1' then
              state_var770 := Q_WAIT683;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1370_arg\(32 to 63), X"0000000" & X"1")));
              state_var770 := PAUSE_GET682;
            end if;
          when "00011" =>
            \$1420\ := \$v585\(0 to 0);
            \$v687\ := \$$1102_stack_lock\;
            if \$v687\(0) = '1' then
              state_var770 := Q_WAIT686;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr_write\ <= to_integer(unsigned(\$1370_arg\(32 to 63)));
              \$$1102_stack_write\ <= \$1370_arg\(64 to 95); \$$1102_stack_write_request\ <= '1';
              state_var770 := PAUSE_SET685;
            end if;
          when "00001" =>
            \$1422_b\ := \$v585\(0 to 0);
            \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & \$1370_arg\(32 to 63) & 
            eclat_if(\$1422_b\ & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
            state_var770 := \$1370\;
          when "00000" =>
            \$1423_v\ := \$v585\(0 to 31);
            \$v690\ := \$$1102_stack_lock\;
            if \$v690\(0) = '1' then
              state_var770 := Q_WAIT689;
            else
              acquire(\$$1102_stack_lock\);
              \$$1102_stack_ptr_write\ <= to_integer(unsigned(\$1370_arg\(32 to 63)));
              \$$1102_stack_write\ <= \$1423_v\; \$$1102_stack_write_request\ <= '1';
              state_var770 := PAUSE_SET688;
            end if;
          when others =>
            \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & \$1370_arg\(32 to 63) & \$1370_arg\(64 to 95) & eclat_unit & eclat_unit;
            state_var770 := \$1370\;
          end case;
        when PAUSE_SET598 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1386_w\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & \$1370_arg\(32 to 63) & \$1370_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET601 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1385_w\ := eclat_unit;
          \$v600\ := \$$1102_stack_lock\;
          if \$v600\(0) = '1' then
            state_var770 := Q_WAIT599;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= \$1383_a\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET598;
          end if;
        when PAUSE_SET610 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1391\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & \$1370_arg\(32 to 63) & \$1370_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET613 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1390\ := eclat_unit;
          \$v612\ := \$$1102_stack_lock\;
          if \$v612\(0) = '1' then
            state_var770 := Q_WAIT611;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"1")));
            \$$1102_stack_write\ <= \$1388_v\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET610;
          end if;
        when PAUSE_SET622 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1395\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.gt(
                                                                   \$1394_x2\, \$1393_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET631 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1399\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.lt(
                                                                   \$1398_x2\, \$1397_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET640 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1403\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.eq(
                                                                   \$1402_x2\, \$1401_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET649 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1407\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1") & work.Int.div(
                                                                   \$1406_x2\, \$1405_x1\) & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET658 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1411\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1") & work.Int.mul(
                                                                   \$1410_x2\, \$1409_x1\) & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET667 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1415\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1") & work.Int.sub(
                                                                   \$1414_x2\, \$1413_x1\) & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET676 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1419\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1") & work.Int.add(
                                                                   \$1418_x2\, \$1417_x1\) & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET685 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1421\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.add(\$1370_arg\(32 to 63), X"0000000" & X"1") & \$1370_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET688 =>
          \$$1102_stack_write_request\ <= '0';
          release(\$$1102_stack_lock\);
          \$1424\ := eclat_unit;
          \$1370_arg\ := work.Int.add(\$1370_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.add(\$1370_arg\(32 to 63), X"0000000" & X"1") & \$1423_v\ & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET698 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1363\ := eclat_unit;
          \$1364\ := work.Print.print_string(clk,of_string("debut \n"));
          \$1370_id\ := "000000000001";
          \$1370_arg\ := X"0000000" & X"0" & X"0000000" & X"0" & X"0000000" & X"0" & eclat_unit & eclat_unit;
          state_var770 := \$1370\;
        when PAUSE_SET702 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1435\ := eclat_unit;
          \$v700\ := \$$1101_code_lock\;
          if \$v700\(0) = '1' then
            state_var770 := Q_WAIT699;
          else
            acquire(\$$1101_code_lock\);
            \$v697\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 17;\$$1101_code_write\ <= "01011" & \$v697\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET698;
          end if;
        when PAUSE_SET706 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1434\ := eclat_unit;
          \$v704\ := \$$1101_code_lock\;
          if \$v704\(0) = '1' then
            state_var770 := Q_WAIT703;
          else
            acquire(\$$1101_code_lock\);
            \$v701\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 16;\$$1101_code_write\ <= "00100" & \$v701\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET702;
          end if;
        when PAUSE_SET710 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1433\ := eclat_unit;
          \$v708\ := \$$1101_code_lock\;
          if \$v708\(0) = '1' then
            state_var770 := Q_WAIT707;
          else
            acquire(\$$1101_code_lock\);
            \$v705\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 15;\$$1101_code_write\ <= "00110" & \$v705\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET706;
          end if;
        when PAUSE_SET714 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1432\ := eclat_unit;
          \$v712\ := \$$1101_code_lock\;
          if \$v712\(0) = '1' then
            state_var770 := Q_WAIT711;
          else
            acquire(\$$1101_code_lock\);
            \$v709\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 14;\$$1101_code_write\ <= "00110" & \$v709\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET710;
          end if;
        when PAUSE_SET718 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1431\ := eclat_unit;
          \$v716\ := \$$1101_code_lock\;
          if \$v716\(0) = '1' then
            state_var770 := Q_WAIT715;
          else
            acquire(\$$1101_code_lock\);
            \$v713\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 13;\$$1101_code_write\ <= "00111" & \$v713\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET714;
          end if;
        when PAUSE_SET722 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1430\ := eclat_unit;
          \$v720\ := \$$1101_code_lock\;
          if \$v720\(0) = '1' then
            state_var770 := Q_WAIT719;
          else
            acquire(\$$1101_code_lock\);
            \$v717\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 12;\$$1101_code_write\ <= "00101" & \$v717\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET718;
          end if;
        when PAUSE_SET726 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1429\ := eclat_unit;
          \$v724\ := \$$1101_code_lock\;
          if \$v724\(0) = '1' then
            state_var770 := Q_WAIT723;
          else
            acquire(\$$1101_code_lock\);
            \$v721\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 11;\$$1101_code_write\ <= "00110" & \$v721\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET722;
          end if;
        when PAUSE_SET730 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1428\ := eclat_unit;
          \$v728\ := \$$1101_code_lock\;
          if \$v728\(0) = '1' then
            state_var770 := Q_WAIT727;
          else
            acquire(\$$1101_code_lock\);
            \$v725\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 10;\$$1101_code_write\ <= "00011" & \$v725\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET726;
          end if;
        when PAUSE_SET734 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1427\ := eclat_unit;
          \$v732\ := \$$1101_code_lock\;
          if \$v732\(0) = '1' then
            state_var770 := Q_WAIT731;
          else
            acquire(\$$1101_code_lock\);
            \$v729\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 9;\$$1101_code_write\ <= "00100" & \$v729\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET730;
          end if;
        when PAUSE_SET738 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1426\ := eclat_unit;
          \$v736\ := \$$1101_code_lock\;
          if \$v736\(0) = '1' then
            state_var770 := Q_WAIT735;
          else
            acquire(\$$1101_code_lock\);
            \$v733\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 8;\$$1101_code_write\ <= "00100" & \$v733\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET734;
          end if;
        when PAUSE_SET742 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1425\ := eclat_unit;
          \$v740\ := \$$1101_code_lock\;
          if \$v740\(0) = '1' then
            state_var770 := Q_WAIT739;
          else
            acquire(\$$1101_code_lock\);
            \$v737\ := X"0000000" & X"4";
            \$$1101_code_ptr_write\ <= 7;\$$1101_code_write\ <= "00000" & \$v737\&X"00000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET738;
          end if;
        when PAUSE_SET746 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1362\ := eclat_unit;
          \$v744\ := \$$1101_code_lock\;
          if \$v744\(0) = '1' then
            state_var770 := Q_WAIT743;
          else
            acquire(\$$1101_code_lock\);
            \$v741\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 6;\$$1101_code_write\ <= "00111" & \$v741\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET742;
          end if;
        when PAUSE_SET750 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1361\ := eclat_unit;
          \$v748\ := \$$1101_code_lock\;
          if \$v748\(0) = '1' then
            state_var770 := Q_WAIT747;
          else
            acquire(\$$1101_code_lock\);
            \$v745\ := X"0000000" & X"3";
            \$$1101_code_ptr_write\ <= 5;\$$1101_code_write\ <= "00000" & \$v745\&X"00000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET746;
          end if;
        when PAUSE_SET754 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1360\ := eclat_unit;
          \$v752\ := \$$1101_code_lock\;
          if \$v752\(0) = '1' then
            state_var770 := Q_WAIT751;
          else
            acquire(\$$1101_code_lock\);
            \$v749\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 4;\$$1101_code_write\ <= "00011" & \$v749\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET750;
          end if;
        when PAUSE_SET758 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1359\ := eclat_unit;
          \$v756\ := \$$1101_code_lock\;
          if \$v756\(0) = '1' then
            state_var770 := Q_WAIT755;
          else
            acquire(\$$1101_code_lock\);
            \$v753\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 3;\$$1101_code_write\ <= "00011" & \$v753\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET754;
          end if;
        when PAUSE_SET762 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1358\ := eclat_unit;
          \$v760\ := \$$1101_code_lock\;
          if \$v760\(0) = '1' then
            state_var770 := Q_WAIT759;
          else
            acquire(\$$1101_code_lock\);
            \$v757\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 2;\$$1101_code_write\ <= "00100" & \$v757\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET758;
          end if;
        when PAUSE_SET766 =>
          \$$1101_code_write_request\ <= '0';
          release(\$$1101_code_lock\);
          \$1357\ := eclat_unit;
          \$v764\ := \$$1101_code_lock\;
          if \$v764\(0) = '1' then
            state_var770 := Q_WAIT763;
          else
            acquire(\$$1101_code_lock\);
            \$v761\ := X"000000" & X"d3";
            \$$1101_code_ptr_write\ <= 1;\$$1101_code_write\ <= "00000" & \$v761\&X"00000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET762;
          end if;
        when Q_WAIT587 =>
          \$v588\ := \$$1102_stack_lock\;
          if \$v588\(0) = '1' then
            state_var770 := Q_WAIT587;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET586;
          end if;
        when Q_WAIT590 =>
          \$v591\ := \$$1102_stack_lock\;
          if \$v591\(0) = '1' then
            state_var770 := Q_WAIT590;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET589;
          end if;
        when Q_WAIT593 =>
          \$v594\ := \$$1102_stack_lock\;
          if \$v594\(0) = '1' then
            state_var770 := Q_WAIT593;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET592;
          end if;
        when Q_WAIT596 =>
          \$v597\ := \$$1102_stack_lock\;
          if \$v597\(0) = '1' then
            state_var770 := Q_WAIT596;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET595;
          end if;
        when Q_WAIT599 =>
          \$v600\ := \$$1102_stack_lock\;
          if \$v600\(0) = '1' then
            state_var770 := Q_WAIT599;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= \$1383_a\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET598;
          end if;
        when Q_WAIT602 =>
          \$v603\ := \$$1102_stack_lock\;
          if \$v603\(0) = '1' then
            state_var770 := Q_WAIT602;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"1")));
            \$$1102_stack_write\ <= \$1384_b\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET601;
          end if;
        when Q_WAIT605 =>
          \$v606\ := \$$1102_stack_lock\;
          if \$v606\(0) = '1' then
            state_var770 := Q_WAIT605;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET604;
          end if;
        when Q_WAIT608 =>
          \$v609\ := \$$1102_stack_lock\;
          if \$v609\(0) = '1' then
            state_var770 := Q_WAIT608;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET607;
          end if;
        when Q_WAIT611 =>
          \$v612\ := \$$1102_stack_lock\;
          if \$v612\(0) = '1' then
            state_var770 := Q_WAIT611;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"1")));
            \$$1102_stack_write\ <= \$1388_v\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET610;
          end if;
        when Q_WAIT614 =>
          \$v615\ := \$$1102_stack_lock\;
          if \$v615\(0) = '1' then
            state_var770 := Q_WAIT614;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= \$1389_u\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET613;
          end if;
        when Q_WAIT617 =>
          \$v618\ := \$$1102_stack_lock\;
          if \$v618\(0) = '1' then
            state_var770 := Q_WAIT617;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET616;
          end if;
        when Q_WAIT620 =>
          \$v621\ := \$$1102_stack_lock\;
          if \$v621\(0) = '1' then
            state_var770 := Q_WAIT620;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET619;
          end if;
        when Q_WAIT623 =>
          \$v624\ := \$$1102_stack_lock\;
          if \$v624\(0) = '1' then
            state_var770 := Q_WAIT623;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= eclat_if(work.Int.gt(\$1394_x2\, \$1393_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET622;
          end if;
        when Q_WAIT626 =>
          \$v627\ := \$$1102_stack_lock\;
          if \$v627\(0) = '1' then
            state_var770 := Q_WAIT626;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET625;
          end if;
        when Q_WAIT629 =>
          \$v630\ := \$$1102_stack_lock\;
          if \$v630\(0) = '1' then
            state_var770 := Q_WAIT629;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET628;
          end if;
        when Q_WAIT632 =>
          \$v633\ := \$$1102_stack_lock\;
          if \$v633\(0) = '1' then
            state_var770 := Q_WAIT632;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= eclat_if(work.Int.lt(\$1398_x2\, \$1397_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET631;
          end if;
        when Q_WAIT635 =>
          \$v636\ := \$$1102_stack_lock\;
          if \$v636\(0) = '1' then
            state_var770 := Q_WAIT635;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET634;
          end if;
        when Q_WAIT638 =>
          \$v639\ := \$$1102_stack_lock\;
          if \$v639\(0) = '1' then
            state_var770 := Q_WAIT638;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET637;
          end if;
        when Q_WAIT641 =>
          \$v642\ := \$$1102_stack_lock\;
          if \$v642\(0) = '1' then
            state_var770 := Q_WAIT641;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= eclat_if(work.Int.eq(\$1402_x2\, \$1401_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET640;
          end if;
        when Q_WAIT644 =>
          \$v645\ := \$$1102_stack_lock\;
          if \$v645\(0) = '1' then
            state_var770 := Q_WAIT644;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET643;
          end if;
        when Q_WAIT647 =>
          \$v648\ := \$$1102_stack_lock\;
          if \$v648\(0) = '1' then
            state_var770 := Q_WAIT647;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET646;
          end if;
        when Q_WAIT650 =>
          \$v651\ := \$$1102_stack_lock\;
          if \$v651\(0) = '1' then
            state_var770 := Q_WAIT650;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= work.Int.div(\$1406_x2\, \$1405_x1\); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET649;
          end if;
        when Q_WAIT653 =>
          \$v654\ := \$$1102_stack_lock\;
          if \$v654\(0) = '1' then
            state_var770 := Q_WAIT653;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET652;
          end if;
        when Q_WAIT656 =>
          \$v657\ := \$$1102_stack_lock\;
          if \$v657\(0) = '1' then
            state_var770 := Q_WAIT656;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET655;
          end if;
        when Q_WAIT659 =>
          \$v660\ := \$$1102_stack_lock\;
          if \$v660\(0) = '1' then
            state_var770 := Q_WAIT659;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= work.Int.mul(\$1410_x2\, \$1409_x1\); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET658;
          end if;
        when Q_WAIT662 =>
          \$v663\ := \$$1102_stack_lock\;
          if \$v663\(0) = '1' then
            state_var770 := Q_WAIT662;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET661;
          end if;
        when Q_WAIT665 =>
          \$v666\ := \$$1102_stack_lock\;
          if \$v666\(0) = '1' then
            state_var770 := Q_WAIT665;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET664;
          end if;
        when Q_WAIT668 =>
          \$v669\ := \$$1102_stack_lock\;
          if \$v669\(0) = '1' then
            state_var770 := Q_WAIT668;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= work.Int.sub(\$1414_x2\, \$1413_x1\); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET667;
          end if;
        when Q_WAIT671 =>
          \$v672\ := \$$1102_stack_lock\;
          if \$v672\(0) = '1' then
            state_var770 := Q_WAIT671;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET670;
          end if;
        when Q_WAIT674 =>
          \$v675\ := \$$1102_stack_lock\;
          if \$v675\(0) = '1' then
            state_var770 := Q_WAIT674;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET673;
          end if;
        when Q_WAIT677 =>
          \$v678\ := \$$1102_stack_lock\;
          if \$v678\(0) = '1' then
            state_var770 := Q_WAIT677;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1370_arg\(32 to 63), X"0000000" & X"2")));
            \$$1102_stack_write\ <= work.Int.add(\$1418_x2\, \$1417_x1\); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET676;
          end if;
        when Q_WAIT680 =>
          \$v681\ := \$$1102_stack_lock\;
          if \$v681\(0) = '1' then
            state_var770 := Q_WAIT680;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"2")));
            state_var770 := PAUSE_GET679;
          end if;
        when Q_WAIT683 =>
          \$v684\ := \$$1102_stack_lock\;
          if \$v684\(0) = '1' then
            state_var770 := Q_WAIT683;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1370_arg\(32 to 63), X"0000000" & X"1")));
            state_var770 := PAUSE_GET682;
          end if;
        when Q_WAIT686 =>
          \$v687\ := \$$1102_stack_lock\;
          if \$v687\(0) = '1' then
            state_var770 := Q_WAIT686;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(\$1370_arg\(32 to 63)));
            \$$1102_stack_write\ <= \$1370_arg\(64 to 95); \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET685;
          end if;
        when Q_WAIT689 =>
          \$v690\ := \$$1102_stack_lock\;
          if \$v690\(0) = '1' then
            state_var770 := Q_WAIT689;
          else
            acquire(\$$1102_stack_lock\);
            \$$1102_stack_ptr_write\ <= to_integer(unsigned(\$1370_arg\(32 to 63)));
            \$$1102_stack_write\ <= \$1423_v\; \$$1102_stack_write_request\ <= '1';
            state_var770 := PAUSE_SET688;
          end if;
        when Q_WAIT694 =>
          \$v695\ := \$$1101_code_lock\;
          if \$v695\(0) = '1' then
            state_var770 := Q_WAIT694;
          else
            acquire(\$$1101_code_lock\);
            \$$1101_code_ptr\ <= to_integer(unsigned(\$1370_arg\(0 to 31)));
            state_var770 := PAUSE_GET693;
          end if;
        when Q_WAIT699 =>
          \$v700\ := \$$1101_code_lock\;
          if \$v700\(0) = '1' then
            state_var770 := Q_WAIT699;
          else
            acquire(\$$1101_code_lock\);
            \$v697\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 17;\$$1101_code_write\ <= "01011" & \$v697\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET698;
          end if;
        when Q_WAIT703 =>
          \$v704\ := \$$1101_code_lock\;
          if \$v704\(0) = '1' then
            state_var770 := Q_WAIT703;
          else
            acquire(\$$1101_code_lock\);
            \$v701\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 16;\$$1101_code_write\ <= "00100" & \$v701\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET702;
          end if;
        when Q_WAIT707 =>
          \$v708\ := \$$1101_code_lock\;
          if \$v708\(0) = '1' then
            state_var770 := Q_WAIT707;
          else
            acquire(\$$1101_code_lock\);
            \$v705\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 15;\$$1101_code_write\ <= "00110" & \$v705\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET706;
          end if;
        when Q_WAIT711 =>
          \$v712\ := \$$1101_code_lock\;
          if \$v712\(0) = '1' then
            state_var770 := Q_WAIT711;
          else
            acquire(\$$1101_code_lock\);
            \$v709\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 14;\$$1101_code_write\ <= "00110" & \$v709\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET710;
          end if;
        when Q_WAIT715 =>
          \$v716\ := \$$1101_code_lock\;
          if \$v716\(0) = '1' then
            state_var770 := Q_WAIT715;
          else
            acquire(\$$1101_code_lock\);
            \$v713\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 13;\$$1101_code_write\ <= "00111" & \$v713\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET714;
          end if;
        when Q_WAIT719 =>
          \$v720\ := \$$1101_code_lock\;
          if \$v720\(0) = '1' then
            state_var770 := Q_WAIT719;
          else
            acquire(\$$1101_code_lock\);
            \$v717\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 12;\$$1101_code_write\ <= "00101" & \$v717\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET718;
          end if;
        when Q_WAIT723 =>
          \$v724\ := \$$1101_code_lock\;
          if \$v724\(0) = '1' then
            state_var770 := Q_WAIT723;
          else
            acquire(\$$1101_code_lock\);
            \$v721\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 11;\$$1101_code_write\ <= "00110" & \$v721\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET722;
          end if;
        when Q_WAIT727 =>
          \$v728\ := \$$1101_code_lock\;
          if \$v728\(0) = '1' then
            state_var770 := Q_WAIT727;
          else
            acquire(\$$1101_code_lock\);
            \$v725\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 10;\$$1101_code_write\ <= "00011" & \$v725\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET726;
          end if;
        when Q_WAIT731 =>
          \$v732\ := \$$1101_code_lock\;
          if \$v732\(0) = '1' then
            state_var770 := Q_WAIT731;
          else
            acquire(\$$1101_code_lock\);
            \$v729\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 9;\$$1101_code_write\ <= "00100" & \$v729\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET730;
          end if;
        when Q_WAIT735 =>
          \$v736\ := \$$1101_code_lock\;
          if \$v736\(0) = '1' then
            state_var770 := Q_WAIT735;
          else
            acquire(\$$1101_code_lock\);
            \$v733\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 8;\$$1101_code_write\ <= "00100" & \$v733\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET734;
          end if;
        when Q_WAIT739 =>
          \$v740\ := \$$1101_code_lock\;
          if \$v740\(0) = '1' then
            state_var770 := Q_WAIT739;
          else
            acquire(\$$1101_code_lock\);
            \$v737\ := X"0000000" & X"4";
            \$$1101_code_ptr_write\ <= 7;\$$1101_code_write\ <= "00000" & \$v737\&X"00000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET738;
          end if;
        when Q_WAIT743 =>
          \$v744\ := \$$1101_code_lock\;
          if \$v744\(0) = '1' then
            state_var770 := Q_WAIT743;
          else
            acquire(\$$1101_code_lock\);
            \$v741\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 6;\$$1101_code_write\ <= "00111" & \$v741\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET742;
          end if;
        when Q_WAIT747 =>
          \$v748\ := \$$1101_code_lock\;
          if \$v748\(0) = '1' then
            state_var770 := Q_WAIT747;
          else
            acquire(\$$1101_code_lock\);
            \$v745\ := X"0000000" & X"3";
            \$$1101_code_ptr_write\ <= 5;\$$1101_code_write\ <= "00000" & \$v745\&X"00000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET746;
          end if;
        when Q_WAIT751 =>
          \$v752\ := \$$1101_code_lock\;
          if \$v752\(0) = '1' then
            state_var770 := Q_WAIT751;
          else
            acquire(\$$1101_code_lock\);
            \$v749\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 4;\$$1101_code_write\ <= "00011" & \$v749\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET750;
          end if;
        when Q_WAIT755 =>
          \$v756\ := \$$1101_code_lock\;
          if \$v756\(0) = '1' then
            state_var770 := Q_WAIT755;
          else
            acquire(\$$1101_code_lock\);
            \$v753\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 3;\$$1101_code_write\ <= "00011" & \$v753\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET754;
          end if;
        when Q_WAIT759 =>
          \$v760\ := \$$1101_code_lock\;
          if \$v760\(0) = '1' then
            state_var770 := Q_WAIT759;
          else
            acquire(\$$1101_code_lock\);
            \$v757\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 2;\$$1101_code_write\ <= "00100" & \$v757\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET758;
          end if;
        when Q_WAIT763 =>
          \$v764\ := \$$1101_code_lock\;
          if \$v764\(0) = '1' then
            state_var770 := Q_WAIT763;
          else
            acquire(\$$1101_code_lock\);
            \$v761\ := X"000000" & X"d3";
            \$$1101_code_ptr_write\ <= 1;\$$1101_code_write\ <= "00000" & \$v761\&X"00000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET762;
          end if;
        when Q_WAIT767 =>
          \$v768\ := \$$1101_code_lock\;
          if \$v768\(0) = '1' then
            state_var770 := Q_WAIT767;
          else
            acquire(\$$1101_code_lock\);
            \$v765\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 0;\$$1101_code_write\ <= "00011" & \$v765\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET766;
          end if;
        when IDLE584 =>
          rdy583 := eclat_false;
          \$v768\ := \$$1101_code_lock\;
          if \$v768\(0) = '1' then
            state_var770 := Q_WAIT767;
          else
            acquire(\$$1101_code_lock\);
            \$v765\ := eclat_unit;
            \$$1101_code_ptr_write\ <= 0;\$$1101_code_write\ <= "00011" & \$v765\&"000"& X"000000000000000"; \$$1101_code_write_request\ <= '1';
            state_var770 := PAUSE_SET766;
          end if;
        end case;
        
        if rdy583(0) = '1' then
          
        else
          result582 := X"0000000" & X"0";
        end if;
        \$1356\ := result582 & rdy583;
        result579 := work.Bool.lnot(""&\$1356\(32));
        rdy580 := eclat_true;
        state := IDLE581;
      end case;
      \state%next\ <= state;
      \state_var770%next\ <= state_var770;
      \$1422_b%next\ <= \$1422_b\;
      \$1380%next\ <= \$1380\;
      \$1388_v%next\ <= \$1388_v\;
      \$1427%next\ <= \$1427\;
      \$1370_result%next\ <= \$1370_result\;
      \$1361%next\ <= \$1361\;
      \$1362%next\ <= \$1362\;
      \$1377_n%next\ <= \$1377_n\;
      \$v678%next\ <= \$v678\;
      \$1401_x1%next\ <= \$1401_x1\;
      \$1379_v%next\ <= \$1379_v\;
      \$v764%next\ <= \$v764\;
      \$v760%next\ <= \$v760\;
      \$v600%next\ <= \$v600\;
      \$v606%next\ <= \$v606\;
      \$1355_cy%next\ <= \$1355_cy\;
      \$v696%next\ <= \$v696\;
      \$1415%next\ <= \$1415\;
      \$v745%next\ <= \$v745\;
      \$v639%next\ <= \$v639\;
      \$v630%next\ <= \$v630\;
      \$1397_x1%next\ <= \$1397_x1\;
      \$1435%next\ <= \$1435\;
      \$1395%next\ <= \$1395\;
      \$1434%next\ <= \$1434\;
      \$1398_x2%next\ <= \$1398_x2\;
      \$v749%next\ <= \$v749\;
      \$1370_arg%next\ <= \$1370_arg\;
      \$v736%next\ <= \$v736\;
      \$1387%next\ <= \$1387\;
      \$1393_x1%next\ <= \$1393_x1\;
      \$1376_code_ptr%next\ <= \$1376_code_ptr\;
      \$1358%next\ <= \$1358\;
      \$v621%next\ <= \$v621\;
      \$v721%next\ <= \$v721\;
      \$v588%next\ <= \$v588\;
      \$v768%next\ <= \$v768\;
      \$v716%next\ <= \$v716\;
      \$1382%next\ <= \$1382\;
      \$v597%next\ <= \$v597\;
      \$v651%next\ <= \$v651\;
      \$v687%next\ <= \$v687\;
      \$v654%next\ <= \$v654\;
      \$v591%next\ <= \$v591\;
      \$v681%next\ <= \$v681\;
      \$v585%next\ <= \$v585\;
      \$1410_x2%next\ <= \$1410_x2\;
      \$1360%next\ <= \$1360\;
      \$1392%next\ <= \$1392\;
      \$1418_x2%next\ <= \$1418_x2\;
      \$v577%next\ <= \$v577\;
      \$1384_b%next\ <= \$1384_b\;
      \$1400%next\ <= \$1400\;
      \$1402_x2%next\ <= \$1402_x2\;
      \$v697%next\ <= \$v697\;
      \$1432%next\ <= \$1432\;
      \$1364%next\ <= \$1364\;
      \$1391%next\ <= \$1391\;
      \$v648%next\ <= \$v648\;
      \$1356%next\ <= \$1356\;
      \$v756%next\ <= \$v756\;
      \$v744%next\ <= \$v744\;
      \$v720%next\ <= \$v720\;
      \$1394_x2%next\ <= \$1394_x2\;
      \$v636%next\ <= \$v636\;
      \rdy580%next\ <= rdy580;
      \$v724%next\ <= \$v724\;
      \$1431%next\ <= \$1431\;
      \$1369%next\ <= \$1369\;
      \$v663%next\ <= \$v663\;
      \$1375_arg%next\ <= \$1375_arg\;
      \$v732%next\ <= \$v732\;
      \$1424%next\ <= \$1424\;
      \$1370_id%next\ <= \$1370_id\;
      \$1363%next\ <= \$1363\;
      \$v609%next\ <= \$v609\;
      \$v713%next\ <= \$v713\;
      \$1425%next\ <= \$1425\;
      \$1414_x2%next\ <= \$1414_x2\;
      \$1389_u%next\ <= \$1389_u\;
      \$1407%next\ <= \$1407\;
      \$v761%next\ <= \$v761\;
      \$v757%next\ <= \$v757\;
      \$v642%next\ <= \$v642\;
      \$v633%next\ <= \$v633\;
      \$1419%next\ <= \$1419\;
      \$1426%next\ <= \$1426\;
      \$v701%next\ <= \$v701\;
      \$v618%next\ <= \$v618\;
      \$1359%next\ <= \$1359\;
      \$v728%next\ <= \$v728\;
      \$v692%next\ <= \$v692\;
      \$1373%next\ <= \$1373\;
      \$v717%next\ <= \$v717\;
      \$v690%next\ <= \$v690\;
      \$v660%next\ <= \$v660\;
      \$1368%next\ <= \$1368\;
      \$1412%next\ <= \$1412\;
      \$1386_w%next\ <= \$1386_w\;
      \$v615%next\ <= \$v615\;
      \result582%next\ <= result582;
      \$v704%next\ <= \$v704\;
      \$1374%next\ <= \$1374\;
      \$v672%next\ <= \$v672\;
      \$1416%next\ <= \$1416\;
      \$1408%next\ <= \$1408\;
      \$v712%next\ <= \$v712\;
      \$v765%next\ <= \$v765\;
      \rdy583%next\ <= rdy583;
      \$1436%next\ <= \$1436\;
      \$1381_u%next\ <= \$1381_u\;
      \$1365_acc_final%next\ <= \$1365_acc_final\;
      \$v708%next\ <= \$v708\;
      \$v729%next\ <= \$v729\;
      \$v627%next\ <= \$v627\;
      \$v705%next\ <= \$v705\;
      \$1406_x2%next\ <= \$1406_x2\;
      \$v737%next\ <= \$v737\;
      \$v684%next\ <= \$v684\;
      \$v675%next\ <= \$v675\;
      \$v669%next\ <= \$v669\;
      \$v748%next\ <= \$v748\;
      \$v741%next\ <= \$v741\;
      \$v740%next\ <= \$v740\;
      \$1421%next\ <= \$1421\;
      \$1403%next\ <= \$1403\;
      \$1404%next\ <= \$1404\;
      \$v603%next\ <= \$v603\;
      \$v594%next\ <= \$v594\;
      \$1383_a%next\ <= \$1383_a\;
      \$1417_x1%next\ <= \$1417_x1\;
      \$v624%next\ <= \$v624\;
      \$v725%next\ <= \$v725\;
      \$1413_x1%next\ <= \$1413_x1\;
      \$1405_x1%next\ <= \$1405_x1\;
      \$v695%next\ <= \$v695\;
      \$1429%next\ <= \$1429\;
      \$1390%next\ <= \$1390\;
      \result579%next\ <= result579;
      \$1396%next\ <= \$1396\;
      \$v709%next\ <= \$v709\;
      \$1411%next\ <= \$1411\;
      \$1378%next\ <= \$1378\;
      \$1409_x1%next\ <= \$1409_x1\;
      \$v666%next\ <= \$v666\;
      \$1357%next\ <= \$1357\;
      \$1433%next\ <= \$1433\;
      \$1430%next\ <= \$1430\;
      \$v612%next\ <= \$v612\;
      \$v700%next\ <= \$v700\;
      \$v753%next\ <= \$v753\;
      \$1428%next\ <= \$1428\;
      \$1423_v%next\ <= \$1423_v\;
      \$1420%next\ <= \$1420\;
      \$v645%next\ <= \$v645\;
      \$1367%next\ <= \$1367\;
      \$v752%next\ <= \$v752\;
      \$v733%next\ <= \$v733\;
      \$1366%next\ <= \$1366\;
      \$1399%next\ <= \$1399\;
      \$1385_w%next\ <= \$1385_w\;
      \$v657%next\ <= \$v657\;
      \$$1101_code_lock%next\ <= \$$1101_code_lock\;
      \$$1102_stack_lock%next\ <= \$$1102_stack_lock\;
      
      
      result <= result579;
      end process;
  end architecture;
