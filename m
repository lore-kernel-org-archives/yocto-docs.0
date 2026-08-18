Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D38C5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 07:35:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3716.1787038531304192914
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 00:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NZPEwAdv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A4641A16F7
	for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 07:35:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D06FE60355
	for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 07:35:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46D4911C7490E;
	Tue, 18 Aug 2026 09:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787038524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HI4hXHjRhyl8ck1k3rruWyCL87H+kuuG0lZ4tsXhMmo=;
	b=NZPEwAdv6qOt28NdC9/qPL5dGYKfpy3EI9R7I7IOZy+/4MBwL69cBCXqXUyvaJRNs7K/8L
	a089/Owj3XmikZ7LnM80mBm1oqQ3OgFnZJkJBEElMwybWgkbLFdkc4EItl6n2AjiHSINXN
	3lWo/MZ0XJzdTBtGrTtS2lrvDHO25RdBkZ62qOziwk98WrVsb1jkkqCP9tJ3FfwMLkA4UA
	+P9/Uy2nJC9GiLaxJrsVFFLvtbttgwkJFEW+UcnbI5iyCY0vIVu0ssDRzqXW6OQYHP5mMS
	xfqhPD/rcKWSz2D0it+LpMMotnAYg3ECSjZNDKsfQgb/GRv+rFFqkj2mvp3egg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Aug 2026 09:34:59 +0200
Subject: [PATCH] index.rst: show the intro paragraph only for html-based
 docs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-intros-only-in-html-v1-1-4fe4c54655bf@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTsJLQ0Yr2JctGWAMdiaTjUQw
 t2psnvf4v0bCCUmgVu1QaIvC8dQoC4V+MmGkZD7YtC1buurUsghpygYw7yWjVN+zWi0Ietc1xh
 voTzfiQZe/tX747R83JN8/qVg3w/9x7VedwAAAA==
X-Change-ID: 20260811-intros-only-in-html-424eabb734ca
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LSn7pFd9aWF1rTgetWhcWZ+QXQ1puYG2OAfxnRqsDU0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqhAs4hcyMwjp6J8FLh6i8nFPgJNlAn5e7sde8R
 cNfPgndzAuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaoQLOAAKCRDRgEFAKaOo
 NmktD/4knkcG1AZjW3QktfrGMzFm0U7MImwBLIyD0P4nWm/rZHb/7Yj+4h5/MlUkK1ykXDA4i5K
 TT6HeYWMd4t8RrYzuvntGuAKLGz+jO3vk/GVuxcDZuH54oOYwDLi7zT3DOKbdLGRHmsdi8fTvOf
 prdWp5lvDPAbuvTrTH7Jmd0JVV2u5FcRd124FWrEstaOFCljndaIf78135ZMMLfz0Y0Pl/yzvTZ
 i6y4OfxZF0JYd6zZi9YHg+1DBEQ6e+ruG7hJc8HcW6z6GI812JxuidQN0V7eqB51w6Ro8sKYmbX
 DHXpj90LgZ9s/7KSSNcKxUmp4+GEwiii3KfTp17pyzMvfFgUNfddA1k4ZDWAmehBDihJqG71mJn
 /8biAYZTO84kBpHr5pRBqxY4qfdFvo7ujMjF793IXFZ0iIVsiFj2aTejm333lwRzS2M5K0L/66t
 cr5yJb0qmTZ9ePYv9BtUrOdUi6RmYW3wMN5lFh6kyZYXjj1XvmPnUBojRdQ1hdMYhczE5O3oUyk
 gF/h7CRQQbf9tz9y57QwUqCqo1qhQJwxYZcM3o4rrrcjKj1Vh5YgbpsBvDr4HoCZ3efPZTDjw5u
 ww78PuRJjRO0tAJ2iO30RdWMQMP8a5FmJIDsiOiFRyrBiWoofXL9WUp7Jp6PSnBtHqSBne7PLvU
 f0CvsmH5QzWnSeA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 07:35:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10294

The current non-HTML-based documents we support is the PDF format. For
this format, this intro paragraph is placed right after the table of
contents, which is odd and breaks the flow of the document. Show this
paragraph only in HTML-based document, which includes the HTML and ePUB
formats.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index afabb6615..9fe4f6acf 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -9,10 +9,12 @@
 Welcome to the Yocto Project Documentation
 ==========================================
 
-This is the top level of the Yocto Project documentation tree. The Yocto Project
-documentation is always a work in progress, just like the Yocto Project itself.
-Improvements to the documentation are always welcome; join the
-:yocto_lists:`docs mailing list </g/docs>` if you want to help out.
+.. only:: html
+
+   This is the top level of the Yocto Project documentation tree. The Yocto
+   Project documentation is always a work in progress, just like the Yocto
+   Project itself. Improvements to the documentation are always welcome; join
+   the :yocto_lists:`docs mailing list </g/docs>` if you want to help out.
 
 Introduction and Overview
 =========================

---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260811-intros-only-in-html-424eabb734ca


