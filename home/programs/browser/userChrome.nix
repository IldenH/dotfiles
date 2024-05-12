{config}:
with config.colorScheme.palette; ''
  :root {
    --urlbarView-highlight-background: #${base00} !important;
    --urlbarView-highlight-color: #${base07} !important;
    --urlbarView-hover-background: #${base01} !important;
    --urlbarView-separator-color: #${base00} !important;
  }

  #PersonalToolbar,
  #nav-bar,
  #navigator-toolbox,
  #urlbar-background {
    background-color: #${base00} !important;
    box-shadow: none !important;
    padding: 0 !important;
    outline: 0 !important;
    border: 0 !important;
  }

  /* remove contextmenu things */
  #context-inspect-a11y,
  #context-take-screenshot,
  #context-savelink,
  #context-print-selection,
  #context-viewpartialsource-selection,
  #context-stripOnShareLink,
  #context-searchselect,
  #context-sendimage,
  #context-savepage,
  /* seperators */
  #unified-extensions-view toolbarseparator,
  #contentAreaContextMenu menuseparator,
  .titlebar-spacer,
  /* other */
  #urlbar .search-one-offs, /* "this time search with ..." */
  #tracking-protection-icon-container,
  #identity-box[pageproxystate=invalid] > .identity-box-button,
  .searchbar-search-button {
  	display: none !important;
  }

  /* "search with ..." */
  #urlbar-input::placeholder {
    color: transparent !important;
  }

  /* stars are yellow */
  #star-button {
  	fill: #${base0A} !important;
  }

  /* tabs */
  .tab-background[selected],
  .tab-background[multiselected="true"] {
  	background: #${base01} !important;
  }
  .tabbrowser-tab {
    padding: 0 !important;
  }
  .tabbrowser-tab * {
    margin: 0 !important;
    border-radius: 0 !important;
  }
  .tab-icon-image {
    height: auto !important;
    width: 1.1em !important;
    margin-right: 0.5em !important;
  }

  /* context menus */
  .menupopup-arrowscrollbox {
    border: 2px solid #${base01} !important;
    min-width: 200px !important;
  }
''
