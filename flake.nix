{
  description = "Personal flakes templates";

  outputs = { self }: {
    templates = {
      blank = {
        path = ./blank;
        description = "flake with empy devshell";
      };
    };

    defaultTemplate = self.templates.blank;
  };
}
