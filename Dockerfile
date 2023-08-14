FROM carlodepieri/docker-archlinux-ansible:latest
RUN pacman --sync --refresh && \
    pacman --noconfirm --sync reflector && \
    reflector --country 'Russia' --latest 5 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && \
    pacman --noconfirm --sync which base-devel glibc lib32-glibc git curl wget htop iotop
