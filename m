Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F68CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:26:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16625.1792135593894078295
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 00:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=bIBnStK+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FEF81A1250
	for <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 07:26:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CC006075D
	for <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 07:26:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C3F410328C79;
	Fri, 16 Oct 2026 09:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792135590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=NOhCsMLhMZzZ8a7Qq6BFS060e6IfWW4soy0143qvk/8=;
	b=bIBnStK+IxL6x5+sSMYnHXNwf1bBOVV9Enw3NUFuH4LeAwwUMWECUMwXuyOjcawGgaMrwR
	BS8TBSrrs4XDjgUHaUqzdtFmU0+NhHiT1sUIuMcFPgS+SOZ676pqm0J2jJrghhn+K+cVpv
	VZvZLjZb47+sVwpB+IZ9Z+2HftVUGEAO0VOk3lr6Z2rEwAfLtnVSfzD4enBIIjzSZa8fA0
	Iu9Mkrn3OcwqpNlw6jllw9Wa1hwy21qspA4LT7Wmwqf5vMQGTXw6ckkFCDHwT1PrAgB72B
	PwbopZ6Ld2c7OrbNVutW13GBL7jVBY7hWHDVGMYg1XoX9C2ED3vRo23HRT/ypg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 16 Oct 2026 09:26:12 +0200
Subject: [PATCH] AGENTS.md: add file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261016-agents-md-v1-1-fb9b9e7de437@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avErBPURVBXiRamo02QhVMRSHfPa
 vng8zMwJkKGrsqQ8CSmNRaougI7mRhQkCsGLXWjpGqECRh3FosT1jvv0ai2dRpKvyX0dH2vfvj
 Nxzij3d8B3PcDgPnsjm0AAAA=
X-Change-ID: 20261016-agents-md-cfdffea199d2
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4027;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Mps3lsd77MZ7BuOIcYy+Smq/O05Emh57kqOYAnJuobc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq0dGVX2zeARkYZMux57F6Uw4OfN4Ilkhsg5xRk
 6wg5LZbsqqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCatHRlQAKCRDRgEFAKaOo
 NoM1D/9WyH0fofT03dDX/PuQqqHvDNRIadSDJQcJWEmOzVPTgKZcMkiKqB0cK50XIqrDztmfNqU
 n5MYswozq8zX75A+PCOnVaN1zofO5Q75op7F1kVNOAiN3VHfZdCQQSS8H+J4gEISau1wh2/Hd1/
 t1+uvwRfxFv+mdiKZYJrJXKvXla/hbzNymvhVsciqAHUaMkTOJ3oyBHIk7nAC79L708ME3vVtDU
 wWapUacETJ93jFGKyGM/FKzmEgfzvlg6+TKPnFPMKcCERd9UKM6OidztoGBQJRO0wwyHy7dOW6r
 E+6MhKGkjURAxh3qK6T6qr4KIflcZ6fLh/QywYgykHv43qs7HIbWRqCy+rZiA01V/HXH6QhH9Ij
 hB0SdZ7nlTYpYYd5GHY4JbE0Ir4KQfv+WnG3zjM+fwAhNNh9QIrM3Soow5DEDcuzSkAt/2Sj4Zw
 jjOgZ/b6XsdROPRxpOWemZ3KziyA0kGyC4W6Ssh7zaMwwBB/j2xmOhhOrxOKrxDX9Cvbnjv+E/m
 9tFXP9vr+8JkY/R/YtOqMMQcP41tL9vVwaGX7h2jxke9X2WpmY09LYFUhRBv9Yph9LQUpFTdwsQ
 hU7K/mBMUZ2NwIigiu9qyJzeeAZ4a6kor9riPyI3T5iBb7+9iNAwdOEjM/Hp9NYJOv2E8JaiWxp
 SamppcQRi1KY7nQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 07:26:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10690

Mostly based on 06d397a09e28 ("AGENTS.md: Add file") in OE-Core and
adapted for yocto-docs, add a AGENTS.md file to direct coding agents
about better commit practices.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 AGENTS.md | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 65 insertions(+)

diff --git a/AGENTS.md b/AGENTS.md
new file mode 100644
index 000000000..3f6ff1d7a
--- /dev/null
+++ b/AGENTS.md
@@ -0,0 +1,65 @@
+# AGENTS.md =E2=80=94 Yocto Project documentation
+
+Guidance for AI agents working in the `yocto-docs` repository.
+
+## Making changes
+
+- No web PR workflow. The project use **patches on mailing lists**
+  (docs@lists.yoctoproject.org) tracked via patchwork
+  (https://patchwork.yoctoproject.org/project/docs/list/). Don't assume =
GitHub
+  PR conventions apply.
+- One Git commit per logical change (e.g., one commit per variable / fam=
ily of
+  variable documentation, or class documentation).
+- Commit message format:
+  - Summary line prefixed with either:
+    - the rST file path *without* the "documentation/"
+      prefix (e.g. `ref-manual/classes.rst: document the <classname> cla=
ss`).
+    - the section directory if multiple files from that section are touc=
hed in
+      the commit (e.g. `ref-manual: Remove the documentation of the
+      GROUPMEMS_PARAM variable`). Again, no "documentation/" prefix.
+    - `docs-wide: ...` if the commit touches files across multiple secti=
ons
+      (e.g. `docs-wide: replace hardcoded conf paths to structure.rst re=
fs`).
+      Again, no "documentation/" prefix.
+  - Check `git log --oneline <path>` for the prefix convention already i=
n use.
+  - Body explains what and why the documentation change is. If the commi=
t
+    represents a feature addition, also how it was tested.
+  - Prefer explaining *why* a change was made over restating what's
+    already visible in the diff, unless the diff is long/hard to follow
+    or the reason for the change isn't known =E2=80=94 in those cases, s=
ummarize
+    what changed instead.
+  - Be succinct: use as few sentences and lines as possible while still
+    covering what/why/how. Cut restatements, filler, and any detail a
+    reviewer wouldn't need (e.g. exact test-run counts, step-by-step
+    narration). One short paragraph is usually enough; only add a second
+    if a distinct point (e.g. testing) needs it.
+  - The most relevant information about the change should be presented f=
irst.
+  - Reference bugs as `[YOCTO #1234]` when applicable.
+  - Use `Reported-by`, `Suggested-by`, `Tested-by`, `Reviewed-by`, `Cc` =
tags
+    where relevant.
+
+### AI-generated code
+
+- **Mandatory**: any AI-generated code/commit must add an `AI-Generated:=
`
+  tag line in the commit message, placed *before* `Signed-off-by` (if pr=
esent),
+  naming the tool used, e.g.:
+
+  ```
+  document.rst: document the <classname> class
+
+  AI-Generated: Uses GitHub Copilot
+  ```
+
+- Also add a code comment or other in-patch indication that the code is
+  AI-generated (recommended, not just the commit tag).
+- **Mandatory** Do not automatically add a `Signed-off-by`. This tag mus=
t
+  always be written by the human contributor, never by the AI tool =E2=80=
=94 the
+  DCO/Developer's Statement of Origin still applies in full.
+- Contributor is responsible for confirming the AI tool's terms don't
+  conflict with the project's open source license/IP policy, and that
+  any third-party copyrighted material in the AI output is properly
+  licensed before contributing it. See the Linux Foundation generative A=
I
+  guidance: https://www.linuxfoundation.org/legal/generative-ai.
+- `Co-authored-by` should be omitted in favor of the `AI-generated` tag.
+
+When in doubt about a convention, grep `git log --oneline <path>` in the
+target repo for precedent before inventing a new style.

---
base-commit: f26faba8568a3c8fc81d81d3650cc419847a4e17
change-id: 20261016-agents-md-cfdffea199d2


