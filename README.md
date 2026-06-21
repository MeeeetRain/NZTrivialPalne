# 新西兰 12 天情侣旅行计划

> 2026-08-08 ~ 2026-08-19 · 深圳 ↔ 墨尔本 ↔ 新西兰 · 南岛轻自驾 + 米尔福德 + 滑雪

## 仓库结构

```
NZTrivialPalne/
├── 新西兰12天情侣旅行计划.md      ← 源文件 MD
├── public/                          ← Cloudflare Pages 部署目录
│   ├── index.html                   ← 重定向到 plan.html
│   ├── plan.html                    ← 🌐 公开版（PNR/订单号已隐藏）
│   ├── plan.md
│   └── private/                     ← 🔐 受 Cloudflare Access 保护
│       ├── index.html               ← 私密文件库 landing
│       ├── plan-full.html           ← 完整版（含敏感信息）
│       ├── plan-full.pdf
│       ├── flights/                 ← 国际+国内机票电子行程单
│       ├── hotels/                  ← 酒店预订单
│       └── visas/                   ← 签证批准信
├── 飞机行程单/                       ← 原始中文命名（仓库存档，不部署）
├── 签证/
├── 酒店/
└── 新西兰10天情侣旅行计划.pdf       ← 早期版本存档
```

## 🚀 Cloudflare Pages 部署设置

1. 创建新的 Pages 项目，连接到此 GitHub 仓库
2. **Build settings**:
   - Framework preset: `None`
   - Build command: `(留空)`
   - **Build output directory**: `public`
3. 部署后访问 `https://nztrivialpalne.pages.dev/` → 自动跳转到 `plan.html`

## 🔐 Cloudflare Access 配置（保护 /private/）

1. Cloudflare dashboard → **Zero Trust** → Access → **Applications**
2. **Add an application** → Self-hosted
3. 设置：
   - Application name: `NZ Trip - Private`
   - Session duration: `24 hours`
   - Application domain: `nztrivialpalne.pages.dev`
   - Path: `/private/*` ⭐ **关键**：只保护 private 路径，公开内容不需要登录
4. **Add policy**:
   - Action: `Allow`
   - Include → Emails → 列出你和搭档的邮箱
5. Save

之后访问 `/private/...` 任何路径都会先弹出 Cloudflare 邮箱 OTP 登录，公开 `plan.html` 不受影响。

## 📄 重新生成 HTML/PDF

如果修改了源 MD：

```bash
# 在 outputs 目录或本地（需要 markdown + weasyprint）
python3 build_html.py --mode public  # 生成 public/plan.html
python3 build_html.py --mode full    # 生成 public/private/plan-full.html
python3 build_pdf.py                 # 生成 public/private/plan-full.pdf
```

## 关键已订项

| 项 | 状态 |
|---|---|
| 国际机票（深航 + NZ）| ✅ 已购 |
| NZ 国内段 ZQN→AKL（Jetstar JQ296）| ✅ 已购（双人，行李待确认）|
| NZ Visitor Visa | ✅ 双人已批 |
| Ibis Budget AKL Airport（8/17）| ✅ 已订 |

## 待办

- [ ] 澳大利亚过境签 Subclass 771（双向覆盖）
- [ ] 9 晚住宿剩余 8 晚锁定
- [ ] 米尔福德峡湾一日团（推荐 Southern Discoveries + 10% off）
- [ ] 滑雪 Superpass + 班车 + 装备（Coronet Peak）
- [ ] Onsen Original Soak 8/16 21:00 时段
- [ ] 旅行保险（含冬季运动 + 航班延误）
- [ ] 驾照英文翻译公证
