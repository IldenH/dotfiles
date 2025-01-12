{config}:
with config.colorScheme.palette;
# css
  ''
    body.theme {
      --accent: #${base0E};
      --accent-overlay: #${base0E};
      --navbar-accent: #${base06};
      --background: #${base00};
      --body-background: var(--background);
      --background-darker: var(--background);
      --current-background: var(--background);
      --navbar-background: var(--background);
      --navbar-active-background: var(--background);
      --input-background: #${base01};
      --modal-background: var(--background);
      --modal-border: var(--background);
      --success: #${base0B};
      --success-hover: var(--success);
      --primary: #${base0D};
      --primary-hover: var(--primary);
      --danger: #${base08};
      --danger-hover: var(--danger);
      --anticheat-denied: #${base08};
      --anticheat-broken: #${base09};
      --anticheat-running: #${base0C};
      --anticheat-supported: #${base0B};
      --anticheat-planned: #${base0E};
      --icons-background: #${base01};
      --action-icon: #${base06};
      --action-icon-hover: #${base0E};
      --action-icon-active: #${base0C};
      --icon-disabled: #${base03};

      --text-title: #${base06};
      --text-default: #${base05};
      --text-secondary: #${base04};
      --text-tertiary: #${base03};
      --text-quartenary: #${base03};
    }
  ''
