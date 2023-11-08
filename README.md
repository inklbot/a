# Leo Developer Toolkit Example

#### 준비물
Ubuntu 22.04<br>
2 CPU<br>
2GB RAM

#### 필요 패키지 및 Leo 설치
```
#기본 패키지 설치
sudo apt update
sudo apt install make clang pkg-config libssl-dev build-essential -y

#Rust 설치
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

#Leo 설치
git clone https://github.com/AleoHQ/leo
cd leo
cargo install --path .
```

#### 러스트 설치
![image](https://github.com/inklbot/a/assets/31788091/bfaa0e6e-76bf-4294-8389-155c6150fc10)
<br>
기본값 1로 설치 진행<br>
