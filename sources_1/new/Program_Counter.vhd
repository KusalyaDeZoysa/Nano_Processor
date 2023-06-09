----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:56:47 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( MUX_2way3_Bit_out : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           memory_add : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

component D_FF
    Port ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       EN : in STD_LOGIC:='1';
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC);
end component;

begin
D_FF_0: D_FF
    port map(
        D => MUX_2way3_Bit_out(0),
        Res => Reset,
        Clk => Clk,
        Q => memory_add(0)
    );
    
D_FF_1: D_FF
        port map(
            D => MUX_2way3_Bit_out(1),
            Res => Reset,
            Clk => Clk,
            Q => memory_add(1)
        );

D_FF_2: D_FF
    port map(
        D => MUX_2way3_Bit_out(2),
        Res => Reset,
        Clk => Clk,
        Q => memory_add(2)
    );

end Behavioral;