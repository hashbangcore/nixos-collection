set unstable := true

fork-clone fork:
    git clone scaffolds/bare scaffolds/{{ fork }}
    git -C scaffolds/{{ fork }} remote remove origin
    gh repo create nixos-template-{{ fork }} \
      --confirm \
      --public \
      --push \
      --remote origin \
      --source scaffolds/{{ fork }} 
    git submodule add git@github.com:hashbangcore/nixos-template-{{ fork }} scaffolds/{{ fork }}
    just commit "clone fork"

fork-remove fork:
    git submodule deinit -f scaffolds/{{ fork }}
    git rm -f scaffolds/{{ fork }}
    gh repo delete hashbangcore/nixos-template-{{ fork }} --confirm
    rm -rf scaffolds/{{ fork }}
    rm -rf .git/modules/scaffolds/{{ fork }}
    just commit "remove fork"

commit hint="":
    netero commit -c docs/convention.txt {{ hint }} | git commit --edit -F -

research file="" hint="":
    netero "{{ hint }}" > docs/research/{{ file }}.md

