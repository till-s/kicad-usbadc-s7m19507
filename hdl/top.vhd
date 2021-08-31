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
      IO_L02_N_0   : in    std_logic;

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
   
   constant NUM_LED_C         : natural := 5;

   constant FIFO_CLOCK_FREQ_C : real := 24.0E6;

   type FifoVariantType is ( LOOPBACK, BITBANG );

   constant FIFO_VARIANT_C : FifoVariantType := BITBANG;

   constant BB_INIT_C : std_logic_vector(7 downto 0) := x"F1";

   signal led         : std_logic_vector(NUM_LED_C - 1 downto 0) := (others => '1');

   signal fifoData_i  : std_logic_vector(7 downto 0);
   signal fifoData_o  : std_logic_vector(7 downto 0) := (others => '0');
   signal fifoData_t  : std_logic_vector(7 downto 0) := (others => '1');

   signal fifoWR      : std_logic := '0';
   signal fifoRDb     : std_logic := '1';
   signal fifoTXFull  : std_logic;
   signal fifoRXEmpty : std_logic;
   signal fifoSiWu    : std_logic := '1'; -- "flush fifo to PC" when low
   signal fifoIOT     : std_logic := '1'; -- IO-buffer direction control

   signal fifoRDat    : std_logic_vector(7 downto 0);
   signal fifoRRdy    : std_logic := '1';
   signal fifoRVld    : std_logic;

   signal fifoWDat    : std_logic_vector(7 downto 0) := x"00";
   signal fifoWRdy    : std_logic;
   signal fifoWVld    : std_logic := '0';
   
   signal TP1_t       : std_logic := '1';
   signal TP1_o       : std_logic := '0';
   signal TP1_i       : std_logic;

   signal fifoClk     : std_logic;
   signal fifoRst     : std_logic := '0';

   signal pllClk      : std_logic;
   signal pllRst      : std_logic := '0';

   signal sda_i       : std_logic;
   signal sda_t       : std_logic := '1';
   signal scl_i       : std_logic;
   signal scl_t       : std_logic := '1';

   signal spi_sck     : std_logic := '0';
   signal spi_csb     : std_logic := '1';
   signal spi_mosi    : std_logic := '0';
   signal spi_miso    : std_logic;

   signal bbi         : std_logic_vector( 7 downto 0) := (others => '0');
   signal bbo         : std_logic_vector( 7 downto 0) := BB_INIT_C;

   signal cnt         : unsigned(23 downto 0) := (others => '0');
   signal pllCnt      : unsigned(25 downto 0) := (others => '0');
   signal fifoRDatR   : std_logic_vector(7 downto 0)  := BB_INIT_C;

   component chipscope_ila is
      PORT (
         CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
         CLK     : IN STD_LOGIC;
         TRIG0   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         TRIG1   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         TRIG2   : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
   end component chipscope_ila;

   component chipscope_icon is
      PORT (
         control0 : out std_logic_vector(35 downto 0)
      );
   end component chipscope_icon;

   signal ila_trg0 : std_logic_vector( 7 downto 0) := (others => '0');
   signal ila_trg1 : std_logic_vector( 7 downto 0) := (others => '0');
   signal ila_trg2 : std_logic_vector( 7 downto 0) := (others => '0');
   signal ila_ctrl : std_logic_vector(35 downto 0);

begin

   fifoClk    <= IO_0;
   pllClk     <= IO_L02_N_0;

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

   IO_L08_N_2 <= led(4);
   IO_L08_P_2 <= led(3);
   IO_L10_N_2 <= led(2);
   IO_L09_N_2 <= led(1);
   IO_L11_P_2 <= led(0);

   IO_L10_P_2 <= 'Z' when TP1_t = '1' else TP1_o;
   TP1_i      <= IO_L10_P_2;

   IO_L05_P_0 <= 'Z' when sda_t = '1' else '0';
   sda_i      <= IO_L05_P_0;
   IO_L05_N_0 <= 'Z' when scl_t = '1' else '0';
   scl_i      <= IO_L05_N_0;

   P_REG : process ( fifoClk ) is
   begin
      if ( rising_edge( fifoClk ) ) then
         if ( (fifoRVld and fifoRRdy) = '1' ) then
            fifoRDatR <= fifoRDat;
         end if;
         cnt <= cnt + 1;
      end if;
   end process P_REG;

   P_REG1 : process ( pllClk ) is
   begin
      if ( rising_edge( pllClk ) ) then
         pllCnt <= pllCnt + 1;
      end if;
   end process P_REG1;
 
   led(4 downto 2) <= fifoRDatR(4 downto 2);
   led(1)          <= pllCnt(pllCnt'left);
   led(0)          <= cnt(cnt'left);

   U_FIFO_IF : entity work.Ft240Fifo
      generic map (
         CLOCK_FREQ_G => FIFO_CLOCK_FREQ_C
      )
      port map (
         clk     => fifoClk,
         rst     => fifoRst,

         fifoRXE => fifoRXEmpty,
         fifoRDT => fifoData_i,
         fifoRDb => fifoRDb,

         fifoTXF => fifoTXFull,
         fifoWDT => fifoData_o,
         fifoWR  => fifoWR,

         fifoIOT => fifoIOT,

         rdat    => fifoRDat,
         rvld    => fifoRVld,
         rrdy    => fifoRRdy,

         wdat    => fifoWDat,
         wvld    => fifoWVld,
         wrdy    => fifoWRdy
      );

   ila_trg0(0) <= fifoRXEmpty;
   ila_trg0(1) <= fifoRDb;
   ila_trg0(2) <= fifoRVld;
   ila_trg0(3) <= fifoRRdy;

   ila_trg0(4) <= fifoTXFull;
   ila_trg0(5) <= fifoWR;
   ila_trg0(6) <= scl_i; --fifoWVld;
   ila_trg0(7) <= sda_i; --fifoWRdy;

   ila_trg1    <= fifoRDat;
   ila_trg2    <= fifoWDat;

   U_ICON : component chipscope_icon
      port map (
         control0 => ila_ctrl
      );

   U_ILA : component chipscope_ila
      port map(
         CONTROL => ila_ctrl,
         CLK     => fifoClk,
         TRIG0   => ila_trg0,
         TRIG1   => ila_trg1,
         TRIG2   => ila_trg2
      );

   fifoData_t <= (others => fifoIOT);

   IO_L02_N_2 <= spi_csb;
   IO_L12_N_2 <= spi_sck;
   IO_2       <= spi_mosi;
   IO_L11_N_2 <= 'Z'; -- spi MISO
   spi_miso   <= IO_L11_N_2;

   GEN_LOOPBACK : if ( FIFO_VARIANT_C = LOOPBACK ) generate

      -- FIFO Loopback
      fifoWDat   <= fifoRDat;
      fifoRRdy   <= fifoWRdy;
      fifoWVld   <= fifoRVld;

   end generate GEN_LOOPBACK;

   -- Bit-bang!
   GEN_BITBANG : if ( FIFO_VARIANT_C = BITBANG ) generate

      constant BB_SPI_CSb_C  : natural := 0;
      constant BB_SPI_SCK_C  : natural := 1;
      constant BB_SPI_MSO_C  : natural := 2;
      constant BB_SPI_MSI_C  : natural := 3;

      constant BB_I2C_SDA_C  : natural := 4;
      constant BB_I2C_SCL_C  : natural := 5;

      constant BB_I2C_MOD_C  : natural := 6;

      constant I2C_HPER_C    : integer := integer( ceil ( 1.0*FIFO_CLOCK_FREQ_C/1.0E5/2.0 ) ) - 1;
      constant I2C_TIMO_C    : integer := integer( ceil ( 0.2*FIFO_CLOCK_FREQ_C ) ) - 1;
      constant I2C_LD_TIMO_C : integer := integer( floor( log2( real( I2C_TIMO_C ) ) ) )  + 1;

      signal   i2c_timo      : unsigned(I2C_LD_TIMO_C - 1 downto 0) := (others => '0');

   begin


      bbo               <= fifoRDatR;

      spi_csb           <= bbo(BB_SPI_CSb_C);
      spi_sck           <= bbo(BB_SPI_SCK_C);
      spi_mosi          <= bbo(BB_SPI_MSO_C);

      bbi(BB_SPI_CSb_C) <= IO_L02_N_2;
      bbi(BB_SPI_SCK_C) <= IO_L12_N_2;
      bbi(BB_SPI_MSO_C) <= IO_2;
      bbi(BB_SPI_MSI_C) <= spi_miso;

      sda_t             <= bbo(BB_I2C_SDA_C);
      scl_t             <= bbo(BB_I2C_SCL_C);

      bbi(BB_I2C_SDA_C) <= sda_i;

      bbi(BB_I2C_MOD_C) <= bbo(BB_I2C_MOD_C);

      -- due to clock stretching SCL input may be asynchronous
      U_SCLI_SYNC : entity work.SynchronizerBit
         generic map (
            RSTPOL_G    => '1'
         )
         port map (
            clk         => fifoClk,
            rst         => fifoRst,
            datInp(0)   => scl_i,
            datOut(0)   => bbi(BB_I2C_SCL_C)
         );

      P_BITBANG : process ( fifoClk ) is
      begin
         if ( rising_edge( fifoClk ) ) then

            i2c_timo <= i2c_timo - 1;

            -- if i2c_timeo is already 0 then this logic reverts the decrement
            if ( i2c_timo < (I2C_TIMO_C - I2C_HPER_C) ) then
               if ( (bbo(BB_I2C_SCL_C) = bbi(BB_I2C_SCL_C)) or (i2c_timo = 0) ) then
                  fifoRRdy <= '1';
                  i2c_timo <= (others => '0');
               else
               end if;
            end if;

            if ( fifoRRdy = '1' and fifoRVld = '1' ) then
               -- record inputs
               fifoWDat <= bbi;
               fifoWVld <= '1';
               if ( bbo(BB_I2C_MOD_C) = '0' ) then
                  fifoRRdy <= '0';
                  i2c_timo <= to_unsigned(I2C_TIMO_C, i2c_timo'length);
               end if;
            end if;
            if ( fifoWRdy = '1' and fifoWVld = '1' ) then
               fifoWVld <= '0';
            end if;

         end if;
      end process P_BITBANG;

   end generate GEN_BITBANG;

end rtl;
