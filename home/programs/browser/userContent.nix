''
  @-moz-document domain("worldcubeassociation.org") {
    .competitions-table tr.not-past.confirmed {
  		background-color: transparent !important;
    }

    .event-checkbox input[type="checkbox"] + i.cubing-icon,
  	.event-radio input[type="radio"] + i.cubing-icon {
      color: gray !important;
    }

    .event-checkbox input[type="checkbox"]:checked + i.cubing-icon,
  	.event-radio input[type="radio"]:checked + i.cubing-icon {
      color: lightgray !important;
    }
  }

  @-moz-document domain("docs.google.com"), domain("translate.google.com") {
  	html {
  		filter: invert(0.20) hue-rotate(0deg) brightness(0.80) contrast(1.6) !important;
  	}
  	html img{
  		filter: invert(0) hue-rotate(0deg) brightness(1.1) contrast(1.1) !important;
  	}
  }
''
