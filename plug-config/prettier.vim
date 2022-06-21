autocmd BufWritePre *.{js,ts,tsx,json,yaml,yml,vue} :silent :call CocAction('runCommand', 'prettier.formatFile')
