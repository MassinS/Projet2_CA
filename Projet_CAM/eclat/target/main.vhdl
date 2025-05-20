-- code generated from the following source code:
--   stdlib.ecl
--   code.ecl
--   main.ecl
--
-- with the following command:
--
--    C:\Users\DELL\Desktop\CA\Projet2-CA\projet_CAM\eclat\eclat-compiler\eclat.exe -arg=true;true;false code.ecl main.ecl

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

  type t_state is (IDLE562);
  signal \state%now\, \state%next\: t_state;
  type t_state_var707 is (IDLE565, \$1394\, PAUSE_GET567, PAUSE_GET570, PAUSE_GET574, PAUSE_GET577, PAUSE_GET580, PAUSE_GET589, PAUSE_GET592, PAUSE_GET601, PAUSE_GET604, PAUSE_GET610, PAUSE_GET613, PAUSE_GET619, PAUSE_GET622, PAUSE_GET628, PAUSE_GET631, PAUSE_GET637, PAUSE_GET640, PAUSE_GET646, PAUSE_GET649, PAUSE_GET655, PAUSE_GET658, PAUSE_GET664, PAUSE_GET667, PAUSE_GET678, PAUSE_SET583, PAUSE_SET586, PAUSE_SET595, PAUSE_SET598, PAUSE_SET607, PAUSE_SET616, PAUSE_SET625, PAUSE_SET634, PAUSE_SET643, PAUSE_SET652, PAUSE_SET661, PAUSE_SET670, PAUSE_SET673, PAUSE_SET683, PAUSE_SET687, PAUSE_SET691, PAUSE_SET695, PAUSE_SET699, PAUSE_SET703, Q_WAIT568, Q_WAIT571, Q_WAIT575, Q_WAIT578, Q_WAIT581, Q_WAIT584, Q_WAIT587, Q_WAIT590, Q_WAIT593, Q_WAIT596, Q_WAIT599, Q_WAIT602, Q_WAIT605, Q_WAIT608, Q_WAIT611, Q_WAIT614, Q_WAIT617, Q_WAIT620, Q_WAIT623, Q_WAIT626, Q_WAIT629, Q_WAIT632, Q_WAIT635, Q_WAIT638, Q_WAIT641, Q_WAIT644, Q_WAIT647, Q_WAIT650, Q_WAIT653, Q_WAIT656, Q_WAIT659, Q_WAIT662, Q_WAIT665, Q_WAIT668, Q_WAIT671, Q_WAIT674, Q_WAIT679, Q_WAIT684, Q_WAIT688, Q_WAIT692, Q_WAIT696, Q_WAIT700, Q_WAIT704);
  signal \state_var707%now\, \state_var707%next\: t_state_var707;
  type array_value_32 is array (natural range <>) of value(0 to 31);
  type array_value_69 is array (natural range <>) of value(0 to 68);
  signal \$1137_code\ : array_value_69(0 to 5);
  signal \$$1137_code_value\ : value(0 to 68) := (others => '0');
  signal \$$1137_code_ptr\ : natural range 0 to 5 := 0;
  signal \$$1137_code_ptr_write\ : natural range 0 to 5 := 0;
  signal \$$1137_code_write\ : value(0 to 68) := (others => '0');
  signal \$$1137_code_write_request\ : std_logic := '0';
  signal \$1138_stack\ : array_value_32(0 to 255);
  signal \$$1138_stack_value\ : value(0 to 31) := (others => '0');
  signal \$$1138_stack_ptr\ : natural range 0 to 255 := 0;
  signal \$$1138_stack_ptr_write\ : natural range 0 to 255 := 0;
  signal \$$1138_stack_write\ : value(0 to 31) := (others => '0');
  signal \$$1138_stack_write_request\ : std_logic := '0';
  signal \$1402%next\, \$1402%now\, \$v566%next\, \$v566%now\ : value(0 to 63) := (others => '0');
  signal \$1381%next\, \$1381%now\ : value(0 to 32) := (others => '0');
  signal \$1397%next\, \$1397%now\ : value(0 to 68) := (others => '0');
  signal \$1394_id%next\, \$1394_id%now\ : value(0 to 11) := (others => '0');
  signal \$v677%next\, \$v677%now\ : value(0 to 4) := (others => '0');
  signal \$1394_arg%next\, \$1394_arg%now\ : value(0 to 97) := (others => '0');
  signal \$$1138_stack_lock%next\, \$$1138_stack_lock%now\, 
         \$$1137_code_lock%next\, \$$1137_code_lock%now\, \$v657%next\, 
         \$v657%now\, \$1384%next\, \$1384%now\, \$v645%next\, \$v645%now\, 
         \$v612%next\, \$v612%now\, \$1406%next\, \$1406%now\, \$1430%next\, 
         \$1430%now\, \$1433%next\, \$1433%now\, \$1441%next\, \$1441%now\, 
         \$v666%next\, \$v666%now\, \$1411_w%next\, \$1411_w%now\, 
         \$1390%next\, \$1390%now\, \$1429%next\, \$1429%now\, \$1383%next\, 
         \$1383%now\, \$v624%next\, \$v624%now\, \$v594%next\, \$v594%now\, 
         \$v603%next\, \$v603%now\, \$1404%next\, \$1404%now\, \$1446%next\, 
         \$1446%now\, \$1421%next\, \$1421%now\, \$v669%next\, \$v669%now\, 
         \$1448_b%next\, \$1448_b%now\, \$v675%next\, \$v675%now\, 
         \$v573%next\, \$v573%now\, \$v705%next\, \$v705%now\, \$v627%next\, 
         \$v627%now\, \$1393%next\, \$1393%now\, \$1413%next\, \$1413%now\, 
         \$1388%next\, \$1388%now\, \$v558%next\, \$v558%now\, \$1408%next\, 
         \$1408%now\, \$1416%next\, \$1416%now\, \$1422%next\, \$1422%now\, 
         \$v672%next\, \$v672%now\, \$v615%next\, \$v615%now\, \$v660%next\, 
         \$v660%now\, \$v569%next\, \$v569%now\, \$v582%next\, \$v582%now\, 
         \$v686%next\, \$v686%now\, \$1442%next\, \$1442%now\, \$1445%next\, 
         \$1445%now\, \$v618%next\, \$v618%now\, \$1426%next\, \$1426%now\, 
         \$v701%next\, \$v701%now\, \$v633%next\, \$v633%now\, \$v642%next\, 
         \$v642%now\, \$1425%next\, \$1425%now\, \$v694%next\, \$v694%now\, 
         \$v609%next\, \$v609%now\, \rdy561%next\, \rdy561%now\, 
         \$v663%next\, \$v663%now\, \$1418%next\, \$1418%now\, \$v636%next\, 
         \$v636%now\, \$1391%next\, \$1391%now\, \$v648%next\, \$v648%now\, 
         \$v697%next\, \$v697%now\, \$1398%next\, \$1398%now\, \$v680%next\, 
         \$v680%now\, \$1392%next\, \$1392%now\, \$v585%next\, \$v585%now\, 
         \$v693%next\, \$v693%now\, \$v681%next\, \$v681%now\, \$v591%next\, 
         \$v591%now\, \$v654%next\, \$v654%now\, \result560%next\, 
         \result560%now\, \$1438%next\, \$1438%now\, \$v702%next\, 
         \$v702%now\, \$v651%next\, \$v651%now\, \$v597%next\, \$v597%now\, 
         \$1382%next\, \$1382%now\, \$v588%next\, \$v588%now\, \$v682%next\, 
         \$v682%now\, \$v621%next\, \$v621%now\, \$v576%next\, \$v576%now\, 
         \$1447%next\, \$1447%now\, \$1387%next\, \$1387%now\, \$1434%next\, 
         \$1434%now\, \$v572%next\, \$v572%now\, \$1412_w%next\, 
         \$1412_w%now\, \$v630%next\, \$v630%now\, \$v639%next\, \$v639%now\, 
         \$1385%next\, \$1385%now\, \$v600%next\, \$v600%now\, \$v579%next\, 
         \$v579%now\, \$v606%next\, \$v606%now\, \$v685%next\, \$v685%now\, 
         \$1417%next\, \$1417%now\, \$v689%next\, \$v689%now\, \rdy564%next\, 
         \rdy564%now\, \$1437%next\, \$1437%now\, \$1450%next\, \$1450%now\, 
         \$1386%next\, \$1386%now\ : value(0 to 0) := (others => '0');
  signal \$1432_x2%next\, \$1432_x2%now\, \$1431_x1%next\, \$1431_x1%now\, 
         \$1403_cond%next\, \$1403_cond%now\, \$1449_v%next\, \$1449_v%now\, 
         \$1423_x1%next\, \$1423_x1%now\, \$1405_v%next\, \$1405_v%now\, 
         \$1380_cy%next\, \$1380_cy%now\, \$1424_x2%next\, \$1424_x2%now\, 
         \$v698%next\, \$v698%now\, \$1409_a%next\, \$1409_a%now\, 
         \$1443_x1%next\, \$1443_x1%now\, \$v690%next\, \$v690%now\, 
         \result563%next\, \result563%now\, \$1394_result%next\, 
         \$1394_result%now\, \$1451%next\, \$1451%now\, 
         \$1400_code_ptr%next\, \$1400_code_ptr%now\, \$1435_x1%next\, 
         \$1435_x1%now\, \$1389_acc_final%next\, \$1389_acc_final%now\, 
         \$1410_b%next\, \$1410_b%now\, \$1440_x2%next\, \$1440_x2%now\, 
         \$1439_x1%next\, \$1439_x1%now\, \$1415_u%next\, \$1415_u%now\, 
         \$1399_arg%next\, \$1399_arg%now\, \$1436_x2%next\, \$1436_x2%now\, 
         \$1407_u%next\, \$1407_u%now\, \$1428_x2%next\, \$1428_x2%now\, 
         \$1401_n%next\, \$1401_n%now\, \$1427_x1%next\, \$1427_x1%now\, 
         \$1414_v%next\, \$1414_v%now\, \$1419_x1%next\, \$1419_x1%now\, 
         \$1444_x2%next\, \$1444_x2%now\, \$1420_x2%next\, \$1420_x2%now\ : value(0 to 31) := (others => '0');
  
  begin
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1137_code_write_request\ = '1' then
                    \$1137_code\(\$$1137_code_ptr_write\) <= \$$1137_code_write\;
                 end if;
                 \$$1137_code_value\ <= \$1137_code\(\$$1137_code_ptr\);
            end if;
        end process;
    
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1138_stack_write_request\ = '1' then
                    \$1138_stack\(\$$1138_stack_ptr_write\) <= \$$1138_stack_write\;
                 end if;
                 \$$1138_stack_value\ <= \$1138_stack\(\$$1138_stack_ptr\);
            end if;
        end process;
    
    process (reset,clk)
      begin
      if reset = '1' then
        \$1386%now\ <= (others => '0');
        \$1450%now\ <= (others => '0');
        \$1420_x2%now\ <= (others => '0');
        \$1437%now\ <= (others => '0');
        \rdy564%now\ <= (others => '0');
        \$v689%now\ <= (others => '0');
        \$1444_x2%now\ <= (others => '0');
        \$1419_x1%now\ <= (others => '0');
        \$1417%now\ <= (others => '0');
        \$v685%now\ <= (others => '0');
        \$v606%now\ <= (others => '0');
        \$v579%now\ <= (others => '0');
        \$v600%now\ <= (others => '0');
        \$1385%now\ <= (others => '0');
        \$v639%now\ <= (others => '0');
        \$1414_v%now\ <= (others => '0');
        \$v630%now\ <= (others => '0');
        \$1427_x1%now\ <= (others => '0');
        \$1412_w%now\ <= (others => '0');
        \$v572%now\ <= (others => '0');
        \$1394_arg%now\ <= (others => '0');
        \$1434%now\ <= (others => '0');
        \$1401_n%now\ <= (others => '0');
        \$1387%now\ <= (others => '0');
        \$1428_x2%now\ <= (others => '0');
        \$1447%now\ <= (others => '0');
        \$v576%now\ <= (others => '0');
        \$v621%now\ <= (others => '0');
        \$v682%now\ <= (others => '0');
        \$v588%now\ <= (others => '0');
        \$1382%now\ <= (others => '0');
        \$v597%now\ <= (others => '0');
        \$v651%now\ <= (others => '0');
        \$1407_u%now\ <= (others => '0');
        \$v702%now\ <= (others => '0');
        \$1438%now\ <= (others => '0');
        \result560%now\ <= (others => '0');
        \$v654%now\ <= (others => '0');
        \$1436_x2%now\ <= (others => '0');
        \$v591%now\ <= (others => '0');
        \$v681%now\ <= (others => '0');
        \$v693%now\ <= (others => '0');
        \$v585%now\ <= (others => '0');
        \$1399_arg%now\ <= (others => '0');
        \$1392%now\ <= (others => '0');
        \$v677%now\ <= (others => '0');
        \$1415_u%now\ <= (others => '0');
        \$v680%now\ <= (others => '0');
        \$1439_x1%now\ <= (others => '0');
        \$1398%now\ <= (others => '0');
        \$1440_x2%now\ <= (others => '0');
        \$v697%now\ <= (others => '0');
        \$1397%now\ <= (others => '0');
        \$v648%now\ <= (others => '0');
        \$1391%now\ <= (others => '0');
        \$1410_b%now\ <= (others => '0');
        \$1381%now\ <= (others => '0');
        \$v636%now\ <= (others => '0');
        \$1389_acc_final%now\ <= (others => '0');
        \$1418%now\ <= (others => '0');
        \$v663%now\ <= (others => '0');
        \$v566%now\ <= (others => '0');
        \rdy561%now\ <= (others => '0');
        \$1394_id%now\ <= (others => '0');
        \$1435_x1%now\ <= (others => '0');
        \$v609%now\ <= (others => '0');
        \$v694%now\ <= (others => '0');
        \$1400_code_ptr%now\ <= (others => '0');
        \$1425%now\ <= (others => '0');
        \$1451%now\ <= (others => '0');
        \$1394_result%now\ <= (others => '0');
        \$v642%now\ <= (others => '0');
        \$v633%now\ <= (others => '0');
        \$v701%now\ <= (others => '0');
        \$1426%now\ <= (others => '0');
        \$v618%now\ <= (others => '0');
        \$1445%now\ <= (others => '0');
        \$1442%now\ <= (others => '0');
        \result563%now\ <= (others => '0');
        \$v686%now\ <= (others => '0');
        \$v690%now\ <= (others => '0');
        \$v582%now\ <= (others => '0');
        \$v569%now\ <= (others => '0');
        \$v660%now\ <= (others => '0');
        \$1443_x1%now\ <= (others => '0');
        \$1409_a%now\ <= (others => '0');
        \$v615%now\ <= (others => '0');
        \$v672%now\ <= (others => '0');
        \$1422%now\ <= (others => '0');
        \$1416%now\ <= (others => '0');
        \$1408%now\ <= (others => '0');
        \$v558%now\ <= (others => '0');
        \$v698%now\ <= (others => '0');
        \$1388%now\ <= (others => '0');
        \$1413%now\ <= (others => '0');
        \$1393%now\ <= (others => '0');
        \$v627%now\ <= (others => '0');
        \$v705%now\ <= (others => '0');
        \$v573%now\ <= (others => '0');
        \$v675%now\ <= (others => '0');
        \$1448_b%now\ <= (others => '0');
        \$v669%now\ <= (others => '0');
        \$1424_x2%now\ <= (others => '0');
        \$1380_cy%now\ <= (others => '0');
        \$1405_v%now\ <= (others => '0');
        \$1421%now\ <= (others => '0');
        \$1446%now\ <= (others => '0');
        \$1404%now\ <= (others => '0');
        \$1423_x1%now\ <= (others => '0');
        \$v603%now\ <= (others => '0');
        \$v594%now\ <= (others => '0');
        \$1402%now\ <= (others => '0');
        \$v624%now\ <= (others => '0');
        \$1383%now\ <= (others => '0');
        \$1429%now\ <= (others => '0');
        \$1390%now\ <= (others => '0');
        \$1411_w%now\ <= (others => '0');
        \$v666%now\ <= (others => '0');
        \$1441%now\ <= (others => '0');
        \$1433%now\ <= (others => '0');
        \$1449_v%now\ <= (others => '0');
        \$1430%now\ <= (others => '0');
        \$1406%now\ <= (others => '0');
        \$1403_cond%now\ <= (others => '0');
        \$v612%now\ <= (others => '0');
        \$1431_x1%now\ <= (others => '0');
        \$1432_x2%now\ <= (others => '0');
        \$v645%now\ <= (others => '0');
        \$1384%now\ <= (others => '0');
        \$v657%now\ <= (others => '0');
        \$$1137_code_lock%now\ <= (others => '0');
        \$$1138_stack_lock%now\ <= (others => '0');
        \state%now\ <= idle562;
        \state_var707%now\ <= idle565;
      elsif (rising_edge(clk)) then
        \$1386%now\ <= \$1386%next\;
        \$1450%now\ <= \$1450%next\;
        \$1420_x2%now\ <= \$1420_x2%next\;
        \$1437%now\ <= \$1437%next\;
        \rdy564%now\ <= \rdy564%next\;
        \$v689%now\ <= \$v689%next\;
        \$1444_x2%now\ <= \$1444_x2%next\;
        \$1419_x1%now\ <= \$1419_x1%next\;
        \$1417%now\ <= \$1417%next\;
        \$v685%now\ <= \$v685%next\;
        \$v606%now\ <= \$v606%next\;
        \$v579%now\ <= \$v579%next\;
        \$v600%now\ <= \$v600%next\;
        \$1385%now\ <= \$1385%next\;
        \$v639%now\ <= \$v639%next\;
        \$1414_v%now\ <= \$1414_v%next\;
        \$v630%now\ <= \$v630%next\;
        \$1427_x1%now\ <= \$1427_x1%next\;
        \$1412_w%now\ <= \$1412_w%next\;
        \$v572%now\ <= \$v572%next\;
        \$1394_arg%now\ <= \$1394_arg%next\;
        \$1434%now\ <= \$1434%next\;
        \$1401_n%now\ <= \$1401_n%next\;
        \$1387%now\ <= \$1387%next\;
        \$1428_x2%now\ <= \$1428_x2%next\;
        \$1447%now\ <= \$1447%next\;
        \$v576%now\ <= \$v576%next\;
        \$v621%now\ <= \$v621%next\;
        \$v682%now\ <= \$v682%next\;
        \$v588%now\ <= \$v588%next\;
        \$1382%now\ <= \$1382%next\;
        \$v597%now\ <= \$v597%next\;
        \$v651%now\ <= \$v651%next\;
        \$1407_u%now\ <= \$1407_u%next\;
        \$v702%now\ <= \$v702%next\;
        \$1438%now\ <= \$1438%next\;
        \result560%now\ <= \result560%next\;
        \$v654%now\ <= \$v654%next\;
        \$1436_x2%now\ <= \$1436_x2%next\;
        \$v591%now\ <= \$v591%next\;
        \$v681%now\ <= \$v681%next\;
        \$v693%now\ <= \$v693%next\;
        \$v585%now\ <= \$v585%next\;
        \$1399_arg%now\ <= \$1399_arg%next\;
        \$1392%now\ <= \$1392%next\;
        \$v677%now\ <= \$v677%next\;
        \$1415_u%now\ <= \$1415_u%next\;
        \$v680%now\ <= \$v680%next\;
        \$1439_x1%now\ <= \$1439_x1%next\;
        \$1398%now\ <= \$1398%next\;
        \$1440_x2%now\ <= \$1440_x2%next\;
        \$v697%now\ <= \$v697%next\;
        \$1397%now\ <= \$1397%next\;
        \$v648%now\ <= \$v648%next\;
        \$1391%now\ <= \$1391%next\;
        \$1410_b%now\ <= \$1410_b%next\;
        \$1381%now\ <= \$1381%next\;
        \$v636%now\ <= \$v636%next\;
        \$1389_acc_final%now\ <= \$1389_acc_final%next\;
        \$1418%now\ <= \$1418%next\;
        \$v663%now\ <= \$v663%next\;
        \$v566%now\ <= \$v566%next\;
        \rdy561%now\ <= \rdy561%next\;
        \$1394_id%now\ <= \$1394_id%next\;
        \$1435_x1%now\ <= \$1435_x1%next\;
        \$v609%now\ <= \$v609%next\;
        \$v694%now\ <= \$v694%next\;
        \$1400_code_ptr%now\ <= \$1400_code_ptr%next\;
        \$1425%now\ <= \$1425%next\;
        \$1451%now\ <= \$1451%next\;
        \$1394_result%now\ <= \$1394_result%next\;
        \$v642%now\ <= \$v642%next\;
        \$v633%now\ <= \$v633%next\;
        \$v701%now\ <= \$v701%next\;
        \$1426%now\ <= \$1426%next\;
        \$v618%now\ <= \$v618%next\;
        \$1445%now\ <= \$1445%next\;
        \$1442%now\ <= \$1442%next\;
        \result563%now\ <= \result563%next\;
        \$v686%now\ <= \$v686%next\;
        \$v690%now\ <= \$v690%next\;
        \$v582%now\ <= \$v582%next\;
        \$v569%now\ <= \$v569%next\;
        \$v660%now\ <= \$v660%next\;
        \$1443_x1%now\ <= \$1443_x1%next\;
        \$1409_a%now\ <= \$1409_a%next\;
        \$v615%now\ <= \$v615%next\;
        \$v672%now\ <= \$v672%next\;
        \$1422%now\ <= \$1422%next\;
        \$1416%now\ <= \$1416%next\;
        \$1408%now\ <= \$1408%next\;
        \$v558%now\ <= \$v558%next\;
        \$v698%now\ <= \$v698%next\;
        \$1388%now\ <= \$1388%next\;
        \$1413%now\ <= \$1413%next\;
        \$1393%now\ <= \$1393%next\;
        \$v627%now\ <= \$v627%next\;
        \$v705%now\ <= \$v705%next\;
        \$v573%now\ <= \$v573%next\;
        \$v675%now\ <= \$v675%next\;
        \$1448_b%now\ <= \$1448_b%next\;
        \$v669%now\ <= \$v669%next\;
        \$1424_x2%now\ <= \$1424_x2%next\;
        \$1380_cy%now\ <= \$1380_cy%next\;
        \$1405_v%now\ <= \$1405_v%next\;
        \$1421%now\ <= \$1421%next\;
        \$1446%now\ <= \$1446%next\;
        \$1404%now\ <= \$1404%next\;
        \$1423_x1%now\ <= \$1423_x1%next\;
        \$v603%now\ <= \$v603%next\;
        \$v594%now\ <= \$v594%next\;
        \$1402%now\ <= \$1402%next\;
        \$v624%now\ <= \$v624%next\;
        \$1383%now\ <= \$1383%next\;
        \$1429%now\ <= \$1429%next\;
        \$1390%now\ <= \$1390%next\;
        \$1411_w%now\ <= \$1411_w%next\;
        \$v666%now\ <= \$v666%next\;
        \$1441%now\ <= \$1441%next\;
        \$1433%now\ <= \$1433%next\;
        \$1449_v%now\ <= \$1449_v%next\;
        \$1430%now\ <= \$1430%next\;
        \$1406%now\ <= \$1406%next\;
        \$1403_cond%now\ <= \$1403_cond%next\;
        \$v612%now\ <= \$v612%next\;
        \$1431_x1%now\ <= \$1431_x1%next\;
        \$1432_x2%now\ <= \$1432_x2%next\;
        \$v645%now\ <= \$v645%next\;
        \$1384%now\ <= \$1384%next\;
        \$v657%now\ <= \$v657%next\;
        \$$1137_code_lock%now\ <= \$$1137_code_lock%next\;
        \$$1138_stack_lock%now\ <= \$$1138_stack_lock%next\;
        \state_var707%now\ <= \state_var707%next\;
        \state%now\ <= \state%next\;
      end if;
    end process;
      
      process(argument,\state%now\, clk,\state_var707%now\, \$$1137_code_value\, \$$1138_stack_value\, \$1386%now\, \$1450%now\, \$1420_x2%now\, \$1437%now\, \rdy564%now\, \$v689%now\, \$1444_x2%now\, \$1419_x1%now\, \$1417%now\, \$v685%now\, \$v606%now\, \$v579%now\, \$v600%now\, \$1385%now\, \$v639%now\, \$1414_v%now\, \$v630%now\, \$1427_x1%now\, \$1412_w%now\, \$v572%now\, \$1394_arg%now\, \$1434%now\, \$1401_n%now\, \$1387%now\, \$1428_x2%now\, \$1447%now\, \$v576%now\, \$v621%now\, \$v682%now\, \$v588%now\, \$1382%now\, \$v597%now\, \$v651%now\, \$1407_u%now\, \$v702%now\, \$1438%now\, \result560%now\, \$v654%now\, \$1436_x2%now\, \$v591%now\, \$v681%now\, \$v693%now\, \$v585%now\, \$1399_arg%now\, \$1392%now\, \$v677%now\, \$1415_u%now\, \$v680%now\, \$1439_x1%now\, \$1398%now\, \$1440_x2%now\, \$v697%now\, \$1397%now\, \$v648%now\, \$1391%now\, \$1410_b%now\, \$1381%now\, \$v636%now\, \$1389_acc_final%now\, \$1418%now\, \$v663%now\, \$v566%now\, \rdy561%now\, \$1394_id%now\, \$1435_x1%now\, \$v609%now\, \$v694%now\, \$1400_code_ptr%now\, \$1425%now\, \$1451%now\, \$1394_result%now\, \$v642%now\, \$v633%now\, \$v701%now\, \$1426%now\, \$v618%now\, \$1445%now\, \$1442%now\, \result563%now\, \$v686%now\, \$v690%now\, \$v582%now\, \$v569%now\, \$v660%now\, \$1443_x1%now\, \$1409_a%now\, \$v615%now\, \$v672%now\, \$1422%now\, \$1416%now\, \$1408%now\, \$v558%now\, \$v698%now\, \$1388%now\, \$1413%now\, \$1393%now\, \$v627%now\, \$v705%now\, \$v573%now\, \$v675%now\, \$1448_b%now\, \$v669%now\, \$1424_x2%now\, \$1380_cy%now\, \$1405_v%now\, \$1421%now\, \$1446%now\, \$1404%now\, \$1423_x1%now\, \$v603%now\, \$v594%now\, \$1402%now\, \$v624%now\, \$1383%now\, \$1429%now\, \$1390%now\, \$1411_w%now\, \$v666%now\, \$1441%now\, \$1433%now\, \$1449_v%now\, \$1430%now\, \$1406%now\, \$1403_cond%now\, \$v612%now\, \$1431_x1%now\, \$1432_x2%now\, \$v645%now\, \$1384%now\, \$v657%now\, \$$1137_code_lock%now\, \$$1138_stack_lock%now\)
        variable \$1402\, \$v566\ : value(0 to 63) := (others => '0');
        variable \$1381\ : value(0 to 32) := (others => '0');
        variable \$1397\ : value(0 to 68) := (others => '0');
        variable \$1394_id\ : value(0 to 11) := (others => '0');
        variable \$v677\ : value(0 to 4) := (others => '0');
        variable \$1394_arg\ : value(0 to 97) := (others => '0');
        variable \$v657\, \$1384\, \$v645\, \$v612\, \$1406\, \$1430\, 
                 \$1433\, \$1441\, \$v666\, \$1411_w\, \$1390\, \$1429\, 
                 \$1383\, \$v624\, \$v594\, \$v603\, \$1404\, \$1446\, 
                 \$1421\, \$v669\, \$1448_b\, \$v675\, \$v573\, \$v705\, 
                 \$v627\, \$1393\, \$1413\, \$1388\, \$v558\, \$1408\, 
                 \$1416\, \$1422\, \$v672\, \$v615\, \$v660\, \$v569\, 
                 \$v582\, \$v686\, \$1442\, \$1445\, \$v618\, \$1426\, 
                 \$v701\, \$v633\, \$v642\, \$1425\, \$v694\, \$v609\, 
                 rdy561, \$v663\, \$1418\, \$v636\, \$1391\, \$v648\, 
                 \$v697\, \$1398\, \$v680\, \$1392\, \$v585\, \$v693\, 
                 \$v681\, \$v591\, \$v654\, result560, \$1438\, \$v702\, 
                 \$v651\, \$v597\, \$1382\, \$v588\, \$v682\, \$v621\, 
                 \$v576\, \$1447\, \$1387\, \$1434\, \$v572\, \$1412_w\, 
                 \$v630\, \$v639\, \$1385\, \$v600\, \$v579\, \$v606\, 
                 \$v685\, \$1417\, \$v689\, rdy564, \$1437\, \$1450\, \$1386\ : value(0 to 0) := (others => '0');
        variable \$1432_x2\, \$1431_x1\, \$1403_cond\, \$1449_v\, \$1423_x1\, 
                 \$1405_v\, \$1380_cy\, \$1424_x2\, \$v698\, \$1409_a\, 
                 \$1443_x1\, \$v690\, result563, \$1394_result\, \$1451\, 
                 \$1400_code_ptr\, \$1435_x1\, \$1389_acc_final\, \$1410_b\, 
                 \$1440_x2\, \$1439_x1\, \$1415_u\, \$1399_arg\, \$1436_x2\, 
                 \$1407_u\, \$1428_x2\, \$1401_n\, \$1427_x1\, \$1414_v\, 
                 \$1419_x1\, \$1444_x2\, \$1420_x2\ : value(0 to 31) := (others => '0');
        variable state : t_state;
        variable state_var707 : t_state_var707;
        variable \$$1137_code_lock\ : value(0 to 0);
        variable \$$1138_stack_lock\ : value(0 to 0);
        
    begin
      \$1386\ := \$1386%now\;
      \$1450\ := \$1450%now\;
      \$1420_x2\ := \$1420_x2%now\;
      \$1437\ := \$1437%now\;
      rdy564 := \rdy564%now\;
      \$v689\ := \$v689%now\;
      \$1444_x2\ := \$1444_x2%now\;
      \$1419_x1\ := \$1419_x1%now\;
      \$1417\ := \$1417%now\;
      \$v685\ := \$v685%now\;
      \$v606\ := \$v606%now\;
      \$v579\ := \$v579%now\;
      \$v600\ := \$v600%now\;
      \$1385\ := \$1385%now\;
      \$v639\ := \$v639%now\;
      \$1414_v\ := \$1414_v%now\;
      \$v630\ := \$v630%now\;
      \$1427_x1\ := \$1427_x1%now\;
      \$1412_w\ := \$1412_w%now\;
      \$v572\ := \$v572%now\;
      \$1394_arg\ := \$1394_arg%now\;
      \$1434\ := \$1434%now\;
      \$1401_n\ := \$1401_n%now\;
      \$1387\ := \$1387%now\;
      \$1428_x2\ := \$1428_x2%now\;
      \$1447\ := \$1447%now\;
      \$v576\ := \$v576%now\;
      \$v621\ := \$v621%now\;
      \$v682\ := \$v682%now\;
      \$v588\ := \$v588%now\;
      \$1382\ := \$1382%now\;
      \$v597\ := \$v597%now\;
      \$v651\ := \$v651%now\;
      \$1407_u\ := \$1407_u%now\;
      \$v702\ := \$v702%now\;
      \$1438\ := \$1438%now\;
      result560 := \result560%now\;
      \$v654\ := \$v654%now\;
      \$1436_x2\ := \$1436_x2%now\;
      \$v591\ := \$v591%now\;
      \$v681\ := \$v681%now\;
      \$v693\ := \$v693%now\;
      \$v585\ := \$v585%now\;
      \$1399_arg\ := \$1399_arg%now\;
      \$1392\ := \$1392%now\;
      \$v677\ := \$v677%now\;
      \$1415_u\ := \$1415_u%now\;
      \$v680\ := \$v680%now\;
      \$1439_x1\ := \$1439_x1%now\;
      \$1398\ := \$1398%now\;
      \$1440_x2\ := \$1440_x2%now\;
      \$v697\ := \$v697%now\;
      \$1397\ := \$1397%now\;
      \$v648\ := \$v648%now\;
      \$1391\ := \$1391%now\;
      \$1410_b\ := \$1410_b%now\;
      \$1381\ := \$1381%now\;
      \$v636\ := \$v636%now\;
      \$1389_acc_final\ := \$1389_acc_final%now\;
      \$1418\ := \$1418%now\;
      \$v663\ := \$v663%now\;
      \$v566\ := \$v566%now\;
      rdy561 := \rdy561%now\;
      \$1394_id\ := \$1394_id%now\;
      \$1435_x1\ := \$1435_x1%now\;
      \$v609\ := \$v609%now\;
      \$v694\ := \$v694%now\;
      \$1400_code_ptr\ := \$1400_code_ptr%now\;
      \$1425\ := \$1425%now\;
      \$1451\ := \$1451%now\;
      \$1394_result\ := \$1394_result%now\;
      \$v642\ := \$v642%now\;
      \$v633\ := \$v633%now\;
      \$v701\ := \$v701%now\;
      \$1426\ := \$1426%now\;
      \$v618\ := \$v618%now\;
      \$1445\ := \$1445%now\;
      \$1442\ := \$1442%now\;
      result563 := \result563%now\;
      \$v686\ := \$v686%now\;
      \$v690\ := \$v690%now\;
      \$v582\ := \$v582%now\;
      \$v569\ := \$v569%now\;
      \$v660\ := \$v660%now\;
      \$1443_x1\ := \$1443_x1%now\;
      \$1409_a\ := \$1409_a%now\;
      \$v615\ := \$v615%now\;
      \$v672\ := \$v672%now\;
      \$1422\ := \$1422%now\;
      \$1416\ := \$1416%now\;
      \$1408\ := \$1408%now\;
      \$v558\ := \$v558%now\;
      \$v698\ := \$v698%now\;
      \$1388\ := \$1388%now\;
      \$1413\ := \$1413%now\;
      \$1393\ := \$1393%now\;
      \$v627\ := \$v627%now\;
      \$v705\ := \$v705%now\;
      \$v573\ := \$v573%now\;
      \$v675\ := \$v675%now\;
      \$1448_b\ := \$1448_b%now\;
      \$v669\ := \$v669%now\;
      \$1424_x2\ := \$1424_x2%now\;
      \$1380_cy\ := \$1380_cy%now\;
      \$1405_v\ := \$1405_v%now\;
      \$1421\ := \$1421%now\;
      \$1446\ := \$1446%now\;
      \$1404\ := \$1404%now\;
      \$1423_x1\ := \$1423_x1%now\;
      \$v603\ := \$v603%now\;
      \$v594\ := \$v594%now\;
      \$1402\ := \$1402%now\;
      \$v624\ := \$v624%now\;
      \$1383\ := \$1383%now\;
      \$1429\ := \$1429%now\;
      \$1390\ := \$1390%now\;
      \$1411_w\ := \$1411_w%now\;
      \$v666\ := \$v666%now\;
      \$1441\ := \$1441%now\;
      \$1433\ := \$1433%now\;
      \$1449_v\ := \$1449_v%now\;
      \$1430\ := \$1430%now\;
      \$1406\ := \$1406%now\;
      \$1403_cond\ := \$1403_cond%now\;
      \$v612\ := \$v612%now\;
      \$1431_x1\ := \$1431_x1%now\;
      \$1432_x2\ := \$1432_x2%now\;
      \$v645\ := \$v645%now\;
      \$1384\ := \$1384%now\;
      \$v657\ := \$v657%now\;
      \$$1137_code_lock\ := \$$1137_code_lock%now\;
      \$$1138_stack_lock\ := \$$1138_stack_lock%now\;
      state := \state%now\;
      state_var707 := \state_var707%now\;
      case state is
      when IDLE562 =>
        rdy561 := eclat_false;
        if \$v558\(0) = '1' then
          
        else
          \$v558\ := eclat_true;
          \$1451\ := X"0000000" & X"0";
        end if;
        \$1451\ := work.Int.add(\$1451\, X"0000000" & X"1");
        \$1380_cy\ := \$1451\;
        case state_var707 is
        when \$1394\ =>
          \$v681\ := work.Int.ge(\$1394_arg\(0 to 31), std_logic_vector(to_unsigned(\$1137_code\'length,32)));
          if \$v681\(0) = '1' then
            \$1394_result\ := \$1394_arg\(64 to 95);
            \$1389_acc_final\ := \$1394_result\;
            \$1390\ := work.Print.print_string(clk,of_string("Résultat = "));
            \$1391\ := work.Int.print(clk,work.Int.sub(\$1389_acc_final\, X"0000000" & X"1"));
            \$1392\ := work.Print.print_newline(clk,eclat_unit);
            \$1393\ := work.Print.print_string(clk,of_string("fin \n"));
            result563 := X"000000" & X"2a";
            rdy564 := eclat_true;
            state_var707 := IDLE565;
          else
            \$v680\ := \$$1137_code_lock\;
            if \$v680\(0) = '1' then
              state_var707 := Q_WAIT679;
            else
              acquire(\$$1137_code_lock\);
              \$$1137_code_ptr\ <= to_integer(unsigned(\$1394_arg\(0 to 31)));
              state_var707 := PAUSE_GET678;
            end if;
          end if;
        when PAUSE_GET567 =>
          \$1400_code_ptr\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$1394_arg\ := \$1400_code_ptr\ & work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2") & \$1399_arg\ & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_GET570 =>
          \$1399_arg\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v569\ := \$$1138_stack_lock\;
          if \$v569\(0) = '1' then
            state_var707 := Q_WAIT568;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET567;
          end if;
        when PAUSE_GET574 =>
          \$1403_cond\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v573\ := work.Int.neq(\$1403_cond\, X"0000000" & X"0");
          if \$v573\(0) = '1' then
            \$1394_arg\ := \$1402\(0 to 31) & work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & \$1394_arg\(64 to 95) & eclat_unit & eclat_unit;
            state_var707 := \$1394\;
          else
            \$1394_arg\ := \$1402\(32 to 63) & work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & \$1394_arg\(64 to 95) & eclat_unit & eclat_unit;
            state_var707 := \$1394\;
          end if;
        when PAUSE_GET577 =>
          \$1405_v\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & \$1394_arg\(32 to 63) & \$1405_v\ & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_GET580 =>
          \$1407_u\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & \$1394_arg\(32 to 63) & \$1407_u\ & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_GET589 =>
          \$1410_b\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v588\ := \$$1138_stack_lock\;
          if \$v588\(0) = '1' then
            state_var707 := Q_WAIT587;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"1")));
            \$$1138_stack_write\ <= \$1410_b\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET586;
          end if;
        when PAUSE_GET592 =>
          \$1409_a\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v591\ := \$$1138_stack_lock\;
          if \$v591\(0) = '1' then
            state_var707 := Q_WAIT590;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET589;
          end if;
        when PAUSE_GET601 =>
          \$1415_u\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v600\ := \$$1138_stack_lock\;
          if \$v600\(0) = '1' then
            state_var707 := Q_WAIT599;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= \$1415_u\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET598;
          end if;
        when PAUSE_GET604 =>
          \$1414_v\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v603\ := \$$1138_stack_lock\;
          if \$v603\(0) = '1' then
            state_var707 := Q_WAIT602;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET601;
          end if;
        when PAUSE_GET610 =>
          \$1420_x2\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v609\ := \$$1138_stack_lock\;
          if \$v609\(0) = '1' then
            state_var707 := Q_WAIT608;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= eclat_if(work.Int.gt(\$1420_x2\, \$1419_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET607;
          end if;
        when PAUSE_GET613 =>
          \$1419_x1\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v612\ := \$$1138_stack_lock\;
          if \$v612\(0) = '1' then
            state_var707 := Q_WAIT611;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET610;
          end if;
        when PAUSE_GET619 =>
          \$1424_x2\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v618\ := \$$1138_stack_lock\;
          if \$v618\(0) = '1' then
            state_var707 := Q_WAIT617;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= eclat_if(work.Int.lt(\$1424_x2\, \$1423_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET616;
          end if;
        when PAUSE_GET622 =>
          \$1423_x1\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v621\ := \$$1138_stack_lock\;
          if \$v621\(0) = '1' then
            state_var707 := Q_WAIT620;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET619;
          end if;
        when PAUSE_GET628 =>
          \$1428_x2\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v627\ := \$$1138_stack_lock\;
          if \$v627\(0) = '1' then
            state_var707 := Q_WAIT626;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= eclat_if(work.Int.eq(\$1428_x2\, \$1427_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET625;
          end if;
        when PAUSE_GET631 =>
          \$1427_x1\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v630\ := \$$1138_stack_lock\;
          if \$v630\(0) = '1' then
            state_var707 := Q_WAIT629;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET628;
          end if;
        when PAUSE_GET637 =>
          \$1432_x2\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v636\ := \$$1138_stack_lock\;
          if \$v636\(0) = '1' then
            state_var707 := Q_WAIT635;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= work.Int.div(\$1432_x2\, \$1431_x1\); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET634;
          end if;
        when PAUSE_GET640 =>
          \$1431_x1\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v639\ := \$$1138_stack_lock\;
          if \$v639\(0) = '1' then
            state_var707 := Q_WAIT638;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET637;
          end if;
        when PAUSE_GET646 =>
          \$1436_x2\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v645\ := \$$1138_stack_lock\;
          if \$v645\(0) = '1' then
            state_var707 := Q_WAIT644;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= work.Int.mul(\$1436_x2\, \$1435_x1\); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET643;
          end if;
        when PAUSE_GET649 =>
          \$1435_x1\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v648\ := \$$1138_stack_lock\;
          if \$v648\(0) = '1' then
            state_var707 := Q_WAIT647;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET646;
          end if;
        when PAUSE_GET655 =>
          \$1440_x2\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v654\ := \$$1138_stack_lock\;
          if \$v654\(0) = '1' then
            state_var707 := Q_WAIT653;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= work.Int.sub(\$1440_x2\, \$1439_x1\); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET652;
          end if;
        when PAUSE_GET658 =>
          \$1439_x1\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v657\ := \$$1138_stack_lock\;
          if \$v657\(0) = '1' then
            state_var707 := Q_WAIT656;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET655;
          end if;
        when PAUSE_GET664 =>
          \$1444_x2\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v663\ := \$$1138_stack_lock\;
          if \$v663\(0) = '1' then
            state_var707 := Q_WAIT662;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= work.Int.add(\$1444_x2\, \$1443_x1\); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET661;
          end if;
        when PAUSE_GET667 =>
          \$1443_x1\ := \$$1138_stack_value\;
          release(\$$1138_stack_lock\);
          \$v666\ := \$$1138_stack_lock\;
          if \$v666\(0) = '1' then
            state_var707 := Q_WAIT665;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET664;
          end if;
        when PAUSE_GET678 =>
          \$1397\ := \$$1137_code_value\;
          release(\$$1137_code_lock\);
          \$v677\ := \$1397\(0 to 4);
          \$v566\ := \$1397\(5 to 68);
          case \$v677\ is
          when "01000" =>
            \$1398\ := \$v566\(0 to 0);
            \$v572\ := \$$1138_stack_lock\;
            if \$v572\(0) = '1' then
              state_var707 := Q_WAIT571;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET570;
            end if;
          when "01010" =>
            \$1401_n\ := \$v566\(0 to 31);
            \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & \$1394_arg\(32 to 63) & \$1401_n\ & eclat_unit & eclat_unit;
            state_var707 := \$1394\;
          when "10010" =>
            \$1402\ := \$v566\(0 to 63);
            \$v576\ := \$$1138_stack_lock\;
            if \$v576\(0) = '1' then
              state_var707 := Q_WAIT575;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET574;
            end if;
          when "00110" =>
            \$1404\ := \$v566\(0 to 0);
            \$v579\ := \$$1138_stack_lock\;
            if \$v579\(0) = '1' then
              state_var707 := Q_WAIT578;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET577;
            end if;
          when "00101" =>
            \$1406\ := \$v566\(0 to 0);
            \$v582\ := \$$1138_stack_lock\;
            if \$v582\(0) = '1' then
              state_var707 := Q_WAIT581;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"2")));
              state_var707 := PAUSE_GET580;
            end if;
          when "00111" =>
            \$1408\ := \$v566\(0 to 0);
            \$v594\ := \$$1138_stack_lock\;
            if \$v594\(0) = '1' then
              state_var707 := Q_WAIT593;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET592;
            end if;
          when "00100" =>
            \$1413\ := \$v566\(0 to 0);
            \$v606\ := \$$1138_stack_lock\;
            if \$v606\(0) = '1' then
              state_var707 := Q_WAIT605;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET604;
            end if;
          when "10001" =>
            \$1418\ := \$v566\(0 to 0);
            \$v615\ := \$$1138_stack_lock\;
            if \$v615\(0) = '1' then
              state_var707 := Q_WAIT614;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET613;
            end if;
          when "10000" =>
            \$1422\ := \$v566\(0 to 0);
            \$v624\ := \$$1138_stack_lock\;
            if \$v624\(0) = '1' then
              state_var707 := Q_WAIT623;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET622;
            end if;
          when "01111" =>
            \$1426\ := \$v566\(0 to 0);
            \$v633\ := \$$1138_stack_lock\;
            if \$v633\(0) = '1' then
              state_var707 := Q_WAIT632;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET631;
            end if;
          when "01110" =>
            \$1430\ := \$v566\(0 to 0);
            \$v642\ := \$$1138_stack_lock\;
            if \$v642\(0) = '1' then
              state_var707 := Q_WAIT641;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET640;
            end if;
          when "01101" =>
            \$1434\ := \$v566\(0 to 0);
            \$v651\ := \$$1138_stack_lock\;
            if \$v651\(0) = '1' then
              state_var707 := Q_WAIT650;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET649;
            end if;
          when "01100" =>
            \$1438\ := \$v566\(0 to 0);
            \$v660\ := \$$1138_stack_lock\;
            if \$v660\(0) = '1' then
              state_var707 := Q_WAIT659;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET658;
            end if;
          when "01011" =>
            \$1442\ := \$v566\(0 to 0);
            \$v669\ := \$$1138_stack_lock\;
            if \$v669\(0) = '1' then
              state_var707 := Q_WAIT668;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1394_arg\(32 to 63), X"0000000" & X"1")));
              state_var707 := PAUSE_GET667;
            end if;
          when "00011" =>
            \$1446\ := \$v566\(0 to 0);
            \$v672\ := \$$1138_stack_lock\;
            if \$v672\(0) = '1' then
              state_var707 := Q_WAIT671;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr_write\ <= to_integer(unsigned(\$1394_arg\(32 to 63)));
              \$$1138_stack_write\ <= \$1394_arg\(64 to 95); \$$1138_stack_write_request\ <= '1';
              state_var707 := PAUSE_SET670;
            end if;
          when "00001" =>
            \$1448_b\ := \$v566\(0 to 0);
            \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & \$1394_arg\(32 to 63) & 
            eclat_if(\$1448_b\ & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
            state_var707 := \$1394\;
          when "00000" =>
            \$1449_v\ := \$v566\(0 to 31);
            \$v675\ := \$$1138_stack_lock\;
            if \$v675\(0) = '1' then
              state_var707 := Q_WAIT674;
            else
              acquire(\$$1138_stack_lock\);
              \$$1138_stack_ptr_write\ <= to_integer(unsigned(\$1394_arg\(32 to 63)));
              \$$1138_stack_write\ <= \$1449_v\; \$$1138_stack_write_request\ <= '1';
              state_var707 := PAUSE_SET673;
            end if;
          when others =>
            \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & \$1394_arg\(32 to 63) & \$1394_arg\(64 to 95) & eclat_unit & eclat_unit;
            state_var707 := \$1394\;
          end case;
        when PAUSE_SET583 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1412_w\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & \$1394_arg\(32 to 63) & \$1394_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET586 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1411_w\ := eclat_unit;
          \$v585\ := \$$1138_stack_lock\;
          if \$v585\(0) = '1' then
            state_var707 := Q_WAIT584;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= \$1409_a\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET583;
          end if;
        when PAUSE_SET595 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1417\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & \$1394_arg\(32 to 63) & \$1394_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET598 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1416\ := eclat_unit;
          \$v597\ := \$$1138_stack_lock\;
          if \$v597\(0) = '1' then
            state_var707 := Q_WAIT596;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"1")));
            \$$1138_stack_write\ <= \$1414_v\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET595;
          end if;
        when PAUSE_SET607 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1421\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.gt(
                                                                   \$1420_x2\, \$1419_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET616 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1425\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.lt(
                                                                   \$1424_x2\, \$1423_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET625 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1429\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.eq(
                                                                   \$1428_x2\, \$1427_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET634 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1433\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & work.Int.div(
                                                                   \$1432_x2\, \$1431_x1\) & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET643 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1437\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & work.Int.mul(
                                                                   \$1436_x2\, \$1435_x1\) & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET652 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1441\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & work.Int.sub(
                                                                   \$1440_x2\, \$1439_x1\) & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET661 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1445\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1") & work.Int.add(
                                                                   \$1444_x2\, \$1443_x1\) & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET670 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1447\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.add(\$1394_arg\(32 to 63), X"0000000" & X"1") & \$1394_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET673 =>
          \$$1138_stack_write_request\ <= '0';
          release(\$$1138_stack_lock\);
          \$1450\ := eclat_unit;
          \$1394_arg\ := work.Int.add(\$1394_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.add(\$1394_arg\(32 to 63), X"0000000" & X"1") & \$1449_v\ & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET683 =>
          \$$1137_code_write_request\ <= '0';
          release(\$$1137_code_lock\);
          \$1387\ := eclat_unit;
          \$1388\ := work.Print.print_string(clk,of_string("debut \n"));
          \$1394_id\ := "000000000001";
          \$1394_arg\ := X"0000000" & X"0" & X"0000000" & X"0" & X"0000000" & X"0" & eclat_unit & eclat_unit;
          state_var707 := \$1394\;
        when PAUSE_SET687 =>
          \$$1137_code_write_request\ <= '0';
          release(\$$1137_code_lock\);
          \$1386\ := eclat_unit;
          \$v685\ := \$$1137_code_lock\;
          if \$v685\(0) = '1' then
            state_var707 := Q_WAIT684;
          else
            acquire(\$$1137_code_lock\);
            \$v682\ := eclat_unit;
            \$$1137_code_ptr_write\ <= 5;\$$1137_code_write\ <= "01011" & \$v682\&"000"& X"000000000000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET683;
          end if;
        when PAUSE_SET691 =>
          \$$1137_code_write_request\ <= '0';
          release(\$$1137_code_lock\);
          \$1385\ := eclat_unit;
          \$v689\ := \$$1137_code_lock\;
          if \$v689\(0) = '1' then
            state_var707 := Q_WAIT688;
          else
            acquire(\$$1137_code_lock\);
            \$v686\ := eclat_unit;
            \$$1137_code_ptr_write\ <= 4;\$$1137_code_write\ <= "00100" & \$v686\&"000"& X"000000000000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET687;
          end if;
        when PAUSE_SET695 =>
          \$$1137_code_write_request\ <= '0';
          release(\$$1137_code_lock\);
          \$1384\ := eclat_unit;
          \$v693\ := \$$1137_code_lock\;
          if \$v693\(0) = '1' then
            state_var707 := Q_WAIT692;
          else
            acquire(\$$1137_code_lock\);
            \$v690\ := X"0000000" & X"2";
            \$$1137_code_ptr_write\ <= 3;\$$1137_code_write\ <= "00000" & \$v690\&X"00000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET691;
          end if;
        when PAUSE_SET699 =>
          \$$1137_code_write_request\ <= '0';
          release(\$$1137_code_lock\);
          \$1383\ := eclat_unit;
          \$v697\ := \$$1137_code_lock\;
          if \$v697\(0) = '1' then
            state_var707 := Q_WAIT696;
          else
            acquire(\$$1137_code_lock\);
            \$v694\ := eclat_unit;
            \$$1137_code_ptr_write\ <= 2;\$$1137_code_write\ <= "00111" & \$v694\&"000"& X"000000000000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET695;
          end if;
        when PAUSE_SET703 =>
          \$$1137_code_write_request\ <= '0';
          release(\$$1137_code_lock\);
          \$1382\ := eclat_unit;
          \$v701\ := \$$1137_code_lock\;
          if \$v701\(0) = '1' then
            state_var707 := Q_WAIT700;
          else
            acquire(\$$1137_code_lock\);
            \$v698\ := X"0000000" & X"5";
            \$$1137_code_ptr_write\ <= 1;\$$1137_code_write\ <= "00000" & \$v698\&X"00000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET699;
          end if;
        when Q_WAIT568 =>
          \$v569\ := \$$1138_stack_lock\;
          if \$v569\(0) = '1' then
            state_var707 := Q_WAIT568;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET567;
          end if;
        when Q_WAIT571 =>
          \$v572\ := \$$1138_stack_lock\;
          if \$v572\(0) = '1' then
            state_var707 := Q_WAIT571;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET570;
          end if;
        when Q_WAIT575 =>
          \$v576\ := \$$1138_stack_lock\;
          if \$v576\(0) = '1' then
            state_var707 := Q_WAIT575;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET574;
          end if;
        when Q_WAIT578 =>
          \$v579\ := \$$1138_stack_lock\;
          if \$v579\(0) = '1' then
            state_var707 := Q_WAIT578;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET577;
          end if;
        when Q_WAIT581 =>
          \$v582\ := \$$1138_stack_lock\;
          if \$v582\(0) = '1' then
            state_var707 := Q_WAIT581;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET580;
          end if;
        when Q_WAIT584 =>
          \$v585\ := \$$1138_stack_lock\;
          if \$v585\(0) = '1' then
            state_var707 := Q_WAIT584;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= \$1409_a\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET583;
          end if;
        when Q_WAIT587 =>
          \$v588\ := \$$1138_stack_lock\;
          if \$v588\(0) = '1' then
            state_var707 := Q_WAIT587;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"1")));
            \$$1138_stack_write\ <= \$1410_b\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET586;
          end if;
        when Q_WAIT590 =>
          \$v591\ := \$$1138_stack_lock\;
          if \$v591\(0) = '1' then
            state_var707 := Q_WAIT590;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET589;
          end if;
        when Q_WAIT593 =>
          \$v594\ := \$$1138_stack_lock\;
          if \$v594\(0) = '1' then
            state_var707 := Q_WAIT593;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET592;
          end if;
        when Q_WAIT596 =>
          \$v597\ := \$$1138_stack_lock\;
          if \$v597\(0) = '1' then
            state_var707 := Q_WAIT596;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"1")));
            \$$1138_stack_write\ <= \$1414_v\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET595;
          end if;
        when Q_WAIT599 =>
          \$v600\ := \$$1138_stack_lock\;
          if \$v600\(0) = '1' then
            state_var707 := Q_WAIT599;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= \$1415_u\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET598;
          end if;
        when Q_WAIT602 =>
          \$v603\ := \$$1138_stack_lock\;
          if \$v603\(0) = '1' then
            state_var707 := Q_WAIT602;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET601;
          end if;
        when Q_WAIT605 =>
          \$v606\ := \$$1138_stack_lock\;
          if \$v606\(0) = '1' then
            state_var707 := Q_WAIT605;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET604;
          end if;
        when Q_WAIT608 =>
          \$v609\ := \$$1138_stack_lock\;
          if \$v609\(0) = '1' then
            state_var707 := Q_WAIT608;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= eclat_if(work.Int.gt(\$1420_x2\, \$1419_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET607;
          end if;
        when Q_WAIT611 =>
          \$v612\ := \$$1138_stack_lock\;
          if \$v612\(0) = '1' then
            state_var707 := Q_WAIT611;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET610;
          end if;
        when Q_WAIT614 =>
          \$v615\ := \$$1138_stack_lock\;
          if \$v615\(0) = '1' then
            state_var707 := Q_WAIT614;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET613;
          end if;
        when Q_WAIT617 =>
          \$v618\ := \$$1138_stack_lock\;
          if \$v618\(0) = '1' then
            state_var707 := Q_WAIT617;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= eclat_if(work.Int.lt(\$1424_x2\, \$1423_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET616;
          end if;
        when Q_WAIT620 =>
          \$v621\ := \$$1138_stack_lock\;
          if \$v621\(0) = '1' then
            state_var707 := Q_WAIT620;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET619;
          end if;
        when Q_WAIT623 =>
          \$v624\ := \$$1138_stack_lock\;
          if \$v624\(0) = '1' then
            state_var707 := Q_WAIT623;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET622;
          end if;
        when Q_WAIT626 =>
          \$v627\ := \$$1138_stack_lock\;
          if \$v627\(0) = '1' then
            state_var707 := Q_WAIT626;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= eclat_if(work.Int.eq(\$1428_x2\, \$1427_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET625;
          end if;
        when Q_WAIT629 =>
          \$v630\ := \$$1138_stack_lock\;
          if \$v630\(0) = '1' then
            state_var707 := Q_WAIT629;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET628;
          end if;
        when Q_WAIT632 =>
          \$v633\ := \$$1138_stack_lock\;
          if \$v633\(0) = '1' then
            state_var707 := Q_WAIT632;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET631;
          end if;
        when Q_WAIT635 =>
          \$v636\ := \$$1138_stack_lock\;
          if \$v636\(0) = '1' then
            state_var707 := Q_WAIT635;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= work.Int.div(\$1432_x2\, \$1431_x1\); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET634;
          end if;
        when Q_WAIT638 =>
          \$v639\ := \$$1138_stack_lock\;
          if \$v639\(0) = '1' then
            state_var707 := Q_WAIT638;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET637;
          end if;
        when Q_WAIT641 =>
          \$v642\ := \$$1138_stack_lock\;
          if \$v642\(0) = '1' then
            state_var707 := Q_WAIT641;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET640;
          end if;
        when Q_WAIT644 =>
          \$v645\ := \$$1138_stack_lock\;
          if \$v645\(0) = '1' then
            state_var707 := Q_WAIT644;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= work.Int.mul(\$1436_x2\, \$1435_x1\); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET643;
          end if;
        when Q_WAIT647 =>
          \$v648\ := \$$1138_stack_lock\;
          if \$v648\(0) = '1' then
            state_var707 := Q_WAIT647;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET646;
          end if;
        when Q_WAIT650 =>
          \$v651\ := \$$1138_stack_lock\;
          if \$v651\(0) = '1' then
            state_var707 := Q_WAIT650;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET649;
          end if;
        when Q_WAIT653 =>
          \$v654\ := \$$1138_stack_lock\;
          if \$v654\(0) = '1' then
            state_var707 := Q_WAIT653;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= work.Int.sub(\$1440_x2\, \$1439_x1\); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET652;
          end if;
        when Q_WAIT656 =>
          \$v657\ := \$$1138_stack_lock\;
          if \$v657\(0) = '1' then
            state_var707 := Q_WAIT656;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET655;
          end if;
        when Q_WAIT659 =>
          \$v660\ := \$$1138_stack_lock\;
          if \$v660\(0) = '1' then
            state_var707 := Q_WAIT659;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET658;
          end if;
        when Q_WAIT662 =>
          \$v663\ := \$$1138_stack_lock\;
          if \$v663\(0) = '1' then
            state_var707 := Q_WAIT662;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1394_arg\(32 to 63), X"0000000" & X"2")));
            \$$1138_stack_write\ <= work.Int.add(\$1444_x2\, \$1443_x1\); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET661;
          end if;
        when Q_WAIT665 =>
          \$v666\ := \$$1138_stack_lock\;
          if \$v666\(0) = '1' then
            state_var707 := Q_WAIT665;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"2")));
            state_var707 := PAUSE_GET664;
          end if;
        when Q_WAIT668 =>
          \$v669\ := \$$1138_stack_lock\;
          if \$v669\(0) = '1' then
            state_var707 := Q_WAIT668;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1394_arg\(32 to 63), X"0000000" & X"1")));
            state_var707 := PAUSE_GET667;
          end if;
        when Q_WAIT671 =>
          \$v672\ := \$$1138_stack_lock\;
          if \$v672\(0) = '1' then
            state_var707 := Q_WAIT671;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(\$1394_arg\(32 to 63)));
            \$$1138_stack_write\ <= \$1394_arg\(64 to 95); \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET670;
          end if;
        when Q_WAIT674 =>
          \$v675\ := \$$1138_stack_lock\;
          if \$v675\(0) = '1' then
            state_var707 := Q_WAIT674;
          else
            acquire(\$$1138_stack_lock\);
            \$$1138_stack_ptr_write\ <= to_integer(unsigned(\$1394_arg\(32 to 63)));
            \$$1138_stack_write\ <= \$1449_v\; \$$1138_stack_write_request\ <= '1';
            state_var707 := PAUSE_SET673;
          end if;
        when Q_WAIT679 =>
          \$v680\ := \$$1137_code_lock\;
          if \$v680\(0) = '1' then
            state_var707 := Q_WAIT679;
          else
            acquire(\$$1137_code_lock\);
            \$$1137_code_ptr\ <= to_integer(unsigned(\$1394_arg\(0 to 31)));
            state_var707 := PAUSE_GET678;
          end if;
        when Q_WAIT684 =>
          \$v685\ := \$$1137_code_lock\;
          if \$v685\(0) = '1' then
            state_var707 := Q_WAIT684;
          else
            acquire(\$$1137_code_lock\);
            \$v682\ := eclat_unit;
            \$$1137_code_ptr_write\ <= 5;\$$1137_code_write\ <= "01011" & \$v682\&"000"& X"000000000000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET683;
          end if;
        when Q_WAIT688 =>
          \$v689\ := \$$1137_code_lock\;
          if \$v689\(0) = '1' then
            state_var707 := Q_WAIT688;
          else
            acquire(\$$1137_code_lock\);
            \$v686\ := eclat_unit;
            \$$1137_code_ptr_write\ <= 4;\$$1137_code_write\ <= "00100" & \$v686\&"000"& X"000000000000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET687;
          end if;
        when Q_WAIT692 =>
          \$v693\ := \$$1137_code_lock\;
          if \$v693\(0) = '1' then
            state_var707 := Q_WAIT692;
          else
            acquire(\$$1137_code_lock\);
            \$v690\ := X"0000000" & X"2";
            \$$1137_code_ptr_write\ <= 3;\$$1137_code_write\ <= "00000" & \$v690\&X"00000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET691;
          end if;
        when Q_WAIT696 =>
          \$v697\ := \$$1137_code_lock\;
          if \$v697\(0) = '1' then
            state_var707 := Q_WAIT696;
          else
            acquire(\$$1137_code_lock\);
            \$v694\ := eclat_unit;
            \$$1137_code_ptr_write\ <= 2;\$$1137_code_write\ <= "00111" & \$v694\&"000"& X"000000000000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET695;
          end if;
        when Q_WAIT700 =>
          \$v701\ := \$$1137_code_lock\;
          if \$v701\(0) = '1' then
            state_var707 := Q_WAIT700;
          else
            acquire(\$$1137_code_lock\);
            \$v698\ := X"0000000" & X"5";
            \$$1137_code_ptr_write\ <= 1;\$$1137_code_write\ <= "00000" & \$v698\&X"00000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET699;
          end if;
        when Q_WAIT704 =>
          \$v705\ := \$$1137_code_lock\;
          if \$v705\(0) = '1' then
            state_var707 := Q_WAIT704;
          else
            acquire(\$$1137_code_lock\);
            \$v702\ := eclat_unit;
            \$$1137_code_ptr_write\ <= 0;\$$1137_code_write\ <= "00011" & \$v702\&"000"& X"000000000000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET703;
          end if;
        when IDLE565 =>
          rdy564 := eclat_false;
          \$v705\ := \$$1137_code_lock\;
          if \$v705\(0) = '1' then
            state_var707 := Q_WAIT704;
          else
            acquire(\$$1137_code_lock\);
            \$v702\ := eclat_unit;
            \$$1137_code_ptr_write\ <= 0;\$$1137_code_write\ <= "00011" & \$v702\&"000"& X"000000000000000"; \$$1137_code_write_request\ <= '1';
            state_var707 := PAUSE_SET703;
          end if;
        end case;
        
        if rdy564(0) = '1' then
          
        else
          result563 := X"0000000" & X"0";
        end if;
        \$1381\ := result563 & rdy564;
        result560 := work.Bool.lnot(""&\$1381\(32));
        rdy561 := eclat_true;
        state := IDLE562;
      end case;
      \state%next\ <= state;
      \state_var707%next\ <= state_var707;
      \$1386%next\ <= \$1386\;
      \$1450%next\ <= \$1450\;
      \$1420_x2%next\ <= \$1420_x2\;
      \$1437%next\ <= \$1437\;
      \rdy564%next\ <= rdy564;
      \$v689%next\ <= \$v689\;
      \$1444_x2%next\ <= \$1444_x2\;
      \$1419_x1%next\ <= \$1419_x1\;
      \$1417%next\ <= \$1417\;
      \$v685%next\ <= \$v685\;
      \$v606%next\ <= \$v606\;
      \$v579%next\ <= \$v579\;
      \$v600%next\ <= \$v600\;
      \$1385%next\ <= \$1385\;
      \$v639%next\ <= \$v639\;
      \$1414_v%next\ <= \$1414_v\;
      \$v630%next\ <= \$v630\;
      \$1427_x1%next\ <= \$1427_x1\;
      \$1412_w%next\ <= \$1412_w\;
      \$v572%next\ <= \$v572\;
      \$1394_arg%next\ <= \$1394_arg\;
      \$1434%next\ <= \$1434\;
      \$1401_n%next\ <= \$1401_n\;
      \$1387%next\ <= \$1387\;
      \$1428_x2%next\ <= \$1428_x2\;
      \$1447%next\ <= \$1447\;
      \$v576%next\ <= \$v576\;
      \$v621%next\ <= \$v621\;
      \$v682%next\ <= \$v682\;
      \$v588%next\ <= \$v588\;
      \$1382%next\ <= \$1382\;
      \$v597%next\ <= \$v597\;
      \$v651%next\ <= \$v651\;
      \$1407_u%next\ <= \$1407_u\;
      \$v702%next\ <= \$v702\;
      \$1438%next\ <= \$1438\;
      \result560%next\ <= result560;
      \$v654%next\ <= \$v654\;
      \$1436_x2%next\ <= \$1436_x2\;
      \$v591%next\ <= \$v591\;
      \$v681%next\ <= \$v681\;
      \$v693%next\ <= \$v693\;
      \$v585%next\ <= \$v585\;
      \$1399_arg%next\ <= \$1399_arg\;
      \$1392%next\ <= \$1392\;
      \$v677%next\ <= \$v677\;
      \$1415_u%next\ <= \$1415_u\;
      \$v680%next\ <= \$v680\;
      \$1439_x1%next\ <= \$1439_x1\;
      \$1398%next\ <= \$1398\;
      \$1440_x2%next\ <= \$1440_x2\;
      \$v697%next\ <= \$v697\;
      \$1397%next\ <= \$1397\;
      \$v648%next\ <= \$v648\;
      \$1391%next\ <= \$1391\;
      \$1410_b%next\ <= \$1410_b\;
      \$1381%next\ <= \$1381\;
      \$v636%next\ <= \$v636\;
      \$1389_acc_final%next\ <= \$1389_acc_final\;
      \$1418%next\ <= \$1418\;
      \$v663%next\ <= \$v663\;
      \$v566%next\ <= \$v566\;
      \rdy561%next\ <= rdy561;
      \$1394_id%next\ <= \$1394_id\;
      \$1435_x1%next\ <= \$1435_x1\;
      \$v609%next\ <= \$v609\;
      \$v694%next\ <= \$v694\;
      \$1400_code_ptr%next\ <= \$1400_code_ptr\;
      \$1425%next\ <= \$1425\;
      \$1451%next\ <= \$1451\;
      \$1394_result%next\ <= \$1394_result\;
      \$v642%next\ <= \$v642\;
      \$v633%next\ <= \$v633\;
      \$v701%next\ <= \$v701\;
      \$1426%next\ <= \$1426\;
      \$v618%next\ <= \$v618\;
      \$1445%next\ <= \$1445\;
      \$1442%next\ <= \$1442\;
      \result563%next\ <= result563;
      \$v686%next\ <= \$v686\;
      \$v690%next\ <= \$v690\;
      \$v582%next\ <= \$v582\;
      \$v569%next\ <= \$v569\;
      \$v660%next\ <= \$v660\;
      \$1443_x1%next\ <= \$1443_x1\;
      \$1409_a%next\ <= \$1409_a\;
      \$v615%next\ <= \$v615\;
      \$v672%next\ <= \$v672\;
      \$1422%next\ <= \$1422\;
      \$1416%next\ <= \$1416\;
      \$1408%next\ <= \$1408\;
      \$v558%next\ <= \$v558\;
      \$v698%next\ <= \$v698\;
      \$1388%next\ <= \$1388\;
      \$1413%next\ <= \$1413\;
      \$1393%next\ <= \$1393\;
      \$v627%next\ <= \$v627\;
      \$v705%next\ <= \$v705\;
      \$v573%next\ <= \$v573\;
      \$v675%next\ <= \$v675\;
      \$1448_b%next\ <= \$1448_b\;
      \$v669%next\ <= \$v669\;
      \$1424_x2%next\ <= \$1424_x2\;
      \$1380_cy%next\ <= \$1380_cy\;
      \$1405_v%next\ <= \$1405_v\;
      \$1421%next\ <= \$1421\;
      \$1446%next\ <= \$1446\;
      \$1404%next\ <= \$1404\;
      \$1423_x1%next\ <= \$1423_x1\;
      \$v603%next\ <= \$v603\;
      \$v594%next\ <= \$v594\;
      \$1402%next\ <= \$1402\;
      \$v624%next\ <= \$v624\;
      \$1383%next\ <= \$1383\;
      \$1429%next\ <= \$1429\;
      \$1390%next\ <= \$1390\;
      \$1411_w%next\ <= \$1411_w\;
      \$v666%next\ <= \$v666\;
      \$1441%next\ <= \$1441\;
      \$1433%next\ <= \$1433\;
      \$1449_v%next\ <= \$1449_v\;
      \$1430%next\ <= \$1430\;
      \$1406%next\ <= \$1406\;
      \$1403_cond%next\ <= \$1403_cond\;
      \$v612%next\ <= \$v612\;
      \$1431_x1%next\ <= \$1431_x1\;
      \$1432_x2%next\ <= \$1432_x2\;
      \$v645%next\ <= \$v645\;
      \$1384%next\ <= \$1384\;
      \$v657%next\ <= \$v657\;
      \$$1137_code_lock%next\ <= \$$1137_code_lock\;
      \$$1138_stack_lock%next\ <= \$$1138_stack_lock\;
      
      
      result <= result560;
      end process;
  end architecture;
