library ieee;
use ieee.std_logic_1164.all;

entity IOBufArray is
   generic (
      WIDTH_G : positive
   );
   port (
      i  : out   std_logic_vector(WIDTH_G - 1 downto 0);
      o  : in    std_logic_vector(WIDTH_G - 1 downto 0);
      t  : in    std_logic_vector(WIDTH_G - 1 downto 0);
      io : inout std_logic_vector(WIDTH_G - 1 downto 0)
   );
end entity IOBufArray;

architecture rtl of IOBufArray is
begin

   GEN_BUFS : for n in o'range generate
      io(n) <= 'Z' when t(n) = '1' else o(n);
      i(n)  <= io(n);
   end generate;

end architecture rtl;
