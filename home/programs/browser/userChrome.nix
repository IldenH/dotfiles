{ config }:

with config.colorScheme.palette; ''
:root {
  --urlbarView-highlight-background: #${base00} !important;
  --urlbarView-highlight-color: #${base07} !important;
  --urlbarView-hover-background: #${base01} !important;
  --urlbarView-separator-color: #${base00} !important;
  --toolbar-field-color: #${base07} !important;
}

#titlebar, 
#PersonalToolbar, 
#nav-bar, 
#tabbrowser-tabs, 
#navigator-toolbox, 
#urlbar-background {
  background-color: #${base00} !important;
  box-shadow: none !important;
  padding: 0 !important;
  outline: 0 !important;
  border: 0 !important;
  margin: 0 !important;
}

/* TODO: fix this menu, and do the same for context menu and permissions menu */
#appMenu-popup .PanelUI-subView, 
#unified-extensions-panel .panel-header,
#unified-extensions-panel .panel-subview-body,
#unified-extensions-panel {
  background-color: #${base00} !important;
  color: #${base07} !important;
}

#tracking-protection-icon-container,
#urlbar .search-one-offs, /* "this time search with ..." */
.titlebar-spacer {
	display: none !important;
}

#identity-box[pageproxystate=invalid] > .identity-box-button,
.searchbar-search-button  {
  display: none !important;
}

/* "search with ..." */
#urlbar-input::placeholder { 
  color: transparent !important;
}

#star-button {
	fill: #${base0A} !important;
}

#back-button, 
#forward-button,
#reload-button,
#unified-extensions-button,
#permissions-granted-icon,
#PanelUI-button,
#blocked-permissions-container {
  color: #${base07} !important;
}

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
''
