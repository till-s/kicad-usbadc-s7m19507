----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:12:45 08/24/2021 
-- Design Name: 
-- Module Name:    top - rtl 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity top is
   port (
      IO_0         : in    std_logic;
      IO_L05_P_0   : inout std_logic := 'Z';
      IO_L05_N_0   : inout std_logic := 'Z';

      IO_L01_N_2   : inout std_logic := 'Z';
      IO_L02_N_2   : inout std_logic := 'Z';
      IO_L03_P_2   : inout std_logic := 'Z';
      IO_L04_P_2   : inout std_logic := 'Z';
      IO_L03_N_2   : inout std_logic := 'Z';
      IO_L04_N_2   : inout std_logic := 'Z';
      IO_L05_P_2   : inout std_logic := 'Z';
      IO_L06_P_2   : inout std_logic := 'Z';
      IO_L05_N_2   : inout std_logic := 'Z';
      IO_L06_N_2   : inout std_logic := 'Z';
      IO_L07_P_2   : inout std_logic := 'Z';
      IO_L07_N_2   : inout std_logic := 'Z';
      IO_L08_P_2   : inout std_logic := 'Z';
      IO_L08_N_2   : inout std_logic := 'Z';
      IO_L09_P_2   : inout std_logic := 'Z';
      IO_L09_N_2   : inout std_logic := 'Z';
      IO_2         : inout std_logic := 'Z';
      IO_L10_P_2   : inout std_logic := 'Z';
      IO_L10_N_2   : inout std_logic := 'Z';
      IO_L11_P_2   : inout std_logic := 'Z';
      IO_L11_N_2   : inout std_logic := 'Z';
      IO_L12_P_2   : inout std_logic := 'Z';
      IO_L12_N_2   : inout std_logic := 'Z';

      IO_L01_P_3   : inout std_logic := 'Z';
      IO_L01_N_3   : inout std_logic := 'Z';
      IO_L02_P_3   : inout std_logic := 'Z';
      IO_L02_N_3   : inout std_logic := 'Z';
      IP_3         : inout std_logic := 'Z';
      IO_L03_P_3   : inout std_logic := 'Z';
      IO_L03_N_3   : inout std_logic := 'Z';
      IO_L04_P_3   : inout std_logic := 'Z';
      IO_L04_N_3   : inout std_logic := 'Z';
      IO_L05_P_3   : inout std_logic := 'Z';
      IO_L05_N_3   : inout std_logic := 'Z';
      IO_L06_P_3   : inout std_logic := 'Z';
      IO_L06_N_3   : inout std_logic := 'Z'

   );
end top;

architecture rtl of top is
   
   constant NUM_LED_C : natural := 5;

   signal led         : std_logic_vector(NUM_LED_C - 1 downto 0) := (others => '1');

   signal fifoData_i  : std_logic_vector(7 downto 0);
   signal fifoData_o  : std_logic_vector(7 downto 0) := (others => '0');
   signal fifoData_t  : std_logic_vector(7 downto 0) := (others => '1');

   signal fifoWR      : std_logic := '0';
   signal fifoRDb     : std_logic := '1';
   signal fifoTXFull  : std_logic;
   signal fifoRXEmpty : std_logic;
   signal fifoSiWu    : std_logic := '1'; -- "flush fifo to PC" when low
   
   signal TP1_t       : std_logic := '1';
   signal TP1_o       : std_logic := '0';
   signal TP1_i       : std_logic;

   signal fifoClk     : std_logic;
   signal fifoRst     : std_logic := '0';

   signal sda_i       : std_logic;
   signal sda_t       : std_logic := '1';
   signal scl_i       : std_logic;
   signal scl_t       : std_logic := '1';

   signal cnt         : unsigned(23 downto 0) := (others => '0');

begin

   fifoClk    <= IO_0;

--TS   -- FIFO
--TS   U_FIFO_BUF : entity work.IOBufArray
--TS      generic map (
--TS         WIDTH_G => 8
--TS      )
--TS      port map (
--TS         i     => fifoData_i,
--TS         o     => fifoData_o,
--TS         t     => fifoData_t,
--TS         io(0) => IO_L06_N_3,
--TS         io(1) => IO_L04_N_3,
--TS         io(2) => IO_L05_P_3,
--TS         io(3) => IO_L02_N_3,
--TS         io(4) => IO_L05_N_3,
--TS         io(5) => IO_L03_N_3,
--TS         io(6) => IO_L03_P_3,
--TS         io(7) => IO_L04_P_3
--TS      );
--TS
--TS   IO_L01_P_3  <= fifoWR;
--TS   IO_L01_N_3  <= fifoRDb;
--TS   IO_L02_P_3  <= fifoSiWu;
--TS   fifoTXFull  <= IP_3;
--TS   fifoRXEmpty <= IO_L06_P_3;

   IO_L08_N_2 <= led(4);
   IO_L08_P_2 <= led(3);
   IO_L10_N_2 <= led(2);
   IO_L09_N_2 <= led(1);
   IO_L11_P_2 <= led(0);

--TS   IO_L10_P_2 <= 'Z' when TP1_t = '1' else TP1_o;
--TS   TP1_i      <= IO_L10_P_2;
--TS
--TS   IO_L05_P_0 <= 'Z' when sda_t = '1' else '0';
--TS   sda_i      <= IO_L05_P_0;
--TS   IO_L05_N_0 <= 'Z' when scl_t = '1' else '0';
--TS   scl_i      <= IO_L05_N_0;
--TS
--TS   GEN_FIFO_TST : if ( true ) generate
--TS      signal fifoVld   : std_logic;
--TS      signal fifoRDat  : std_logic_vector(7 downto 0);
--TS      signal fifoRDatR : std_logic_vector(7 downto 0) := x"55";
--TS      signal fifoRRdy  : std_logic := '1';
--TS      signal fifoRVld  : std_logic;
--TS
--TS      signal fifoWDat  : std_logic_vector(7 downto 0) := x"00";
--TS      signal fifoWRdy  : std_logic;
--TS      signal fifoWVld  : std_logic := '0';
--TS   begin
--TS
--TS   P_REG : process ( fifoClk ) is
--TS   begin
--TS      if ( rising_edge( fifoClk ) ) then
--TS         if ( fifoVld = '1' ) then
--TS            fifoRDatR <= fifoRDat;
--TS         end if;
--TS         cnt <= cnt + 1;
--TS      end if;
--TS   end process P_REG;
--TS
--TS   led(4 downto 2) <= fifoRDatR(4 downto 2);
--TS   led(1)          <= '1';
--TS   led(0)          <= cnt(23);
--TS
--TS   U_FIFO_IF : entity work.Ft240Fifo
--TS      generic map (
--TS         CLOCK_FREQ_G => 24.0E6
--TS      )
--TS      port map (
--TS         clk     => fifoClk,
--TS         rst     => fifoRst,
--TS
--TS         fifoRXE => fifoRXEmpty,
--TS         fifoRDT => fifoData_i,
--TS         fifoRDb => fifoRDb,
--TS
--TS         fifoTXF => fifoTXFull,
--TS         fifoWDT => fifoData_o,
--TS         fifoWR  => fifoWR,
--TS
--TS         fifoIOT => open,
--TS
--TS         rdat    => fifoRDat,
--TS         rvld    => fifoRVld,
--TS         rrdy    => fifoRRdy,
--TS
--TS         wdat    => fifoWDat,
--TS         wvld    => fifoWVld,
--TS         wrdy    => fifoWRdy
--TS      );
--TS
--TS      fifoRRdy <= '1';
--TS      fifoWVld <= '0';
--TS
--TS   end generate GEN_FIFO_TST;

end rtl;
