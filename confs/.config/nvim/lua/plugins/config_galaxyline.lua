local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left = {
  {
    RainbowRed = {
      provider = function() return '▊ ' end,
      highlight = {colors.blue,colors.bg}
    },
  },
  {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
        [''] = colors.blue, -- V_BLOCK
        V=colors.blue,
        c = colors.magenta,no = colors.red,s = colors.orange,
        S=colors.orange,[''] = colors.orange,
        ic = colors.yellow,R = colors.violet,Rv = colors.violet,
        cv = colors.red,ce=colors.red, r = colors.cyan,
        rm = colors.cyan, ['r?'] = colors.cyan,
        ['!']  = colors.red,t = colors.red}
        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
        local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',v= 'VISUAL',V= 'VISUAL LINE', 
        [''] = 'VISUAL BLOCK',
      }
        return alias[vim.fn.mode()]..' '
      end,
      highlight = {colors.red,colors.bg,'bold'},
    },
  },
  {
    FileSize = {
      provider = 'FileSize',
      condition = condition.buffer_not_empty,
      highlight = {colors.fg,colors.bg}
    }
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    },
  },
  {
    FileName = {
      provider = 'FileName',
      condition = condition.buffer_not_empty,
      highlight = {colors.magenta,colors.bg,'bold'}
    }
  },
  {
    LineInfo = {
      provider = 'LineColumn',
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.fg,colors.bg},
    },
  },
  {
    Nearest = {
      provider = 'VistaPlugin',
      separator = ' ',
      highlight = {colors.blue,colors.bg},
    }
  },
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      highlight = {colors.red,colors.bg}
    }
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.yellow,colors.bg},
    }
  },
  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = '  ',
      highlight = {colors.cyan,colors.bg},
    }
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '  ',
      highlight = {colors.blue,colors.bg},
    }
  }
}

gls.right = {
  {
    PerCent = {
      provider = 'LinePercent',
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.fg,colors.bg,'bold'},
    }
  },
  {
    FileEncode = {
      provider = 'FileEncode',
      condition = condition.hide_in_width,
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.green,colors.bg,'bold'}
    }
  },
  {
    FileFormat = {
      provider = 'FileFormat',
      condition = condition.hide_in_width,
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.green,colors.bg,'bold'}
    }
  },
  {
    GitIcon = {
      provider = function() return '  ' end,
      condition = condition.check_git_workspace,
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.violet,colors.bg,'bold'},
    }
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      condition = condition.check_git_workspace,
      highlight = {colors.violet,colors.bg,'bold'},
    }
  },
  {
    DividerGit = {
      provider = function() return ' ' end,
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {colors.green,colors.bg},
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {colors.orange,colors.bg},
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {colors.red,colors.bg},
    }
  },
  {
    RainbowBlue = {
      provider = function() return ' ▊' end,
      highlight = {colors.blue,colors.bg}
    },
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
