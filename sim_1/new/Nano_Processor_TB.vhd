----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:11:22 AM
-- Design Name: 
-- Module Name: Nano_Processor_TB - Behavioral
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

entity Nano_Processor_TB is
--  Port ( );
end Nano_Processor_TB;

architecture Behavioral of Nano_Processor_TB is
    -- Component declaration for the DUT (Design Under Test)
    component Nano_Processor is
        Port ( Clk_In : in STD_LOGIC;
               Reset : in STD_LOGIC;
               OverFlow : out std_logic;
               Zero : out std_logic;
               S_7Seg_out: out std_logic_vector(6 downto 0);
               R7_out: out std_logic_vector(3 downto 0);
               anode_out: out std_logic_vector(3 downto 0));
    end component;

    -- Inputs
    signal Clk_In_TB : STD_LOGIC;
    signal Reset_TB : STD_LOGIC;

    -- Outputs
    signal OverFlow_TB : std_logic;
    signal Zero_TB : std_logic;
    signal S_7Seg_out_TB : std_logic_vector(6 downto 0);
    signal R7_out_TB : std_logic_vector(3 downto 0);
    signal anode_out_TB : std_logic_vector(3 downto 0);

begin
   
    uut: Nano_Processor
    Port map (
        Clk_In => Clk_In_TB,
        Reset => Reset_TB,
        OverFlow => OverFlow_TB,
        Zero => Zero_TB,
        S_7Seg_out => S_7Seg_out_TB,
        R7_out => R7_out_TB,
        anode_out => anode_out_TB
    );

    -- Clock process
    process
    begin
        Clk_In_TB <= '0';
        wait for 5 ns;
        Clk_In_TB <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
   process
    begin
        -- Initialize inputs
        wait for 95 ns;
        Reset_TB <= '1';
        
        wait for 5 ns;
        Reset_TB <= '0';
         

    end process;

end Behavioral;