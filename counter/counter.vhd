----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2026 14:55:44
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity counter is
    generic ( g_nbits : integer := 10
    );
    port ( i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_en : in STD_LOGIC;
           i_limit : in STD_LOGIC_VECTOR (g_nbits-1 downto 0);
           o_done : out STD_LOGIC;
           o_count : out STD_LOGIC_VECTOR (g_nbits-1 downto 0)
           );
end entity counter;

architecture Behavioral of counter is

    signal f_count : unsigned(g_nbits-1 downto 0);
    signal f_done : std_logic;

begin

    o_count <=  std_logic_vector(f_count);
    o_done <= f_done;
    
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            f_count <= (others => '0');
            f_done <= '0';
        elsif(rising_edge(i_clk)) then
            if(i_en = '1') then
                f_count <= f_count + 1;
                if(f_count = unsigned(i_limit)) then
                    f_count <= (others => '0');
                    f_done <= '1';
                else
                    f_done <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
