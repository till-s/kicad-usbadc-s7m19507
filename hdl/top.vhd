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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.psi_common_array_pkg.all;
use work.psi_common_math_pkg.all;
use work.psi_common_logic_pkg.all;

use work.SimpleI2cMasterPkg.all;

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
   constant CNT_LEN_C : natural := 28;
   
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

   signal cnt         : unsigned(CNT_LEN_C - 1 downto 0) := to_unsigned( 0, CNT_LEN_C );
   
   signal fifoClk     : std_logic;
   signal fifoRst     : std_logic := '0';

   signal cmdVld      : std_logic;
   signal cmdRdy      : std_logic;
   signal cmdAck      : std_logic;
   signal cmdDat      : std_logic_vector(7 downto 0);
   signal cmdTyp      : std_logic_vector(2 downto 0);

   signal rspDat      : std_logic_vector(7 downto 0);
   signal rspVld      : std_logic;
   signal rspAck      : std_logic;

   component i2c_master is
      generic (
         RUNTIME_MODE_SEL : integer
      );
      port (
         clk          : in  std_logic;
         sda_in       : in  std_logic;
         sda_out      : out std_logic;
         scl_in       : in  std_logic;
         scl_out      : out std_logic;

         cmd          : in  std_logic_vector( 4 downto 0);
         stat_out     : out std_logic_vector( 7 downto 0);
         dat          : in  std_logic_vector( 7 downto 0);
         dat_out      : out std_logic_vector( 7 downto 0);
         ws           : in  std_logic;
         rst          : in  std_logic;
         mode         : in  std_logic_vector( 1 downto 0);
         debug        : out std_logic_vector(15 downto 0)
      );
   end component i2c_master;

   constant GEN_PSI_C : boolean := false;

begin

   fifoClk    <= IO_0;

   -- FIFO
   U_FIFO_BUF : entity work.IOBufArray
      generic map (
         WIDTH_G => 8
      )
      port map (
         i     => fifoData_i,
         o     => fifoData_o,
         t     => fifoData_t,
         io(0) => IO_L06_N_3,
         io(1) => IO_L04_N_3,
         io(2) => IO_L05_P_3,
         io(3) => IO_L02_N_3,
         io(4) => IO_L05_N_3,
         io(5) => IO_L03_N_3,
         io(6) => IO_L03_P_3,
         io(7) => IO_L04_P_3
      );

   IO_L01_P_3  <= fifoWR;
   IO_L01_N_3  <= fifoRDb;
   IO_L02_P_3  <= fifoSiWu;
   fifoTXFull  <= IP_3;
   fifoRXEmpty <= IO_L06_P_3;

--   IO_L08_N_2 <= led(4);
--   IO_L08_P_2 <= led(3);
   IO_L10_N_2 <= led(2);
--   IO_L09_N_2 <= led(1);
   IO_L11_P_2 <= led(0);
--   
   IO_L10_P_2 <= 'Z' when TP1_t = '1' else TP1_o;
   TP1_i      <= IO_L10_P_2;

GEN_PSI : if ( GEN_PSI_C ) generate
   U_DUT : entity work.psi_common_i2c_master
      generic map (
         ClockFrequency_g => 12.0E6,
         CmdTimeout_g     => 1.0e-3
      )
      port map (
         Clk              => fifoClk,
         Rst              => fifoRst,

         CmdRdy           => cmdRdy,
         CmdVld           => cmdVld,
         CmdType          => cmdTyp,
         CmdData          => cmdDat,
         CmdAck           => cmdAck,

         RspVld           => rspVld,
         RspType          => open,
         RspData          => rspDat,
         RspAck           => rspAck,
         RspArbLost       => open,
         RspSeq           => open,

         BusBusy          => open,
         TimeoutCmd       => open,

         I2cScl           => IO_L05_N_0,
         I2cSda           => IO_L05_P_0,

         I2cScl_I         => open,
         I2cScl_O         => open,
         I2cScl_T         => open,
         I2cSda_I         => open,
         I2cSda_O         => open,
         I2cSda_T         => open
      );

   cmdVld      <= IO_L01_N_2;
   IO_L02_N_2  <= cmdRdy;
   cmdAck      <= IO_L03_P_2;

   cmdTyp(2)   <= IO_L07_N_2;
   cmdTyp(1)   <= IO_L08_P_2;
   cmdTyp(0)   <= IO_L08_N_2;


   rspVld      <= IO_L09_P_2;
   rspAck      <= IO_L09_N_2;
end generate GEN_PSI;

GEN_VER : if ( not GEN_PSI_C ) generate
   signal sda_o, scl_o : std_logic;

   signal req          : I2cReqType;

begin

   IO_L05_P_0 <= 'Z' when sda_o = '1' else '0';
   IO_L05_N_0 <= 'Z' when scl_o = '1' else '0';

   req.start     <= IO_L09_P_2;
   req.cmd(0)    <= IO_L09_N_2;
   req.cmd(1)    <= IO_L07_N_2;
   req.stop      <= IO_L08_P_2;
   req.vld       <= IO_L08_N_2;
   req.wdat      <= cmdDat;

   IO_L02_N_2  <= cmdRdy;

   U_TST : entity work.SimpleI2cMaster
      generic map (
         BUS_FREQ_HZ_G => 12.0E6
      )
      port map (
         clk  => fifoClk,
         rst  => fifoRst,
         req  => req,
         rdy  => cmdRdy,
         rdat(0)          => IO_L03_P_2,
         rdat(8 downto 1) => rspDat,
         don  => IO_L01_N_2,

         sclInp => IO_L05_N_0,
         sclOut => scl_o,
         sdaInp => IO_L05_P_0,
         sdaOut => sda_o
      );
      

end generate GEN_VER;

   cmdDat(7)   <= IO_L04_P_2;
   cmdDat(6)   <= IO_L03_N_2;
   cmdDat(5)   <= IO_L04_N_2;
   cmdDat(4)   <= IO_L05_P_2;
   cmdDat(3)   <= IO_L06_P_2;
   cmdDat(2)   <= IO_L05_N_2;
   cmdDat(1)   <= IO_L06_N_2;
   cmdDat(0)   <= IO_L07_P_2;

   IO_L04_P_2  <= rspDat(7) when IO_2 = '1' else 'Z';
   IO_L03_N_2  <= rspDat(6) when IO_2 = '1' else 'Z';
   IO_L04_N_2  <= rspDat(5) when IO_2 = '1' else 'Z';
   IO_L05_P_2  <= rspDat(4) when IO_2 = '1' else 'Z';
   IO_L06_P_2  <= rspDat(3) when IO_2 = '1' else 'Z';
   IO_L05_N_2  <= rspDat(2) when IO_2 = '1' else 'Z';
   IO_L06_N_2  <= rspDat(1) when IO_2 = '1' else 'Z';
   IO_L07_P_2  <= rspDat(0) when IO_2 = '1' else 'Z';

end rtl;

