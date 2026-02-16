set unstable := true

clone fork:
    git clone ./submodules/minimal ./submodules/{{ fork }}

commit hint="":
    netero commit -c ./docs/convention.txt {{ hint }} | git commit --edit -F -

research file="" hint="":
    netero "{{ hint }}" > ./docs/research/{{ file }}.md
