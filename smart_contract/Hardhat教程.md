---
layout: course_lesson
title: Hardhat教程
---

# Hardhat教程

## 视频介绍

**[Solidity 基础课第三节：使用Hardhat-测试与任务](https://www.bilibili.com/video/BV1jy4y1K7Tj/?share_source=copy_web&vd_source=06d5516ee4f517472270277cac88fae0)**

![](./attachment/image-20241008204626295.png)

## Hardhat简介

- 一个灵活、快速、可扩展的以太坊智能合约开发环境。
- 当前最流行的开发框架
- 最丰富的社区支持和插件生态

### Hardhat组成部分

- Hardhat Runner:Hardhati运行环境，核心为task和plugin
- Hardhat Network:开发使用的本地网络
- Hardhat VSCode:为VSCode中开发Solidityi设计的插件

### 为什么使用Hardhat

- 无需配置网络环境，在本地开发智能合约并利用Hardhat Network 模拟部署和测试
- 丰富的Debug.工具，包括合约中使用console.log,以及返回详细的错误信息和堆栈追踪信息

- 灵活性：自由地配置项目并构建自己的Qsk
- 兼容性：可以和其他开发工具一起使用(Truffle,Foundry,DappTools))

- 扩展性：可以添加各种插件来扩展功能
- 插件：拥有丰富的插件生态，活跃的社区支持

![](attachment/Hardhat与Remix对比.png)

## 准备工作

- 安装NodeJS
  - Hardhat是基于NodeJS的框架
- 选择你的代码编辑器
  - 推荐SCode
  - 插件安装：Solidity 
- 准备必要的Key和资产
  - 注册BSCScanf的APIKey)用于验证合约代码
  - 领取BNB Testnet的测试token
  - 注册Coinmarketcapl的APIKey用于测试中显示gasFee(可选)

![](./attachment/image-20241008210009949.png)

## Hardhat安装与设置

### 新建一个nardhat项目

```sh
npx hardhat
```

![](./attachment/image-20241008210226679.png)

### Hardhat目录结构

![](./attachment/image-20241008210319720.png)

### Hardhat配置

![](./attachment/image-20241008210455918.png)

![](./attachment/image-20241008210855082.png)

![](./attachment/image-20241008211058438.png)

## 使用Hardhat完成ERC2O合约

### ERC20合约功能设计

- Ownert机制
  - 合约的部署者成为owner 
- Mint机制
  - 每个地址只能mint一次，mint数量为一个确定的常量
  - 如果某个地址的币被销毁，那么可以重新获得一次mint机会
  - 合约的owner在部署时获得一定量的初始代币
- 转移机制
  - 不能转移
- Burn机制
  - 只有合约的owner可以burn掉任意地址的代币

### 完成ERC20合约

准备-安装@openzeppelin/,contracts

```sh
npm install @openzeppelin/contracts 
```

引入并继承ERC20合约

```solidity
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MyToken is ERC20
```

可以直接使用ERC20的基础功能，不必重复实现

![](./attachment/image-20241008212011528.png)

![](./attachment/image-20241008212133975.png)

![](./attachment/image-20241008212203652.png)

![](./attachment/image-20241008212226319.png)

### 测试

#### 设计测试内容

- Deployment
  - Correct owner正确的ownert地址
  - Initial values正确的代币name和symbol
  - Initial mint初始化mint了代币给owneri地址
- Mint & Burn
  - Mint token可以正常mint一次，不可以再次重复mint
  - Burn token只能被owneri调用一次burn,不可以被其他地址调用，不可以多次重复调用
- Transfer
  - Not allowed to transfer不可以转移

![](./attachment/image-20241008212812393.png)

#### 书写测试

![](./attachment/image-20241008212943758.png)

![](./attachment/image-20241008213409161.png)

![](./attachment/image-20241008213730611.png)

![](attachment/image-20241008213819995.png)

![](./attachment/image-20241008214220047.png)

![](./attachment/image-20241008214348576.png)

![](attachment/image-20241008214431884.png)

## Hardhat脚本与任务

### 脚本与任务

启动本地网络localhost

```sh
npx hardhat node
```

![](./attachment/image-20241008214806452.png)

用Script部署合约到localhost

```sh
npx hardhat run scripts/deploy.ts--network localhost
```

![](./attachment/image-20241008214922422.png)

```sh
npx hardhat deploy--network localhost
```

![](./attachment/image-20241008215146178.png)

### 用任务与合约交互

用Task来完成mint

```sh
npx hardhat mint--network localhost
```

![](./attachment/image-20241008215525202.png)

用Task来查看余额

```sh
npx hardhat balance--network localhost--address {address}
```

![](./attachment/image-20241008215712781.png)

### 部署到BNB Testnet

部署

```sh
npx hardhat deploy--network bnbtest
```

验证合约

```sh
npx hardhat verify --network bnbtest--address Oxabc123
```

![](./attachment/image-20241008215831441.png)