lib: {
  mkStrOption = default:
    lib.mkOption {
      type = lib.types.str;
      inherit default;
    };
}
