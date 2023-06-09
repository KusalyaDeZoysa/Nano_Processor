----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:47:30 PM
-- Design Name: 
-- Module Name: MUX_2way_3_Bit - Behavioral
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

entity MUX_2way_3_Bit is
    Port (
        S  : in STD_LOGIC;  
        D0 : in STD_LOGIC_VECTOR(2 downto 0);  
        D1 : in STD_LOGIC_VECTOR(2 downto 0);  
        Y  : out STD_LOGIC_VECTOR(2 downto 0)
    );
end MUX_2way_3_Bit;

architecture Behavioral of MUX_2way_3_Bit is
begin
    process(S,D0,D1)
    begin
        if (S = '0') then
            Y <= D1;
        else
            Y <= D0;
        end if;
    end process;
end Behavioral;