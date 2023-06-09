----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:08:59 AM
-- Design Name: 
-- Module Name: MUX_2way_4_Bit_TB - Behavioral
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

entity MUX_2way_4_Bit_TB is
--  Port ( );
end MUX_2way_4_Bit_TB;

architecture Behavioral of MUX_2way_4_Bit_TB is
    component MUX_2way_4_Bit is
        Port (
            S  : in STD_LOGIC;
            D0 : in STD_LOGIC_VECTOR(3 downto 0);
            D1 : in STD_LOGIC_VECTOR(3 downto 0);
            Y  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal S_tb: STD_LOGIC;
    signal D0_tb, D1_tb: STD_LOGIC_VECTOR(3 downto 0);
    signal Y_tb: STD_LOGIC_VECTOR(3 downto 0);
begin

    uut: MUX_2way_4_Bit
    port map (
        S => S_tb,
        D0 => D0_tb,
        D1 => D1_tb,
        Y => Y_tb
    );

    -- Stimulus process
    process
    begin
        -- Test case 1: S = '0'
        S_tb <= '0';
        D0_tb <= "0111";
        D1_tb <= "1010";
        wait for 100 ns;
       

        -- Test case 2: S = '1'
        S_tb <= '1';
        D0_tb <= "0111";
        D1_tb <= "1010";
        wait for 100 ns;
        
        -- Test case 3: S = '0'
                S_tb <= '0';
                D0_tb <= "1111";
                D1_tb <= "0000";
                wait for 100 ns;
                
         -- Test case 4: S = '1'
                        S_tb <= '1';
                        D0_tb <= "1111";
                        D1_tb <= "0000";
                        wait for 100 ns;
        

     
    end process;

end Behavioral;