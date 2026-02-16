set unstable := true

clone fork:
    git clone ./scaffolds/bare ./scaffolds/{{ fork }}
    git -C ./scaffolds/{{ fork }} remote remove origin
    gh repo create nixos-template-{{ fork }} \
      --confirm \
      --public \
      --push \
      --remote origin \
      --source ./scaffolds/{{ fork }} 
    git submodule add git@github.com:hashbangcore/nixos-template-{{ fork }} ./scaffolds/{{ fork }}
    just commit

commit hint="":
    netero commit -c ./docs/convention.txt {{ hint }} | git commit --edit -F -

research file="" hint="":
    netero "{{ hint }}" > ./docs/research/{{ file }}.md

