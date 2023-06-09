----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:48:37 PM
-- Design Name: 
-- Module Name: MUX_2way_4_Bit - Behavioral
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

entity MUX_2way_4_Bit is
    Port (
        S  : in STD_LOGIC;  
        D0 : in STD_LOGIC_VECTOR(3 downto 0);  
        D1 : in STD_LOGIC_VECTOR(3 downto 0);  
        Y  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end MUX_2way_4_Bit;

architecture Behavioral of MUX_2way_4_Bit is
begin
    process(S , D0, D1)
    begin
        if (S = '0') then
            Y <= D0;
        else
            Y <= D1;
        end if;
    end process;
end Behavioral;