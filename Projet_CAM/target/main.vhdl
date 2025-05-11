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

  type t_state is (IDLE582, PAUSE_SET699, PAUSE_SET703, PAUSE_SET707, PAUSE_SET711, PAUSE_SET715, PAUSE_SET719, PAUSE_SET723, PAUSE_SET727, PAUSE_SET731, PAUSE_SET735, PAUSE_SET739, PAUSE_SET743, PAUSE_SET747, PAUSE_SET751, Q_WAIT700, Q_WAIT704, Q_WAIT708, Q_WAIT712, Q_WAIT716, Q_WAIT720, Q_WAIT724, Q_WAIT728, Q_WAIT732, Q_WAIT736, Q_WAIT740, Q_WAIT744, Q_WAIT748, Q_WAIT752);
  signal \state%now\, \state%next\: t_state;
  type t_state_var754 is (IDLE585, \$1709\, \$1712\, PAUSE_GET587, PAUSE_GET590, PAUSE_GET599, PAUSE_GET602, PAUSE_GET606, PAUSE_GET609, PAUSE_GET615, PAUSE_GET618, PAUSE_GET627, PAUSE_GET630, PAUSE_GET636, PAUSE_GET639, PAUSE_GET645, PAUSE_GET648, PAUSE_GET654, PAUSE_GET657, PAUSE_GET663, PAUSE_GET666, PAUSE_GET672, PAUSE_GET675, PAUSE_GET681, PAUSE_GET684, PAUSE_GET689, PAUSE_SET593, PAUSE_SET596, PAUSE_SET612, PAUSE_SET621, PAUSE_SET624, PAUSE_SET633, PAUSE_SET642, PAUSE_SET651, PAUSE_SET660, PAUSE_SET669, PAUSE_SET678, PAUSE_SET694, Q_WAIT588, Q_WAIT591, Q_WAIT594, Q_WAIT597, Q_WAIT600, Q_WAIT603, Q_WAIT607, Q_WAIT610, Q_WAIT613, Q_WAIT616, Q_WAIT619, Q_WAIT622, Q_WAIT625, Q_WAIT628, Q_WAIT631, Q_WAIT634, Q_WAIT637, Q_WAIT640, Q_WAIT643, Q_WAIT646, Q_WAIT649, Q_WAIT652, Q_WAIT655, Q_WAIT658, Q_WAIT661, Q_WAIT664, Q_WAIT667, Q_WAIT670, Q_WAIT673, Q_WAIT676, Q_WAIT679, Q_WAIT682, Q_WAIT685, Q_WAIT690, Q_WAIT695);
  signal \state_var754%now\, \state_var754%next\: t_state_var754;
  type array_value_32 is array (natural range <>) of value(0 to 31);
  type array_value_37 is array (natural range <>) of value(0 to 36);
  type array_value_69 is array (natural range <>) of value(0 to 68);
  signal \$1418_code\ : array_value_69(0 to 14);
  signal \$$1418_code_value\ : value(0 to 68) := (others => '0');
  signal \$$1418_code_ptr\ : natural range 0 to 14 := 0;
  signal \$$1418_code_ptr_write\ : natural range 0 to 14 := 0;
  signal \$$1418_code_write\ : value(0 to 68) := (others => '0');
  signal \$$1418_code_write_request\ : std_logic := '0';
  signal \$1433_code\ : array_value_37(0 to 1023);
  signal \$$1433_code_value\ : value(0 to 36) := (others => '0');
  signal \$$1433_code_ptr\ : natural range 0 to 1023 := 0;
  signal \$$1433_code_ptr_write\ : natural range 0 to 1023 := 0;
  signal \$$1433_code_write\ : value(0 to 36) := (others => '0');
  signal \$$1433_code_write_request\ : std_logic := '0';
  signal \$1454_stack\ : array_value_32(0 to 255);
  signal \$$1454_stack_value\ : value(0 to 31) := (others => '0');
  signal \$$1454_stack_ptr\ : natural range 0 to 255 := 0;
  signal \$$1454_stack_ptr_write\ : natural range 0 to 255 := 0;
  signal \$$1454_stack_write\ : value(0 to 31) := (others => '0');
  signal \$$1454_stack_write_request\ : std_logic := '0';
  signal \$1709_arg%next\, \$1709_arg%now\ : value(0 to 1) := (others => '0');
  signal \$1704%next\, \$1704%now\ : value(0 to 32) := (others => '0');
  signal \$1726%next\, \$1726%now\ : value(0 to 63) := (others => '0');
  signal \$1715%next\, \$1715%now\ : value(0 to 36) := (others => '0');
  signal \$v688%next\, \$v688%now\ : value(0 to 4) := (others => '0');
  signal \$1709_id%next\, \$1709_id%now\, \$1712_id%next\, \$1712_id%now\ : value(0 to 11) := (others => '0');
  signal \$1712_arg%next\, \$1712_arg%now\ : value(0 to 97) := (others => '0');
  signal \$$1454_stack_lock%next\, \$$1454_stack_lock%now\, 
         \$$1433_code_lock%next\, \$$1433_code_lock%now\, 
         \$$1418_code_lock%next\, \$$1418_code_lock%now\, \$v601%next\, 
         \$v601%now\, \$v733%next\, \$v733%now\, \$v753%next\, \$v753%now\, 
         \$v632%next\, \$v632%now\, \$v734%next\, \$v734%now\, \$v608%next\, 
         \$v608%now\, \$1740_w%next\, \$1740_w%now\, \$1717%next\, 
         \$1717%now\, \$v623%next\, \$v623%now\, \$1736_w%next\, 
         \$1736_w%now\, \$1706%next\, \$1706%now\, \$v709%next\, \$v709%now\, 
         \$1756_w%next\, \$1756_w%now\, \$v725%next\, \$v725%now\, 
         \$v614%next\, \$v614%now\, \$v706%next\, \$v706%now\, \$v647%next\, 
         \$v647%now\, \$v741%next\, \$v741%now\, \$v718%next\, \$v718%now\, 
         \$v737%next\, \$v737%now\, \$v705%next\, \$v705%now\, \$v674%next\, 
         \$v674%now\, \$v729%next\, \$v729%now\, \$1734_w%next\, 
         \$1734_w%now\, \$v698%next\, \$v698%now\, \$v659%next\, \$v659%now\, 
         \$1709_result%next\, \$1709_result%now\, \$1694_w%next\, 
         \$1694_w%now\, \$1693_w%next\, \$1693_w%now\, \$1688_w%next\, 
         \$1688_w%now\, \$1752_w%next\, \$1752_w%now\, \$1701_w%next\, 
         \$1701_w%now\, \$v717%next\, \$v717%now\, \$v692%next\, \$v692%now\, 
         \$v626%next\, \$v626%now\, \$v686%next\, \$v686%now\, 
         \$1744_w%next\, \$1744_w%now\, \$v701%next\, \$v701%now\, 
         \$v662%next\, \$v662%now\, \$1745%next\, \$1745%now\, \$1731%next\, 
         \$1731%now\, \$1716%next\, \$1716%now\, \$v713%next\, \$v713%now\, 
         \$v641%next\, \$v641%now\, \$1760_w%next\, \$1760_w%now\, 
         \$v644%next\, \$v644%now\, \$1697_w%next\, \$1697_w%now\, 
         \$v665%next\, \$v665%now\, \$1696_w%next\, \$1696_w%now\, 
         \$1692_w%next\, \$1692_w%now\, \$1695_w%next\, \$1695_w%now\, 
         \$v629%next\, \$v629%now\, \$v638%next\, \$v638%now\, 
         \$1689_w%next\, \$1689_w%now\, \$v620%next\, \$v620%now\, 
         \rdy584%next\, \rdy584%now\, \$v680%next\, \$v680%now\, 
         \$1727%next\, \$1727%now\, \$v677%next\, \$v677%now\, 
         \$1764_w%next\, \$1764_w%now\, \$v738%next\, \$v738%now\, 
         \$1690_w%next\, \$1690_w%now\, \$v589%next\, \$v589%now\, 
         \$v726%next\, \$v726%now\, \$v693%next\, \$v693%now\, \$1741%next\, 
         \$1741%now\, \$1749%next\, \$1749%now\, \$1720%next\, \$1720%now\, 
         \$1765%next\, \$1765%now\, \$1705%next\, \$1705%now\, \$v746%next\, 
         \$v746%now\, \$v578%next\, \$v578%now\, \$v668%next\, \$v668%now\, 
         \$1757%next\, \$1757%now\, \$v671%next\, \$v671%now\, \$v650%next\, 
         \$v650%now\, \$1748_w%next\, \$1748_w%now\, \$v714%next\, 
         \$v714%now\, \$v702%next\, \$v702%now\, \$v721%next\, \$v721%now\, 
         \$v617%next\, \$v617%now\, \$1699_w%next\, \$1699_w%now\, 
         \$v611%next\, \$v611%now\, \$v683%next\, \$v683%now\, \$1753%next\, 
         \$1753%now\, \$v749%next\, \$v749%now\, \$v598%next\, \$v598%now\, 
         \$v635%next\, \$v635%now\, \$1723_w%next\, \$1723_w%now\, 
         \$1691_w%next\, \$1691_w%now\, \$v742%next\, \$v742%now\, 
         \$1707%next\, \$1707%now\, \$1708%next\, \$1708%now\, \$1761%next\, 
         \$1761%now\, \result580%next\, \result580%now\, \$v745%next\, 
         \$v745%now\, \$1700_w%next\, \$1700_w%now\, \$v696%next\, 
         \$v696%now\, \$v595%next\, \$v595%now\, \$1729%next\, \$1729%now\, 
         \$1724_w%next\, \$1724_w%now\, \$1698_w%next\, \$1698_w%now\, 
         \$v710%next\, \$v710%now\, \$v656%next\, \$v656%now\, \$1735%next\, 
         \$1735%now\, \$v722%next\, \$v722%now\, \$v691%next\, \$v691%now\, 
         \$v653%next\, \$v653%now\, \$v605%next\, \$v605%now\, 
         \$1766_b%next\, \$1766_b%now\, \rdy581%next\, \rdy581%now\, 
         \$v592%next\, \$v592%now\, \$v604%next\, \$v604%now\, 
         \$1712_result%next\, \$1712_result%now\, \$1737%next\, \$1737%now\ : value(0 to 0) := (others => '0');
  signal \$1719_code_ptr%next\, \$1719_code_ptr%now\, \$1763_x%next\, 
         \$1763_x%now\, \$1730_v%next\, \$1730_v%now\, \$1768%next\, 
         \$1768%now\, \$1703_cy%next\, \$1703_cy%now\, \$1747_x%next\, 
         \$1747_x%now\, \$1722_b%next\, \$1722_b%now\, \$1742_y%next\, 
         \$1742_y%now\, \$1755_x%next\, \$1755_x%now\, \$1739_x%next\, 
         \$1739_x%now\, \result583%next\, \result583%now\, \$1746_y%next\, 
         \$1746_y%now\, \$1750_y%next\, \$1750_y%now\, \$1738_y%next\, 
         \$1738_y%now\, \$1718_arg%next\, \$1718_arg%now\, \$1728_v%next\, 
         \$1728_v%now\, \$1762_y%next\, \$1762_y%now\, \$1725_n%next\, 
         \$1725_n%now\, \$1758_y%next\, \$1758_y%now\, \$v730%next\, 
         \$v730%now\, \$1733_x%next\, \$1733_x%now\, \$1751_x%next\, 
         \$1751_x%now\, \$1721_a%next\, \$1721_a%now\, \$v750%next\, 
         \$v750%now\, \$v586%next\, \$v586%now\, \$1732_y%next\, 
         \$1732_y%now\, \$1743_x%next\, \$1743_x%now\, \$1759_x%next\, 
         \$1759_x%now\, \$1754_y%next\, \$1754_y%now\, \$1767_v%next\, 
         \$1767_v%now\ : value(0 to 31) := (others => '0');
  
  begin
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1418_code_write_request\ = '1' then
                    \$1418_code\(\$$1418_code_ptr_write\) <= \$$1418_code_write\;
                 end if;
                 \$$1418_code_value\ <= \$1418_code\(\$$1418_code_ptr\);
            end if;
        end process;
    
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1433_code_write_request\ = '1' then
                    \$1433_code\(\$$1433_code_ptr_write\) <= \$$1433_code_write\;
                 end if;
                 \$$1433_code_value\ <= \$1433_code\(\$$1433_code_ptr\);
            end if;
        end process;
    
    process (clk)
            begin
            if rising_edge(clk) then
                 if \$$1454_stack_write_request\ = '1' then
                    \$1454_stack\(\$$1454_stack_ptr_write\) <= \$$1454_stack_write\;
                 end if;
                 \$$1454_stack_value\ <= \$1454_stack\(\$$1454_stack_ptr\);
            end if;
        end process;
    
    process (reset,clk)
      begin
      if reset = '1' then
        \$1737%now\ <= (others => '0');
        \$1712_result%now\ <= (others => '0');
        \$1767_v%now\ <= (others => '0');
        \$1754_y%now\ <= (others => '0');
        \$v604%now\ <= (others => '0');
        \$v592%now\ <= (others => '0');
        \$1759_x%now\ <= (others => '0');
        \$1743_x%now\ <= (others => '0');
        \rdy581%now\ <= (others => '0');
        \$1766_b%now\ <= (others => '0');
        \$v605%now\ <= (others => '0');
        \$v653%now\ <= (others => '0');
        \$v691%now\ <= (others => '0');
        \$1712_id%now\ <= (others => '0');
        \$v722%now\ <= (others => '0');
        \$1732_y%now\ <= (others => '0');
        \$v688%now\ <= (others => '0');
        \$1735%now\ <= (others => '0');
        \$v586%now\ <= (others => '0');
        \$v656%now\ <= (others => '0');
        \$v710%now\ <= (others => '0');
        \$1698_w%now\ <= (others => '0');
        \$1724_w%now\ <= (others => '0');
        \$1729%now\ <= (others => '0');
        \$v595%now\ <= (others => '0');
        \$v696%now\ <= (others => '0');
        \$1700_w%now\ <= (others => '0');
        \$v745%now\ <= (others => '0');
        \result580%now\ <= (others => '0');
        \$1761%now\ <= (others => '0');
        \$1708%now\ <= (others => '0');
        \$1707%now\ <= (others => '0');
        \$v742%now\ <= (others => '0');
        \$1691_w%now\ <= (others => '0');
        \$1723_w%now\ <= (others => '0');
        \$v635%now\ <= (others => '0');
        \$v598%now\ <= (others => '0');
        \$v750%now\ <= (others => '0');
        \$1721_a%now\ <= (others => '0');
        \$v749%now\ <= (others => '0');
        \$1753%now\ <= (others => '0');
        \$1751_x%now\ <= (others => '0');
        \$v683%now\ <= (others => '0');
        \$v611%now\ <= (others => '0');
        \$1699_w%now\ <= (others => '0');
        \$v617%now\ <= (others => '0');
        \$v721%now\ <= (others => '0');
        \$v702%now\ <= (others => '0');
        \$v714%now\ <= (others => '0');
        \$1748_w%now\ <= (others => '0');
        \$v650%now\ <= (others => '0');
        \$v671%now\ <= (others => '0');
        \$1757%now\ <= (others => '0');
        \$v668%now\ <= (others => '0');
        \$v578%now\ <= (others => '0');
        \$v746%now\ <= (others => '0');
        \$1705%now\ <= (others => '0');
        \$1765%now\ <= (others => '0');
        \$1720%now\ <= (others => '0');
        \$1749%now\ <= (others => '0');
        \$1741%now\ <= (others => '0');
        \$1733_x%now\ <= (others => '0');
        \$v693%now\ <= (others => '0');
        \$v726%now\ <= (others => '0');
        \$v589%now\ <= (others => '0');
        \$1690_w%now\ <= (others => '0');
        \$v730%now\ <= (others => '0');
        \$v738%now\ <= (others => '0');
        \$1764_w%now\ <= (others => '0');
        \$v677%now\ <= (others => '0');
        \$1727%now\ <= (others => '0');
        \$v680%now\ <= (others => '0');
        \rdy584%now\ <= (others => '0');
        \$v620%now\ <= (others => '0');
        \$1689_w%now\ <= (others => '0');
        \$v638%now\ <= (others => '0');
        \$v629%now\ <= (others => '0');
        \$1695_w%now\ <= (others => '0');
        \$1692_w%now\ <= (others => '0');
        \$1696_w%now\ <= (others => '0');
        \$1758_y%now\ <= (others => '0');
        \$v665%now\ <= (others => '0');
        \$1697_w%now\ <= (others => '0');
        \$1725_n%now\ <= (others => '0');
        \$v644%now\ <= (others => '0');
        \$1762_y%now\ <= (others => '0');
        \$1712_arg%now\ <= (others => '0');
        \$1728_v%now\ <= (others => '0');
        \$1718_arg%now\ <= (others => '0');
        \$1760_w%now\ <= (others => '0');
        \$v641%now\ <= (others => '0');
        \$1738_y%now\ <= (others => '0');
        \$v713%now\ <= (others => '0');
        \$1716%now\ <= (others => '0');
        \$1731%now\ <= (others => '0');
        \$1745%now\ <= (others => '0');
        \$v662%now\ <= (others => '0');
        \$1750_y%now\ <= (others => '0');
        \$1746_y%now\ <= (others => '0');
        \result583%now\ <= (others => '0');
        \$v701%now\ <= (others => '0');
        \$1744_w%now\ <= (others => '0');
        \$1709_id%now\ <= (others => '0');
        \$v686%now\ <= (others => '0');
        \$v626%now\ <= (others => '0');
        \$v692%now\ <= (others => '0');
        \$v717%now\ <= (others => '0');
        \$1701_w%now\ <= (others => '0');
        \$1709_arg%now\ <= (others => '0');
        \$1752_w%now\ <= (others => '0');
        \$1715%now\ <= (others => '0');
        \$1688_w%now\ <= (others => '0');
        \$1693_w%now\ <= (others => '0');
        \$1694_w%now\ <= (others => '0');
        \$1709_result%now\ <= (others => '0');
        \$v659%now\ <= (others => '0');
        \$v698%now\ <= (others => '0');
        \$1734_w%now\ <= (others => '0');
        \$1739_x%now\ <= (others => '0');
        \$v729%now\ <= (others => '0');
        \$v674%now\ <= (others => '0');
        \$v705%now\ <= (others => '0');
        \$v737%now\ <= (others => '0');
        \$v718%now\ <= (others => '0');
        \$1755_x%now\ <= (others => '0');
        \$1742_y%now\ <= (others => '0');
        \$1722_b%now\ <= (others => '0');
        \$v741%now\ <= (others => '0');
        \$v647%now\ <= (others => '0');
        \$v706%now\ <= (others => '0');
        \$v614%now\ <= (others => '0');
        \$v725%now\ <= (others => '0');
        \$1726%now\ <= (others => '0');
        \$1747_x%now\ <= (others => '0');
        \$1756_w%now\ <= (others => '0');
        \$v709%now\ <= (others => '0');
        \$1703_cy%now\ <= (others => '0');
        \$1706%now\ <= (others => '0');
        \$1736_w%now\ <= (others => '0');
        \$v623%now\ <= (others => '0');
        \$1717%now\ <= (others => '0');
        \$1740_w%now\ <= (others => '0');
        \$v608%now\ <= (others => '0');
        \$v734%now\ <= (others => '0');
        \$1704%now\ <= (others => '0');
        \$v632%now\ <= (others => '0');
        \$1768%now\ <= (others => '0');
        \$v753%now\ <= (others => '0');
        \$1730_v%now\ <= (others => '0');
        \$v733%now\ <= (others => '0');
        \$1763_x%now\ <= (others => '0');
        \$v601%now\ <= (others => '0');
        \$1719_code_ptr%now\ <= (others => '0');
        \$$1418_code_lock%now\ <= (others => '0');
        \$$1433_code_lock%now\ <= (others => '0');
        \$$1454_stack_lock%now\ <= (others => '0');
        \state%now\ <= idle582;
        \state_var754%now\ <= idle585;
      elsif (rising_edge(clk)) then
        \$1737%now\ <= \$1737%next\;
        \$1712_result%now\ <= \$1712_result%next\;
        \$1767_v%now\ <= \$1767_v%next\;
        \$1754_y%now\ <= \$1754_y%next\;
        \$v604%now\ <= \$v604%next\;
        \$v592%now\ <= \$v592%next\;
        \$1759_x%now\ <= \$1759_x%next\;
        \$1743_x%now\ <= \$1743_x%next\;
        \rdy581%now\ <= \rdy581%next\;
        \$1766_b%now\ <= \$1766_b%next\;
        \$v605%now\ <= \$v605%next\;
        \$v653%now\ <= \$v653%next\;
        \$v691%now\ <= \$v691%next\;
        \$1712_id%now\ <= \$1712_id%next\;
        \$v722%now\ <= \$v722%next\;
        \$1732_y%now\ <= \$1732_y%next\;
        \$v688%now\ <= \$v688%next\;
        \$1735%now\ <= \$1735%next\;
        \$v586%now\ <= \$v586%next\;
        \$v656%now\ <= \$v656%next\;
        \$v710%now\ <= \$v710%next\;
        \$1698_w%now\ <= \$1698_w%next\;
        \$1724_w%now\ <= \$1724_w%next\;
        \$1729%now\ <= \$1729%next\;
        \$v595%now\ <= \$v595%next\;
        \$v696%now\ <= \$v696%next\;
        \$1700_w%now\ <= \$1700_w%next\;
        \$v745%now\ <= \$v745%next\;
        \result580%now\ <= \result580%next\;
        \$1761%now\ <= \$1761%next\;
        \$1708%now\ <= \$1708%next\;
        \$1707%now\ <= \$1707%next\;
        \$v742%now\ <= \$v742%next\;
        \$1691_w%now\ <= \$1691_w%next\;
        \$1723_w%now\ <= \$1723_w%next\;
        \$v635%now\ <= \$v635%next\;
        \$v598%now\ <= \$v598%next\;
        \$v750%now\ <= \$v750%next\;
        \$1721_a%now\ <= \$1721_a%next\;
        \$v749%now\ <= \$v749%next\;
        \$1753%now\ <= \$1753%next\;
        \$1751_x%now\ <= \$1751_x%next\;
        \$v683%now\ <= \$v683%next\;
        \$v611%now\ <= \$v611%next\;
        \$1699_w%now\ <= \$1699_w%next\;
        \$v617%now\ <= \$v617%next\;
        \$v721%now\ <= \$v721%next\;
        \$v702%now\ <= \$v702%next\;
        \$v714%now\ <= \$v714%next\;
        \$1748_w%now\ <= \$1748_w%next\;
        \$v650%now\ <= \$v650%next\;
        \$v671%now\ <= \$v671%next\;
        \$1757%now\ <= \$1757%next\;
        \$v668%now\ <= \$v668%next\;
        \$v578%now\ <= \$v578%next\;
        \$v746%now\ <= \$v746%next\;
        \$1705%now\ <= \$1705%next\;
        \$1765%now\ <= \$1765%next\;
        \$1720%now\ <= \$1720%next\;
        \$1749%now\ <= \$1749%next\;
        \$1741%now\ <= \$1741%next\;
        \$1733_x%now\ <= \$1733_x%next\;
        \$v693%now\ <= \$v693%next\;
        \$v726%now\ <= \$v726%next\;
        \$v589%now\ <= \$v589%next\;
        \$1690_w%now\ <= \$1690_w%next\;
        \$v730%now\ <= \$v730%next\;
        \$v738%now\ <= \$v738%next\;
        \$1764_w%now\ <= \$1764_w%next\;
        \$v677%now\ <= \$v677%next\;
        \$1727%now\ <= \$1727%next\;
        \$v680%now\ <= \$v680%next\;
        \rdy584%now\ <= \rdy584%next\;
        \$v620%now\ <= \$v620%next\;
        \$1689_w%now\ <= \$1689_w%next\;
        \$v638%now\ <= \$v638%next\;
        \$v629%now\ <= \$v629%next\;
        \$1695_w%now\ <= \$1695_w%next\;
        \$1692_w%now\ <= \$1692_w%next\;
        \$1696_w%now\ <= \$1696_w%next\;
        \$1758_y%now\ <= \$1758_y%next\;
        \$v665%now\ <= \$v665%next\;
        \$1697_w%now\ <= \$1697_w%next\;
        \$1725_n%now\ <= \$1725_n%next\;
        \$v644%now\ <= \$v644%next\;
        \$1762_y%now\ <= \$1762_y%next\;
        \$1712_arg%now\ <= \$1712_arg%next\;
        \$1728_v%now\ <= \$1728_v%next\;
        \$1718_arg%now\ <= \$1718_arg%next\;
        \$1760_w%now\ <= \$1760_w%next\;
        \$v641%now\ <= \$v641%next\;
        \$1738_y%now\ <= \$1738_y%next\;
        \$v713%now\ <= \$v713%next\;
        \$1716%now\ <= \$1716%next\;
        \$1731%now\ <= \$1731%next\;
        \$1745%now\ <= \$1745%next\;
        \$v662%now\ <= \$v662%next\;
        \$1750_y%now\ <= \$1750_y%next\;
        \$1746_y%now\ <= \$1746_y%next\;
        \result583%now\ <= \result583%next\;
        \$v701%now\ <= \$v701%next\;
        \$1744_w%now\ <= \$1744_w%next\;
        \$1709_id%now\ <= \$1709_id%next\;
        \$v686%now\ <= \$v686%next\;
        \$v626%now\ <= \$v626%next\;
        \$v692%now\ <= \$v692%next\;
        \$v717%now\ <= \$v717%next\;
        \$1701_w%now\ <= \$1701_w%next\;
        \$1709_arg%now\ <= \$1709_arg%next\;
        \$1752_w%now\ <= \$1752_w%next\;
        \$1715%now\ <= \$1715%next\;
        \$1688_w%now\ <= \$1688_w%next\;
        \$1693_w%now\ <= \$1693_w%next\;
        \$1694_w%now\ <= \$1694_w%next\;
        \$1709_result%now\ <= \$1709_result%next\;
        \$v659%now\ <= \$v659%next\;
        \$v698%now\ <= \$v698%next\;
        \$1734_w%now\ <= \$1734_w%next\;
        \$1739_x%now\ <= \$1739_x%next\;
        \$v729%now\ <= \$v729%next\;
        \$v674%now\ <= \$v674%next\;
        \$v705%now\ <= \$v705%next\;
        \$v737%now\ <= \$v737%next\;
        \$v718%now\ <= \$v718%next\;
        \$1755_x%now\ <= \$1755_x%next\;
        \$1742_y%now\ <= \$1742_y%next\;
        \$1722_b%now\ <= \$1722_b%next\;
        \$v741%now\ <= \$v741%next\;
        \$v647%now\ <= \$v647%next\;
        \$v706%now\ <= \$v706%next\;
        \$v614%now\ <= \$v614%next\;
        \$v725%now\ <= \$v725%next\;
        \$1726%now\ <= \$1726%next\;
        \$1747_x%now\ <= \$1747_x%next\;
        \$1756_w%now\ <= \$1756_w%next\;
        \$v709%now\ <= \$v709%next\;
        \$1703_cy%now\ <= \$1703_cy%next\;
        \$1706%now\ <= \$1706%next\;
        \$1736_w%now\ <= \$1736_w%next\;
        \$v623%now\ <= \$v623%next\;
        \$1717%now\ <= \$1717%next\;
        \$1740_w%now\ <= \$1740_w%next\;
        \$v608%now\ <= \$v608%next\;
        \$v734%now\ <= \$v734%next\;
        \$1704%now\ <= \$1704%next\;
        \$v632%now\ <= \$v632%next\;
        \$1768%now\ <= \$1768%next\;
        \$v753%now\ <= \$v753%next\;
        \$1730_v%now\ <= \$1730_v%next\;
        \$v733%now\ <= \$v733%next\;
        \$1763_x%now\ <= \$1763_x%next\;
        \$v601%now\ <= \$v601%next\;
        \$1719_code_ptr%now\ <= \$1719_code_ptr%next\;
        \$$1418_code_lock%now\ <= \$$1418_code_lock%next\;
        \$$1433_code_lock%now\ <= \$$1433_code_lock%next\;
        \$$1454_stack_lock%now\ <= \$$1454_stack_lock%next\;
        \state_var754%now\ <= \state_var754%next\;
        \state%now\ <= \state%next\;
      end if;
    end process;
      
      process(argument,\state%now\, clk,\state_var754%now\, \$$1418_code_value\, \$$1433_code_value\, \$$1454_stack_value\, \$1737%now\, \$1712_result%now\, \$1767_v%now\, \$1754_y%now\, \$v604%now\, \$v592%now\, \$1759_x%now\, \$1743_x%now\, \rdy581%now\, \$1766_b%now\, \$v605%now\, \$v653%now\, \$v691%now\, \$1712_id%now\, \$v722%now\, \$1732_y%now\, \$v688%now\, \$1735%now\, \$v586%now\, \$v656%now\, \$v710%now\, \$1698_w%now\, \$1724_w%now\, \$1729%now\, \$v595%now\, \$v696%now\, \$1700_w%now\, \$v745%now\, \result580%now\, \$1761%now\, \$1708%now\, \$1707%now\, \$v742%now\, \$1691_w%now\, \$1723_w%now\, \$v635%now\, \$v598%now\, \$v750%now\, \$1721_a%now\, \$v749%now\, \$1753%now\, \$1751_x%now\, \$v683%now\, \$v611%now\, \$1699_w%now\, \$v617%now\, \$v721%now\, \$v702%now\, \$v714%now\, \$1748_w%now\, \$v650%now\, \$v671%now\, \$1757%now\, \$v668%now\, \$v578%now\, \$v746%now\, \$1705%now\, \$1765%now\, \$1720%now\, \$1749%now\, \$1741%now\, \$1733_x%now\, \$v693%now\, \$v726%now\, \$v589%now\, \$1690_w%now\, \$v730%now\, \$v738%now\, \$1764_w%now\, \$v677%now\, \$1727%now\, \$v680%now\, \rdy584%now\, \$v620%now\, \$1689_w%now\, \$v638%now\, \$v629%now\, \$1695_w%now\, \$1692_w%now\, \$1696_w%now\, \$1758_y%now\, \$v665%now\, \$1697_w%now\, \$1725_n%now\, \$v644%now\, \$1762_y%now\, \$1712_arg%now\, \$1728_v%now\, \$1718_arg%now\, \$1760_w%now\, \$v641%now\, \$1738_y%now\, \$v713%now\, \$1716%now\, \$1731%now\, \$1745%now\, \$v662%now\, \$1750_y%now\, \$1746_y%now\, \result583%now\, \$v701%now\, \$1744_w%now\, \$1709_id%now\, \$v686%now\, \$v626%now\, \$v692%now\, \$v717%now\, \$1701_w%now\, \$1709_arg%now\, \$1752_w%now\, \$1715%now\, \$1688_w%now\, \$1693_w%now\, \$1694_w%now\, \$1709_result%now\, \$v659%now\, \$v698%now\, \$1734_w%now\, \$1739_x%now\, \$v729%now\, \$v674%now\, \$v705%now\, \$v737%now\, \$v718%now\, \$1755_x%now\, \$1742_y%now\, \$1722_b%now\, \$v741%now\, \$v647%now\, \$v706%now\, \$v614%now\, \$v725%now\, \$1726%now\, \$1747_x%now\, \$1756_w%now\, \$v709%now\, \$1703_cy%now\, \$1706%now\, \$1736_w%now\, \$v623%now\, \$1717%now\, \$1740_w%now\, \$v608%now\, \$v734%now\, \$1704%now\, \$v632%now\, \$1768%now\, \$v753%now\, \$1730_v%now\, \$v733%now\, \$1763_x%now\, \$v601%now\, \$1719_code_ptr%now\, \$$1418_code_lock%now\, \$$1433_code_lock%now\, \$$1454_stack_lock%now\)
        variable \$1709_arg\ : value(0 to 1) := (others => '0');
        variable \$1704\ : value(0 to 32) := (others => '0');
        variable \$1726\ : value(0 to 63) := (others => '0');
        variable \$1715\ : value(0 to 36) := (others => '0');
        variable \$v688\ : value(0 to 4) := (others => '0');
        variable \$1709_id\, \$1712_id\ : value(0 to 11) := (others => '0');
        variable \$1712_arg\ : value(0 to 97) := (others => '0');
        variable \$v601\, \$v733\, \$v753\, \$v632\, \$v734\, \$v608\, 
                 \$1740_w\, \$1717\, \$v623\, \$1736_w\, \$1706\, \$v709\, 
                 \$1756_w\, \$v725\, \$v614\, \$v706\, \$v647\, \$v741\, 
                 \$v718\, \$v737\, \$v705\, \$v674\, \$v729\, \$1734_w\, 
                 \$v698\, \$v659\, \$1709_result\, \$1694_w\, \$1693_w\, 
                 \$1688_w\, \$1752_w\, \$1701_w\, \$v717\, \$v692\, \$v626\, 
                 \$v686\, \$1744_w\, \$v701\, \$v662\, \$1745\, \$1731\, 
                 \$1716\, \$v713\, \$v641\, \$1760_w\, \$v644\, \$1697_w\, 
                 \$v665\, \$1696_w\, \$1692_w\, \$1695_w\, \$v629\, \$v638\, 
                 \$1689_w\, \$v620\, rdy584, \$v680\, \$1727\, \$v677\, 
                 \$1764_w\, \$v738\, \$1690_w\, \$v589\, \$v726\, \$v693\, 
                 \$1741\, \$1749\, \$1720\, \$1765\, \$1705\, \$v746\, 
                 \$v578\, \$v668\, \$1757\, \$v671\, \$v650\, \$1748_w\, 
                 \$v714\, \$v702\, \$v721\, \$v617\, \$1699_w\, \$v611\, 
                 \$v683\, \$1753\, \$v749\, \$v598\, \$v635\, \$1723_w\, 
                 \$1691_w\, \$v742\, \$1707\, \$1708\, \$1761\, result580, 
                 \$v745\, \$1700_w\, \$v696\, \$v595\, \$1729\, \$1724_w\, 
                 \$1698_w\, \$v710\, \$v656\, \$1735\, \$v722\, \$v691\, 
                 \$v653\, \$v605\, \$1766_b\, rdy581, \$v592\, \$v604\, 
                 \$1712_result\, \$1737\ : value(0 to 0) := (others => '0');
        variable \$1719_code_ptr\, \$1763_x\, \$1730_v\, \$1768\, \$1703_cy\, 
                 \$1747_x\, \$1722_b\, \$1742_y\, \$1755_x\, \$1739_x\, 
                 result583, \$1746_y\, \$1750_y\, \$1738_y\, \$1718_arg\, 
                 \$1728_v\, \$1762_y\, \$1725_n\, \$1758_y\, \$v730\, 
                 \$1733_x\, \$1751_x\, \$1721_a\, \$v750\, \$v586\, 
                 \$1732_y\, \$1743_x\, \$1759_x\, \$1754_y\, \$1767_v\ : value(0 to 31) := (others => '0');
        variable state : t_state;
        variable state_var754 : t_state_var754;
        variable \$$1418_code_lock\ : value(0 to 0);
        variable \$$1433_code_lock\ : value(0 to 0);
        variable \$$1454_stack_lock\ : value(0 to 0);
        
    begin
      \$1737\ := \$1737%now\;
      \$1712_result\ := \$1712_result%now\;
      \$1767_v\ := \$1767_v%now\;
      \$1754_y\ := \$1754_y%now\;
      \$v604\ := \$v604%now\;
      \$v592\ := \$v592%now\;
      \$1759_x\ := \$1759_x%now\;
      \$1743_x\ := \$1743_x%now\;
      rdy581 := \rdy581%now\;
      \$1766_b\ := \$1766_b%now\;
      \$v605\ := \$v605%now\;
      \$v653\ := \$v653%now\;
      \$v691\ := \$v691%now\;
      \$1712_id\ := \$1712_id%now\;
      \$v722\ := \$v722%now\;
      \$1732_y\ := \$1732_y%now\;
      \$v688\ := \$v688%now\;
      \$1735\ := \$1735%now\;
      \$v586\ := \$v586%now\;
      \$v656\ := \$v656%now\;
      \$v710\ := \$v710%now\;
      \$1698_w\ := \$1698_w%now\;
      \$1724_w\ := \$1724_w%now\;
      \$1729\ := \$1729%now\;
      \$v595\ := \$v595%now\;
      \$v696\ := \$v696%now\;
      \$1700_w\ := \$1700_w%now\;
      \$v745\ := \$v745%now\;
      result580 := \result580%now\;
      \$1761\ := \$1761%now\;
      \$1708\ := \$1708%now\;
      \$1707\ := \$1707%now\;
      \$v742\ := \$v742%now\;
      \$1691_w\ := \$1691_w%now\;
      \$1723_w\ := \$1723_w%now\;
      \$v635\ := \$v635%now\;
      \$v598\ := \$v598%now\;
      \$v750\ := \$v750%now\;
      \$1721_a\ := \$1721_a%now\;
      \$v749\ := \$v749%now\;
      \$1753\ := \$1753%now\;
      \$1751_x\ := \$1751_x%now\;
      \$v683\ := \$v683%now\;
      \$v611\ := \$v611%now\;
      \$1699_w\ := \$1699_w%now\;
      \$v617\ := \$v617%now\;
      \$v721\ := \$v721%now\;
      \$v702\ := \$v702%now\;
      \$v714\ := \$v714%now\;
      \$1748_w\ := \$1748_w%now\;
      \$v650\ := \$v650%now\;
      \$v671\ := \$v671%now\;
      \$1757\ := \$1757%now\;
      \$v668\ := \$v668%now\;
      \$v578\ := \$v578%now\;
      \$v746\ := \$v746%now\;
      \$1705\ := \$1705%now\;
      \$1765\ := \$1765%now\;
      \$1720\ := \$1720%now\;
      \$1749\ := \$1749%now\;
      \$1741\ := \$1741%now\;
      \$1733_x\ := \$1733_x%now\;
      \$v693\ := \$v693%now\;
      \$v726\ := \$v726%now\;
      \$v589\ := \$v589%now\;
      \$1690_w\ := \$1690_w%now\;
      \$v730\ := \$v730%now\;
      \$v738\ := \$v738%now\;
      \$1764_w\ := \$1764_w%now\;
      \$v677\ := \$v677%now\;
      \$1727\ := \$1727%now\;
      \$v680\ := \$v680%now\;
      rdy584 := \rdy584%now\;
      \$v620\ := \$v620%now\;
      \$1689_w\ := \$1689_w%now\;
      \$v638\ := \$v638%now\;
      \$v629\ := \$v629%now\;
      \$1695_w\ := \$1695_w%now\;
      \$1692_w\ := \$1692_w%now\;
      \$1696_w\ := \$1696_w%now\;
      \$1758_y\ := \$1758_y%now\;
      \$v665\ := \$v665%now\;
      \$1697_w\ := \$1697_w%now\;
      \$1725_n\ := \$1725_n%now\;
      \$v644\ := \$v644%now\;
      \$1762_y\ := \$1762_y%now\;
      \$1712_arg\ := \$1712_arg%now\;
      \$1728_v\ := \$1728_v%now\;
      \$1718_arg\ := \$1718_arg%now\;
      \$1760_w\ := \$1760_w%now\;
      \$v641\ := \$v641%now\;
      \$1738_y\ := \$1738_y%now\;
      \$v713\ := \$v713%now\;
      \$1716\ := \$1716%now\;
      \$1731\ := \$1731%now\;
      \$1745\ := \$1745%now\;
      \$v662\ := \$v662%now\;
      \$1750_y\ := \$1750_y%now\;
      \$1746_y\ := \$1746_y%now\;
      result583 := \result583%now\;
      \$v701\ := \$v701%now\;
      \$1744_w\ := \$1744_w%now\;
      \$1709_id\ := \$1709_id%now\;
      \$v686\ := \$v686%now\;
      \$v626\ := \$v626%now\;
      \$v692\ := \$v692%now\;
      \$v717\ := \$v717%now\;
      \$1701_w\ := \$1701_w%now\;
      \$1709_arg\ := \$1709_arg%now\;
      \$1752_w\ := \$1752_w%now\;
      \$1715\ := \$1715%now\;
      \$1688_w\ := \$1688_w%now\;
      \$1693_w\ := \$1693_w%now\;
      \$1694_w\ := \$1694_w%now\;
      \$1709_result\ := \$1709_result%now\;
      \$v659\ := \$v659%now\;
      \$v698\ := \$v698%now\;
      \$1734_w\ := \$1734_w%now\;
      \$1739_x\ := \$1739_x%now\;
      \$v729\ := \$v729%now\;
      \$v674\ := \$v674%now\;
      \$v705\ := \$v705%now\;
      \$v737\ := \$v737%now\;
      \$v718\ := \$v718%now\;
      \$1755_x\ := \$1755_x%now\;
      \$1742_y\ := \$1742_y%now\;
      \$1722_b\ := \$1722_b%now\;
      \$v741\ := \$v741%now\;
      \$v647\ := \$v647%now\;
      \$v706\ := \$v706%now\;
      \$v614\ := \$v614%now\;
      \$v725\ := \$v725%now\;
      \$1726\ := \$1726%now\;
      \$1747_x\ := \$1747_x%now\;
      \$1756_w\ := \$1756_w%now\;
      \$v709\ := \$v709%now\;
      \$1703_cy\ := \$1703_cy%now\;
      \$1706\ := \$1706%now\;
      \$1736_w\ := \$1736_w%now\;
      \$v623\ := \$v623%now\;
      \$1717\ := \$1717%now\;
      \$1740_w\ := \$1740_w%now\;
      \$v608\ := \$v608%now\;
      \$v734\ := \$v734%now\;
      \$1704\ := \$1704%now\;
      \$v632\ := \$v632%now\;
      \$1768\ := \$1768%now\;
      \$v753\ := \$v753%now\;
      \$1730_v\ := \$1730_v%now\;
      \$v733\ := \$v733%now\;
      \$1763_x\ := \$1763_x%now\;
      \$v601\ := \$v601%now\;
      \$1719_code_ptr\ := \$1719_code_ptr%now\;
      \$$1418_code_lock\ := \$$1418_code_lock%now\;
      \$$1433_code_lock\ := \$$1433_code_lock%now\;
      \$$1454_stack_lock\ := \$$1454_stack_lock%now\;
      state := \state%now\;
      state_var754 := \state_var754%now\;
      case state is
      when PAUSE_SET699 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1701_w\ := eclat_unit;
        if \$v578\(0) = '1' then
          
        else
          \$v578\ := eclat_true;
          \$1768\ := X"0000000" & X"0";
        end if;
        \$1768\ := work.Int.add(\$1768\, X"0000000" & X"1");
        \$1703_cy\ := \$1768\;
        case state_var754 is
        when \$1709\ =>
          \$1712_id\ := "000000000001";
          \$1712_arg\ := X"0000000" & X"0" & X"0000000" & X"0" & X"0000000" & X"0" & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when \$1712\ =>
          \$v692\ := work.Int.ge(\$1712_arg\(0 to 31), X"00000" & X"400");
          if \$v692\(0) = '1' then
            \$1712_result\ := eclat_unit;
            \$1709_result\ := \$1712_result\;
            \$1707\ := \$1709_result\;
            \$1708\ := work.Print.print_string(clk,of_string("fin\n"));
            result583 := X"000000" & X"2a";
            rdy584 := eclat_true;
            state_var754 := IDLE585;
          else
            \$v691\ := \$$1433_code_lock\;
            if \$v691\(0) = '1' then
              state_var754 := Q_WAIT690;
            else
              acquire(\$$1433_code_lock\);
              \$$1433_code_ptr\ <= to_integer(unsigned(\$1712_arg\(0 to 31)));
              state_var754 := PAUSE_GET689;
            end if;
          end if;
        when PAUSE_GET587 =>
          \$1719_code_ptr\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$1712_arg\ := \$1719_code_ptr\ & work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2") & \$1718_arg\ & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_GET590 =>
          \$1718_arg\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v589\ := \$$1454_stack_lock\;
          if \$v589\(0) = '1' then
            state_var754 := Q_WAIT588;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET587;
          end if;
        when PAUSE_GET599 =>
          \$1722_b\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v598\ := \$$1454_stack_lock\;
          if \$v598\(0) = '1' then
            state_var754 := Q_WAIT597;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"1")));
            \$$1454_stack_write\ <= \$1722_b\; \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET596;
          end if;
        when PAUSE_GET602 =>
          \$1721_a\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v601\ := \$$1454_stack_lock\;
          if \$v601\(0) = '1' then
            state_var754 := Q_WAIT600;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET599;
          end if;
        when PAUSE_GET606 =>
          \$1728_v\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & 
          work.Int.modulo(\$1728_v\, X"000000" & X"10") & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_GET609 =>
          \$1730_v\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & 
          work.Int.div(\$1730_v\, X"000000" & X"10") & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_GET615 =>
          \$1733_x\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v614\ := \$$1454_stack_lock\;
          if \$v614\(0) = '1' then
            state_var754 := Q_WAIT613;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.add(work.Int.mul(\$1733_x\, X"000000" & X"10"), \$1732_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET612;
          end if;
        when PAUSE_GET618 =>
          \$1732_y\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v617\ := \$$1454_stack_lock\;
          if \$v617\(0) = '1' then
            state_var754 := Q_WAIT616;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET615;
          end if;
        when PAUSE_GET627 =>
          \$1739_x\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v626\ := \$$1454_stack_lock\;
          if \$v626\(0) = '1' then
            state_var754 := Q_WAIT625;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= eclat_if(work.Int.gt(\$1739_x\, \$1738_y\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET624;
          end if;
        when PAUSE_GET630 =>
          \$1738_y\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v629\ := \$$1454_stack_lock\;
          if \$v629\(0) = '1' then
            state_var754 := Q_WAIT628;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET627;
          end if;
        when PAUSE_GET636 =>
          \$1743_x\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v635\ := \$$1454_stack_lock\;
          if \$v635\(0) = '1' then
            state_var754 := Q_WAIT634;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= eclat_if(work.Int.lt(\$1743_x\, \$1742_y\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET633;
          end if;
        when PAUSE_GET639 =>
          \$1742_y\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v638\ := \$$1454_stack_lock\;
          if \$v638\(0) = '1' then
            state_var754 := Q_WAIT637;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET636;
          end if;
        when PAUSE_GET645 =>
          \$1747_x\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v644\ := \$$1454_stack_lock\;
          if \$v644\(0) = '1' then
            state_var754 := Q_WAIT643;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= eclat_if(work.Int.eq(\$1747_x\, \$1746_y\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET642;
          end if;
        when PAUSE_GET648 =>
          \$1746_y\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v647\ := \$$1454_stack_lock\;
          if \$v647\(0) = '1' then
            state_var754 := Q_WAIT646;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET645;
          end if;
        when PAUSE_GET654 =>
          \$1751_x\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v653\ := \$$1454_stack_lock\;
          if \$v653\(0) = '1' then
            state_var754 := Q_WAIT652;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.div(\$1751_x\, \$1750_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET651;
          end if;
        when PAUSE_GET657 =>
          \$1750_y\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v656\ := \$$1454_stack_lock\;
          if \$v656\(0) = '1' then
            state_var754 := Q_WAIT655;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET654;
          end if;
        when PAUSE_GET663 =>
          \$1755_x\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v662\ := \$$1454_stack_lock\;
          if \$v662\(0) = '1' then
            state_var754 := Q_WAIT661;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.mul(\$1755_x\, \$1754_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET660;
          end if;
        when PAUSE_GET666 =>
          \$1754_y\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v665\ := \$$1454_stack_lock\;
          if \$v665\(0) = '1' then
            state_var754 := Q_WAIT664;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET663;
          end if;
        when PAUSE_GET672 =>
          \$1759_x\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v671\ := \$$1454_stack_lock\;
          if \$v671\(0) = '1' then
            state_var754 := Q_WAIT670;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.sub(\$1759_x\, \$1758_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET669;
          end if;
        when PAUSE_GET675 =>
          \$1758_y\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v674\ := \$$1454_stack_lock\;
          if \$v674\(0) = '1' then
            state_var754 := Q_WAIT673;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET672;
          end if;
        when PAUSE_GET681 =>
          \$1763_x\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v680\ := \$$1454_stack_lock\;
          if \$v680\(0) = '1' then
            state_var754 := Q_WAIT679;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.add(\$1763_x\, \$1762_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET678;
          end if;
        when PAUSE_GET684 =>
          \$1762_y\ := \$$1454_stack_value\;
          release(\$$1454_stack_lock\);
          \$v683\ := \$$1454_stack_lock\;
          if \$v683\(0) = '1' then
            state_var754 := Q_WAIT682;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET681;
          end if;
        when PAUSE_GET689 =>
          \$1715\ := \$$1433_code_value\;
          release(\$$1433_code_lock\);
          \$v688\ := \$1715\(0 to 4);
          \$v586\ := \$1715\(5 to 36);
          case \$v688\ is
          when "10011" =>
            \$1716\ := \$v586\(0 to 0);
            \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & \$1712_arg\(64 to 95) & eclat_unit & eclat_unit;
            state_var754 := \$1712\;
          when "01000" =>
            \$1717\ := \$v586\(0 to 0);
            \$v592\ := \$$1454_stack_lock\;
            if \$v592\(0) = '1' then
              state_var754 := Q_WAIT591;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET590;
            end if;
          when "00111" =>
            \$1720\ := \$v586\(0 to 0);
            \$v604\ := \$$1454_stack_lock\;
            if \$v604\(0) = '1' then
              state_var754 := Q_WAIT603;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET602;
            end if;
          when "01010" =>
            \$1725_n\ := \$v586\(0 to 31);
            \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & \$1725_n\ & eclat_unit & eclat_unit;
            state_var754 := \$1712\;
          when "10010" =>
            \$1726\ := \$v586\(0 to 63);
            \$v605\ := work.Int.neq(\$1712_arg\(64 to 95), X"0000000" & X"0");
            if \$v605\(0) = '1' then
              \$1712_arg\ := \$1726\(0 to 31) & \$1712_arg\(32 to 63) & \$1712_arg\(64 to 95) & eclat_unit & eclat_unit;
              state_var754 := \$1712\;
            else
              \$1712_arg\ := \$1726\(32 to 63) & \$1712_arg\(32 to 63) & \$1712_arg\(64 to 95) & eclat_unit & eclat_unit;
              state_var754 := \$1712\;
            end if;
          when "00110" =>
            \$1727\ := \$v586\(0 to 0);
            \$v608\ := \$$1454_stack_lock\;
            if \$v608\(0) = '1' then
              state_var754 := Q_WAIT607;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET606;
            end if;
          when "00101" =>
            \$1729\ := \$v586\(0 to 0);
            \$v611\ := \$$1454_stack_lock\;
            if \$v611\(0) = '1' then
              state_var754 := Q_WAIT610;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET609;
            end if;
          when "00100" =>
            \$1731\ := \$v586\(0 to 0);
            \$v620\ := \$$1454_stack_lock\;
            if \$v620\(0) = '1' then
              state_var754 := Q_WAIT619;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET618;
            end if;
          when "00011" =>
            \$1735\ := \$v586\(0 to 0);
            \$v623\ := \$$1454_stack_lock\;
            if \$v623\(0) = '1' then
              state_var754 := Q_WAIT622;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr_write\ <= to_integer(unsigned(\$1712_arg\(32 to 63)));
              \$$1454_stack_write\ <= \$1712_arg\(64 to 95); \$$1454_stack_write_request\ <= '1';
              state_var754 := PAUSE_SET621;
            end if;
          when "10001" =>
            \$1737\ := \$v586\(0 to 0);
            \$v632\ := \$$1454_stack_lock\;
            if \$v632\(0) = '1' then
              state_var754 := Q_WAIT631;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET630;
            end if;
          when "10000" =>
            \$1741\ := \$v586\(0 to 0);
            \$v641\ := \$$1454_stack_lock\;
            if \$v641\(0) = '1' then
              state_var754 := Q_WAIT640;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET639;
            end if;
          when "01111" =>
            \$1745\ := \$v586\(0 to 0);
            \$v650\ := \$$1454_stack_lock\;
            if \$v650\(0) = '1' then
              state_var754 := Q_WAIT649;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET648;
            end if;
          when "01110" =>
            \$1749\ := \$v586\(0 to 0);
            \$v659\ := \$$1454_stack_lock\;
            if \$v659\(0) = '1' then
              state_var754 := Q_WAIT658;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET657;
            end if;
          when "01101" =>
            \$1753\ := \$v586\(0 to 0);
            \$v668\ := \$$1454_stack_lock\;
            if \$v668\(0) = '1' then
              state_var754 := Q_WAIT667;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET666;
            end if;
          when "01100" =>
            \$1757\ := \$v586\(0 to 0);
            \$v677\ := \$$1454_stack_lock\;
            if \$v677\(0) = '1' then
              state_var754 := Q_WAIT676;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET675;
            end if;
          when "01011" =>
            \$1761\ := \$v586\(0 to 0);
            \$v686\ := \$$1454_stack_lock\;
            if \$v686\(0) = '1' then
              state_var754 := Q_WAIT685;
            else
              acquire(\$$1454_stack_lock\);
              \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(
                                                        \$1712_arg\(32 to 63), X"0000000" & X"1")));
              state_var754 := PAUSE_GET684;
            end if;
          when "00010" =>
            \$1765\ := \$v586\(0 to 0);
            \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & X"0000000" & X"0" & eclat_unit & eclat_unit;
            state_var754 := \$1712\;
          when "00001" =>
            \$1766_b\ := \$v586\(0 to 0);
            \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & 
            eclat_if(\$1766_b\ & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
            state_var754 := \$1712\;
          when "00000" =>
            \$1767_v\ := \$v586\(0 to 31);
            \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & \$1767_v\ & eclat_unit & eclat_unit;
            state_var754 := \$1712\;
          when others =>
            \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & \$1712_arg\(64 to 95) & eclat_unit & eclat_unit;
            state_var754 := \$1712\;
          end case;
        when PAUSE_SET593 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1724_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & \$1712_arg\(32 to 63) & \$1712_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET596 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1723_w\ := eclat_unit;
          \$v595\ := \$$1454_stack_lock\;
          if \$v595\(0) = '1' then
            state_var754 := Q_WAIT594;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= \$1721_a\; \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET593;
          end if;
        when PAUSE_SET612 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1734_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1") & \$1712_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET621 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1736_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.add(\$1712_arg\(32 to 63), X"0000000" & X"1") & \$1712_arg\(64 to 95) & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET624 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1740_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.gt(
                                                                   \$1739_x\, \$1738_y\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET633 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1744_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.lt(
                                                                   \$1743_x\, \$1742_y\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET642 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1748_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1") & eclat_if(
                                                                   work.Int.eq(
                                                                   \$1747_x\, \$1746_y\) & X"0000000" & X"1" & X"0000000" & X"0") & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET651 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1752_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1") & work.Int.div(
                                                                   \$1751_x\, \$1750_y\) & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET660 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1756_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1") & work.Int.mul(
                                                                   \$1755_x\, \$1754_y\) & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET669 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1760_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1") & work.Int.sub(
                                                                   \$1759_x\, \$1758_y\) & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET678 =>
          \$$1454_stack_write_request\ <= '0';
          release(\$$1454_stack_lock\);
          \$1764_w\ := eclat_unit;
          \$1712_arg\ := work.Int.add(\$1712_arg\(0 to 31), X"0000000" & X"1") & 
          work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1") & work.Int.add(
                                                                   \$1763_x\, \$1762_y\) & eclat_unit & eclat_unit;
          state_var754 := \$1712\;
        when PAUSE_SET694 =>
          \$$1418_code_write_request\ <= '0';
          release(\$$1418_code_lock\);
          \$1705\ := eclat_unit;
          \$1706\ := work.Print.print_string(clk,of_string("début\n"));
          \$1709_id\ := "000000000010";
          \$1709_arg\ := eclat_unit & eclat_unit;
          state_var754 := \$1709\;
        when Q_WAIT588 =>
          \$v589\ := \$$1454_stack_lock\;
          if \$v589\(0) = '1' then
            state_var754 := Q_WAIT588;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET587;
          end if;
        when Q_WAIT591 =>
          \$v592\ := \$$1454_stack_lock\;
          if \$v592\(0) = '1' then
            state_var754 := Q_WAIT591;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET590;
          end if;
        when Q_WAIT594 =>
          \$v595\ := \$$1454_stack_lock\;
          if \$v595\(0) = '1' then
            state_var754 := Q_WAIT594;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= \$1721_a\; \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET593;
          end if;
        when Q_WAIT597 =>
          \$v598\ := \$$1454_stack_lock\;
          if \$v598\(0) = '1' then
            state_var754 := Q_WAIT597;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"1")));
            \$$1454_stack_write\ <= \$1722_b\; \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET596;
          end if;
        when Q_WAIT600 =>
          \$v601\ := \$$1454_stack_lock\;
          if \$v601\(0) = '1' then
            state_var754 := Q_WAIT600;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET599;
          end if;
        when Q_WAIT603 =>
          \$v604\ := \$$1454_stack_lock\;
          if \$v604\(0) = '1' then
            state_var754 := Q_WAIT603;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET602;
          end if;
        when Q_WAIT607 =>
          \$v608\ := \$$1454_stack_lock\;
          if \$v608\(0) = '1' then
            state_var754 := Q_WAIT607;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET606;
          end if;
        when Q_WAIT610 =>
          \$v611\ := \$$1454_stack_lock\;
          if \$v611\(0) = '1' then
            state_var754 := Q_WAIT610;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET609;
          end if;
        when Q_WAIT613 =>
          \$v614\ := \$$1454_stack_lock\;
          if \$v614\(0) = '1' then
            state_var754 := Q_WAIT613;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.add(work.Int.mul(\$1733_x\, X"000000" & X"10"), \$1732_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET612;
          end if;
        when Q_WAIT616 =>
          \$v617\ := \$$1454_stack_lock\;
          if \$v617\(0) = '1' then
            state_var754 := Q_WAIT616;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET615;
          end if;
        when Q_WAIT619 =>
          \$v620\ := \$$1454_stack_lock\;
          if \$v620\(0) = '1' then
            state_var754 := Q_WAIT619;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET618;
          end if;
        when Q_WAIT622 =>
          \$v623\ := \$$1454_stack_lock\;
          if \$v623\(0) = '1' then
            state_var754 := Q_WAIT622;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(\$1712_arg\(32 to 63)));
            \$$1454_stack_write\ <= \$1712_arg\(64 to 95); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET621;
          end if;
        when Q_WAIT625 =>
          \$v626\ := \$$1454_stack_lock\;
          if \$v626\(0) = '1' then
            state_var754 := Q_WAIT625;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= eclat_if(work.Int.gt(\$1739_x\, \$1738_y\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET624;
          end if;
        when Q_WAIT628 =>
          \$v629\ := \$$1454_stack_lock\;
          if \$v629\(0) = '1' then
            state_var754 := Q_WAIT628;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET627;
          end if;
        when Q_WAIT631 =>
          \$v632\ := \$$1454_stack_lock\;
          if \$v632\(0) = '1' then
            state_var754 := Q_WAIT631;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET630;
          end if;
        when Q_WAIT634 =>
          \$v635\ := \$$1454_stack_lock\;
          if \$v635\(0) = '1' then
            state_var754 := Q_WAIT634;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= eclat_if(work.Int.lt(\$1743_x\, \$1742_y\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET633;
          end if;
        when Q_WAIT637 =>
          \$v638\ := \$$1454_stack_lock\;
          if \$v638\(0) = '1' then
            state_var754 := Q_WAIT637;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET636;
          end if;
        when Q_WAIT640 =>
          \$v641\ := \$$1454_stack_lock\;
          if \$v641\(0) = '1' then
            state_var754 := Q_WAIT640;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET639;
          end if;
        when Q_WAIT643 =>
          \$v644\ := \$$1454_stack_lock\;
          if \$v644\(0) = '1' then
            state_var754 := Q_WAIT643;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= eclat_if(work.Int.eq(\$1747_x\, \$1746_y\) & X"0000000" & X"1" & X"0000000" & X"0"); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET642;
          end if;
        when Q_WAIT646 =>
          \$v647\ := \$$1454_stack_lock\;
          if \$v647\(0) = '1' then
            state_var754 := Q_WAIT646;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET645;
          end if;
        when Q_WAIT649 =>
          \$v650\ := \$$1454_stack_lock\;
          if \$v650\(0) = '1' then
            state_var754 := Q_WAIT649;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET648;
          end if;
        when Q_WAIT652 =>
          \$v653\ := \$$1454_stack_lock\;
          if \$v653\(0) = '1' then
            state_var754 := Q_WAIT652;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.div(\$1751_x\, \$1750_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET651;
          end if;
        when Q_WAIT655 =>
          \$v656\ := \$$1454_stack_lock\;
          if \$v656\(0) = '1' then
            state_var754 := Q_WAIT655;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET654;
          end if;
        when Q_WAIT658 =>
          \$v659\ := \$$1454_stack_lock\;
          if \$v659\(0) = '1' then
            state_var754 := Q_WAIT658;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET657;
          end if;
        when Q_WAIT661 =>
          \$v662\ := \$$1454_stack_lock\;
          if \$v662\(0) = '1' then
            state_var754 := Q_WAIT661;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.mul(\$1755_x\, \$1754_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET660;
          end if;
        when Q_WAIT664 =>
          \$v665\ := \$$1454_stack_lock\;
          if \$v665\(0) = '1' then
            state_var754 := Q_WAIT664;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET663;
          end if;
        when Q_WAIT667 =>
          \$v668\ := \$$1454_stack_lock\;
          if \$v668\(0) = '1' then
            state_var754 := Q_WAIT667;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET666;
          end if;
        when Q_WAIT670 =>
          \$v671\ := \$$1454_stack_lock\;
          if \$v671\(0) = '1' then
            state_var754 := Q_WAIT670;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.sub(\$1759_x\, \$1758_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET669;
          end if;
        when Q_WAIT673 =>
          \$v674\ := \$$1454_stack_lock\;
          if \$v674\(0) = '1' then
            state_var754 := Q_WAIT673;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET672;
          end if;
        when Q_WAIT676 =>
          \$v677\ := \$$1454_stack_lock\;
          if \$v677\(0) = '1' then
            state_var754 := Q_WAIT676;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET675;
          end if;
        when Q_WAIT679 =>
          \$v680\ := \$$1454_stack_lock\;
          if \$v680\(0) = '1' then
            state_var754 := Q_WAIT679;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr_write\ <= to_integer(unsigned(work.Int.sub(
                                                            \$1712_arg\(32 to 63), X"0000000" & X"2")));
            \$$1454_stack_write\ <= work.Int.add(\$1763_x\, \$1762_y\); \$$1454_stack_write_request\ <= '1';
            state_var754 := PAUSE_SET678;
          end if;
        when Q_WAIT682 =>
          \$v683\ := \$$1454_stack_lock\;
          if \$v683\(0) = '1' then
            state_var754 := Q_WAIT682;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"2")));
            state_var754 := PAUSE_GET681;
          end if;
        when Q_WAIT685 =>
          \$v686\ := \$$1454_stack_lock\;
          if \$v686\(0) = '1' then
            state_var754 := Q_WAIT685;
          else
            acquire(\$$1454_stack_lock\);
            \$$1454_stack_ptr\ <= to_integer(unsigned(work.Int.sub(\$1712_arg\(32 to 63), X"0000000" & X"1")));
            state_var754 := PAUSE_GET684;
          end if;
        when Q_WAIT690 =>
          \$v691\ := \$$1433_code_lock\;
          if \$v691\(0) = '1' then
            state_var754 := Q_WAIT690;
          else
            acquire(\$$1433_code_lock\);
            \$$1433_code_ptr\ <= to_integer(unsigned(\$1712_arg\(0 to 31)));
            state_var754 := PAUSE_GET689;
          end if;
        when Q_WAIT695 =>
          \$v696\ := \$$1418_code_lock\;
          if \$v696\(0) = '1' then
            state_var754 := Q_WAIT695;
          else
            acquire(\$$1418_code_lock\);
            \$v693\ := eclat_unit;
            \$$1418_code_ptr_write\ <= 0;\$$1418_code_write\ <= "00011" & \$v693\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
            state_var754 := PAUSE_SET694;
          end if;
        when IDLE585 =>
          rdy584 := eclat_false;
          \$v696\ := \$$1418_code_lock\;
          if \$v696\(0) = '1' then
            state_var754 := Q_WAIT695;
          else
            acquire(\$$1418_code_lock\);
            \$v693\ := eclat_unit;
            \$$1418_code_ptr_write\ <= 0;\$$1418_code_write\ <= "00011" & \$v693\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
            state_var754 := PAUSE_SET694;
          end if;
        end case;
        
        if rdy584(0) = '1' then
          
        else
          result583 := X"0000000" & X"0";
        end if;
        \$1704\ := result583 & rdy584;
        result580 := work.Bool.lnot(""&\$1704\(32));
        rdy581 := eclat_true;
        state := IDLE582;
      when PAUSE_SET703 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1700_w\ := eclat_unit;
        \$v701\ := \$$1418_code_lock\;
        if \$v701\(0) = '1' then
          state := Q_WAIT700;
        else
          acquire(\$$1418_code_lock\);
          \$v698\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 14;\$$1418_code_write\ <= "10011" & \$v698\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET699;
        end if;
      when PAUSE_SET707 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1699_w\ := eclat_unit;
        \$v705\ := \$$1418_code_lock\;
        if \$v705\(0) = '1' then
          state := Q_WAIT704;
        else
          acquire(\$$1418_code_lock\);
          \$v702\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 13;\$$1418_code_write\ <= "00100" & \$v702\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET703;
        end if;
      when PAUSE_SET711 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1698_w\ := eclat_unit;
        \$v709\ := \$$1418_code_lock\;
        if \$v709\(0) = '1' then
          state := Q_WAIT708;
        else
          acquire(\$$1418_code_lock\);
          \$v706\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 12;\$$1418_code_write\ <= "00110" & \$v706\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET707;
        end if;
      when PAUSE_SET715 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1697_w\ := eclat_unit;
        \$v713\ := \$$1418_code_lock\;
        if \$v713\(0) = '1' then
          state := Q_WAIT712;
        else
          acquire(\$$1418_code_lock\);
          \$v710\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 11;\$$1418_code_write\ <= "00111" & \$v710\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET711;
        end if;
      when PAUSE_SET719 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1696_w\ := eclat_unit;
        \$v717\ := \$$1418_code_lock\;
        if \$v717\(0) = '1' then
          state := Q_WAIT716;
        else
          acquire(\$$1418_code_lock\);
          \$v714\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 10;\$$1418_code_write\ <= "00110" & \$v714\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET715;
        end if;
      when PAUSE_SET723 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1695_w\ := eclat_unit;
        \$v721\ := \$$1418_code_lock\;
        if \$v721\(0) = '1' then
          state := Q_WAIT720;
        else
          acquire(\$$1418_code_lock\);
          \$v718\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 9;\$$1418_code_write\ <= "00011" & \$v718\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET719;
        end if;
      when PAUSE_SET727 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1694_w\ := eclat_unit;
        \$v725\ := \$$1418_code_lock\;
        if \$v725\(0) = '1' then
          state := Q_WAIT724;
        else
          acquire(\$$1418_code_lock\);
          \$v722\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 8;\$$1418_code_write\ <= "01000" & \$v722\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET723;
        end if;
      when PAUSE_SET731 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1693_w\ := eclat_unit;
        \$v729\ := \$$1418_code_lock\;
        if \$v729\(0) = '1' then
          state := Q_WAIT728;
        else
          acquire(\$$1418_code_lock\);
          \$v726\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 7;\$$1418_code_write\ <= "00100" & \$v726\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET727;
        end if;
      when PAUSE_SET735 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1692_w\ := eclat_unit;
        \$v733\ := \$$1418_code_lock\;
        if \$v733\(0) = '1' then
          state := Q_WAIT732;
        else
          acquire(\$$1418_code_lock\);
          \$v730\ := X"0000000" & X"6";
          \$$1418_code_ptr_write\ <= 6;\$$1418_code_write\ <= "00000" & \$v730\&X"00000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET731;
        end if;
      when PAUSE_SET739 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1691_w\ := eclat_unit;
        \$v737\ := \$$1418_code_lock\;
        if \$v737\(0) = '1' then
          state := Q_WAIT736;
        else
          acquire(\$$1418_code_lock\);
          \$v734\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 5;\$$1418_code_write\ <= "00111" & \$v734\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET735;
        end if;
      when PAUSE_SET743 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1690_w\ := eclat_unit;
        \$v741\ := \$$1418_code_lock\;
        if \$v741\(0) = '1' then
          state := Q_WAIT740;
        else
          acquire(\$$1418_code_lock\);
          \$v738\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 4;\$$1418_code_write\ <= "00110" & \$v738\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET739;
        end if;
      when PAUSE_SET747 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1689_w\ := eclat_unit;
        \$v745\ := \$$1418_code_lock\;
        if \$v745\(0) = '1' then
          state := Q_WAIT744;
        else
          acquire(\$$1418_code_lock\);
          \$v742\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 3;\$$1418_code_write\ <= "00011" & \$v742\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET743;
        end if;
      when PAUSE_SET751 =>
        \$$1418_code_write_request\ <= '0';
        release(\$$1418_code_lock\);
        \$1688_w\ := eclat_unit;
        \$v749\ := \$$1418_code_lock\;
        if \$v749\(0) = '1' then
          state := Q_WAIT748;
        else
          acquire(\$$1418_code_lock\);
          \$v746\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 2;\$$1418_code_write\ <= "00100" & \$v746\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET747;
        end if;
      when Q_WAIT700 =>
        \$v701\ := \$$1418_code_lock\;
        if \$v701\(0) = '1' then
          state := Q_WAIT700;
        else
          acquire(\$$1418_code_lock\);
          \$v698\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 14;\$$1418_code_write\ <= "10011" & \$v698\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET699;
        end if;
      when Q_WAIT704 =>
        \$v705\ := \$$1418_code_lock\;
        if \$v705\(0) = '1' then
          state := Q_WAIT704;
        else
          acquire(\$$1418_code_lock\);
          \$v702\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 13;\$$1418_code_write\ <= "00100" & \$v702\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET703;
        end if;
      when Q_WAIT708 =>
        \$v709\ := \$$1418_code_lock\;
        if \$v709\(0) = '1' then
          state := Q_WAIT708;
        else
          acquire(\$$1418_code_lock\);
          \$v706\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 12;\$$1418_code_write\ <= "00110" & \$v706\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET707;
        end if;
      when Q_WAIT712 =>
        \$v713\ := \$$1418_code_lock\;
        if \$v713\(0) = '1' then
          state := Q_WAIT712;
        else
          acquire(\$$1418_code_lock\);
          \$v710\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 11;\$$1418_code_write\ <= "00111" & \$v710\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET711;
        end if;
      when Q_WAIT716 =>
        \$v717\ := \$$1418_code_lock\;
        if \$v717\(0) = '1' then
          state := Q_WAIT716;
        else
          acquire(\$$1418_code_lock\);
          \$v714\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 10;\$$1418_code_write\ <= "00110" & \$v714\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET715;
        end if;
      when Q_WAIT720 =>
        \$v721\ := \$$1418_code_lock\;
        if \$v721\(0) = '1' then
          state := Q_WAIT720;
        else
          acquire(\$$1418_code_lock\);
          \$v718\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 9;\$$1418_code_write\ <= "00011" & \$v718\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET719;
        end if;
      when Q_WAIT724 =>
        \$v725\ := \$$1418_code_lock\;
        if \$v725\(0) = '1' then
          state := Q_WAIT724;
        else
          acquire(\$$1418_code_lock\);
          \$v722\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 8;\$$1418_code_write\ <= "01000" & \$v722\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET723;
        end if;
      when Q_WAIT728 =>
        \$v729\ := \$$1418_code_lock\;
        if \$v729\(0) = '1' then
          state := Q_WAIT728;
        else
          acquire(\$$1418_code_lock\);
          \$v726\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 7;\$$1418_code_write\ <= "00100" & \$v726\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET727;
        end if;
      when Q_WAIT732 =>
        \$v733\ := \$$1418_code_lock\;
        if \$v733\(0) = '1' then
          state := Q_WAIT732;
        else
          acquire(\$$1418_code_lock\);
          \$v730\ := X"0000000" & X"6";
          \$$1418_code_ptr_write\ <= 6;\$$1418_code_write\ <= "00000" & \$v730\&X"00000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET731;
        end if;
      when Q_WAIT736 =>
        \$v737\ := \$$1418_code_lock\;
        if \$v737\(0) = '1' then
          state := Q_WAIT736;
        else
          acquire(\$$1418_code_lock\);
          \$v734\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 5;\$$1418_code_write\ <= "00111" & \$v734\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET735;
        end if;
      when Q_WAIT740 =>
        \$v741\ := \$$1418_code_lock\;
        if \$v741\(0) = '1' then
          state := Q_WAIT740;
        else
          acquire(\$$1418_code_lock\);
          \$v738\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 4;\$$1418_code_write\ <= "00110" & \$v738\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET739;
        end if;
      when Q_WAIT744 =>
        \$v745\ := \$$1418_code_lock\;
        if \$v745\(0) = '1' then
          state := Q_WAIT744;
        else
          acquire(\$$1418_code_lock\);
          \$v742\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 3;\$$1418_code_write\ <= "00011" & \$v742\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET743;
        end if;
      when Q_WAIT748 =>
        \$v749\ := \$$1418_code_lock\;
        if \$v749\(0) = '1' then
          state := Q_WAIT748;
        else
          acquire(\$$1418_code_lock\);
          \$v746\ := eclat_unit;
          \$$1418_code_ptr_write\ <= 2;\$$1418_code_write\ <= "00100" & \$v746\&"000"& X"000000000000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET747;
        end if;
      when Q_WAIT752 =>
        \$v753\ := \$$1418_code_lock\;
        if \$v753\(0) = '1' then
          state := Q_WAIT752;
        else
          acquire(\$$1418_code_lock\);
          \$v750\ := X"0000000" & X"9";
          \$$1418_code_ptr_write\ <= 1;\$$1418_code_write\ <= "01010" & \$v750\&X"00000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET751;
        end if;
      when IDLE582 =>
        rdy581 := eclat_false;
        \$v753\ := \$$1418_code_lock\;
        if \$v753\(0) = '1' then
          state := Q_WAIT752;
        else
          acquire(\$$1418_code_lock\);
          \$v750\ := X"0000000" & X"9";
          \$$1418_code_ptr_write\ <= 1;\$$1418_code_write\ <= "01010" & \$v750\&X"00000000"; \$$1418_code_write_request\ <= '1';
          state := PAUSE_SET751;
        end if;
      end case;
      \state%next\ <= state;
      \state_var754%next\ <= state_var754;
      \$1737%next\ <= \$1737\;
      \$1712_result%next\ <= \$1712_result\;
      \$1767_v%next\ <= \$1767_v\;
      \$1754_y%next\ <= \$1754_y\;
      \$v604%next\ <= \$v604\;
      \$v592%next\ <= \$v592\;
      \$1759_x%next\ <= \$1759_x\;
      \$1743_x%next\ <= \$1743_x\;
      \rdy581%next\ <= rdy581;
      \$1766_b%next\ <= \$1766_b\;
      \$v605%next\ <= \$v605\;
      \$v653%next\ <= \$v653\;
      \$v691%next\ <= \$v691\;
      \$1712_id%next\ <= \$1712_id\;
      \$v722%next\ <= \$v722\;
      \$1732_y%next\ <= \$1732_y\;
      \$v688%next\ <= \$v688\;
      \$1735%next\ <= \$1735\;
      \$v586%next\ <= \$v586\;
      \$v656%next\ <= \$v656\;
      \$v710%next\ <= \$v710\;
      \$1698_w%next\ <= \$1698_w\;
      \$1724_w%next\ <= \$1724_w\;
      \$1729%next\ <= \$1729\;
      \$v595%next\ <= \$v595\;
      \$v696%next\ <= \$v696\;
      \$1700_w%next\ <= \$1700_w\;
      \$v745%next\ <= \$v745\;
      \result580%next\ <= result580;
      \$1761%next\ <= \$1761\;
      \$1708%next\ <= \$1708\;
      \$1707%next\ <= \$1707\;
      \$v742%next\ <= \$v742\;
      \$1691_w%next\ <= \$1691_w\;
      \$1723_w%next\ <= \$1723_w\;
      \$v635%next\ <= \$v635\;
      \$v598%next\ <= \$v598\;
      \$v750%next\ <= \$v750\;
      \$1721_a%next\ <= \$1721_a\;
      \$v749%next\ <= \$v749\;
      \$1753%next\ <= \$1753\;
      \$1751_x%next\ <= \$1751_x\;
      \$v683%next\ <= \$v683\;
      \$v611%next\ <= \$v611\;
      \$1699_w%next\ <= \$1699_w\;
      \$v617%next\ <= \$v617\;
      \$v721%next\ <= \$v721\;
      \$v702%next\ <= \$v702\;
      \$v714%next\ <= \$v714\;
      \$1748_w%next\ <= \$1748_w\;
      \$v650%next\ <= \$v650\;
      \$v671%next\ <= \$v671\;
      \$1757%next\ <= \$1757\;
      \$v668%next\ <= \$v668\;
      \$v578%next\ <= \$v578\;
      \$v746%next\ <= \$v746\;
      \$1705%next\ <= \$1705\;
      \$1765%next\ <= \$1765\;
      \$1720%next\ <= \$1720\;
      \$1749%next\ <= \$1749\;
      \$1741%next\ <= \$1741\;
      \$1733_x%next\ <= \$1733_x\;
      \$v693%next\ <= \$v693\;
      \$v726%next\ <= \$v726\;
      \$v589%next\ <= \$v589\;
      \$1690_w%next\ <= \$1690_w\;
      \$v730%next\ <= \$v730\;
      \$v738%next\ <= \$v738\;
      \$1764_w%next\ <= \$1764_w\;
      \$v677%next\ <= \$v677\;
      \$1727%next\ <= \$1727\;
      \$v680%next\ <= \$v680\;
      \rdy584%next\ <= rdy584;
      \$v620%next\ <= \$v620\;
      \$1689_w%next\ <= \$1689_w\;
      \$v638%next\ <= \$v638\;
      \$v629%next\ <= \$v629\;
      \$1695_w%next\ <= \$1695_w\;
      \$1692_w%next\ <= \$1692_w\;
      \$1696_w%next\ <= \$1696_w\;
      \$1758_y%next\ <= \$1758_y\;
      \$v665%next\ <= \$v665\;
      \$1697_w%next\ <= \$1697_w\;
      \$1725_n%next\ <= \$1725_n\;
      \$v644%next\ <= \$v644\;
      \$1762_y%next\ <= \$1762_y\;
      \$1712_arg%next\ <= \$1712_arg\;
      \$1728_v%next\ <= \$1728_v\;
      \$1718_arg%next\ <= \$1718_arg\;
      \$1760_w%next\ <= \$1760_w\;
      \$v641%next\ <= \$v641\;
      \$1738_y%next\ <= \$1738_y\;
      \$v713%next\ <= \$v713\;
      \$1716%next\ <= \$1716\;
      \$1731%next\ <= \$1731\;
      \$1745%next\ <= \$1745\;
      \$v662%next\ <= \$v662\;
      \$1750_y%next\ <= \$1750_y\;
      \$1746_y%next\ <= \$1746_y\;
      \result583%next\ <= result583;
      \$v701%next\ <= \$v701\;
      \$1744_w%next\ <= \$1744_w\;
      \$1709_id%next\ <= \$1709_id\;
      \$v686%next\ <= \$v686\;
      \$v626%next\ <= \$v626\;
      \$v692%next\ <= \$v692\;
      \$v717%next\ <= \$v717\;
      \$1701_w%next\ <= \$1701_w\;
      \$1709_arg%next\ <= \$1709_arg\;
      \$1752_w%next\ <= \$1752_w\;
      \$1715%next\ <= \$1715\;
      \$1688_w%next\ <= \$1688_w\;
      \$1693_w%next\ <= \$1693_w\;
      \$1694_w%next\ <= \$1694_w\;
      \$1709_result%next\ <= \$1709_result\;
      \$v659%next\ <= \$v659\;
      \$v698%next\ <= \$v698\;
      \$1734_w%next\ <= \$1734_w\;
      \$1739_x%next\ <= \$1739_x\;
      \$v729%next\ <= \$v729\;
      \$v674%next\ <= \$v674\;
      \$v705%next\ <= \$v705\;
      \$v737%next\ <= \$v737\;
      \$v718%next\ <= \$v718\;
      \$1755_x%next\ <= \$1755_x\;
      \$1742_y%next\ <= \$1742_y\;
      \$1722_b%next\ <= \$1722_b\;
      \$v741%next\ <= \$v741\;
      \$v647%next\ <= \$v647\;
      \$v706%next\ <= \$v706\;
      \$v614%next\ <= \$v614\;
      \$v725%next\ <= \$v725\;
      \$1726%next\ <= \$1726\;
      \$1747_x%next\ <= \$1747_x\;
      \$1756_w%next\ <= \$1756_w\;
      \$v709%next\ <= \$v709\;
      \$1703_cy%next\ <= \$1703_cy\;
      \$1706%next\ <= \$1706\;
      \$1736_w%next\ <= \$1736_w\;
      \$v623%next\ <= \$v623\;
      \$1717%next\ <= \$1717\;
      \$1740_w%next\ <= \$1740_w\;
      \$v608%next\ <= \$v608\;
      \$v734%next\ <= \$v734\;
      \$1704%next\ <= \$1704\;
      \$v632%next\ <= \$v632\;
      \$1768%next\ <= \$1768\;
      \$v753%next\ <= \$v753\;
      \$1730_v%next\ <= \$1730_v\;
      \$v733%next\ <= \$v733\;
      \$1763_x%next\ <= \$1763_x\;
      \$v601%next\ <= \$v601\;
      \$1719_code_ptr%next\ <= \$1719_code_ptr\;
      \$$1418_code_lock%next\ <= \$$1418_code_lock\;
      \$$1433_code_lock%next\ <= \$$1433_code_lock\;
      \$$1454_stack_lock%next\ <= \$$1454_stack_lock\;
      
      
      result <= result580;
      end process;
  end architecture;
