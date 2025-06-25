{ config, pkgs, ...}:
{
  programs.vim = {
    enable = true;
    settings = { ignorecase = true; };
    plugins = with pkgs.vimPlugins; [ 
			vim-airline
			vim-nix
			vim-lastplace
			vim-fugitive
			vim-polyglot
		];

    extraConfig = ''
			syntax enable
			filetype plugin on
			colorscheme evening

			let mapleader = " "
			set nocompatible
			set expandtab
			set shiftwidth=4
			set softtabstop=4
			set relativenumber
			set ignorecase
			set smartcase
			set incsearch
			set path+=**
			set wildmenu
			set mouse=a
			set colorcolumn=80
			set textwidth=80
			set clipboard=unnamedplus

			function! ToggleLineNumbers()
					if &relativenumber
							set norelativenumber
							set number
					elseif &number
							set relativenumber
					else
							set number
					endif
			endfunction

			nnoremap <C-p> :FZF<CR>
			nnoremap <F12> :call ToggleLineNumbers()<CR>
			nnoremap <leader><leader> :buffers<CR>
    '';
  };
}
