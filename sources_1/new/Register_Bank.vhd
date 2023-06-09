----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:42:22 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : IN STD_LOGIC ;
           Reset : in STD_LOGIC);
end Register_Bank;

architecture Behavioral of Register_Bank is
COMPONENT Decoder_3_to_8
Port (     I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT Reg
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0) ;
           Reset : in std_logic
           );
           
END COMPONENT;

signal S_A , R_0 , R_1 , R_2 , R_3 , R_4 , R_5 , R_6 , R_7 : STD_LOGIC_VECTOR(3 downto 0);
signal X , Y , Clock : STD_LOGIC;
signal RegSel : std_logic_vector(2 downto 0);
signal Dec1_Out : std_logic_vector(7 downto 0);
signal Dec2_Out : std_logic_vector(7 downto 0);

begin

S_A <= I;

Decoder_3_to_8_0 : Decoder_3_to_8 port map(
    I => RegSel,
    EN => '1',
    Y => Dec1_Out
);
 Reg_0 : Reg
 port map (
 D => "0000",
 EN   => Dec1_Out(0),
 Clk  => Clock,
 Reset => Reset,
 Q => R_0
);

Reg_1 : Reg
 port map (
 D => S_A,
 EN   => Dec1_Out(1),
 Clk  => Clock,
 Reset => Reset,
 Q => R_1
);

Reg_2 : Reg
 port map (
 D => S_A,
 EN   => Dec1_Out(2),
 Clk  => Clock,
 Reset => Reset,
 Q => R_2
);

Reg_3 : Reg
 port map (
 D => S_A,
 EN   => Dec1_Out(3),
 Clk  => Clock,
 Reset => Reset,
 Q => R_3
);

Reg_4 : Reg
 port map (
 D => S_A,
 EN   => Dec1_Out(4),
 Clk  => Clock,
 Reset => Reset,
 Q => R_4
);

Reg_5 : Reg
 port map (
 D => S_A,
 EN   => Dec1_Out(5),
 Clk  => Clock,
 Reset => Reset,
 Q => R_5
);

Reg_6 : Reg
 port map (
 D => S_A,
 EN   => Dec1_Out(6),
 Clk  => Clock,
 Reset => Reset,
 Q => R_6
);

Reg_7 : Reg
 port map (
 D => S_A,
 EN   => Dec1_Out(7),
 Clk  => Clock,
 Reset => Reset,
 Q => R_7
);

S_A <= I;
Clock <= Clk;
RegSel <= EN;
R0 <= R_0;
R1 <= R_1;
R2 <= R_2;
R3 <= R_3;
R4 <= R_4;
R5 <= R_5;
R6 <= R_6;
R7 <= R_7;

end Behavioral;