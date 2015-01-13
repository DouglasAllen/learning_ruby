require 'irb/ruby-lex'
require 'stringio'

class RubyLexEasy < RubyLex
  class Continue < StandardError;end
  class Empty < StandardError;end
  def initialize
    super
    set_input(StringIO.new)
  end
  def run(str)
    obj=nil
    @io << str
    @io.rewind
    unless l = lex
      raise Empty if @line == ''
    else
      @line << l << "\n"
      if @ltype or @continue or @indent > 0
        raise Contine
      end
    end
    obj = eval @line, TOPLEVEL_BINDING
    @line = ''
    @exp_line_no = @line_no
                
    @indent = 0
    @indent_stack = []
    obj
  ensure
    set_input(StringIO.new)
  end
end

rle = RubyLexEasy.new
=begin
from irb
#<RubyLexEasy:0xb9936480 @OP=<SLex: @head = #<IRB::SLex::Node:0xb9936444 @Tree={"\u0000"=>#<IRB::SLex::Node:0xb99362dc @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb99363a4@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:339>>, 
  "\u0004"=>#<IRB::SLex::Node:0xb99361ec @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb99363a4@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:339>>, 
  "\u001A"=>#<IRB::SLex::Node:0xb99360fc @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb99363a4@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:339>>, 
  " "=>#<IRB::SLex::Node:0xb9935f58 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9936020@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:343>>, 
  "\t"=>#<IRB::SLex::Node:0xb9935e68 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9936020@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:343>>, 
  "\f"=>#<IRB::SLex::Node:0xb9935d78 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9936020@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:343>>, 
  "\r"=>#<IRB::SLex::Node:0xb9935c88 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9936020@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:343>>, 
  "\v"=>#<IRB::SLex::Node:0xb9935b98 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9936020@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:343>>, 
  "#"=>#<IRB::SLex::Node:0xb9935a80 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9935b48@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:350>>, 
  "="=>#<IRB::SLex::Node:0xb9935828 @Tree={"b"=>#<IRB::SLex::Node:0xb9935800 @Tree={"e"=>#<IRB::SLex::Node:0xb99357d8 @Tree={"g"=>#<IRB::SLex::Node:0xb99357b0 @Tree={"i"=>#<IRB::SLex::Node:0xb9935788 @Tree={"n"=>#<IRB::SLex::Node:0xb9935760 @Tree={}, 
  @preproc=#<Proc:0xb9935a30@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:355>, 
  @postproc=#<Proc:0xb9935a1c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:355>>}, 
  @preproc=nil, @postproc=nil>}, 
  @preproc=nil, @postproc=nil>}, 
  @preproc=nil, @postproc=nil>}, 
  @preproc=nil, @postproc=nil>, 
  "="=>#<IRB::SLex::Node:0xb9935030 @Tree={"="=>#<IRB::SLex::Node:0xb9934ec8 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  "~"=>#<IRB::SLex::Node:0xb9934d9c @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  "\n"=>#<IRB::SLex::Node:0xb99355e4 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb99356ac@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:367>>, 
  "*"=>#<IRB::SLex::Node:0xb9935378 @Tree={"*"=>#<IRB::SLex::Node:0xb993524c @Tree={"="=>#<IRB::SLex::Node:0xb9947140 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  "="=>#<IRB::SLex::Node:0xb99472a8 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  "<"=>#<IRB::SLex::Node:0xb9934c34 @Tree={"="=>#<IRB::SLex::Node:0xb9934c0c @Tree={">"=>#<IRB::SLex::Node:0xb9934be4 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  "<"=>#<IRB::SLex::Node:0xb9934194 @Tree={"="=>#<IRB::SLex::Node:0xb9946c18 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9934298@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:402>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  ">"=>#<IRB::SLex::Node:0xb99348b0 @Tree={"="=>#<IRB::SLex::Node:0xb9934784 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  ">"=>#<IRB::SLex::Node:0xb9934658 @Tree={"="=>#<IRB::SLex::Node:0xb9946ab0 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  "!"=>#<IRB::SLex::Node:0xb9934568 @Tree={"="=>#<IRB::SLex::Node:0xb993443c @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  "~"=>#<IRB::SLex::Node:0xb9934310 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9935440@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:391>>, 
  "'"=>#<IRB::SLex::Node:0xb9934040 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9934108@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:424>>, 
  "\""=>#<IRB::SLex::Node:0xb9947f28 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9934108@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:424>>, 
  "`"=>#<IRB::SLex::Node:0xb9947de8 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9947eb0@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:429>>, 
  "?"=>#<IRB::SLex::Node:0xb9947ca8 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9947d70@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:439>>, 
  "&"=>#<IRB::SLex::Node:0xb9947b18 @Tree={"&"=>#<IRB::SLex::Node:0xb99479ec @Tree={"="=>#<IRB::SLex::Node:0xb99467e0 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9947be0@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:460>>, 
  "="=>#<IRB::SLex::Node:0xb9947014 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9947be0@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:460>>, 
  "|"=>#<IRB::SLex::Node:0xb99478fc @Tree={"|"=>#<IRB::SLex::Node:0xb99477d0 @Tree={"="=>#<IRB::SLex::Node:0xb9946948 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9947be0@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:460>>, 
  "="=>#<IRB::SLex::Node:0xb9946ee8 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9947be0@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:460>>, 
  "+"=>#<IRB::SLex::Node:0xb9947578 @Tree={"="=>#<IRB::SLex::Node:0xb9947550 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>, 
  "@"=>#<IRB::SLex::Node:0xb9946678 @Tree={}, @preproc=#<Proc:0xb9946790@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:474>, 
  @postproc=#<Proc:0xb994677c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:474>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9946484@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:486>>, 
  "-"=>#<IRB::SLex::Node:0xb9947410 @Tree={"="=>#<IRB::SLex::Node:0xb99473e8 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>, 
  "@"=>#<IRB::SLex::Node:0xb9946510 @Tree={}, 
  @preproc=#<Proc:0xb9946628@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:480>, 
  @postproc=#<Proc:0xb9946614@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:480>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9946484@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:486>>, 
  "^"=>#<IRB::SLex::Node:0xb9946dbc @Tree={"="=>#<IRB::SLex::Node:0xb9946d94 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994767c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:467>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9945764@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:573>>, 
  "."=>#<IRB::SLex::Node:0xb99461b4 @Tree={"."=>#<IRB::SLex::Node:0xb9946024 @Tree={"."=>#<IRB::SLex::Node:0xb9945ebc @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9946128@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:517>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9946128@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:517>>},  
  @preproc=nil, @postproc=#<Proc:0xb994627c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:504>>, 
  "]"=>#<IRB::SLex::Node:0xb9945d40 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9945e08@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:527>>, 
  "}"=>#<IRB::SLex::Node:0xb9945c50 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9945e08@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:527>>, 
  ")"=>#<IRB::SLex::Node:0xb9945b60 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9945e08@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:527>>, 
  ":"=>#<IRB::SLex::Node:0xb9945a48 @Tree={":"=>#<IRB::SLex::Node:0xb99458f4 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb99459f8@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:546>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9945b10@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:535>>, 
  "/"=>#<IRB::SLex::Node:0xb99457dc @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb99458a4@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:557>>, 
  ","=>#<IRB::SLex::Node:0xb994555c @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9945624@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:579>>, 
  ";"=>#<IRB::SLex::Node:0xb994541c @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb99454e4@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:585>>, 
  "~"=>#<IRB::SLex::Node:0xb9945304 @Tree={"@"=>#<IRB::SLex::Node:0xb994519c @Tree={}, 
  @preproc=#<Proc:0xb99452b4@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:602>, 
  @postproc=#<Proc:0xb99452a0@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:602>>}, 
  @preproc=nil, @postproc=#<Proc:0xb99453cc@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:596>>, 
  "("=>#<IRB::SLex::Node:0xb9945084 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994514c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:608>>, 
  "["=>#<IRB::SLex::Node:0xb9944f1c @Tree={"]"=>#<IRB::SLex::Node:0xb9944ef4 @Tree={"="=>#<IRB::SLex::Node:0xb9944d3c @Tree={}, 
  @preproc=#<Proc:0xb9944e90@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:628>, 
  @postproc=#<Proc:0xb9944e7c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:628>>}, 
  @preproc=#<Proc:0xb9945034@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:622>, 
  @postproc=#<Proc:0xb9945020@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:622>>}, 
  @preproc=nil, @postproc=#<Proc:0xb9944cec@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:634>>, 
  "{"=>#<IRB::SLex::Node:0xb9944b0c @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9944bd4@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:653>>, 
  "\\"=>#<IRB::SLex::Node:0xb99449f4 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9944abc@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:666>>, 
  "%"=>#<IRB::SLex::Node:0xb99448dc @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb99449a4@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:678>>, 
  "$"=>#<IRB::SLex::Node:0xb99447c4 @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb994488c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:693>>, 
  "@"=>#<IRB::SLex::Node:0xb99446ac @Tree={}, 
  @preproc=nil, @postproc=#<Proc:0xb9944774@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:698>>}, 
  @preproc=nil, @postproc=#<Proc:0xb994465c@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:708>>>, 
  @io=#<StringIO:0xb9944508>, 
  @input=#<Proc:0xb99444cc@/home/douglasallen/.rbenv/versions/2.2.0/lib/ruby/2.2.0/irb/ruby-lex.rb:85>, 
  @seek=0, 
  @line_no=1, 
  @exp_line_no=1, 
  @base_char_no=0, 
  @char_no=0, 
  @rests=[], 
  @readed=[], 
  @here_readed=[], 
  @indent=0, 
  @indent_stack=[], 
  @lex_state=:EXPR_BEG, 
  @space_seen=false, 
  @here_header=false, 
  @post_symbeg=false, 
  @continue=false, 
  @line="", 
  @skip_space=false, 
  @readed_auto_clean_up=false, 
  @exception_on_syntax_error=true, 
  @prompt=nil>

=end

rle.run("(0..9).each {|o| puts o};puts 'you just ran rle'")

=begin
0
1
2
3
4
5
6
7
8
9
=end
