----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:07:40 AM
-- Design Name: 
-- Module Name: MUX_2way_3_Bit_TB - Behavioral
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

entity MUX_2way_3_Bit_TB is
--  Port ( );
end MUX_2way_3_Bit_TB;

architecture Behavioral of MUX_2way_3_Bit_TB is
    component MUX_2way_3_Bit is
        Port (
            S  : in STD_LOGIC;
            D0 : in STD_LOGIC_VECTOR(2 downto 0);
            D1 : in STD_LOGIC_VECTOR(2 downto 0);
            Y  : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    signal S_tb: STD_LOGIC;
    signal D0_tb, D1_tb: STD_LOGIC_VECTOR(2 downto 0);
    signal Y_tb: STD_LOGIC_VECTOR(2 downto 0);
begin

    uut: MUX_2way_3_Bit
    port map (
        S => S_tb,
        D0 => D0_tb,
        D1 => D1_tb,
        Y => Y_tb
    );

    process
    begin
    
        D0_tb <= "000";
        D1_tb <= "001";
        S_tb <= '0';
        wait for 50 ns;
       
        D0_tb <= "100";
        D1_tb <= "111";
        S_tb <= '1';
        wait for 50 ns;
        
        S_tb <= '0';
        wait for 50 ns;
               
        D0_tb <= "110";
        D1_tb <= "010";
        S_tb <= '0';
        wait for 50 ns;
        
   end process;

end Behavioral;
