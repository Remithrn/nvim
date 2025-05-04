return {
  "folke/snacks.nvim",
  opts = function()
    -- List of quotes to rotate through
    local quotes = {
      '"It’s not a bug, it’s an undocumented feature." — Anonymous',
      '"When in doubt, use brute force." — Ken Thompson',
      '"Talk is cheap. Show me the code." — Linus Torvalds',
      '"You miss 101% of the shots you don’t take." — Wayne Gretzky',
      '"The best way to predict the future is to invent it." — Alan Kay',
      '"There’s no place like 128.0.0.1" — Developer Proverb',
      '"If it works, don’t touch it." — Sysadmin Wisdom',
      '"Experience is the name everyone gives to their mistakes." — Oscar Wilde (Applies to programming too!)',
      '"Java is to Javascript what car is to Carpet." — Chris Heilmann',
      '"Debugging: Removing the needles from the haystack." — Anonymous',
      '"Why do programmers prefer dark mode? Because light attracts bugs!" — Anonymous',
      '"My code doesn\'t work, I have no idea why. My code works, I have no idea why." — Anonymous',
      '"There are 11 types of people in the world: those who understand binary and those who don\'t." — Anonymous',
      '"Software developers: Turning caffeine into code." — Anonymous',
      '"If at first you don\'t succeed, call it version 2.0." — Anonymous',
      '"Programming is like sex: One mistake and you have to support it for the rest of your life." — Anonymous',
      '"The best thing about Boolean variables is: if you get a good one, you get two for free." — Anonymous',
      '"Why did the programmer quit his job? He didn\'t get arrays." — Anonymous',
      '"Sometimes it pays to stay in bed on Monday, rather than spending the rest of the week debugging Monday\'s code." — Dan Salomon',
      '"Perfection is achieved not when there is nothing more to add, but rather when there is nothing more to take away." — Antoine de Saint-Exupery (Relatable to clean code)',
      '"Code is like humor. When you have to explain it, it\'s bad." — Cory House',
      '"Fix the cause, not the symptom." — Steve Maguire',
      '"Optimism is an occupational hazard of programming: feedback is the treatment." — Kent Beck',
      '"When to use iterative development? You should use iterative development only on projects that you want to succeed." — Martin Fowler',
      '"Simplicity is the soul of efficiency." — Austin Freeman',
      '"Before software can be reusable it first has to be usable." — Ralph Johnson',
      '"Make it work, make it right, make it fast." — Kent Beck',
      '"Premature optimization is the root of all evil (or at least most of it) in programming." – Donald Knuth',
      '"Don’t write code you don’t need just in case you might need it later." – YAGNI principle (You Ain\'t Gonna Need It)',
      '"The only way to do great work is to love what you do." - Steve Jobs (Applicable to programming and anything else)',
    }

    -- Seed random generator and select a quote
    math.randomseed(os.time())
    local random_quote = quotes[math.random(#quotes)]

    -- ASCII art header (Neovim logo)
    local header_art = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣀⣤⣴⣶⣶⣶⣦⣤⣄⡀⠀⠀⠘⣷⣤⡀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢀⣴⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠹⣿⣷⣄⠀⠀⠀⠀⠀⣾⢀⠀⠀⠀⠀⢠⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢿⣿⣿⣿⣿⣿⡿⠟⠋⠉⠛⠿⣿⣆⠀⠹⣿⣿⡄⢠⣤⣶⢷⣿⡎⣦⣤⣤⢠⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠈⢿⡆⠀⢻⣿⣧⢸⡿⠟⢺⣿⡇⠻⢿⡇⢸⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠀⠀⢿⡟⠀⠀⠀⢸⣿⡇⠀⠀⠁⢸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⢣⣶⣆⠀⢸⣿⠇⢀⣶⣦⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡃⠀⢻⣿⠀⢸⣿⠀⢸⣿⠋⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⢰⡈⠈⠀⠈⡏⠀⠈⠉⢠⣾⠇⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣌⢿⣦⣀⡀⠁⣀⣀⣴⣿⠏⠈⠙⠻⣷⣶⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠝⠿⣿⣿⣿⡿⡟⠁⠀⠀⠀⠀⠀⢿⣷⡀⠀⢀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⡇⠀⠀⠀⠀⢰⠃⢀⣀⣤⠀⠒⠦⡀⠻⣿⣷⣾⣦⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠂⠺⣿⣿⣶⣼⣇⠀⠀⠀⠀⢏⣴⣿⣿⡇⠀⠀⠀⢹⠀⠀⠉⠛⣿⣿⣿⣿⣿⣶⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⢸⣿⣿⣿⣿⣆⠀⠀⢰⣿⣿⣿⣿⣿⣄⣀⣀⠈⠀⠀⠀⠀⣿⣿⡿⣿⣷⡙⠃
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⣀⣀⣴⣿⣿⣿⠋⠀⠹⡆⠀⣾⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⣿⡇⠀⠘⠿⠇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⠿⠛⠋⡁⡀⠀⠀⡀⠀⠈⠉⢩⡉⣠⣿⠟⠁⠀⠀⠀⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡇⢳⣤⣶⠇⠀⠀⠀⣾⣿⣯⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣠⣿⣯⠀⠀⠀⠀⢻⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡾⠟⠿⣿⣿⣿⣿⣿⣧⡀⠀⠀⢸⣿⣿⡍⠻⢿⡷⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⢣⣶⣾⠿⢿⣿⣿⡿⠛⢿⣷⣶⡌⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠋⠀⠸⣿⣿⠟⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]
    local header_art2 = [[
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⢶⠶⠟⠛⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠻⣷⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠃⠀⢀⡴⢚⣁⠤⠷⠖⠒⠒⠒⠒⠒⠲⠤⣤⣀⠀⠀⠀⠂⠁⠀⠤⠾⠿⢷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠀⠀⡰⠚⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣗⢤⡀⠀⠀⠀⠀⠀⠀⠈⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠈⠳⣄⠀⠀⠀⠀⠀⠀⠈⠻⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢰⡟⠘⠀⠀⠠⠀⡐⠃⠀⣐⠏⠀⣀⣀⠤⠤⠤⠤⠤⠤⢤⣀⣀⣀⣆⠀⠀⠈⠣⡀⠀⠀⠤⠄⣀⠀⠘⢧⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⡿⠇⠀⢀⠔⠁⢠⠁⠀⡐⠀⠘⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠿⣄⠀⠀⠀⠐⡄⠀⠀⠀⠀⠉⠲⣌⢳⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣾⠙⠀⢀⠎⠀⠀⠇⢀⡄⠀⠀⠀⡀⠤⠀⠀⢀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠣⡀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠈⠱⣇⠀⠀⠀
⠀⠀⠀⠀⢸⠇⠀⢀⣞⡠⠀⠀⠀⠀⡀⠀⡔⠁⢀⠄⠒⠀⠀⠙⡆⢄⡊⢦⠀⠀⠀⢀⠀⠀⠑⡄⠉⠐⣴⠀⠀⠀⠀⠀⠀⠀⠘⠄⠀⠀
⠀⠀⠀⠀⡟⠀⢀⣾⠟⠀⠀⠇⠀⢠⠁⢤⠀⠀⠘⡆⠆⠀⠀⠀⡕⠁⠀⠁⠀⠀⠀⠀⠱⠀⠀⠐⠀⠀⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢠⡇⠀⣼⠋⠀⠀⠀⢰⠀⠀⠜⠂⠀⠀⠀⠀⠀⠀⢀⡎⡀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠁⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢸⣇⣼⠃⠀⠀⠀⠀⢢⡀⣢⠃⠀⠀⠀⠀⠀⠀⠀⡄⠑⠈⠙⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢸⢈⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠐⡀⠀⠀⠀⡀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢸⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⡀⠀⠀⠘⢶⣤⣄⠁⠀⠀⠀⢀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠉⢛⠃⠀⢸⡿⠉⡆⠀⠀⢠⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠋⠁⠀⠰⠀⣠⠟⠁⠀⡘⢶⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠚⠁⠀⢀⣼⡀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠛⠁⣀⠠⠐⠀⡌⠀⠟⢲⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⢋⣠⠴⠚⠉⠀⠀⠀⠀⠀⠸⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠊⢁⠖⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠁⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⡌⠀⠀⠀⠀⠀⢀⣤⡔⠀⠀⠀⠀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢇⠇⠀⠀⣠⠄⢤⡞⠉⣠⢤⡴⠿⣿⣋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠲⠭⠀⠀⠈⢉⠋⣡⠤⠴⠾⠛⠀⠀⠀⠀⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠘⠈⠩⠶⠾⠖⠂⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]
    local header_art3 = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⡄⠀⠀⣿⣧⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠁⠀⠀⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⣿⣿⡇⠀⠀⢀⣿⣿⣿⣿⣷⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣽⣿⣿⡇⠀⠀⣾⣿⣿⢸⣿⣿⡆⠘⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢯⣿⣿⡿⣵⠀⣼⣿⡏⣿⣾⣿⣿⣷⠈⡾⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡄⠀⠠⠁⢸⣿⡏⡿⢹⣼⠐⣿⣿⠁⣿⣿⣿⣿⡟⢠⣷⣻⡀⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡽⡀⠀⠀⣸⣿⠘⠀⣇⣿⡀⠸⠧⠀⣿⣿⣿⣿⠁⢈⣿⣇⠁⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⢿⡄⢀⣿⡏⠀⠀⣿⣿⣇⡐⠀⠀⣿⣿⠟⠁⡐⢸⣿⣿⣸⢿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠈⣎⢟⣎⢿⡇⠀⠈⣷⣿⣿⡀⠀⠸⡿⠃⠀⡰⠀⣿⣿⡟⣿⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠤⡀⠃⠀⠹⣎⢟⢧⡃⠀⠀⢿⣯⣿⣧⠀⠀⠀⠀⡴⠁⣼⣿⣿⢹⡟⣾⠇⢀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀⠻⡎⢣⡻⡀⠀⢰⢹⣞⢿⣧⠀⢀⡜⠀⣼⣿⣿⣏⣿⠓⠟⣰⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡀⠀⠀⠹⠄⠙⢀⠀⠘⡆⢻⢊⣿⣦⠎⢀⣼⡿⣹⡿⠙⠋⣠⣾⣿⣟⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⡂⠀⠀⠀⠀⠘⠀⠀⡣⣶⡿⣷⣁⢀⢞⣭⡀⣿⣇⣴⣾⣿⢟⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⢀⣼⣿⣿⠿⠋⠉⠱⢻⡿⣻⣿⣟⣿⠟⣱⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⢸⣿⠟⠁⠀⠀⠀⠀⢹⢷⡿⣵⢻⣽⣾⠛⠀⣤⣶⢾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠆⠀⠀⣰⣾⣷⡄⠈⣼⢳⣿⢿⠟⡁⣠⡾⣿⡽⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠁⣿⡿⠇⡰⠃⣈⢧⠀⣠⢿⡿⠾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡄⡀⠘⣦⣤⡟⠀⢘⢵⣯⣤⠏⠀⡟⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠁⠑⡒⠘⠙⠃⠐⠂⠙⣛⡿⢀⠘⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠈⠁⠀⣿⣶⣶⣿⣿⠃⢐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠸⣿⣿⠟⠋⣿⣎⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠏⠁⠀⢸⡿⣿⠹⣷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⠀⠀⠀⣀⠀⣰⢃⣿⠁⡿⠀⠈⠙⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣇⠀⠀⠀⠃⢰⠇⣸⠇⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣤⣤⣤⣽⣤⣀⠀⠀⠀⣀⣿⣤⣤⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠚⠛⠛⠿⣿⣿⣿⠉⠉⠉⠛⠛⠿⢿⣶⡶⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]

    -- Combine ASCII art with random quote
    local header = header_art2 .. random_quote

    return {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = header,
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    }
  end,
}
