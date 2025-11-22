{ pkgs, inputs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      options = {
        tabstop = 2;
        shiftwidth = 2;
      };

      telescope.enable = true;

      extraPlugins = {
        smear-cursor = {
          package = pkgs.vimPlugins.smear-cursor-nvim;
          setup = "require('smear_cursor').enabled = true";
        };
      };

      luaConfigRC.highlights = ''
        vim.api.nvim_set_hl(0, 'LineNr', { fg = '#8e8e8e', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#8e8e8e', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#8e8e8e', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#8e8e8e', bg = '#151515' })
      '';
    };
  };
}
