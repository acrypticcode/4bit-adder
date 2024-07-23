----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2023 08:15:42 PM
-- Design Name: 
-- Module Name: toplevel - Behavioral
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

entity toplevel is
    Port (
    sw : in STD_LOGIC_VECTOR (7 downto 0);
    carry_in : in STD_LOGIC;
    clk : in STD_LOGIC;
    segments : out STD_LOGIC_VECTOR (6 downto 0);
    anodes : out STD_LOGIC_VECTOR (3 downto 0));
    
    
end toplevel;

architecture Structural of toplevel is

--Component Declaration
component bit_full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
      
end component bit_full_adder;

component display_driver is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end component display_driver;

component LEDdisplay IS
	PORT (
		  clk					: IN  STD_LOGIC;
		  seg0,seg1,seg2,seg3		: IN  STD_LOGIC_VECTOR(6 downto 0);
        seg       		: OUT  STD_LOGIC_VECTOR(6  downto 0);
		  an					: OUT STD_LOGIC_VECTOR(3 downto 0));		  
END component LEDdisplay;




--Signal Declaration
signal s: STD_LOGIC_VECTOR (3 downto 0);
signal c: STD_LOGIC_VECTOR (3 downto 0);
signal sig_segments1: STD_LOGIC_VECTOR (6 downto 0);
signal sig_segments2: STD_LOGIC_VECTOR (6 downto 0);

begin
--Component Instantiation
bit_full_adder0: bit_full_adder
    port map(A => sw(0),
    B => sw(4),
    Cin => carry_in,
    S => s(0),
    Cout => c(0));
    
bit_full_adder1: bit_full_adder
    port map(A => sw(1),
    B => sw(5),
    Cin => c(0),
    S => s(1),
    Cout => c(1));
    
bit_full_adder2: bit_full_adder
    port map(A => sw(2),
    B => sw(6),
    Cin => c(1),
    S => s(2),
    Cout => c(2));
        
bit_full_adder3: bit_full_adder
    port map(A => sw(3),
    B => sw(7),
    Cin => c(2),
    S => s(3),
    Cout => c(3));

display_driver1: display_driver
    port map(
    inputs => s(3 downto 0),
    seg_out => sig_segments1);
    
display_driver2: display_driver
        port map(
        inputs(0) => c(3),
        inputs(3 downto 1) => "0",
        seg_out => sig_segments2);
        
LED: LEDdisplay
    port map(
    clk => clk,
    seg0 => sig_segments1,
    seg1 => sig_segments2,
    seg2 => "1111111",
    seg3 => "1111111",
    seg => segments,
    an => anodes);
    
end Structural;
