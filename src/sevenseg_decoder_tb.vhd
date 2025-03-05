----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 08:51:27 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
   
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
    component sevenseg_decoder is 
      port (
        i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
        o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
      end component sevenseg_decoder; 
      
      signal test_sw : std_logic_vector (3 downto 0):= (others=> '0');
      signal test_seg : std_logic_vector (6 downto 0); 
begin
    sevenseg_decoder_0: sevenseg_decoder
	port map(
	   i_Hex => test_sw, 
	   o_seg_n(6) => test_seg(0),
	   o_seg_n(5) => test_seg(1),
	   o_seg_n(4) => test_seg(2), 
	   o_seg_n(3) => test_seg(3), 
	   o_seg_n(2) => test_seg(4),
	   o_seg_n(1) => test_seg(5), 
	   o_seg_n(0) => test_seg(6)  
	   ); 
	   
test_process : process 
	begin
	test_sw <= x"0"; wait for 10 ns;
         assert test_seg = "0000001" report "error on 0" severity failure; 
    test_sw <= x"1"; wait for 10 ns;
         assert test_seg = "1001111" report "error on 1" severity failure; 
    test_sw <= x"2"; wait for 10 ns;
         assert test_seg = "0010010" report "error on 2" severity failure;
    test_sw <= x"3"; wait for 10 ns;
         assert test_seg = "0000110" report "error on 3" severity failure;
    test_sw <= x"4"; wait for 10 ns;
         assert test_seg = "1001100" report "error on 4" severity failure;
    test_sw <= x"5"; wait for 10 ns;
         assert test_seg = "0100100" report "error on 5" severity failure;
    test_sw <= x"6"; wait for 10 ns;
         assert test_seg = "0100000" report "error on 6" severity failure;
    test_sw <= x"7"; wait for 10 ns;
         assert test_seg = "0001111" report "error on 7" severity failure;
    test_sw <= x"8"; wait for 10 ns;
         assert test_seg = "0000000" report "error on 8" severity failure;
    test_sw <= x"9"; wait for 10 ns;
         assert test_seg = "0001100" report "error on 9" severity failure;
    test_sw <= x"A"; wait for 10 ns;
         assert test_seg = "0001000" report "error on A" severity failure; 
    test_sw <= x"B"; wait for 10 ns;
         assert test_seg = "1100000" report "error on B" severity failure; 
    test_sw <= x"C"; wait for 10 ns;
         assert test_seg = "1110010" report "error on C" severity failure; 
    test_sw <= x"D"; wait for 10 ns;
         assert test_seg = "1000010" report "error on D" severity failure; 
    test_sw <= x"E"; wait for 10 ns;
         assert test_seg = "0110000" report "error on E" severity failure; 
    test_sw <= x"F"; wait for 10 ns;
         assert test_seg = "0111000" report "error on F" severity failure; 
    wait;
    end process; 


end test_bench;
