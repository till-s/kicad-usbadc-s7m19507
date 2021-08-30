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
      IO_N06_N_0   : out   std_logic := '1';
      IO_L08_P_2   : out   std_logic := 'Z';
      IO_L08_N_2   : out   std_logic := 'Z';
      IO_L09_N_2   : out   std_logic := 'Z';
      IO_L10_N_2   : out   std_logic := 'Z';
      IO_L11_P_2   : out   std_logic := 'Z'
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

   IO_L08_N_2 <= led(4);
   IO_L08_P_2 <= led(3);
   IO_L10_N_2 <= led(2);
   IO_L09_N_2 <= led(1);
   IO_L11_P_2 <= led(0);

   IO_N06_N_0 <= '1';

   led(0) <= '0';

end rtl;
