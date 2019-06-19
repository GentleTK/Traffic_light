library ieee;
use ieee.std_logic_1164.all;

entity led is
	port(clk,rst:in std_logic;
		t1,t2:buffer integer range 0 to 14;
		r1,r2,r3,r4,g1,g2,g3,g4,m1:buffer integer range 0 to 1;
		we,du:out std_logic_vector(7 downto 0)
	);
end led;

architecture beh of led is
type state is(s0,s1,s2,s3,s4);
signal n_state,c_state:state;
signal cnt,init1,init2:integer range 0 to 14;
signal cnt0:integer range 0 to 4;
signal sel:integer range 0 to 3;
signal cnt1,m,count,tmp:integer range 0 to 999;
signal clk1,lock:bit;
signal num,temp0,temp1,temp2,temp3:integer range 0 to 9;

begin 
process(clk)
	begin	
		if clk'event and clk = '1' then
			if cnt1<999 then	
				if cnt1<499 then 	
					clk1<='0';
				else 
					clk1<='1';
				end if;
			cnt1<=cnt1+1;
		else
			cnt1<=0;
		end if;
	end if;
end process;

process(clk)
begin
	if clk'event and clk='1' then
		if count<m then tmp<=(m-1)/2;
			if count<tmp then 
				m1<=0;
			else
				m1<=1;
			end if;
			count<=count+1;
		else
			count<=0;
		end if;
	end if;
end process;

state_reg:process(clk1,rst)
begin
	if rst='0' then c_state<=s0;
	elsif clk1'event and clk1='1' then
		c_state<=n_state;	
	end if;
end process;

state_com:process(c_state,lock,count)
begin
	case c_state is
	
		when s0 => r2<=1;r4<=1;r1<=1;r3<=1;
		g1<=0;g2<=0;g3<=0;g4<=0;
		init1<=12;t1<=cnt;t2<=cnt;lock<='1';
		if cnt=0 then n_state<=s1;
		else n_state<=s0;lock<='0';
		end if;
		
		when s1 => r2<=1;r4<=1;g1<=1;g3<=1;
		r1<=0;r3<=0;g2<=0;g4<=0;
		init1<=5;t1<=cnt+5;t2<=cnt;lock<='1';init2<=0;
		if cnt=0 then n_state<=s2;
		else n_state<=s1;lock<='0';
		end if;
		
		when s2 => r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=1;g1<=1;r3<=1;g3<=1;
			init1<=12;t1<=cnt;t2<=cnt;lock<='1';
		if cnt>11 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;
		elsif cnt>10 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;
		elsif cnt>9 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;
		elsif cnt>8 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;
		elsif cnt>7 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;
		elsif cnt>6 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;
		elsif cnt>5 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;	
		elsif cnt>4 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;	
		elsif cnt>3 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;	
		elsif cnt>2 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;	
		elsif cnt>1 then r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;
		else
			r2<=1;r4<=1;g2<=0;g4<=0;
			r1<=m1;g1<=m1;r3<=m1;g3<=m1;
		end if;
		if cnt<12 and cnt>0 then n_state<=s2;lock<='0';
		else n_state<=s3;
		end if;
		
		when s3 => g2<=1;g4<=1;r1<=1;r3<=1;
			r2<=0;r4<=0;g1<=0;g3<=0;
			init1<=5;t1<=cnt;t2<=cnt+5;lock<='1';init2<=0;
		if cnt=0 then n_state<=s4;
		else n_state<=s3;lock<='0';
		end if;
			
		when s4 => r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=1;g2<=1;r4<=1;g4<=1;
			init1<=12;t1<=cnt;t2<=cnt;lock<='1';
		if cnt>11 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>10 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>9 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>8 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>7 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>6 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>5 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>4 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>3 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>2 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		elsif cnt>1 then r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		else
			r1<=1;r3<=1;g1<=0;g3<=0;
			r2<=m1;g2<=m1;r4<=m1;g4<=m1;
		end if;
		if cnt<12 and cnt>0 then n_state<=s4;lock<='0';
		else n_state<=s1;
		end if;
		when others => n_state<=s0;
	end case;
end process;

process(clk1)
begin
	if clk1'event and clk1='1' then
	if lock='1'  then 
		cnt<=init1;cnt0<=init2;
	else
		cnt<=cnt-1;cnt0<=cnt0+1;
	end if;
	if cnt0=1 then m<=999;
	elsif cnt0=2 then m<=499;
	elsif cnt0=3 then m<=249;
	elsif cnt0=4 then m<=124;
	else m<=61;
	end if;
	if rst='0' then cnt<=0;
	end if;
end if;
	temp0<=t1/10;
	temp1<=t1 rem 10;
	temp2<=t2/10;
	temp3<=t2 rem 10;
end process;

process(clk)
begin
	if clk'event and clk='1' then
			sel<=sel+1;
	end if;
end process;

process(sel)
begin
	case sel is
		when 0 => we<="00000001";num<=temp0;
		when 1 => we<="00000010";num<=temp1;
		when 2 => we<="00000100";num<=temp2;
		when 3 => we<="00001000";num<=temp3;
		when others => we<="00000000";
	end case;
end process;

process(num)
begin
	case num is
		when 0 => du <="11111100";
		when 1 => du <="01100000";
		when 2 => du <="11011010";
		when 3 => du <="11110010";
		when 4 => du <="01100110";
		when 5 => du <="10110110";
		when 6 => du <="10111110";
		when 7 => du <="11100000";
		when 8 => du <="11111110";
		when 9 => du <="11110110";	
		when others =>du<="00000000";
	end case;
end process;
end beh;	
