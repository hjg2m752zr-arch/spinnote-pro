# SpinNote Pro 使用说明

## 本机版
直接打开 index.html 可使用轮盘、记录、导出和打印；本机存储不保证永久不丢失，建议定期导出 JSON。

## 多设备云同步（需要自行配置）
1. 创建 Supabase 项目，在 SQL Editor 执行 `supabase-setup.sql`。
2. 在 Supabase Auth 设置允许 Email 注册，按需配置邮件验证。
3. 将网页发布到 HTTPS 静态网站（如 GitHub Pages）。
4. 在页面下方填写 Supabase Project URL、publishable/anon 公钥（**禁止填写 secret/service_role**）、邮箱及密码，注册并登录。
5. 首次连接如果云端已有数据，请点击“从云端恢复”，再“立即同步”。
6. 另一设备登录后也先点击“从云端恢复”。编辑后会尝试自动上传。
7. 发生冲突时停止覆盖：先导出 JSON 备份，再从云端恢复合并并手动同步。

## 限制
- 云同步需要网络、Supabase 项目与正确 RLS；未配置时只有本机保存。
- 云同步是可选的快照同步，删除操作跨设备合并时可能重新出现；需要更强的删除语义和实时同步应使用服务端事件日志/墓碑记录。
- 会话令牌只存储在当前标签页的 sessionStorage，配置公钥保存在 localStorage；不要在共享设备上登录。
- 无法保证绝对不丢失，建议定期导出备份；Supabase 备份与服务可用性取决于项目计划。
- 目前没有完成真实 Supabase 多设备联机验收。
