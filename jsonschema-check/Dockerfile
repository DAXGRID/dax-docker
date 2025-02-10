FROM archlinux:latest

RUN pacman -Sy check-jsonschema --noconfirm

ENTRYPOINT ["check-jsonschema"]
CMD ["--help"]