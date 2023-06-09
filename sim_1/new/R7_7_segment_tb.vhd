----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:17:31 AM
-- Design Name: 
-- Module Name: R7_7_segment_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity R7_7_segment_tb is
--  Port ( );
end R7_7_segment_tb;

architecture Behavioral of R7_7_segment_tb is

  -- Component declaration for the DUT (Design Under Test)
  component R7_7_segment
    Port (
      R7 : in std_logic_vector(3 downto 0);
      S_7Seg : out std_logic_vector(6 downto 0);
      anode : out std_logic_vector(3 downto 0)
    );
  end component;

  -- Signal declarations
  signal R7_tb : std_logic_vector(3 downto 0);
  signal S_7Seg_tb : std_logic_vector(6 downto 0);
  signal anode_tb : std_logic_vector(3 downto 0);

begin

 
  uut: R7_7_segment
    port map(
      R7 => R7_tb,
      S_7Seg => S_7Seg_tb,
      anode => anode_tb
    );

  -- Stimulus process
  process
  begin
    -- Stimulus generation
    R7_tb <= "1110"; -- Set input values here
    wait for 200 ns;
    
    R7_tb <= "1111";
    wait for 200 ns;
    
    R7_tb <= "0101";
        wait for 200 ns;
    
    R7_tb <= "0011";
            wait for 200 ns;
            
    R7_tb <= "0001";
    wait for 200 ns;


  end process;

end Behavioral;