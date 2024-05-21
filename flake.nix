{
  description = "Personal flakes templates";

  outputs = { self }: {
    templates = {
      blank = {
        path = ./blank-shell;
        description = "flake with empy devshell";
      };
    };

    default = self.templates.blank;
  };
}
