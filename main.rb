class Automate
    def initialize(chain)
      @chain = chain
      @position = 0
      @output = ''
    end
  
  def generate_next_letter(state)
    letter = case state
             when "q13" 
                 "a"
             when "q16"
                 "b"
             when "q18"
                 "c"
             when "q15"
                 "d"
             when "q8"
                 "e"
             when "q20"
                 "f"
             when "q21"
                 "g"
             when "q11"
                 "h"
             when "q9"
                 "i"
             when "q22"
                 "j"
             when "q17"
                 "k"
             when "q47"
                 "l"
             when "q3"
                 "m"
             when "q14"
                 "n"
             when "q4"
                 "o"
             when "q23"
                 "p"
             when "q24"
                 "q"
             when "q46"
                 "r"
             when "q10"
                 "s"
             when "q2"
                 "t"
             when "q19"
                 "u"
             when "q32"
                 "v"
             when "q48"
                 "w"
             when "q26"
                 "x"
             when "q27"
                 "y"
             when "q28"
                 "z"
             when "q6"
                 "0"
             when "q29"
                 "1"
             when "q31"
                 "2"
             when "q33"
                 "3"
             when "q34"
                 "4"
             when "q12"
                 "5"
             when "q35"
                 "6"
             when "q37"
                 "7"
             when "q38"
                 "8"
             when "q39"
                 "9"
             when "q50"
                 ","
             when "q43"
                 "."
             when "q45"
                 "?"
             when "q0"
                 ""
             else
                 "?"
             end
    @output += letter
end
  
    def next_letter
        return "_" if @position == @chain.size
      
        actual_letter = @chain[@position]
        @position += 1
        actual_letter
      end
      
      def verify_word
        actual_state = "q0"
      
        loop do
          char = next_letter
      
          case [char, actual_state]
          when [".", "q0"]
            actual_state = "q8"
          when ["-", "q0"]
            actual_state = "q2"
          when [".", "q2"]
            actual_state = "q14"
          when ["-", "q2"]
            actual_state = "q3"
          when [".", "q3"]
            actual_state = "q21"
          when ["-", "q3"]
            actual_state = "q4"
          when [".", "q4"]
            actual_state = "q36"
          when ["-", "q4"]
            actual_state = "q5"
          when [".", "q5"]
            actual_state = "q39"
          when ["-", "q5"]
            actual_state = "q6"
          when [".", "q8"]
            actual_state = "q9"
          when ["-", "q8"]
            actual_state = "q13"
          when [".", "q9"]
            actual_state = "q10"
          when ["-", "q9"]
            actual_state = "q19"
          when [".", "q10"]
            actual_state = "q11"
          when ["-", "q10"]
            actual_state = "q32"
          when [".", "q11"]
            actual_state = "q12"
          when ["-", "q11"]
            actual_state = "q34"
          when [".", "q13"]
            actual_state = "q46"
          when ["-", "q13"]
            actual_state = "q48"
          when [".", "q14"]
            actual_state = "q15"
          when ["-", "q14"]
            actual_state = "q17"
          when [".", "q15"]
            actual_state = "q16"
          when ["-", "q15"]
            actual_state = "q26"
          when [".", "q16"]
            actual_state = "q35"
          when [".", "q17"]
            actual_state = "q18"
          when ["-", "q17"]
            actual_state = "q27"
          when [".", "q19"]
            actual_state = "q20"
          when ["-", "q19"]
            actual_state = "q30"
          when [".", "q21"]
            actual_state = "q28"
          when ["-", "q21"]
            actual_state = "q24"
          when ["-", "q22"]
            actual_state = "q29"
          when ["-", "q24"]
            actual_state = "q40"
          when [".", "q28"]
            actual_state = "q37"
          when ["-", "q28"]
            actual_state = "q49"
          when [".", "q30"]
            actual_state = "q44"
          when ["-", "q30"]
            actual_state = "q31"
          when [".", "q36"]
            actual_state = "q38"
          when [".", "q41"]
            actual_state = "q42"
          when ["-", "q42"]
            actual_state = "q43"
          when [".", "q46"]
            actual_state = "q47"
          when ["-", "q46"]
            actual_state = "q41"
          when [".", "q48"]
            actual_state = "q23"
          when ["-", "q48"]
            actual_state = "q22"
          when ["-", "q49"]
            actual_state == "q50"
          when ["/", "q0"]
            @output += ' '
          when [" ", actual_state]
            if actual_state != "q0"
              generate_next_letter(actual_state)
              actual_state = "q0"
            end
          when ["_", actual_state]

            if actual_state == 'q0'
              puts 'Cadeia invalida'
              break
            end

            if @position != @chain.size
              puts "Cadeia inválida"
              breal
            else
              generate_next_letter(actual_state)
              puts "Cadeia de entrada: \n\n #{@chain} \n\n"
              puts "Cadeia válida!! sua traducao: \n\n"
              puts @output + "\n\n"
              break
            end

          else
            puts 'Cadeia invalida'
            break
          end
        end
      end
    end
hello = Automate.new(".- .-.. .. --.- ..- .- -- / --.- ..- .- -- / .-.. --- .-. . -- --..-- / ...- .. ...- . .-. .-. .- / ...- . .-.. / ..-. . .-. -- . -. - ..- -- / -. . -.-. --..-- / .-. ..- - .-. ..- -- / ...- --- .-.. ..- - .--. .- - / -. ..- -. -.-. .-.-.- / ..- - / . ..- / .- -.-. -.-. ..- -- ... .- -. / --- .-. -.-. .. .-.-.- / ...- . ... - .. -... ..- .-.. ..- -- / -.-. --- -. -.. .. -- . -. - ..- -- / .. .--. ... ..- -- / .- -.-. / . -. .. -- / ...- . ... - .. -... ..- .-.. ..- -- / .--. --- .-. - - .. - --- .-. .-.-.- / -.-. .-. .- ... / -- .- .-.. . ... ..- .- -.. .- / - .. -. -.-. .. -.. ..- -. - / .-.. .- -.-. ..- ... / .- / .-.. ..- -.-. - ..- ... .-.-.- / .- . -. . .- -. / -.-. --- -- -- --- -.. --- / -... .-.. .- -. -.. .. - / -. ..- -. -.-. --..-- / ..- .-.. - .-. .. -.-. . ... / ...- .. ...- . .-. .-. .- / -. .. ... .-.. / -- .- .-.. . ... ..- .- -.. .- / .- -.-. .-.-.- / -. .- -- / .--. --- .-. - - .. - --- .-. / -.-. --- -. ...- .- .-.. .-.. .. ... / .-. .. ... ..- ... / ...- .. - .- . / ...- --- .-.. ..- - .--. .- - .-.-.- / -. ..- -. -.-. / ..- - / - ..- .-. .--. .. ... / --.- ..- .. ... / .-.. .- -.-. ..- ... / ...- . .... .. -.-. ..- .-.. .- / .--. --- ... ..- . .-. . .-.-.- / .--. .... .- ... . .-.. .-.. ..- ... / . .-.. . .. ..-. . -. -.. / . - / .-.. . -.-. - ..- ... / .- -.-. / .--. .-. . - .. ..- -- .-.-.- / -- .- ..- .-. .. ... / ... -.-. . .-.. . .-. .. ... --.- ..- . --..-- / .--- ..- ... - --- / .- / . --. . ... - .- ... / - .. -. -.-. .. -.. ..- -. - --..-- / .--. ..- .-. ..- ... / .-.. . -.-. - ..- ... / ... --- .-.. .-.. .. -.-. .. - ..- -.. .. -. / .. .--. ... ..- -- --..-- / -. --- -. / -... .-.. .- -. -.. .. - / -. .. -... .... / .-.. --- .-. . -- / -.. .. --. -. .. ... ... .. -- / -. ..- .-.. .-.. .- .-.-.- / .--. .-. .- . ... . -. - / . ..- / .- .-. -.-. ..- / . .-. .- - .-.-.- / ...- . ... - .. -... ..- .-.. ..- -- / -. --- -. / ... --- -.. .- .-.. . ... / . .-.. .. - --..-- / -. --- -. / .--. . .-.. .-.. . -. - . ... --.- ..- . / .- .-. -.-. ..- .-.-.- / -- .- . -.-. . -. .- ... / .--. .... .- .-. . - .-. .- / .--. .... .- .-. . - .-. .- / ..- .-. -. .- / -. --- -. / ... . -- .--. . .-. .-.-.- / -. .- -- / .- -.-. -.-. ..- -- ... .- -. / .- -. - . / ...- . .-.. / .-.. .- --- .-. . . - / -.. .. -.-. - ..- -- .-.-.- / .--. . .-.. .-.. . -. - . ... --.- ..- . / .... .- -... .. - .- -. - / -- --- .-. -... .. / - .-. .. ... - .. --.- ..- . / ... . -. . -.-. - ..- ... / . - / -. . - ..- ... / . - / -- .- .-.. . ... ..- .- -.. .- / ..-. .- -- . ... / .- -.-. / - ..- .-. .--. .. ... / . --. . ... - .- ... .-.-.- / .. -. - . --. . .-. / - ..- .-. .--. .. ... / -.. ..- .. --..-- / -.-. --- -. ... . --.- ..- .- - / ... .. - / .- -- . - / . .-. .- - / . --. . - --..-- / .--. --- .-. - - .. - --- .-. / -... .. -... . -. -.. ..- -- / ..-. . .-.. .. ...")
hello.verify_word