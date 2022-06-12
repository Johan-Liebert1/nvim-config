import os

init_vim = os.path.join(os.environ['HOME'], '.config', 'nvim', 'init.vim')

with open(init_vim) as f:
    print(f.readlines())
