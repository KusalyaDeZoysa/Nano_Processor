----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:49:34 PM
-- Design Name: 
-- Module Name: Mux_8Way_4_Bit - Behavioral
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

entity Mux_8Way_4_Bit is
    Port (
        Sel: in STD_LOGIC_VECTOR(2 downto 0);
        Data: in STD_LOGIC_VECTOR(31 downto 0);
        Output: out STD_LOGIC_VECTOR(3 downto 0)
    );
end Mux_8Way_4_Bit;

architecture Behavioral of Mux_8Way_4_Bit is
begin
    process (Sel, Data)
    begin
        case Sel is
            when "000" =>
                Output <= Data(3 downto 0);
            when "001" =>
                Output <= Data(7 downto 4);
            when "010" =>
                Output <= Data(11 downto 8);
            when "011" =>
                Output <= Data(15 downto 12);
            when "100" =>
                Output <= Data(19 downto 16);
            when "101" =>
                Output <= Data(23 downto 20);
            when "110" =>
                Output <= Data(27 downto 24);
            when "111" =>
                Output <= Data(31 downto 28);
            when others =>
                Output <= (others => '0');
        end case;
    end process;

end Behavioral;