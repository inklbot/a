# Leo Developer Toolkit Example

## 준비물
Ubuntu 22.04<br>
2 CPU<br>
2GB RAM

## 필수 패키지 및 Leo 설치
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

## 러스트 설치
![image](https://github.com/inklbot/a/assets/31788091/bfaa0e6e-76bf-4294-8389-155c6150fc10)
<br>
기본값 1로 설치 진행<br>

## Leo 설치
![image](https://github.com/inklbot/a/assets/31788091/87f504e3-f3a6-427f-9352-2ddf08c3d39a)
<br> 설치중<br>
![image](https://github.com/inklbot/a/assets/31788091/f867e05a-3d9d-4ac7-a10d-cad7992be2ae)
<br> 설치 완료

### Leo 기본 예제를 사용하여 Tic Tac Toe 실행하기
![image](https://github.com/inklbot/a/assets/31788091/79e5d3a3-ae50-4041-bd72-7943afb5daeb)

```
leo example tictactoe
cd tictactoe
leo run new
```
![image](https://github.com/inklbot/a/assets/31788091/28d57f36-6ef5-45e4-b172-47c16b066f05)

### Leo 기본 예제를 사용하여 Lottery 실행하기
```
leo example lottery
cd lottery
leo run play
```
![image](https://github.com/inklbot/a/assets/31788091/9411ad4c-91e7-4c2d-bc48-db2eb0a043a9)

