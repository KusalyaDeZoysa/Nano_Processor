----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:10:12 AM
-- Design Name: 
-- Module Name: Mux_8Way_4_Bit_TB - Behavioral
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

entity Mux_8Way_4_Bit_TB is
--  Port ( );
end Mux_8Way_4_Bit_TB;

architecture Behavioral of Mux_8Way_4_Bit_TB is
    component Mux_8Way_4_Bit is
        Port (
            Sel: in STD_LOGIC_VECTOR(2 downto 0);
            Data: in STD_LOGIC_VECTOR(31 downto 0);
            Output: out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal Sel_tb: STD_LOGIC_VECTOR(2 downto 0);
    signal Data_tb: STD_LOGIC_VECTOR(31 downto 0);
    signal Output_tb: STD_LOGIC_VECTOR(3 downto 0);
begin

    uut: Mux_8Way_4_Bit
    port map (
        Sel => Sel_tb,
        Data => Data_tb,
        Output => Output_tb
    );

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1: Sel = "000", Output should be Data(3 downto 0)
        Data_tb <= "01001101110000110101011111100001";
        
        Sel_tb <= "110";
             wait for 200 ns;
             
             Sel_tb <= "011";
             wait for 200 ns;
             
             Sel_tb <= "010";
             wait for 200 ns;
                  
             Sel_tb <= "100";
             wait for 200 ns;
                  
             Sel_tb <= "111";
             wait for 200 ns;
        

--        -- Test case 2: Sel = "011", Output should be Data(15 downto 12)
--        Sel_tb <= "011";
--        Data_tb <= "11110000111100001111000011110000";
--        wait for 100 ns;
        

--        -- Test case 3: Sel = "101", Output should be Data(23 downto 20)
--        Sel_tb <= "101";
--        Data_tb <= "11110000111100001111000011110000";
--        wait for 100 ns;
       

      
    end process;

end Behavioral;