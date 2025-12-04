Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7560AD20694
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:36:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43886.1764855408795017997
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 05:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ceRMIOuz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 82D18C17853
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:36:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3AEB6068C
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:36:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3659F11922626;
	Thu,  4 Dec 2025 14:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764855406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WjCTs00r9XFgE0UbcCbW4SfGbGEG05pzUexLpLG9M0I=;
	b=ceRMIOuzM/tuEYzLepaRSMEcwg8F/xpNsxHQuavqvP2aK7lzUe9obsRHZlUluJyIG/GV/t
	7YQDtnOnYIpe/JDjZz/a1oKq7EKb0gK+AjKsb2S1dvS+aAtX/J28f2ignN0V9dKgObAIy3
	fos+iOr/KUdu88Rmnzf6MLCPU5lUw3VCGDoqfcLpav163s2toFPVZZVfqkGl4TjT/CS+Kj
	q8J1yuMy5nqigkpIX3LDcenOF7sFAz+XkB37bQvF0/0ddVFcBLHU2AHk5yXuJ1mAnHXD0j
	ukpOQa6ZP1EEeHk2+MEKNoBWtbo0szxpkn0kppBq1VgReZI51jxsbEQJ/Y93xA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 04 Dec 2025 14:36:39 +0100
Subject: [PATCH v2 2/4] ref-manual/svg/releases.svg: mark whinlatter as
 current release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-release-updates-v2-2-04ca6c26ddd5@bootlin.com>
References: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
In-Reply-To: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YkLbtn6oyZRItPpJnFEMyp0sCpSBsYCnl+32iVXGiCQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMY5rM4CkM4ouIKqWr02T+TC6hmYNqBsrP3/oX
 9kFD5MojfCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTGOawAKCRDRgEFAKaOo
 NgghD/9M3tu8rTP0MvFfwUSZEStxiU2geHKgQsUKjxxkrdjml5BDBkw8sNCQpgXLu9ra7THwUr3
 lotC+3/KQuFpbB7aL1w7NCDiDOth2pJ3ewTxF8bXmFjj26+m+NKqu1KNrofEYAOts4i/QM4jkpc
 Dd/7SWVm4cDwA1gKWHYJno4nTksUisSW5eoPXICagwPyqMFQTXVhdHeC7rVBYrNN7m0eFDLRsis
 olxb1hynIUWOYZa7X8FjMKFv9AFI+saSegFV4UjrPYW1+DG9oHxGcskIn0Kq+bob9GnNt3uM7yC
 FHysDXKQ77F+ETojLVAIpI77Go/kg35KHfNvhI91FTKXV3CQ8+pBcWIHjEO5SVKSSlfxeCVEZi+
 aKYJMHJq/TepPxNDgkPlCcXe9JDw3d+Fou3ggfeQxGOY1+ZXE1MY0Nrfbxom3jzzpiiV5j8eZIe
 W3MOr2p2lC1W44EgXH3YEuVT4c/+2qiNOKdebzTTyfoUGKE8QQaiqMK0N7Rw6uufXuHvKf1DCTF
 j3jRBO8QuI2UKPZx51c5R0KWmwyPrLWt28VQyHbKV7JEZk/DAzl8VvkGY4eoClJI7OxrDyldQNS
 IttLZ2rH3KtpO+8CZbAbcanc3+hBcVFbKYYa1BYfas1uzm9c9pVAWWULUDNzDDtHAbiZc/SDwkl
 26QtPTvajYZeyyA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 13:36:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8218

Whinlatter is the new current Yocto Project release, mark it as an
active one. Move it as released in December 2025.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index e6038935f..b9fdd74ab 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -656,26 +656,26 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6-9">5.2</tspan></text>
     <rect
-       style="opacity:0.75;fill:#251f32;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2-3-67"
        width="140"
        height="45.000004"
-       x="1163.6425"
+       x="1223.8723"
        y="-382.27469"
        ry="2.2558987" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1214.9716"
+       x="1275.2014"
        y="-363.89413"
        id="text1185-3-55-4-0-0-0-1-1-6-4-3-53"><tspan
          sodipodi:role="line"
-         x="1214.9716"
+         x="1275.2014"
          y="-363.89413"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan957-2-8-6-3-9-7-4-2-0-5-5">Whinlatter</tspan><tspan
          sodipodi:role="line"
-         x="1214.9716"
+         x="1275.2014"
          y="-345.89746"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6-6-6">5.3</tspan></text>

-- 
2.51.0


