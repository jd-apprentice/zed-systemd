module.exports = grammar({
  name: "systemd_service",

  rules: {
    source_file: ($) => repeat($._line),

    _line: ($) => choice($.section, $.property, $.comment, $._blank_line),

    section: ($) => seq("[", field("name", $.section_name), "]"),

    section_name: ($) => /[a-zA-Z0-9-]+/,

    property: ($) =>
      seq(field("key", /[A-Za-z0-9][A-Za-z0-9-]*/), "=", field("value", /.*/)),

    comment: ($) => token(seq("#", /.*/)),

    _blank_line: ($) => /\s*/,
  },
});
