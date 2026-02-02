Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1C4E73157
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 10:47:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49877.1770029269320608467
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 02:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Vn7SP+qi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7D1394E423CF
	for <docs@lists.yoctoproject.org>; Mon,  2 Feb 2026 10:47:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D90B60767
	for <docs@lists.yoctoproject.org>; Mon,  2 Feb 2026 10:47:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 829D4119A8888;
	Mon,  2 Feb 2026 11:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770029266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cj41TdG2tLqkDAlQDmlCUWaS+1BlljiP4sDb6yI1Op0=;
	b=Vn7SP+qiNeIrzDcw8libU680CxLe5i7GsY8xASKtXpCeuf2j6ZyFL+eAqD4E4uuzQ3A9Z0
	vDX6nvkm5Tp3P5pHwGSLwSZRSDUsp8timRlXdpUjWJRbNKR5GSpIvoXU000acM6LGeILe7
	JwyabYKgdiEYyMeEFaFTzRe1EK1kF+fv66dUiRRbwfrMes0OuU4Md2cnV05aNn9kRWznpB
	AcIHtVTL+00y/bryAJs9o1Sw8Q/uEj5i3+VP6eQn0vqB0JT76HQOMALjEUF87cFJftfKip
	3LNUmbyaA7eQWL4vIoTAzw0mWh8ihElULUSLm2uhoInZhMz3NG1ZQOn8sjo3bg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Feb 2026 11:47:30 +0100
Subject: [PATCH RFC] sphinx-static/theme_overrides.css: switch to a fixed
 width documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-fixed-width-html-v1-1-e987deb9926d@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIKGbllmRmqJbnplSkqGbUZKbo2uWappiYGFuZp6SaKEE1FZQlApSAzI
 yWinIzVkpFiJYXJqUlZpcAjJMqbYWAJWIcxl5AAAA
X-Change-ID: 20260202-fixed-width-html-6e5d08767da8
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ldEOFxPqz217s/xOqkxocSeybvs8gev32gQ0599JmzQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpgIDRvCpoZrKaPZ1AxCFPfy6f2D78kTpd4iZoR
 nAW84YWLmGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaYCA0QAKCRDRgEFAKaOo
 No9oD/0WsG7/IyoNhRr2VjBYZng6eGE/zf08chm6fmSz/b2qwjH3N2poOn3A/feEQoZWZ4WviwL
 l/eUKP+exrnEdDmrgZqPuSxm5XCU1+lnFJAbm66CZBbF9XHkSP+W4Vaj7bT+f9QHUWtmUEqfr+X
 lj6cS54hy8r6fhJoWAGgvZB73H1esqsSPuMS8+HhUFPESaehoWfsFH4VfM+pbX4szAZweA1o5bL
 Hh/yLzACvms/yJMbVTt9VxqpzKdvvn44+q/TwzRZSPQc5OYRhYvPI8P2vj2/RDdLNP876CmDRH0
 53yq36qMmSngaerImpb7jOXlLQHACwpBy49Zil0oU+z/CQRNDRGJIby1ZMPwNkRLnNjXb/fvu2I
 gSn1/rsV4g0x7G8L0gxsHSjX+RUwxvqMm5h145zTdRr/6eEHdoBmCB8VKQq4N+NOGbdAl1nW562
 +A7YEE5aNOAUmvWA1EJJBsarvg73I8x1+gB/GhoKkQWPrNpDClLURvLchA5Fn2supejnIZNL9P7
 ulu14fGjJ9wigxzjSepZTmmysOim0tjDulPpuYu0Lz7P+dHET28dsTF3kY6FQZNHLg1WZ1YJ6nm
 MYXworlJt7n9Jc89G5lGIYsNZ6s9MsxGa+HleGgVmCvGjySfSOIvyQsamceXP3TxGEPhh+tL4Jh
 RWPOk/XU2/LoMoQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Feb 2026 10:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8856

Change the css rules of our theme to have a fixed-width documentation
instead of it taking the full width of the page. I believe this makes it
much more readable compared to having long lines with few line returns,
especially on high-resolution displays. Set the width to 1000px instead
of the previous 800px, which felt slightly too thin.

I think the removed comment here does not make that much sense for us.
It was added by commit 0c1e108bc6c4 ("sphinx: add CSS theme override"),
and I believe is a simply copy and paste of what was is set in the Linux
kernel, added by commit 9abaf979abb2 ("doc-rst: customize RTD theme,
table & full width") [1].

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9abaf979abb2

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: this would require backports to stable branches to harmonize each
version of the documentation (perhaps outdated releases too) - either
manually or in an automated manner from the Autobuilder. We would also
have to update the BitBake manual's CSS file.

Note 2: I was hesitant as whether to center the text column or not. If
you want to try this is possible to do it by adding:

.wy-nav-content {
   ...
   margin-left: auto;
   margin-right: auto;
}

Note 3: I also tested this on my smartphone and it displays correctly.
---
 documentation/sphinx-static/theme_overrides.css | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index d235cb826f..3cb16dbccc 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -99,14 +99,19 @@ em {
 [alt='Permalink'] { color: #eee; }
 [alt='Permalink']:hover { color: black; }
 
+.literal-block {
+    background: #f8f8f8;
+}
+
 @media screen {
-    /* content column
-     *
-     * RTD theme's default is 800px as max width for the content, but we have
-     * tables with tons of columns, which need the full width of the view-port.
-     */
+    .wy-nav-content {
+       max-width: 1000px;
+       background: #fcfcfc;
+    }
 
-    .wy-nav-content{max-width: none; }
+    .wy-nav-content-wrap {
+       background: #efefef;
+    }
 
     /* inline literal: drop the borderbox, padding and red color */
     code, .rst-content tt, .rst-content code {

---
base-commit: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4
change-id: 20260202-fixed-width-html-6e5d08767da8


