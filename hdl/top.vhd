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
library unisim;
use unisim.vcomponents.all;

use work.CommandMuxPkg.all;

entity top is
   generic (
      GEN_ICAP_G   : boolean         := false
   );
   port (
      IO_0         : in    std_logic;
      IO_L02_P_0   : in    std_logic;
      IO_L02_N_0   : in    std_logic;
      IP_0         : in    std_logic := 'H';

      IO_L03_N_0   : inout std_logic := 'Z';
      IO_L04_P_0   : inout std_logic := 'Z';
      IO_L04_N_0   : inout std_logic := 'Z';

      IO_L05_P_0   : inout std_logic := 'Z';
      IO_L05_N_0   : inout std_logic := 'Z';
      IO_L06_P_0   : inout std_logic := 'Z';

      IO_L01_P_1   : inout std_logic := 'Z';
      IO_L01_N_1   : inout std_logic := 'Z';
      IO_L02_P_1   : inout std_logic := 'Z';
      IO_L02_N_1   : inout std_logic := 'Z';
      IO_L03_P_1   : inout std_logic := 'Z';
      IO_L03_N_1   : inout std_logic := 'Z';
      IO_L04_P_1   : inout std_logic := 'Z';
      IO_L04_N_1   : inout std_logic := 'Z';
      IO_L05_P_1   : inout std_logic := 'Z';
      IO_L05_N_1   : inout std_logic := 'Z';
      IO_L06_P_1   : inout std_logic := 'Z';
      IO_L06_N_1   : inout std_logic := 'Z';

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
   constant GEN_ILA_C      : boolean         := false;
   constant GEN_ICAP_ILA_C : boolean         := false;

   constant BB_INIT_C : std_logic_vector(7 downto 0) := x"F1";

   signal led         : std_logic_vector(NUM_LED_C - 1 downto 0) := (others => '1');

   signal J12B        : std_logic;

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

   signal chnlAClk    : std_logic;
   signal chnlBClk    : std_logic;

   signal sda_i       : std_logic;
   signal sda_t       : std_logic := '1';
   signal scl_i       : std_logic;
   signal scl_t       : std_logic := '1';

   signal spi_sck     : std_logic := '0';
   signal spi_csb     : std_logic := '1';
   signal spi_mosi    : std_logic := '0';
   signal spi_miso    : std_logic;

   signal adc_i       : std_logic_vector(7 downto 0);
   signal adc_o       : std_logic_vector(7 downto 0);
   signal adc_t       : std_logic_vector(7 downto 0) := (others => '0');
   signal adcDor_i    : std_logic;
   signal adcDClk     : std_logic;
   signal adcDRst     : std_logic := '0';
   signal adcSClk     : std_logic := '0';
   signal adcSD_i     : std_logic := '0';
   signal adcSD_o     : std_logic := '0';
   signal adcSD_t     : std_logic := '1';
   signal adcSCSb     : std_logic := '1';

   signal pgaSClk     : std_logic := '0';
   signal pgaSDI      : std_logic := '0';
   signal pgaSDO      : std_logic := '0';
   signal pgaSCSb     : std_logic := '1';


   signal bbi         : std_logic_vector( 7 downto 0) := (others => '0');
   signal bbo         : std_logic_vector( 7 downto 0) := BB_INIT_C;

   -- when ioDir is low then ioDat is an input otherwise an output
   signal ioDir_i     : std_logic;
   signal ioDir_o     : std_logic := '0';
   signal ioDir_t     : std_logic := '1';

   signal ioDat_i     : std_logic;
   signal ioDat_o     : std_logic := '0';
   signal ioDat_t     : std_logic := '1';

   signal cnt         : unsigned(23 downto 0) := (others => '0');
   signal pllCnt      : unsigned(25 downto 0) := (others => '0');
   signal dumCnt      : unsigned(25 downto 0) := (others => '0');

   signal multiBoot   : std_logic := '0';

   component ila_1br is
      PORT (
         CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
         CLK     : IN STD_LOGIC;
         TRIG0   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         TRIG1   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         TRIG2   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         TRIG3   : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
   end component ila_1br;

   component chipscope_icon is
      PORT (
         control0 : out std_logic_vector(35 downto 0)
      );
   end component chipscope_icon;

   signal ila_trg0 : std_logic_vector( 7 downto 0) := (others => '0');
   signal ila_trg1 : std_logic_vector( 7 downto 0) := (others => '0');
   signal ila_trg2 : std_logic_vector( 7 downto 0) := (others => '0');
   signal ila_trg3 : std_logic_vector( 7 downto 0) := (others => '0');

begin

   fifoClk    <= IO_0;
   pllClk     <= IO_L02_N_0;
   adcDClk    <= IO_L02_P_0;

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

   IO_L05_N_1 <= 'Z' when ioDir_t = '1' else ioDir_o;
   ioDir_i    <= IO_L05_N_1;

   IO_L06_P_1 <= 'Z' when ioDat_t = '1' else ioDat_o;
   ioDat_i    <= IO_L06_P_1;

   ioDir_t    <= '0';
   ioDat_t    <= not ioDir_o;

   P_REG : process ( fifoClk ) is
   begin
      if ( rising_edge( fifoClk ) ) then
         cnt <= cnt + 1;
      end if;
   end process P_REG;

   P_REGA : process ( chnlAClk ) is
   begin
      if ( rising_edge( chnlAClk ) ) then
         pllCnt <= pllCnt + 1;
      end if;
   end process P_REGA;

   P_REGB : process ( chnlAClk ) is
   begin
      if ( falling_edge( chnlAClk ) ) then
         dumCnt <= dumCnt + 1;
      end if;
   end process P_REGB;
  
   led(4 downto 2) <= fifoRDat(4 downto 2);
   led(1)          <= pllCnt(pllCnt'left);
   led(0)          <= cnt(cnt'left);

   -- ADC
   adcDor_i        <= IO_L04_P_1;

   adc_i(0) <= IO_L05_P_1;
   adc_i(1) <= IO_L04_N_1;
   adc_i(2) <= IO_L03_N_1;
   adc_i(3) <= IO_L03_P_1;
   adc_i(4) <= IO_L02_N_1;
   adc_i(5) <= IO_L02_P_1;
   adc_i(6) <= IO_L01_N_1;
   adc_i(7) <= IO_L01_P_1;

   IO_L05_P_1 <= adc_o(0);
   IO_L04_N_1 <= adc_o(1);
   IO_L03_N_1 <= adc_o(2);
   IO_L03_P_1 <= adc_o(3);
   IO_L02_N_1 <= adc_o(4);
   IO_L02_P_1 <= adc_o(5);
   IO_L01_N_1 <= adc_o(6);
   IO_L01_P_1 <= adc_o(7);

   GEN_ODDR : for i in 0 to 7 generate
      U_BUF  : component OBUF
         port map (
            I => adc_t(i), O => adc_o(i)
         );
      U_ODDR : component ODDR2
         port map (
            Q   => adc_t(i),
            C0  => chnlAClk,
            C1  => not chnlAClk,
            D0  => pllCnt(i),
            D1  => dumCnt(i+1),
            R   => '0',
            S   => '0'
         );
   end generate GEN_ODDR;

   IO_L03_N_0      <= adcSCSb;
   IO_L04_P_0      <= adcSClk;
   IO_L04_N_0      <= 'Z' when adcSD_t = '1' else adcSD_o;
   adcSD_i         <= IO_L04_N_0;

   -- PGA
   IO_L09_P_2      <= pgaSCSb;
   IO_L07_N_2      <= pgaSClk;
   IO_L07_P_2      <= pgaSDO;
   pgaSDI          <= IO_L06_N_2;

   J12B            <= IP_0;

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
   ila_trg0(6) <= fifoWVld;
   ila_trg0(7) <= fifoWRdy;

   ila_trg1    <= fifoRDat;
   ila_trg2    <= fifoWDat;

   GEN_ILA : if ( GEN_ILA_C ) generate

      U_ILA : entity work.ILAWrapper
         port map(
            clk   => fifoClk,
            trg0  => ila_trg0,
            trg1  => ila_trg1,
            trg2  => ila_trg2,
            trg3  => ila_trg3
         );

   end generate GEN_ILA;

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

      constant BB_SPI_T_C    : natural := 6;
      constant BB_XXX_XXX_C  : natural := 7;

      signal   subCmdBB      : SubCommandBBType;

   begin

      spi_sck           <= bbo(BB_SPI_SCK_C);
      spi_mosi          <= bbo(BB_SPI_MSO_C);

      adcSClk           <= bbo(BB_SPI_SCK_C);
      adcSD_o           <= bbo(BB_SPI_MSO_C);


      sda_t             <= bbo(BB_I2C_SDA_C);
      scl_t             <= bbo(BB_I2C_SCL_C);

      bbi(BB_I2C_SDA_C) <= sda_i;
      bbi(BB_I2C_SCL_C) <= scl_i;

      bbi(BB_SPI_SCK_C) <= bbo(BB_SPI_SCK_C);
      bbi(BB_SPI_CSb_C) <= bbo(BB_SPI_CSb_C);
      bbi(BB_SPI_MSO_C) <= bbo(BB_SPI_MSO_C);

      bbi(BB_SPI_T_C  ) <= '0';
      bbi(BB_XXX_XXX_C) <= bbi(BB_XXX_XXX_C);

      P_SPI_CS_MUX : process ( subCmdBB, bbo, spi_miso, adcSD_i, pgaSDI ) is
      begin

         spi_csb <= '1';
         adcSCSb <= '1';
         pgaSCSb <= '1';
         adcSD_t <= '1';

         case ( subCmdBB ) is
            when CMD_BB_SPI_ROM_C  =>
               spi_csb           <= bbo(BB_SPI_CSb_C);
               bbi(BB_SPI_MSI_C) <= spi_miso;
            when CMD_BB_SPI_ADC_C  =>
               adcSCSb           <= bbo(BB_SPI_CSb_C);
               adcSD_t           <= bbo(BB_SPI_T_C  );
               bbi(BB_SPI_MSI_C) <= adcSD_i;
            when CMD_BB_SPI_PGA_C  =>
               pgaSCSb           <= bbo(BB_SPI_CSb_C);
               bbi(BB_SPI_MSI_C) <= pgaSDI;
            when others    =>
               bbi(BB_SPI_MSI_C) <= '0';
         end case;
      end process P_SPI_CS_MUX;

      U_COMMAND_WRAPPER : entity work.CommandWrapper
         generic map (
            I2C_SCL_G    => BB_I2C_SCL_C,
            BBO_INIT_G   => BB_INIT_C,
            -- can't infer 3*1024, unfortunately; would have to hand code...
            MEM_DEPTH_G  => (2*1024),
            FIFO_FREQ_G  => FIFO_CLOCK_FREQ_C
         )
         port map (
            clk          => fifoClk, 
            rst          => fifoRst, 
            
            datIb        => fifoRDat,
            vldIb        => fifoRVld,
            rdyIb        => fifoRRdy,

            datOb        => fifoWDat,
            vldOb        => fifoWVld,
            rdyOb        => fifoWRdy,

            bbo          => bbo,
            bbi          => bbi,
            subCmdBB     => subCmdBB,

            adcClk       => pllClk,
            adcRst       => pllRst,

            adcDataDDR   => adc_i,
            chnlAClk     => chnlAClk,
            chnlBClk     => chnlBClk
         );

   end generate GEN_BITBANG;


   GEN_ICAP : if ( GEN_ICAP_G ) generate

      subtype  IcapSlv      is std_logic_vector(7 downto 0);
      type     IcapSlvArray is array (natural range <>) of IcapSlv;

	  constant ICAP_WAIT_C   : integer := 4;

      constant ICAP_PROG_C   : IcapSlvArray (12 downto 1) := (
         -- UG332
         x"FF", -- Dummy      (hi)
         x"FF", --            (lo)
         x"AA", -- SYNC       (hi)
         x"99", --            (lo)
         x"30", -- CMD        (hi)
         x"A1", --            (lo)
         x"00", -- REBOOT     (hi)
         x"0E", --            (lo)
         x"20", -- NOOP       (hi)
         x"00", --            (lo)
         x"20", -- NOOP       (hi)
         x"00"  --            (lo)
      );

      constant ICAP_IDX_INIT_C : integer := ICAP_WAIT_C + ICAP_PROG_C'left;

      subtype  IcapIdxType  is integer range ICAP_IDX_INIT_C downto 0;

      signal icapCEb         : std_ulogic                   := '0';
      signal icapDin         : std_logic_vector(7 downto 0) := (others => '1');
      signal icapDou         : std_logic_vector(7 downto 0);
      signal icapWRb         : std_ulogic                   := '0';
      signal icapBSY         : std_ulogic;

      signal icapIdx         : IcapIdxType := ICAP_IDX_INIT_C;

      signal icapIla0        : std_logic_vector(7 downto 0);
      signal icapIla1        : std_logic_vector(7 downto 0);
      signal icapIla2        : std_logic_vector(7 downto 0);
      signal icapIla3        : std_logic_vector(7 downto 0);

      signal J12BLoc         : std_logic;

   begin

      P_ICAP_COMB : process( icapIdx ) is
      begin
         if ( icapIdx >= ICAP_PROG_C'low  and icapIdx <= ICAP_PROG_C'high ) then
            icapDin <= ICAP_PROG_C(icapIdx)(7 downto 0);
            icapWRb <= '0';
            icapCEb <= '0';
         else
            icapDin <= x"FF";
            icapWRb <= '0';
            icapCEb <= '1';
         end if;
      end process P_ICAP_COMB;


      P_ICAP : process ( fifoClk ) is
      begin
         if ( rising_edge( fifoClk ) ) then
            if ( fifoRst = '1' ) then
               icapIdx <= ICAP_IDX_INIT_C;
            else
               if ( ( multiBoot or J12BLoc ) = '1' ) then
                  if ( icapIdx > 0 ) then
                     icapIdx <= icapIdx - 1;
                  end if;
               end if;
            end if;
         end if;
      end process P_ICAP;

      icapIla0 <= icapDin;
      icapIla1 <= icapDou;
      icapIla2 <= ( 0 => icapCEb, 1 => icapWRb, 2 => J12B, 7 => icapBSY, others => '0' );
      icapIla3 <= std_logic_vector( to_unsigned( icapIdx, 8 ) );

      GEN_ICAP_ILA : if ( GEN_ICAP_ILA_C ) generate

         P_JMP_HOLD : process ( fifoClk ) is
         begin
            if ( rising_edge( fifoClk ) ) then
               if ( J12B = '1' ) then
                  J12BLoc <= '1';
               end if;
            end if;
         end process P_JMP_HOLD;

         U_ILA : entity work.ILAWrapper
            port map(
               clk   => fifoClk,
               trg0  => icapIla0,
               trg1  => icapIla1,
               trg2  => icapIla2,
               trg3  => icapIla3
            );

      end generate GEN_ICAP_ILA;

      GEN_NO_ICAP_ILA : if ( not GEN_ICAP_ILA_C ) generate
         J12BLoc <= J12B;
      end generate GEN_NO_ICAP_ILA;

      U_ICAP : component ICAP_SPARTAN3A
         port map (
            BUSY  => icapBSY,    -- : out std_ulogic;
            CE    => icapCEb,    -- : in  std_ulogic;
            CLK   => fifoClk,    -- : in  std_ulogic;
            I(0)  => icapDin(7), -- : in  std_logic_vector(7 downto 0);
            I(1)  => icapDin(6), -- : in  std_logic_vector(7 downto 0);
            I(2)  => icapDin(5), -- : in  std_logic_vector(7 downto 0);
            I(3)  => icapDin(4), -- : in  std_logic_vector(7 downto 0);
            I(4)  => icapDin(3), -- : in  std_logic_vector(7 downto 0);
            I(5)  => icapDin(2), -- : in  std_logic_vector(7 downto 0);
            I(6)  => icapDin(1), -- : in  std_logic_vector(7 downto 0);
            I(7)  => icapDin(0), -- : in  std_logic_vector(7 downto 0);
            O(0)  => icapDou(7), -- : in  std_logic_vector(7 downto 0);
            O(1)  => icapDou(6), -- : in  std_logic_vector(7 downto 0);
            O(2)  => icapDou(5), -- : in  std_logic_vector(7 downto 0);
            O(3)  => icapDou(4), -- : in  std_logic_vector(7 downto 0);
            O(4)  => icapDou(3), -- : in  std_logic_vector(7 downto 0);
            O(5)  => icapDou(2), -- : in  std_logic_vector(7 downto 0);
            O(6)  => icapDou(1), -- : in  std_logic_vector(7 downto 0);
            O(7)  => icapDou(0), -- : in  std_logic_vector(7 downto 0);
            WRITE => icapWRb     -- : in  std_ulogic
         );
   end generate GEN_ICAP;

end rtl;
