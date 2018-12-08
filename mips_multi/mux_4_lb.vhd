library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- use work.mips_pkg.all;
use work.pack.all;

entity mux_4_lb is
	generic (
		W_SIZE 	: natural := 32
			);
	port (
	 	in0, in1, in2, in3	: in std_logic_vector(W_SIZE-1 downto 0);
		sel						: in std_logic_vector(1 downto 0);
		m_out						: out std_logic_vector(W_SIZE-1 downto 0));
end entity;

architecture rtl of mux_4_lb is 
begin
	m_out <= (in0 AND X"000000FF") when (sel = "00") else 
				(in1 AND X"0000FF00") when (sel = "01") else
				(in2 AND X"00FF0000") when (sel = "10") else
				(in3 AND X"FF000000");
end architecture;