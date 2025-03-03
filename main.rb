
    class Automate

        def initialize(chain)
            @chain = chain
            @position = 0
            @output = ''
            @valid_chars = {
                '.-' => 'a',
                '-...' => 'b',
                '-.-.' => 'c',
                '-..' => 'd',
                '.' => 'e',
                '..-.' => 'f',
                '--.' => 'g',
                '....' => 'h',
                '..' => 'i',
                '.---' => 'j',
                '-.-' => 'k',
                '.-..' => 'l',
                '--' => 'm',
                '-.' => 'n',
                '---' => 'o',
                '.--.' => 'p',
                '--.-' => 'q',
                '.-.' => 'r',
                '...' => 's',
                '-' => 't',
                '..-' => 'u',
                '...-' => 'v',
                '.--' => 'w',
                '-..-' => 'x',
                '-.--' => 'y',
                '--..' => 'z',
                '.----' => '1',
                '..---' => '2',
                '...--' => '3',
                '....-' => '4',
                '.....' => '5',
                '-....' => '6',
                '--...' => '7',
                '---..' => '8',
                '----.' => '9',
                '-----' => '0',
                '.-.-.-' => '.',
                '--..--' => ',',
                '..--..' => '?',
                '-....-' => '-'
            }
        end

    def generate_next_letter char
        actual_letter = @valid_chars[char]
        @output += actual_letter if actual_letter
    end 

    def next_letter
        return "_" if @position == @chain.size

        actual_letter = @chain[@position]
        @position += 1
        actual_letter
    end

    def verify_word
        actual_state = 'q0'
        actual_chain = ''

        loop do
            char = next_letter

            case [char, actual_state]
            when [".", "q0"]
                actual_state = "q1"
                actual_chain += '.'
            when ["-", "q0"]
                actual_state = "q2"
                actual_chain += '-'
            when [".", "q1"]
                actual_state = "q1"
                actual_chain += '.'
            when ["-", "q1"]
                actual_state = "q2"
                actual_chain += '-'
            when ["-", "q2"]
                actual_state = "q2"
                actual_chain += '-'
            when [".", "q2"]
                actual_state = "q1"
                actual_chain += '.'
            when ["/", "q1"]
                generate_next_letter(actual_chain)
                @output += ' '
                actual_chain = ''
            when ["/", "q2"]
                generate_next_letter(actual_chain)
                @output += ' '
                actual_chain = ''
            when [" ", "q1"]
                generate_next_letter(actual_chain)
                actual_chain = ''
            when [" ", "q2"]
                generate_next_letter(actual_chain)
                actual_chain = ''
            when ["_", "q1"]
                generate_next_letter(actual_chain)
                puts "Palavra válida"
                actual_state = 'q0'
                puts @output
                break
            when ["_", "q2"]
                generate_next_letter(actual_chain)
                puts "Palavra válida"
                actual_state = 'q0'
                puts @output
                break
            else
                puts "Palavra inválida"
                break
            end
        end
    end
end 

    hello = Automate.new('-.-. --- -.. .. --. --- / -- --- .-. ... . / -.. . / . -..- . -- .--. .-.. ---')
    hello.verify_word