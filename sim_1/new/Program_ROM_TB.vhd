----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:14:27 AM
-- Design Name: 
-- Module Name: Program_ROM_TB - Behavioral
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

entity Program_ROM_TB is
--  Port ( );
end Program_ROM_TB;

architecture Behavioral of Program_ROM_TB is
    -- Constants
    --constant CLK_PERIOD: time := 100 ns;  -- Clock period

    -- Signals
    signal memory_add: std_logic_vector(2 downto 0);
    signal instruction_out: std_logic_vector(11 downto 0);

    -- Component Declaration
    component Program_ROM is
        Port (
            memory_add: in std_logic_vector(2 downto 0);
            instruction_out: out std_logic_vector(11 downto 0)
        );
    end component;

begin
    UUT: Program_ROM
    port map (
        memory_add => memory_add,
        instruction_out => instruction_out
    );

    process
   begin
         
         memory_add <= "110";
         wait for 200 ns;
         
         memory_add <= "111";
         wait for 200 ns;
         
         memory_add <= "100";
         wait for 200 ns;
         
         memory_add <= "010";
         wait for 200 ns;

         memory_add <= "011";
         wait for 200 ns;        
 
end process;
end Behavioral;