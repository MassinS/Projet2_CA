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

  type t_state is (IDLE542);
  signal \state%now\, \state%next\: t_state;
  type t_state_var695 is (IDLE545, \$1335\, PAUSE_GET547, PAUSE_GET550, PAUSE_GET553, PAUSE_GET556, PAUSE_GET565, PAUSE_GET568, PAUSE_GET577, PAUSE_GET580, PAUSE_GET586, PAUSE_GET589, PAUSE_GET595, PAUSE_GET598, PAUSE_GET604, PAUSE_GET607, PAUSE_GET613, PAUSE_GET616, PAUSE_GET622, PAUSE_GET625, PAUSE_GET631, PAUSE_GET634, PAUSE_GET640, PAUSE_GET643, PAUSE_GET654, PAUSE_SET559, PAUSE_SET562, PAUSE_SET571, PAUSE_SET574, PAUSE_SET583, PAUSE_SET592, PAUSE_SET601, PAUSE_SET610, PAUSE_SET619, PAUSE_SET628, PAUSE_SET637, PAUSE_SET646, PAUSE_SET649, PAUSE_SET659, PAUSE_SET663, PAUSE_SET667, PAUSE_SET671, PAUSE_SET675, PAUSE_SET679, PAUSE_SET683, PAUSE_SET687, PAUSE_SET691, Q_WAIT548, Q_WAIT551, Q_WAIT554, Q_WAIT557, Q_WAIT560, Q_WAIT563, Q_WAIT566, Q_WAIT569, Q_WAIT572, Q_WAIT575, Q_WAIT578, Q_WAIT581, Q_WAIT584, Q_WAIT587, Q_WAIT590, Q_WAIT593, Q_WAIT596, Q_WAIT599, Q_WAIT602, Q_WAIT605, Q_WAIT608, Q_WAIT611, Q_WAIT614, Q_WAIT617, Q_WAIT620, Q_WAIT623, Q_WAIT626, Q_WAIT629, Q_WAIT632, Q_WAIT635, Q_WAIT638, Q_WAIT641, Q_WAIT644, Q_WAIT647, Q_WAIT650, Q_WAIT655, Q_WAIT660, Q_WAIT664, Q_WAIT668, Q_WAIT672, Q_WAIT676, Q_WAIT680, Q_WAIT684, Q_WAIT688, Q_WAIT692);
  signal \state_var695%now\, \state_var695%next\: t_state_var695;
  type array_value_32 is array (natural range <>) of value(0 to 31);
  type array_value_69 is array (natural range <>) of value(0 to 68);
  signal \$1085_code\ : array_value_69(0 to 8);
  signal \$$1085_code_value\ : value(0 to 68) := (others => '0');
  signal \$$1085_code_ptr\ : natural range 0 to 8 := 0;
  signal \$$1085_code_ptr_write\ : natural range 0 to 8 := 0;
  signal \$$1085_code_write\ : value(0 to 68) := (others => '0');
  signal \$$1085_code_write_request\ : std_logic := '0';
  signal \$1086_stack\ : array_value_32(0 to 255);
  signal \$$1086_stack_value\ : value(0 to 31) := (others => '0');
  signal \$$1086_stack_ptr\ : natural range 0 to 255 := 0;
  signal \$$1086_stack_ptr_write\ : natural range 0 to 255 := 0;
  signal \$$1086_stack_write\ : value(0 to 31) := (others => '0');
  signal \$$1086_stack_write_request\ : std_logic := '0';
  signal \$v546%next\, \$v546%now\ : value(0 to 63) := (others => '0');
  signal \$1321%next\, \$1321%now\ : value(0 to 32) := (others => '0');
  signal \$1338%next\, \$1338%now\ : value(0 to 68) := (others => '0');
  signal \$1335_id%next\, \$1335_id%now\ : value(0 to 11) := (others => '0');
  signal \$v653%next\, \$v653%now\ : value(0 to 4) := (others => '0');
  signal \$1335_arg%next\, \$1335_arg%now\ : value(0 to 97) := (others => '0');
  signal \$$1086_stack_lock%next\, \$$1086_stack_lock%now\, 
         \$$1085_code_lock%next\, \$$1085_code_lock%now\, \$v657%next\, 
         \$v657%now\, \$1384%next\, \$1384%now\, \$v645%next\, \$v645%now\, 
         \$1322%next\, \$1322%now\, \$v612%next\, \$v612%now\, \$1345%next\, 
         \$1345%now\, \$1357%next\, \$1357%now\, \$1325%next\, \$1325%now\, 
         \$1332%next\, \$1332%now\, \$1390%next\, \$1390%now\, \$v570%next\, 
         \$v570%now\, \$v624%next\, \$v624%now\, \$v658%next\, \$v658%now\, 
         \$1355%next\, \$1355%now\, \$v594%next\, \$v594%now\, \$v603%next\, 
         \$v603%now\, \$v669%next\, \$v669%now\, \$v573%next\, \$v573%now\, 
         \$1347%next\, \$1347%now\, \$v627%next\, \$v627%now\, \$v674%next\, 
         \$v674%now\, \$1333%next\, \$1333%now\, \$v558%next\, \$v558%now\, 
         \$v670%next\, \$v670%now\, \$v615%next\, \$v615%now\, \$1368%next\, 
         \$1368%now\, \$v690%next\, \$v690%now\, \$v582%next\, \$v582%now\, 
         \$1328%next\, \$1328%now\, \$1373%next\, \$1373%now\, \$v618%next\, 
         \$v618%now\, \$1329%next\, \$1329%now\, \$v633%next\, \$v633%now\, 
         \$v642%next\, \$v642%now\, \rdy544%next\, \rdy544%now\, 
         \$1339%next\, \$1339%now\, \$v662%next\, \$v662%now\, 
         \$1350_w%next\, \$1350_w%now\, \$v564%next\, \$v564%now\, 
         \$v609%next\, \$v609%now\, \$1369%next\, \$1369%now\, \$1334%next\, 
         \$1334%now\, \$v636%next\, \$v636%now\, \$v665%next\, \$v665%now\, 
         \$v538%next\, \$v538%now\, \$1381%next\, \$1381%now\, \$1356%next\, 
         \$1356%now\, \$v648%next\, \$v648%now\, \$1364%next\, \$1364%now\, 
         \$1391%next\, \$1391%now\, \$1352%next\, \$1352%now\, \$1331%next\, 
         \$1331%now\, \$v677%next\, \$v677%now\, \$1360%next\, \$1360%now\, 
         \$v693%next\, \$v693%now\, \$v549%next\, \$v549%now\, \$v585%next\, 
         \$v585%now\, \result540%next\, \result540%now\, \$v591%next\, 
         \$v591%now\, \$1389%next\, \$1389%now\, \$v681%next\, \$v681%now\, 
         \$1351_w%next\, \$1351_w%now\, \rdy541%next\, \rdy541%now\, 
         \$v567%next\, \$v567%now\, \$v597%next\, \$v597%now\, \$v651%next\, 
         \$v651%now\, \$v588%next\, \$v588%now\, \$1327%next\, \$1327%now\, 
         \$v682%next\, \$v682%now\, \$v576%next\, \$v576%now\, \$v621%next\, 
         \$v621%now\, \$1372%next\, \$1372%now\, \$v552%next\, \$v552%now\, 
         \$1365%next\, \$1365%now\, \$v661%next\, \$v661%now\, \$1324%next\, 
         \$1324%now\, \$v673%next\, \$v673%now\, \$1343%next\, \$1343%now\, 
         \$v630%next\, \$v630%now\, \$1326%next\, \$1326%now\, \$v639%next\, 
         \$v639%now\, \$1385%next\, \$1385%now\, \$v579%next\, \$v579%now\, 
         \$v606%next\, \$v606%now\, \$v600%next\, \$v600%now\, \$v656%next\, 
         \$v656%now\, \$1376%next\, \$1376%now\, \$v685%next\, \$v685%now\, 
         \$v561%next\, \$v561%now\, \$v678%next\, \$v678%now\, \$1323%next\, 
         \$1323%now\, \$1377%next\, \$1377%now\, \$v689%next\, \$v689%now\, 
         \$1387_b%next\, \$1387_b%now\, \$1361%next\, \$1361%now\, 
         \$v555%next\, \$v555%now\, \$1386%next\, \$1386%now\, \$1380%next\, 
         \$1380%now\ : value(0 to 0) := (others => '0');
  signal \$1359_x2%next\, \$1359_x2%now\, \$v666%next\, \$v666%now\, 
         \$1340_arg%next\, \$1340_arg%now\, \$1374_x1%next\, \$1374_x1%now\, 
         \$1363_x2%next\, \$1363_x2%now\, \$1358_x1%next\, \$1358_x1%now\, 
         \$1367_x2%next\, \$1367_x2%now\, \$1379_x2%next\, \$1379_x2%now\, 
         \$v686%next\, \$v686%now\, \$1330_acc_final%next\, 
         \$1330_acc_final%now\, \result543%next\, \result543%now\, 
         \$1335_result%next\, \$1335_result%now\, \$1344_v%next\, 
         \$1344_v%now\, \$1371_x2%next\, \$1371_x2%now\, \$1346_u%next\, 
         \$1346_u%now\, \$1378_x1%next\, \$1378_x1%now\, \$1375_x2%next\, 
         \$1375_x2%now\, \$1392%next\, \$1392%now\, \$1354_u%next\, 
         \$1354_u%now\, \$1370_x1%next\, \$1370_x1%now\, \$1353_v%next\, 
         \$1353_v%now\, \$1382_x1%next\, \$1382_x1%now\, \$1366_x1%next\, 
         \$1366_x1%now\, \$1320_cy%next\, \$1320_cy%now\, \$1383_x2%next\, 
         \$1383_x2%now\, \$1348_a%next\, \$1348_a%now\, \$1349_b%next\, 
         \$1349_b%now\, \$1341_code_ptr%next\, \$1341_code_ptr%now\, 
         \$1362_x1%next\, \$1362_x1%now\, \$1342_n%next\, \$1342_n%now\, 
         \$1388_v%next\, \$1388_v%now\ : value(0 to 31) := (others => '0');
  
  begin
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1085_code_write_request\ = '1' then
                    \$1085_code\(\$$1085_code_ptr_write\) <= \$$1085_code_write\;
                 end if;
                 \$$1085_code_value\ <= \$1085_code\(\$$1085_code_ptr\);
            end if;
        end process;
    
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1086_stack_write_request\ = '1' then
                    \$1086_stack\(\$$1086_stack_ptr_write\) <= \$$1086_stack_write\;
                 end if;
                 \$$1086_stack_value\ <= \$1086_stack\(\$$1086_stack_ptr\);
            end if;
        end process;
    
    process (reset,clk)
      begin
      if reset = '1' then
        \$1380%now\ <= (others => '0');
        \$1335_arg%now\ <= (others => '0');
        \$1386%now\ <= (others => '0');
        \$1388_v%now\ <= (others => '0');
        \$v555%now\ <= (others => '0');
        \$1361%now\ <= (others => '0');
        \$v653%now\ <= (others => '0');
        \$1342_n%now\ <= (others => '0');
        \$1387_b%now\ <= (others => '0');
        \$v689%now\ <= (others => '0');
        \$1377%now\ <= (others => '0');
        \$1323%now\ <= (others => '0');
        \$v678%now\ <= (others => '0');
        \$1335_id%now\ <= (others => '0');
        \$v561%now\ <= (others => '0');
        \$1362_x1%now\ <= (others => '0');
        \$1321%now\ <= (others => '0');
        \$v685%now\ <= (others => '0');
        \$1376%now\ <= (others => '0');
        \$1341_code_ptr%now\ <= (others => '0');
        \$v656%now\ <= (others => '0');
        \$v600%now\ <= (others => '0');
        \$v606%now\ <= (others => '0');
        \$v579%now\ <= (others => '0');
        \$1385%now\ <= (others => '0');
        \$1349_b%now\ <= (others => '0');
        \$v639%now\ <= (others => '0');
        \$1326%now\ <= (others => '0');
        \$v630%now\ <= (others => '0');
        \$1343%now\ <= (others => '0');
        \$1348_a%now\ <= (others => '0');
        \$v673%now\ <= (others => '0');
        \$1324%now\ <= (others => '0');
        \$v661%now\ <= (others => '0');
        \$1365%now\ <= (others => '0');
        \$1383_x2%now\ <= (others => '0');
        \$v552%now\ <= (others => '0');
        \$1320_cy%now\ <= (others => '0');
        \$1372%now\ <= (others => '0');
        \$v621%now\ <= (others => '0');
        \$1366_x1%now\ <= (others => '0');
        \$v576%now\ <= (others => '0');
        \$v682%now\ <= (others => '0');
        \$1327%now\ <= (others => '0');
        \$v588%now\ <= (others => '0');
        \$v651%now\ <= (others => '0');
        \$1382_x1%now\ <= (others => '0');
        \$v597%now\ <= (others => '0');
        \$v567%now\ <= (others => '0');
        \$1353_v%now\ <= (others => '0');
        \rdy541%now\ <= (others => '0');
        \$1351_w%now\ <= (others => '0');
        \$v681%now\ <= (others => '0');
        \$1389%now\ <= (others => '0');
        \$v591%now\ <= (others => '0');
        \result540%now\ <= (others => '0');
        \$v585%now\ <= (others => '0');
        \$v549%now\ <= (others => '0');
        \$v693%now\ <= (others => '0');
        \$1360%now\ <= (others => '0');
        \$1370_x1%now\ <= (others => '0');
        \$1354_u%now\ <= (others => '0');
        \$1392%now\ <= (others => '0');
        \$v677%now\ <= (others => '0');
        \$1331%now\ <= (others => '0');
        \$1375_x2%now\ <= (others => '0');
        \$1352%now\ <= (others => '0');
        \$1391%now\ <= (others => '0');
        \$1364%now\ <= (others => '0');
        \$v648%now\ <= (others => '0');
        \$1356%now\ <= (others => '0');
        \$1381%now\ <= (others => '0');
        \$v538%now\ <= (others => '0');
        \$v665%now\ <= (others => '0');
        \$v636%now\ <= (others => '0');
        \$1334%now\ <= (others => '0');
        \$1369%now\ <= (others => '0');
        \$1378_x1%now\ <= (others => '0');
        \$1346_u%now\ <= (others => '0');
        \$v609%now\ <= (others => '0');
        \$1371_x2%now\ <= (others => '0');
        \$v564%now\ <= (others => '0');
        \$1350_w%now\ <= (others => '0');
        \$1344_v%now\ <= (others => '0');
        \$v662%now\ <= (others => '0');
        \$1339%now\ <= (others => '0');
        \$1335_result%now\ <= (others => '0');
        \rdy544%now\ <= (others => '0');
        \$v642%now\ <= (others => '0');
        \$v633%now\ <= (others => '0');
        \$1329%now\ <= (others => '0');
        \$v618%now\ <= (others => '0');
        \result543%now\ <= (others => '0');
        \$1330_acc_final%now\ <= (others => '0');
        \$v686%now\ <= (others => '0');
        \$1379_x2%now\ <= (others => '0');
        \$1367_x2%now\ <= (others => '0');
        \$1373%now\ <= (others => '0');
        \$1328%now\ <= (others => '0');
        \$v582%now\ <= (others => '0');
        \$v690%now\ <= (others => '0');
        \$1368%now\ <= (others => '0');
        \$v615%now\ <= (others => '0');
        \$1358_x1%now\ <= (others => '0');
        \$1363_x2%now\ <= (others => '0');
        \$v670%now\ <= (others => '0');
        \$v558%now\ <= (others => '0');
        \$1333%now\ <= (others => '0');
        \$1374_x1%now\ <= (others => '0');
        \$v674%now\ <= (others => '0');
        \$v627%now\ <= (others => '0');
        \$1347%now\ <= (others => '0');
        \$v546%now\ <= (others => '0');
        \$v573%now\ <= (others => '0');
        \$1338%now\ <= (others => '0');
        \$v669%now\ <= (others => '0');
        \$v603%now\ <= (others => '0');
        \$v594%now\ <= (others => '0');
        \$1355%now\ <= (others => '0');
        \$1340_arg%now\ <= (others => '0');
        \$v658%now\ <= (others => '0');
        \$v624%now\ <= (others => '0');
        \$v570%now\ <= (others => '0');
        \$1390%now\ <= (others => '0');
        \$1332%now\ <= (others => '0');
        \$1325%now\ <= (others => '0');
        \$v666%now\ <= (others => '0');
        \$1357%now\ <= (others => '0');
        \$1359_x2%now\ <= (others => '0');
        \$1345%now\ <= (others => '0');
        \$v612%now\ <= (others => '0');
        \$1322%now\ <= (others => '0');
        \$v645%now\ <= (others => '0');
        \$1384%now\ <= (others => '0');
        \$v657%now\ <= (others => '0');
        \$$1085_code_lock%now\ <= (others => '0');
        \$$1086_stack_lock%now\ <= (others => '0');
        \state%now\ <= idle542;
        \state_var695%now\ <= idle545;
      elsif (rising_edge(clk)) then
        \$1380%now\ <= \$1380%next\;
        \$1335_arg%now\ <= \$1335_arg%next\;
        \$1386%now\ <= \$1386%next\;
        \$1388_v%now\ <= \$1388_v%next\;
        \$v555%now\ <= \$v555%next\;
        \$1361%now\ <= \$1361%next\;
        \$v653%now\ <= \$v653%next\;
        \$1342_n%now\ <= \$1342_n%next\;
        \$1387_b%now\ <= \$1387_b%next\;
        \$v689%now\ <= \$v689%next\;
        \$1377%now\ <= \$1377%next\;
        \$1323%now\ <= \$1323%next\;
        \$v678%now\ <= \$v678%next\;
        \$1335_id%now\ <= \$1335_id%next\;
        \$v561%now\ <= \$v561%next\;
        \$1362_x1%now\ <= \$1362_x1%next\;
        \$1321%now\ <= \$1321%next\;
        \$v685%now\ <= \$v685%next\;
        \$1376%now\ <= \$1376%next\;
        \$1341_code_ptr%now\ <= \$1341_code_ptr%next\;
        \$v656%now\ <= \$v656%next\;
        \$v600%now\ <= \$v600%next\;
        \$v606%now\ <= \$v606%next\;
        \$v579%now\ <= \$v579%next\;
        \$1385%now\ <= \$1385%next\;
        \$1349_b%now\ <= \$1349_b%next\;
        \$v639%now\ <= \$v639%next\;
        \$1326%now\ <= \$1326%next\;
        \$v630%now\ <= \$v630%next\;
        \$1343%now\ <= \$1343%next\;
        \$1348_a%now\ <= \$1348_a%next\;
        \$v673%now\ <= \$v673%next\;
        \$1324%now\ <= \$1324%next\;
        \$v661%now\ <= \$v661%next\;
        \$1365%now\ <= \$1365%next\;
        \$1383_x2%now\ <= \$1383_x2%next\;
        \$v552%now\ <= \$v552%next\;
        \$1320_cy%now\ <= \$1320_cy%next\;
        \$1372%now\ <= \$1372%next\;
        \$v621%now\ <= \$v621%next\;
        \$1366_x1%now\ <= \$1366_x1%next\;
        \$v576%now\ <= \$v576%next\;
        \$v682%now\ <= \$v682%next\;
        \$1327%now\ <= \$1327%next\;
        \$v588%now\ <= \$v588%next\;
        \$v651%now\ <= \$v651%next\;
        \$1382_x1%now\ <= \$1382_x1%next\;
        \$v597%now\ <= \$v597%next\;
        \$v567%now\ <= \$v567%next\;
        \$1353_v%now\ <= \$1353_v%next\;
        \rdy541%now\ <= \rdy541%next\;
        \$1351_w%now\ <= \$1351_w%next\;
        \$v681%now\ <= \$v681%next\;
        \$1389%now\ <= \$1389%next\;
        \$v591%now\ <= \$v591%next\;
        \result540%now\ <= \result540%next\;
        \$v585%now\ <= \$v585%next\;
        \$v549%now\ <= \$v549%next\;
        \$v693%now\ <= \$v693%next\;
        \$1360%now\ <= \$1360%next\;
        \$1370_x1%now\ <= \$1370_x1%next\;
        \$1354_u%now\ <= \$1354_u%next\;
        \$1392%now\ <= \$1392%next\;
        \$v677%now\ <= \$v677%next\;
        \$1331%now\ <= \$1331%next\;
        \$1375_x2%now\ <= \$1375_x2%next\;
        \$1352%now\ <= \$1352%next\;
        \$1391%now\ <= \$1391%next\;
        \$1364%now\ <= \$1364%next\;
        \$v648%now\ <= \$v648%next\;
        \$1356%now\ <= \$1356%next\;
        \$1381%now\ <= \$1381%next\;
        \$v538%now\ <= \$v538%next\;
        \$v665%now\ <= \$v665%next\;
        \$v636%now\ <= \$v636%next\;
        \$1334%now\ <= \$1334%next\;
        \$1369%now\ <= \$1369%next\;
        \$1378_x1%now\ <= \$1378_x1%next\;
        \$1346_u%now\ <= \$1346_u%next\;
        \$v609%now\ <= \$v609%next\;
        \$1371_x2%now\ <= \$1371_x2%next\;
        \$v564%now\ <= \$v564%next\;
        \$1350_w%now\ <= \$1350_w%next\;
        \$1344_v%now\ <= \$1344_v%next\;
        \$v662%now\ <= \$v662%next\;
        \$1339%now\ <= \$1339%next\;
        \$1335_result%now\ <= \$1335_result%next\;
        \rdy544%now\ <= \rdy544%next\;
        \$v642%now\ <= \$v642%next\;
        \$v633%now\ <= \$v633%next\;
        \$1329%now\ <= \$1329%next\;
        \$v618%now\ <= \$v618%next\;
        \result543%now\ <= \result543%next\;
        \$1330_acc_final%now\ <= \$1330_acc_final%next\;
        \$v686%now\ <= \$v686%next\;
        \$1379_x2%now\ <= \$1379_x2%next\;
        \$1367_x2%now\ <= \$1367_x2%next\;
        \$1373%now\ <= \$1373%next\;
        \$1328%now\ <= \$1328%next\;
        \$v582%now\ <= \$v582%next\;
        \$v690%now\ <= \$v690%next\;
        \$1368%now\ <= \$1368%next\;
        \$v615%now\ <= \$v615%next\;
        \$1358_x1%now\ <= \$1358_x1%next\;
        \$1363_x2%now\ <= \$1363_x2%next\;
        \$v670%now\ <= \$v670%next\;
        \$v558%now\ <= \$v558%next\;
        \$1333%now\ <= \$1333%next\;
        \$1374_x1%now\ <= \$1374_x1%next\;
        \$v674%now\ <= \$v674%next\;
        \$v627%now\ <= \$v627%next\;
        \$1347%now\ <= \$1347%next\;
        \$v546%now\ <= \$v546%next\;
        \$v573%now\ <= \$v573%next\;
        \$1338%now\ <= \$1338%next\;
        \$v669%now\ <= \$v669%next\;
        \$v603%now\ <= \$v603%next\;
        \$v594%now\ <= \$v594%next\;
        \$1355%now\ <= \$1355%next\;
        \$1340_arg%now\ <= \$1340_arg%next\;
        \$v658%now\ <= \$v658%next\;
        \$v624%now\ <= \$v624%next\;
        \$v570%now\ <= \$v570%next\;
        \$1390%now\ <= \$1390%next\;
        \$1332%now\ <= \$1332%next\;
        \$1325%now\ <= \$1325%next\;
        \$v666%now\ <= \$v666%next\;
        \$1357%now\ <= \$1357%next\;
        \$1359_x2%now\ <= \$1359_x2%next\;
        \$1345%now\ <= \$1345%next\;
        \$v612%now\ <= \$v612%next\;
        \$1322%now\ <= \$1322%next\;
        \$v645%now\ <= \$v645%next\;
        \$1384%now\ <= \$1384%next\;
        \$v657%now\ <= \$v657%next\;
        \$$1085_code_lock%now\ <= \$$1085_code_lock%next\;
        \$$1086_stack_lock%now\ <= \$$1086_stack_lock%next\;
        \state_var695%now\ <= \state_var695%next\;
        \state%now\ <= \state%next\;
      end if;
    end process;
      
      process(argument,\state%now\, clk,\state_var695%now\, \$$1085_code_value\, \$$1086_stack_value\, \$1380%now\, \$1335_arg%now\, \$1386%now\, \$1388_v%now\, \$v555%now\, \$1361%now\, \$v653%now\, \$1342_n%now\, \$1387_b%now\, \$v689%now\, \$1377%now\, \$1323%now\, \$v678%now\, \$1335_id%now\, \$v561%now\, \$1362_x1%now\, \$1321%now\, \$v685%now\, \$1376%now\, \$1341_code_ptr%now\, \$v656%now\, \$v600%now\, \$v606%now\, \$v579%now\, \$1385%now\, \$1349_b%now\, \$v639%now\, \$1326%now\, \$v630%now\, \$1343%now\, \$1348_a%now\, \$v673%now\, \$1324%now\, \$v661%now\, \$1365%now\, \$1383_x2%now\, \$v552%now\, \$1320_cy%now\, \$1372%now\, \$v621%now\, \$1366_x1%now\, \$v576%now\, \$v682%now\, \$1327%now\, \$v588%now\, \$v651%now\, \$1382_x1%now\, \$v597%now\, \$v567%now\, \$1353_v%now\, \rdy541%now\, \$1351_w%now\, \$v681%now\, \$1389%now\, \$v591%now\, \result540%now\, \$v585%now\, \$v549%now\, \$v693%now\, \$1360%now\, \$1370_x1%now\, \$1354_u%now\, \$1392%now\, \$v677%now\, \$1331%now\, \$1375_x2%now\, \$1352%now\, \$1391%now\, \$1364%now\, \$v648%now\, \$1356%now\, \$1381%now\, \$v538%now\, \$v665%now\, \$v636%now\, \$1334%now\, \$1369%now\, \$1378_x1%now\, \$1346_u%now\, \$v609%now\, \$1371_x2%now\, \$v564%now\, \$1350_w%now\, \$1344_v%now\, \$v662%now\, \$1339%now\, \$1335_result%now\, \rdy544%now\, \$v642%now\, \$v633%now\, \$1329%now\, \$v618%now\, \result543%now\, \$1330_acc_final%now\, \$v686%now\, \$1379_x2%now\, \$1367_x2%now\, \$1373%now\, \$1328%now\, \$v582%now\, \$v690%now\, \$1368%now\, \$v615%now\, \$1358_x1%now\, \$1363_x2%now\, \$v670%now\, \$v558%now\, \$1333%now\, \$1374_x1%now\, \$v674%now\, \$v627%now\, \$1347%now\, \$v546%now\, \$v573%now\, \$1338%now\, \$v669%now\, \$v603%now\, \$v594%now\, \$1355%now\, \$1340_arg%now\, \$v658%now\, \$v624%now\, \$v570%now\, \$1390%now\, \$1332%now\, \$1325%now\, \$v666%now\, \$1357%now\, \$1359_x2%now\, \$1345%now\, \$v612%now\, \$1322%now\, \$v645%now\, \$1384%now\, \$v657%now\, \$$1085_code_lock%now\, \$$1086_stack_lock%now\)
        variable \$v546\ : value(0 to 63) := (others => '0');
        variable \$1321\ : value(0 to 32) := (others => '0');
        variable \$1338\ : value(0 to 68) := (others => '0');
        variable \$1335_id\ : value(0 to 11) := (others => '0');
        variable \$v653\ : value(0 to 4) := (others => '0');
        variable \$1335_arg\ : value(0 to 97) := (others => '0');
        variable \$v657\, \$1384\, \$v645\, \$1322\, \$v612\, \$1345\, 
                 \$1357\, \$1325\, \$1332\, \$1390\, \$v570\, \$v624\, 
                 \$v658\, \$1355\, \$v594\, \$v603\, \$v669\, \$v573\, 
                 \$1347\, \$v627\, \$v674\, \$1333\, \$v558\, \$v670\, 
                 \$v615\, \$1368\, \$v690\, \$v582\, \$1328\, \$1373\, 
                 \$v618\, \$1329\, \$v633\, \$v642\, rdy544, \$1339\, 
                 \$v662\, \$1350_w\, \$v564\, \$v609\, \$1369\, \$1334\, 
                 \$v636\, \$v665\, \$v538\, \$1381\, \$1356\, \$v648\, 
                 \$1364\, \$1391\, \$1352\, \$1331\, \$v677\, \$1360\, 
                 \$v693\, \$v549\, \$v585\, result540, \$v591\, \$1389\, 
                 \$v681\, \$1351_w\, rdy541, \$v567\, \$v597\, \$v651\, 
                 \$v588\, \$1327\, \$v682\, \$v576\, \$v621\, \$1372\, 
                 \$v552\, \$1365\, \$v661\, \$1324\, \$v673\, \$1343\, 
                 \$v630\, \$1326\, \$v639\, \$1385\, \$v579\, \$v606\, 
                 \$v600\, \$v656\, \$1376\, \$v685\, \$v561\, \$v678\, 
                 \$1323\, \$1377\, \$v689\, \$1387_b\, \$1361\, \$v555\, 
                 \$1386\, \$1380\ : value(0 to 0) := (others => '0');
        variable \$1359_x2\, \$v666\, \$1340_arg\, \$1374_x1\, \$1363_x2\, 
                 \$1358_x1\, \$1367_x2\, \$1379_x2\, \$v686\, 
                 \$1330_acc_final\, result543, \$1335_result\, \$1344_v\, 
                 \$1371_x2\, \$1346_u\, \$1378_x1\, \$1375_x2\, \$1392\, 
                 \$1354_u\, \$1370_x1\, \$1353_v\, \$1382_x1\, \$1366_x1\, 
                 \$1320_cy\, \$1383_x2\, \$1348_a\, \$1349_b\, 
                 \$1341_code_ptr\, \$1362_x1\, \$1342_n\, \$1388_v\ : value(0 to 31) := (others => '0');
        variable state : t_state;
        variable state_var695 : t_state_var695;
        variable \$$1085_code_lock\ : value(0 to 0);
        variable \$$1086_stack_lock\ : value(0 to 0);
        
    begin
      \$1380\ := \$1380%now\;
      \$1335_arg\ := \$1335_arg%now\;
      \$1386\ := \$1386%now\;
      \$1388_v\ := \$1388_v%now\;
      \$v555\ := \$v555%now\;
      \$1361\ := \$1361%now\;
      \$v653\ := \$v653%now\;
      \$1342_n\ := \$1342_n%now\;
      \$1387_b\ := \$1387_b%now\;
      \$v689\ := \$v689%now\;
      \$1377\ := \$1377%now\;
      \$1323\ := \$1323%now\;
      \$v678\ := \$v678%now\;
      \$1335_id\ := \$1335_id%now\;
      \$v561\ := \$v561%now\;
      \$1362_x1\ := \$1362_x1%now\;
      \$1321\ := \$1321%now\;
      \$v685\ := \$v685%now\;
      \$1376\ := \$1376%now\;
      \$1341_code_ptr\ := \$1341_code_ptr%now\;
      \$v656\ := \$v656%now\;
      \$v600\ := \$v600%now\;
      \$v606\ := \$v606%now\;
      \$v579\ := \$v579%now\;
      \$1385\ := \$1385%now\;
      \$1349_b\ := \$1349_b%now\;
      \$v639\ := \$v639%now\;
      \$1326\ := \$1326%now\;
      \$v630\ := \$v630%now\;
      \$1343\ := \$1343%now\;
      \$1348_a\ := \$1348_a%now\;
      \$v673\ := \$v673%now\;
      \$1324\ := \$1324%now\;
      \$v661\ := \$v661%now\;
      \$1365\ := \$1365%now\;
      \$1383_x2\ := \$1383_x2%now\;
      \$v552\ := \$v552%now\;
      \$1320_cy\ := \$1320_cy%now\;
      \$1372\ := \$1372%now\;
      \$v621\ := \$v621%now\;
      \$1366_x1\ := \$1366_x1%now\;
      \$v576\ := \$v576%now\;
      \$v682\ := \$v682%now\;
      \$1327\ := \$1327%now\;
      \$v588\ := \$v588%now\;
      \$v651\ := \$v651%now\;
      \$1382_x1\ := \$1382_x1%now\;
      \$v597\ := \$v597%now\;
      \$v567\ := \$v567%now\;
      \$1353_v\ := \$1353_v%now\;
      rdy541 := \rdy541%now\;
      \$1351_w\ := \$1351_w%now\;
      \$v681\ := \$v681%now\;
      \$1389\ := \$1389%now\;
      \$v591\ := \$v591%now\;
      result540 := \result540%now\;
      \$v585\ := \$v585%now\;
      \$v549\ := \$v549%now\;
      \$v693\ := \$v693%now\;
      \$1360\ := \$1360%now\;
      \$1370_x1\ := \$1370_x1%now\;
      \$1354_u\ := \$1354_u%now\;
      \$1392\ := \$1392%now\;
      \$v677\ := \$v677%now\;
      \$1331\ := \$1331%now\;
      \$1375_x2\ := \$1375_x2%now\;
      \$1352\ := \$1352%now\;
      \$1391\ := \$1391%now\;
      \$1364\ := \$1364%now\;
      \$v648\ := \$v648%now\;
      \$1356\ := \$1356%now\;
      \$1381\ := \$1381%now\;
      \$v538\ := \$v538%now\;
      \$v665\ := \$v665%now\;
      \$v636\ := \$v636%now\;
      \$1334\ := \$1334%now\;
      \$1369\ := \$1369%now\;
      \$1378_x1\ := \$1378_x1%now\;
      \$1346_u\ := \$1346_u%now\;
      \$v609\ := \$v609%now\;
      \$1371_x2\ := \$1371_x2%now\;
      \$v564\ := \$v564%now\;
      \$1350_w\ := \$1350_w%now\;
      \$1344_v\ := \$1344_v%now\;
      \$v662\ := \$v662%now\;
      \$1339\ := \$1339%now\;
      \$1335_result\ := \$1335_result%now\;
      rdy544 := \rdy544%now\;
      \$v642\ := \$v642%now\;
      \$v633\ := \$v633%now\;
      \$1329\ := \$1329%now\;
      \$v618\ := \$v618%now\;
      result543 := \result543%now\;
      \$1330_acc_final\ := \$1330_acc_final%now\;
      \$v686\ := \$v686%now\;
      \$1379_x2\ := \$1379_x2%now\;
      \$1367_x2\ := \$1367_x2%now\;
      \$1373\ := \$1373%now\;
      \$1328\ := \$1328%now\;
      \$v582\ := \$v582%now\;
      \$v690\ := \$v690%now\;
      \$1368\ := \$1368%now\;
      \$v615\ := \$v615%now\;
      \$1358_x1\ := \$1358_x1%now\;
      \$1363_x2\ := \$1363_x2%now\;
      \$v670\ := \$v670%now\;
      \$v558\ := \$v558%now\;
      \$1333\ := \$1333%now\;
      \$1374_x1\ := \$1374_x1%now\;
      \$v674\ := \$v674%now\;
      \$v627\ := \$v627%now\;
      \$1347\ := \$1347%now\;
      \$v546\ := \$v546%now\;
      \$v573\ := \$v573%now\;
      \$1338\ := \$1338%now\;
      \$v669\ := \$v669%now\;
      \$v603\ := \$v603%now\;
      \$v594\ := \$v594%now\;
      \$1355\ := \$1355%now\;
      \$1340_arg\ := \$1340_arg%now\;
      \$v658\ := \$v658%now\;
      \$v624\ := \$v624%now\;
      \$v570\ := \$v570%now\;
      \$1390\ := \$1390%now\;
      \$1332\ := \$1332%now\;
      \$1325\ := \$1325%now\;
      \$v666\ := \$v666%now\;
      \$1357\ := \$1357%now\;
      \$1359_x2\ := \$1359_x2%now\;
      \$1345\ := \$1345%now\;
      \$v612\ := \$v612%now\;
      \$1322\ := \$1322%now\;
      \$v645\ := \$v645%now\;
      \$1384\ := \$1384%now\;
      \$v657\ := \$v657%now\;
      \$$1085_code_lock\ := \$$1085_code_lock%now\;
      \$$1086_stack_lock\ := \$$1086_stack_lock%now\;
      state := \state%now\;
      state_var695 := \state_var695%now\;
      case state is
      when IDLE542 =>
        rdy541 := eclat_false;
        if \$v538\(0) = '1' then
          
        else
          \$v538\ := eclat_true;
          \$1392\ := X"0000000" & X"0";
        end if;
        \$1392\ := work.Int.add(\$1392\, X"0000000" & X"1");
        \$1320_cy\ := \$1392\;
        case state_var695 is
        when \$1335\ =>
          \$v657\ := work.Int.ge(\$1335_arg\(0 to 31), std_logic_vector(to_unsigned(\$1085_code\'length,32)));
          if \$v657\(0) = '1' then
            \$1335_result\ := \$1335_arg\(64 to 95);
            \$1330_acc_final\ := \$1335_result\;
            \$1331\ := work.Print.print_string(clk,of_string("Résultat = "));
            \$1332\ := work.Int.print(clk,\$1330_acc_final\);
            \$1333\ := work.Print.print_newline(clk,eclat_unit);
            \$1334\ := work.Print.print_string(clk,of_string("fin \n"));
            result543 := X"000000" & X"2a";
            rdy544 := eclat_true;
            state_var695 := IDLE545;
          else
            \$v656\ := \$$1085_code_lock\;
            if \$v656\(0) = '1' then
              state_var695 := Q_WAIT655;
            else
              acquire(\$$1085_code_lock\);
              \$$1085_code_ptr\ <= to_integer(unsigned(\$1335_arg\(0 to 31)));
              state_var695 := PAUSE_GET654;
            end if;
          end if;
        when PAUSE_GET547 =>
          \$1341_code_ptr\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$1335_arg\ := \$1341_code_ptr\ & work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2") & \$1340_arg\ & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_GET550 =>
          \$1340_arg\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v549\ := \$$1086_stack_lock\;
          if \$v549\(0) = '1' then
            state_var695 := Q_WAIT548;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET547;
          end if;
        when PAUSE_GET553 =>
          \$1344_v\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & \$1335_arg\(32 to 63) & \$1344_v\ & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_GET556 =>
          \$1346_u\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & \$1335_arg\(32 to 63) & \$1346_u\ & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_GET565 =>
          \$1349_b\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v564\ := \$$1086_stack_lock\;
          if \$v564\(0) = '1' then
            state_var695 := Q_WAIT563;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"1")));
            \$$1086_stack_write\ <= \$1349_b\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET562;
          end if;
        when PAUSE_GET568 =>
          \$1348_a\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v567\ := \$$1086_stack_lock\;
          if \$v567\(0) = '1' then
            state_var695 := Q_WAIT566;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET565;
          end if;
        when PAUSE_GET577 =>
          \$1354_u\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v576\ := \$$1086_stack_lock\;
          if \$v576\(0) = '1' then
            state_var695 := Q_WAIT575;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= \$1354_u\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET574;
          end if;
        when PAUSE_GET580 =>
          \$1353_v\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v579\ := \$$1086_stack_lock\;
          if \$v579\(0) = '1' then
            state_var695 := Q_WAIT578;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET577;
          end if;
        when PAUSE_GET586 =>
          \$1359_x2\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v585\ := \$$1086_stack_lock\;
          if \$v585\(0) = '1' then
            state_var695 := Q_WAIT584;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= eclat_if(work.Int.gt(\$1359_x2\, \$1358_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET583;
          end if;
        when PAUSE_GET589 =>
          \$1358_x1\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v588\ := \$$1086_stack_lock\;
          if \$v588\(0) = '1' then
            state_var695 := Q_WAIT587;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET586;
          end if;
        when PAUSE_GET595 =>
          \$1363_x2\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v594\ := \$$1086_stack_lock\;
          if \$v594\(0) = '1' then
            state_var695 := Q_WAIT593;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= eclat_if(work.Int.lt(\$1363_x2\, \$1362_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET592;
          end if;
        when PAUSE_GET598 =>
          \$1362_x1\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v597\ := \$$1086_stack_lock\;
          if \$v597\(0) = '1' then
            state_var695 := Q_WAIT596;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET595;
          end if;
        when PAUSE_GET604 =>
          \$1367_x2\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v603\ := \$$1086_stack_lock\;
          if \$v603\(0) = '1' then
            state_var695 := Q_WAIT602;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= eclat_if(work.Int.eq(\$1367_x2\, \$1366_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET601;
          end if;
        when PAUSE_GET607 =>
          \$1366_x1\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v606\ := \$$1086_stack_lock\;
          if \$v606\(0) = '1' then
            state_var695 := Q_WAIT605;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET604;
          end if;
        when PAUSE_GET613 =>
          \$1371_x2\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v612\ := \$$1086_stack_lock\;
          if \$v612\(0) = '1' then
            state_var695 := Q_WAIT611;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= work.Int.div(\$1371_x2\, \$1370_x1\); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET610;
          end if;
        when PAUSE_GET616 =>
          \$1370_x1\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v615\ := \$$1086_stack_lock\;
          if \$v615\(0) = '1' then
            state_var695 := Q_WAIT614;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET613;
          end if;
        when PAUSE_GET622 =>
          \$1375_x2\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v621\ := \$$1086_stack_lock\;
          if \$v621\(0) = '1' then
            state_var695 := Q_WAIT620;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= work.Int.mul(\$1375_x2\, \$1374_x1\); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET619;
          end if;
        when PAUSE_GET625 =>
          \$1374_x1\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v624\ := \$$1086_stack_lock\;
          if \$v624\(0) = '1' then
            state_var695 := Q_WAIT623;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET622;
          end if;
        when PAUSE_GET631 =>
          \$1379_x2\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v630\ := \$$1086_stack_lock\;
          if \$v630\(0) = '1' then
            state_var695 := Q_WAIT629;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= work.Int.sub(\$1379_x2\, \$1378_x1\); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET628;
          end if;
        when PAUSE_GET634 =>
          \$1378_x1\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v633\ := \$$1086_stack_lock\;
          if \$v633\(0) = '1' then
            state_var695 := Q_WAIT632;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET631;
          end if;
        when PAUSE_GET640 =>
          \$1383_x2\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v639\ := \$$1086_stack_lock\;
          if \$v639\(0) = '1' then
            state_var695 := Q_WAIT638;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= work.Int.add(\$1383_x2\, \$1382_x1\); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET637;
          end if;
        when PAUSE_GET643 =>
          \$1382_x1\ := \$$1086_stack_value\;
          release(\$$1086_stack_lock\);
          \$v642\ := \$$1086_stack_lock\;
          if \$v642\(0) = '1' then
            state_var695 := Q_WAIT641;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET640;
          end if;
        when PAUSE_GET654 =>
          \$1338\ := \$$1085_code_value\;
          release(\$$1085_code_lock\);
          \$v653\ := \$1338\(0 to 4);
          \$v546\ := \$1338\(5 to 68);
          case \$v653\ is
          when "01000" =>
            \$1339\ := \$v546\(0 to 0);
            \$v552\ := \$$1086_stack_lock\;
            if \$v552\(0) = '1' then
              state_var695 := Q_WAIT551;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET550;
            end if;
          when "01010" =>
            \$1342_n\ := \$v546\(0 to 31);
            \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & \$1335_arg\(32 to 63) & \$1342_n\ & eclat_unit & eclat_unit;
            state_var695 := \$1335\;
          when "00110" =>
            \$1343\ := \$v546\(0 to 0);
            \$v555\ := \$$1086_stack_lock\;
            if \$v555\(0) = '1' then
              state_var695 := Q_WAIT554;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET553;
            end if;
          when "00101" =>
            \$1345\ := \$v546\(0 to 0);
            \$v558\ := \$$1086_stack_lock\;
            if \$v558\(0) = '1' then
              state_var695 := Q_WAIT557;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"2")));
              state_var695 := PAUSE_GET556;
            end if;
          when "00111" =>
            \$1347\ := \$v546\(0 to 0);
            \$v570\ := \$$1086_stack_lock\;
            if \$v570\(0) = '1' then
              state_var695 := Q_WAIT569;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET568;
            end if;
          when "00100" =>
            \$1352\ := \$v546\(0 to 0);
            \$v582\ := \$$1086_stack_lock\;
            if \$v582\(0) = '1' then
              state_var695 := Q_WAIT581;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET580;
            end if;
          when "10001" =>
            \$1357\ := \$v546\(0 to 0);
            \$v591\ := \$$1086_stack_lock\;
            if \$v591\(0) = '1' then
              state_var695 := Q_WAIT590;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET589;
            end if;
          when "10000" =>
            \$1361\ := \$v546\(0 to 0);
            \$v600\ := \$$1086_stack_lock\;
            if \$v600\(0) = '1' then
              state_var695 := Q_WAIT599;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET598;
            end if;
          when "01111" =>
            \$1365\ := \$v546\(0 to 0);
            \$v609\ := \$$1086_stack_lock\;
            if \$v609\(0) = '1' then
              state_var695 := Q_WAIT608;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET607;
            end if;
          when "01110" =>
            \$1369\ := \$v546\(0 to 0);
            \$v618\ := \$$1086_stack_lock\;
            if \$v618\(0) = '1' then
              state_var695 := Q_WAIT617;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET616;
            end if;
          when "01101" =>
            \$1373\ := \$v546\(0 to 0);
            \$v627\ := \$$1086_stack_lock\;
            if \$v627\(0) = '1' then
              state_var695 := Q_WAIT626;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET625;
            end if;
          when "01100" =>
            \$1377\ := \$v546\(0 to 0);
            \$v636\ := \$$1086_stack_lock\;
            if \$v636\(0) = '1' then
              state_var695 := Q_WAIT635;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET634;
            end if;
          when "01011" =>
            \$1381\ := \$v546\(0 to 0);
            \$v645\ := \$$1086_stack_lock\;
            if \$v645\(0) = '1' then
              state_var695 := Q_WAIT644;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1335_arg\(32 to 63), X"0000000" & X"1")));
              state_var695 := PAUSE_GET643;
            end if;
          when "00011" =>
            \$1385\ := \$v546\(0 to 0);
            \$v648\ := \$$1086_stack_lock\;
            if \$v648\(0) = '1' then
              state_var695 := Q_WAIT647;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr_write\ <= to_integer(unsigned(\$1335_arg\(32 to 63)));
              \$$1086_stack_write\ <= \$1335_arg\(64 to 95); \$$1086_stack_write_request\ <= '1';
              state_var695 := PAUSE_SET646;
            end if;
          when "00001" =>
            \$1387_b\ := \$v546\(0 to 0);
            \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & \$1335_arg\(32 to 63) & 
            eclat_if(\$1387_b\ & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
            state_var695 := \$1335\;
          when "00000" =>
            \$1388_v\ := \$v546\(0 to 31);
            \$v651\ := \$$1086_stack_lock\;
            if \$v651\(0) = '1' then
              state_var695 := Q_WAIT650;
            else
              acquire(\$$1086_stack_lock\);
              \$$1086_stack_ptr_write\ <= to_integer(unsigned(\$1335_arg\(32 to 63)));
              \$$1086_stack_write\ <= \$1388_v\; \$$1086_stack_write_request\ <= '1';
              state_var695 := PAUSE_SET649;
            end if;
          when others =>
            \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & \$1335_arg\(32 to 63) & \$1335_arg\(64 to 95) & eclat_unit & eclat_unit;
            state_var695 := \$1335\;
          end case;
        when PAUSE_SET559 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1351_w\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & \$1335_arg\(32 to 63) & \$1335_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET562 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1350_w\ := eclat_unit;
          \$v561\ := \$$1086_stack_lock\;
          if \$v561\(0) = '1' then
            state_var695 := Q_WAIT560;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= \$1348_a\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET559;
          end if;
        when PAUSE_SET571 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1356\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & \$1335_arg\(32 to 63) & \$1335_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET574 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1355\ := eclat_unit;
          \$v573\ := \$$1086_stack_lock\;
          if \$v573\(0) = '1' then
            state_var695 := Q_WAIT572;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"1")));
            \$$1086_stack_write\ <= \$1353_v\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET571;
          end if;
        when PAUSE_SET583 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1360\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.gt(
                                                                   \$1359_x2\, \$1358_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET592 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1364\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.lt(
                                                                   \$1363_x2\, \$1362_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET601 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1368\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.eq(
                                                                   \$1367_x2\, \$1366_x1\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET610 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1372\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1") & work.Int.div(
                                                                   \$1371_x2\, \$1370_x1\) & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET619 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1376\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1") & work.Int.mul(
                                                                   \$1375_x2\, \$1374_x1\) & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET628 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1380\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1") & work.Int.sub(
                                                                   \$1379_x2\, \$1378_x1\) & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET637 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1384\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1") & work.Int.add(
                                                                   \$1383_x2\, \$1382_x1\) & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET646 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1386\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.add(\$1335_arg\(32 to 63), X"0000000" & X"1") & \$1335_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET649 =>
          \$$1086_stack_write_request\ <= '0';
          release(\$$1086_stack_lock\);
          \$1389\ := eclat_unit;
          \$1335_arg\ := work.Int.add(\$1335_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.add(\$1335_arg\(32 to 63), X"0000000" & X"1") & \$1388_v\ & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET659 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1328\ := eclat_unit;
          \$1329\ := work.Print.print_string(clk,of_string("debut \n"));
          \$1335_id\ := "000000000001";
          \$1335_arg\ := X"0000000" & X"0" & X"0000000" & X"0" & X"0000000" & X"0" & eclat_unit & eclat_unit;
          state_var695 := \$1335\;
        when PAUSE_SET663 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1391\ := eclat_unit;
          \$v661\ := \$$1085_code_lock\;
          if \$v661\(0) = '1' then
            state_var695 := Q_WAIT660;
          else
            acquire(\$$1085_code_lock\);
            \$v658\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 8;\$$1085_code_write\ <= "01011" & \$v658\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET659;
          end if;
        when PAUSE_SET667 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1390\ := eclat_unit;
          \$v665\ := \$$1085_code_lock\;
          if \$v665\(0) = '1' then
            state_var695 := Q_WAIT664;
          else
            acquire(\$$1085_code_lock\);
            \$v662\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 7;\$$1085_code_write\ <= "00100" & \$v662\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET663;
          end if;
        when PAUSE_SET671 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1327\ := eclat_unit;
          \$v669\ := \$$1085_code_lock\;
          if \$v669\(0) = '1' then
            state_var695 := Q_WAIT668;
          else
            acquire(\$$1085_code_lock\);
            \$v666\ := X"000000" & X"37";
            \$$1085_code_ptr_write\ <= 6;\$$1085_code_write\ <= "00000" & \$v666\&X"00000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET667;
          end if;
        when PAUSE_SET675 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1326\ := eclat_unit;
          \$v673\ := \$$1085_code_lock\;
          if \$v673\(0) = '1' then
            state_var695 := Q_WAIT672;
          else
            acquire(\$$1085_code_lock\);
            \$v670\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 5;\$$1085_code_write\ <= "00111" & \$v670\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET671;
          end if;
        when PAUSE_SET679 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1325\ := eclat_unit;
          \$v677\ := \$$1085_code_lock\;
          if \$v677\(0) = '1' then
            state_var695 := Q_WAIT676;
          else
            acquire(\$$1085_code_lock\);
            \$v674\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 4;\$$1085_code_write\ <= "00110" & \$v674\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET675;
          end if;
        when PAUSE_SET683 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1324\ := eclat_unit;
          \$v681\ := \$$1085_code_lock\;
          if \$v681\(0) = '1' then
            state_var695 := Q_WAIT680;
          else
            acquire(\$$1085_code_lock\);
            \$v678\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 3;\$$1085_code_write\ <= "00011" & \$v678\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET679;
          end if;
        when PAUSE_SET687 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1323\ := eclat_unit;
          \$v685\ := \$$1085_code_lock\;
          if \$v685\(0) = '1' then
            state_var695 := Q_WAIT684;
          else
            acquire(\$$1085_code_lock\);
            \$v682\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 2;\$$1085_code_write\ <= "00100" & \$v682\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET683;
          end if;
        when PAUSE_SET691 =>
          \$$1085_code_write_request\ <= '0';
          release(\$$1085_code_lock\);
          \$1322\ := eclat_unit;
          \$v689\ := \$$1085_code_lock\;
          if \$v689\(0) = '1' then
            state_var695 := Q_WAIT688;
          else
            acquire(\$$1085_code_lock\);
            \$v686\ := X"0000000" & X"2";
            \$$1085_code_ptr_write\ <= 1;\$$1085_code_write\ <= "00000" & \$v686\&X"00000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET687;
          end if;
        when Q_WAIT548 =>
          \$v549\ := \$$1086_stack_lock\;
          if \$v549\(0) = '1' then
            state_var695 := Q_WAIT548;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET547;
          end if;
        when Q_WAIT551 =>
          \$v552\ := \$$1086_stack_lock\;
          if \$v552\(0) = '1' then
            state_var695 := Q_WAIT551;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET550;
          end if;
        when Q_WAIT554 =>
          \$v555\ := \$$1086_stack_lock\;
          if \$v555\(0) = '1' then
            state_var695 := Q_WAIT554;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET553;
          end if;
        when Q_WAIT557 =>
          \$v558\ := \$$1086_stack_lock\;
          if \$v558\(0) = '1' then
            state_var695 := Q_WAIT557;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET556;
          end if;
        when Q_WAIT560 =>
          \$v561\ := \$$1086_stack_lock\;
          if \$v561\(0) = '1' then
            state_var695 := Q_WAIT560;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= \$1348_a\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET559;
          end if;
        when Q_WAIT563 =>
          \$v564\ := \$$1086_stack_lock\;
          if \$v564\(0) = '1' then
            state_var695 := Q_WAIT563;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"1")));
            \$$1086_stack_write\ <= \$1349_b\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET562;
          end if;
        when Q_WAIT566 =>
          \$v567\ := \$$1086_stack_lock\;
          if \$v567\(0) = '1' then
            state_var695 := Q_WAIT566;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET565;
          end if;
        when Q_WAIT569 =>
          \$v570\ := \$$1086_stack_lock\;
          if \$v570\(0) = '1' then
            state_var695 := Q_WAIT569;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET568;
          end if;
        when Q_WAIT572 =>
          \$v573\ := \$$1086_stack_lock\;
          if \$v573\(0) = '1' then
            state_var695 := Q_WAIT572;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"1")));
            \$$1086_stack_write\ <= \$1353_v\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET571;
          end if;
        when Q_WAIT575 =>
          \$v576\ := \$$1086_stack_lock\;
          if \$v576\(0) = '1' then
            state_var695 := Q_WAIT575;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= \$1354_u\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET574;
          end if;
        when Q_WAIT578 =>
          \$v579\ := \$$1086_stack_lock\;
          if \$v579\(0) = '1' then
            state_var695 := Q_WAIT578;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET577;
          end if;
        when Q_WAIT581 =>
          \$v582\ := \$$1086_stack_lock\;
          if \$v582\(0) = '1' then
            state_var695 := Q_WAIT581;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET580;
          end if;
        when Q_WAIT584 =>
          \$v585\ := \$$1086_stack_lock\;
          if \$v585\(0) = '1' then
            state_var695 := Q_WAIT584;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= eclat_if(work.Int.gt(\$1359_x2\, \$1358_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET583;
          end if;
        when Q_WAIT587 =>
          \$v588\ := \$$1086_stack_lock\;
          if \$v588\(0) = '1' then
            state_var695 := Q_WAIT587;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET586;
          end if;
        when Q_WAIT590 =>
          \$v591\ := \$$1086_stack_lock\;
          if \$v591\(0) = '1' then
            state_var695 := Q_WAIT590;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET589;
          end if;
        when Q_WAIT593 =>
          \$v594\ := \$$1086_stack_lock\;
          if \$v594\(0) = '1' then
            state_var695 := Q_WAIT593;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= eclat_if(work.Int.lt(\$1363_x2\, \$1362_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET592;
          end if;
        when Q_WAIT596 =>
          \$v597\ := \$$1086_stack_lock\;
          if \$v597\(0) = '1' then
            state_var695 := Q_WAIT596;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET595;
          end if;
        when Q_WAIT599 =>
          \$v600\ := \$$1086_stack_lock\;
          if \$v600\(0) = '1' then
            state_var695 := Q_WAIT599;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET598;
          end if;
        when Q_WAIT602 =>
          \$v603\ := \$$1086_stack_lock\;
          if \$v603\(0) = '1' then
            state_var695 := Q_WAIT602;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= eclat_if(work.Int.eq(\$1367_x2\, \$1366_x1\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET601;
          end if;
        when Q_WAIT605 =>
          \$v606\ := \$$1086_stack_lock\;
          if \$v606\(0) = '1' then
            state_var695 := Q_WAIT605;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET604;
          end if;
        when Q_WAIT608 =>
          \$v609\ := \$$1086_stack_lock\;
          if \$v609\(0) = '1' then
            state_var695 := Q_WAIT608;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET607;
          end if;
        when Q_WAIT611 =>
          \$v612\ := \$$1086_stack_lock\;
          if \$v612\(0) = '1' then
            state_var695 := Q_WAIT611;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= work.Int.div(\$1371_x2\, \$1370_x1\); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET610;
          end if;
        when Q_WAIT614 =>
          \$v615\ := \$$1086_stack_lock\;
          if \$v615\(0) = '1' then
            state_var695 := Q_WAIT614;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET613;
          end if;
        when Q_WAIT617 =>
          \$v618\ := \$$1086_stack_lock\;
          if \$v618\(0) = '1' then
            state_var695 := Q_WAIT617;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET616;
          end if;
        when Q_WAIT620 =>
          \$v621\ := \$$1086_stack_lock\;
          if \$v621\(0) = '1' then
            state_var695 := Q_WAIT620;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= work.Int.mul(\$1375_x2\, \$1374_x1\); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET619;
          end if;
        when Q_WAIT623 =>
          \$v624\ := \$$1086_stack_lock\;
          if \$v624\(0) = '1' then
            state_var695 := Q_WAIT623;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET622;
          end if;
        when Q_WAIT626 =>
          \$v627\ := \$$1086_stack_lock\;
          if \$v627\(0) = '1' then
            state_var695 := Q_WAIT626;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET625;
          end if;
        when Q_WAIT629 =>
          \$v630\ := \$$1086_stack_lock\;
          if \$v630\(0) = '1' then
            state_var695 := Q_WAIT629;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= work.Int.sub(\$1379_x2\, \$1378_x1\); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET628;
          end if;
        when Q_WAIT632 =>
          \$v633\ := \$$1086_stack_lock\;
          if \$v633\(0) = '1' then
            state_var695 := Q_WAIT632;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET631;
          end if;
        when Q_WAIT635 =>
          \$v636\ := \$$1086_stack_lock\;
          if \$v636\(0) = '1' then
            state_var695 := Q_WAIT635;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET634;
          end if;
        when Q_WAIT638 =>
          \$v639\ := \$$1086_stack_lock\;
          if \$v639\(0) = '1' then
            state_var695 := Q_WAIT638;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1335_arg\(32 to 63), X"0000000" & X"2")));
            \$$1086_stack_write\ <= work.Int.add(\$1383_x2\, \$1382_x1\); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET637;
          end if;
        when Q_WAIT641 =>
          \$v642\ := \$$1086_stack_lock\;
          if \$v642\(0) = '1' then
            state_var695 := Q_WAIT641;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"2")));
            state_var695 := PAUSE_GET640;
          end if;
        when Q_WAIT644 =>
          \$v645\ := \$$1086_stack_lock\;
          if \$v645\(0) = '1' then
            state_var695 := Q_WAIT644;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1335_arg\(32 to 63), X"0000000" & X"1")));
            state_var695 := PAUSE_GET643;
          end if;
        when Q_WAIT647 =>
          \$v648\ := \$$1086_stack_lock\;
          if \$v648\(0) = '1' then
            state_var695 := Q_WAIT647;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(\$1335_arg\(32 to 63)));
            \$$1086_stack_write\ <= \$1335_arg\(64 to 95); \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET646;
          end if;
        when Q_WAIT650 =>
          \$v651\ := \$$1086_stack_lock\;
          if \$v651\(0) = '1' then
            state_var695 := Q_WAIT650;
          else
            acquire(\$$1086_stack_lock\);
            \$$1086_stack_ptr_write\ <= to_integer(unsigned(\$1335_arg\(32 to 63)));
            \$$1086_stack_write\ <= \$1388_v\; \$$1086_stack_write_request\ <= '1';
            state_var695 := PAUSE_SET649;
          end if;
        when Q_WAIT655 =>
          \$v656\ := \$$1085_code_lock\;
          if \$v656\(0) = '1' then
            state_var695 := Q_WAIT655;
          else
            acquire(\$$1085_code_lock\);
            \$$1085_code_ptr\ <= to_integer(unsigned(\$1335_arg\(0 to 31)));
            state_var695 := PAUSE_GET654;
          end if;
        when Q_WAIT660 =>
          \$v661\ := \$$1085_code_lock\;
          if \$v661\(0) = '1' then
            state_var695 := Q_WAIT660;
          else
            acquire(\$$1085_code_lock\);
            \$v658\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 8;\$$1085_code_write\ <= "01011" & \$v658\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET659;
          end if;
        when Q_WAIT664 =>
          \$v665\ := \$$1085_code_lock\;
          if \$v665\(0) = '1' then
            state_var695 := Q_WAIT664;
          else
            acquire(\$$1085_code_lock\);
            \$v662\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 7;\$$1085_code_write\ <= "00100" & \$v662\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET663;
          end if;
        when Q_WAIT668 =>
          \$v669\ := \$$1085_code_lock\;
          if \$v669\(0) = '1' then
            state_var695 := Q_WAIT668;
          else
            acquire(\$$1085_code_lock\);
            \$v666\ := X"000000" & X"37";
            \$$1085_code_ptr_write\ <= 6;\$$1085_code_write\ <= "00000" & \$v666\&X"00000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET667;
          end if;
        when Q_WAIT672 =>
          \$v673\ := \$$1085_code_lock\;
          if \$v673\(0) = '1' then
            state_var695 := Q_WAIT672;
          else
            acquire(\$$1085_code_lock\);
            \$v670\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 5;\$$1085_code_write\ <= "00111" & \$v670\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET671;
          end if;
        when Q_WAIT676 =>
          \$v677\ := \$$1085_code_lock\;
          if \$v677\(0) = '1' then
            state_var695 := Q_WAIT676;
          else
            acquire(\$$1085_code_lock\);
            \$v674\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 4;\$$1085_code_write\ <= "00110" & \$v674\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET675;
          end if;
        when Q_WAIT680 =>
          \$v681\ := \$$1085_code_lock\;
          if \$v681\(0) = '1' then
            state_var695 := Q_WAIT680;
          else
            acquire(\$$1085_code_lock\);
            \$v678\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 3;\$$1085_code_write\ <= "00011" & \$v678\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET679;
          end if;
        when Q_WAIT684 =>
          \$v685\ := \$$1085_code_lock\;
          if \$v685\(0) = '1' then
            state_var695 := Q_WAIT684;
          else
            acquire(\$$1085_code_lock\);
            \$v682\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 2;\$$1085_code_write\ <= "00100" & \$v682\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET683;
          end if;
        when Q_WAIT688 =>
          \$v689\ := \$$1085_code_lock\;
          if \$v689\(0) = '1' then
            state_var695 := Q_WAIT688;
          else
            acquire(\$$1085_code_lock\);
            \$v686\ := X"0000000" & X"2";
            \$$1085_code_ptr_write\ <= 1;\$$1085_code_write\ <= "00000" & \$v686\&X"00000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET687;
          end if;
        when Q_WAIT692 =>
          \$v693\ := \$$1085_code_lock\;
          if \$v693\(0) = '1' then
            state_var695 := Q_WAIT692;
          else
            acquire(\$$1085_code_lock\);
            \$v690\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 0;\$$1085_code_write\ <= "00011" & \$v690\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET691;
          end if;
        when IDLE545 =>
          rdy544 := eclat_false;
          \$v693\ := \$$1085_code_lock\;
          if \$v693\(0) = '1' then
            state_var695 := Q_WAIT692;
          else
            acquire(\$$1085_code_lock\);
            \$v690\ := eclat_unit;
            \$$1085_code_ptr_write\ <= 0;\$$1085_code_write\ <= "00011" & \$v690\&"000"& X"000000000000000"; \$$1085_code_write_request\ <= '1';
            state_var695 := PAUSE_SET691;
          end if;
        end case;
        
        if rdy544(0) = '1' then
          
        else
          result543 := X"0000000" & X"0";
        end if;
        \$1321\ := result543 & rdy544;
        result540 := work.Bool.lnot(""&\$1321\(32));
        rdy541 := eclat_true;
        state := IDLE542;
      end case;
      \state%next\ <= state;
      \state_var695%next\ <= state_var695;
      \$1380%next\ <= \$1380\;
      \$1335_arg%next\ <= \$1335_arg\;
      \$1386%next\ <= \$1386\;
      \$1388_v%next\ <= \$1388_v\;
      \$v555%next\ <= \$v555\;
      \$1361%next\ <= \$1361\;
      \$v653%next\ <= \$v653\;
      \$1342_n%next\ <= \$1342_n\;
      \$1387_b%next\ <= \$1387_b\;
      \$v689%next\ <= \$v689\;
      \$1377%next\ <= \$1377\;
      \$1323%next\ <= \$1323\;
      \$v678%next\ <= \$v678\;
      \$1335_id%next\ <= \$1335_id\;
      \$v561%next\ <= \$v561\;
      \$1362_x1%next\ <= \$1362_x1\;
      \$1321%next\ <= \$1321\;
      \$v685%next\ <= \$v685\;
      \$1376%next\ <= \$1376\;
      \$1341_code_ptr%next\ <= \$1341_code_ptr\;
      \$v656%next\ <= \$v656\;
      \$v600%next\ <= \$v600\;
      \$v606%next\ <= \$v606\;
      \$v579%next\ <= \$v579\;
      \$1385%next\ <= \$1385\;
      \$1349_b%next\ <= \$1349_b\;
      \$v639%next\ <= \$v639\;
      \$1326%next\ <= \$1326\;
      \$v630%next\ <= \$v630\;
      \$1343%next\ <= \$1343\;
      \$1348_a%next\ <= \$1348_a\;
      \$v673%next\ <= \$v673\;
      \$1324%next\ <= \$1324\;
      \$v661%next\ <= \$v661\;
      \$1365%next\ <= \$1365\;
      \$1383_x2%next\ <= \$1383_x2\;
      \$v552%next\ <= \$v552\;
      \$1320_cy%next\ <= \$1320_cy\;
      \$1372%next\ <= \$1372\;
      \$v621%next\ <= \$v621\;
      \$1366_x1%next\ <= \$1366_x1\;
      \$v576%next\ <= \$v576\;
      \$v682%next\ <= \$v682\;
      \$1327%next\ <= \$1327\;
      \$v588%next\ <= \$v588\;
      \$v651%next\ <= \$v651\;
      \$1382_x1%next\ <= \$1382_x1\;
      \$v597%next\ <= \$v597\;
      \$v567%next\ <= \$v567\;
      \$1353_v%next\ <= \$1353_v\;
      \rdy541%next\ <= rdy541;
      \$1351_w%next\ <= \$1351_w\;
      \$v681%next\ <= \$v681\;
      \$1389%next\ <= \$1389\;
      \$v591%next\ <= \$v591\;
      \result540%next\ <= result540;
      \$v585%next\ <= \$v585\;
      \$v549%next\ <= \$v549\;
      \$v693%next\ <= \$v693\;
      \$1360%next\ <= \$1360\;
      \$1370_x1%next\ <= \$1370_x1\;
      \$1354_u%next\ <= \$1354_u\;
      \$1392%next\ <= \$1392\;
      \$v677%next\ <= \$v677\;
      \$1331%next\ <= \$1331\;
      \$1375_x2%next\ <= \$1375_x2\;
      \$1352%next\ <= \$1352\;
      \$1391%next\ <= \$1391\;
      \$1364%next\ <= \$1364\;
      \$v648%next\ <= \$v648\;
      \$1356%next\ <= \$1356\;
      \$1381%next\ <= \$1381\;
      \$v538%next\ <= \$v538\;
      \$v665%next\ <= \$v665\;
      \$v636%next\ <= \$v636\;
      \$1334%next\ <= \$1334\;
      \$1369%next\ <= \$1369\;
      \$1378_x1%next\ <= \$1378_x1\;
      \$1346_u%next\ <= \$1346_u\;
      \$v609%next\ <= \$v609\;
      \$1371_x2%next\ <= \$1371_x2\;
      \$v564%next\ <= \$v564\;
      \$1350_w%next\ <= \$1350_w\;
      \$1344_v%next\ <= \$1344_v\;
      \$v662%next\ <= \$v662\;
      \$1339%next\ <= \$1339\;
      \$1335_result%next\ <= \$1335_result\;
      \rdy544%next\ <= rdy544;
      \$v642%next\ <= \$v642\;
      \$v633%next\ <= \$v633\;
      \$1329%next\ <= \$1329\;
      \$v618%next\ <= \$v618\;
      \result543%next\ <= result543;
      \$1330_acc_final%next\ <= \$1330_acc_final\;
      \$v686%next\ <= \$v686\;
      \$1379_x2%next\ <= \$1379_x2\;
      \$1367_x2%next\ <= \$1367_x2\;
      \$1373%next\ <= \$1373\;
      \$1328%next\ <= \$1328\;
      \$v582%next\ <= \$v582\;
      \$v690%next\ <= \$v690\;
      \$1368%next\ <= \$1368\;
      \$v615%next\ <= \$v615\;
      \$1358_x1%next\ <= \$1358_x1\;
      \$1363_x2%next\ <= \$1363_x2\;
      \$v670%next\ <= \$v670\;
      \$v558%next\ <= \$v558\;
      \$1333%next\ <= \$1333\;
      \$1374_x1%next\ <= \$1374_x1\;
      \$v674%next\ <= \$v674\;
      \$v627%next\ <= \$v627\;
      \$1347%next\ <= \$1347\;
      \$v546%next\ <= \$v546\;
      \$v573%next\ <= \$v573\;
      \$1338%next\ <= \$1338\;
      \$v669%next\ <= \$v669\;
      \$v603%next\ <= \$v603\;
      \$v594%next\ <= \$v594\;
      \$1355%next\ <= \$1355\;
      \$1340_arg%next\ <= \$1340_arg\;
      \$v658%next\ <= \$v658\;
      \$v624%next\ <= \$v624\;
      \$v570%next\ <= \$v570\;
      \$1390%next\ <= \$1390\;
      \$1332%next\ <= \$1332\;
      \$1325%next\ <= \$1325\;
      \$v666%next\ <= \$v666\;
      \$1357%next\ <= \$1357\;
      \$1359_x2%next\ <= \$1359_x2\;
      \$1345%next\ <= \$1345\;
      \$v612%next\ <= \$v612\;
      \$1322%next\ <= \$1322\;
      \$v645%next\ <= \$v645\;
      \$1384%next\ <= \$1384\;
      \$v657%next\ <= \$v657\;
      \$$1085_code_lock%next\ <= \$$1085_code_lock\;
      \$$1086_stack_lock%next\ <= \$$1086_stack_lock\;
      
      
      result <= result540;
      end process;
  end architecture;
