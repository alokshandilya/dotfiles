function fish_title
  # set -q argv[1]; or set argv simple terminal, st : fish shell
  set -q argv[1]; or set argv Hey Alok, Welcome to ur ❤️ fish shell
  # Looks like ~/d/fish: git log
  # or /e/apt: fish
  echo (fish_prompt_pwd_dir_length=1 prompt_pwd): $argv;
end
