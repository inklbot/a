# Leo Developer Toolkit Example

#### 준비물
Ubuntu 22.04<br>
2 CPU<br>
2GB RAM

#### 필요 패키지 및 Leo 설치
```
sudo apt update
sudo apt install make clang pkg-config libssl-dev build-essential -y

curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

git clone https://github.com/AleoHQ/leo
cd leo
cargo install --path .
```
