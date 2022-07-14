autocmd BufWritePre *.{js,ts,tsx,json,yaml,yml,vue} :silent :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePre *.{sql} :silent :call CocAction('runCommand', 'sql.Format')

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
