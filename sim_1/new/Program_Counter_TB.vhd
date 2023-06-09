----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:13:03 AM
-- Design Name: 
-- Module Name: Program_Counter_TB - Behavioral
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

entity Program_Counter_TB is
--  Port ( );
end Program_Counter_TB;

architecture Behavioral of Program_Counter_TB is
    component Program_Counter is
        Port (
            MUX_2way3_Bit_out : in STD_LOGIC_VECTOR (2 downto 0);
            Reset : in STD_LOGIC;
            Clk : in STD_LOGIC;
            memory_add : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal MUX_2way3_Bit_out_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Reset_tb: STD_LOGIC;
    signal Clk_tb : std_logic:='0';
    signal memory_add_tb : STD_LOGIC_VECTOR (2 downto 0);
    
begin

    uut: Program_Counter
    port map (
        MUX_2way3_Bit_out => MUX_2way3_Bit_out_tb,
        Reset => Reset_tb,
        Clk => Clk_tb,
        memory_add => memory_add_tb
    );
    
    -- Clock generation process
   process begin
          wait for 50 ns;
          Clk_tb <= not (Clk_tb);
    end process;
    
    process
    begin
          wait for 100 ns;
       Reset_tb <= '1';
       MUX_2way3_Bit_out_tb <= "110";
       
       wait for 100 ns;
       Reset_tb <= '0';
       MUX_2way3_Bit_out_tb <= "111";
       
       wait for 200 ns;
       MUX_2way3_Bit_out_tb <= "011";
       
       wait for 200 ns;
       Reset_tb <= '1';
       MUX_2way3_Bit_out_tb <= "100";
   
       wait for 200 ns;
       Reset_tb <= '0';
       MUX_2way3_Bit_out_tb <= "010";
       
       wait;
    end process;
    
end Behavioral;