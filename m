Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AB7C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16462.1782807205585964379
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MGO/ZZZA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E773C4E40BA1
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDCE460233
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 319CB106F1CC8;
	Tue, 30 Jun 2026 10:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807203; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WIdERGL56wydrKzYn8sfzw9odd8Pxiyb7mp1YzVkyWo=;
	b=MGO/ZZZAxvFx9Xjc5GdVKBdpIi6Mxz05IAHhN3YfGMzs2uUj1HOV0EDaUAIB+aRNvK56ic
	rJTgvXOZlJK0ovXIlC15K3EyHnQ2xXmqahJY3YaMDdinPjeqjFFyzdKMylRxhbb8lsCER3
	mlXwc7wTUOJlgIyUJgUB9pyXr7HlYnvcJP5/hziRAJjfVNqh7wIc3X8JO2Xr6YJnQiS47e
	asYYY/zkcI+QiVbfXAOVwX0xstdeukYSmck7xKxDqtr0mfXGFEVcJBEQZWKvIAVhgF0kEx
	bL+lSniYViXe3s2pIxPfqaZlNNsVDjQ5Ns1a6nrlA05NBl7v5WBpgPioxxDWsQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 30 Jun 2026 10:13:17 +0200
Subject: [PATCH 7/7] ref-manual/variables.rst: document the IMAGE_*_DEBUGFS
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-sync-documentation-conf-v1-7-da14b40cb515@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
In-Reply-To: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cmnxXPaWPDZpftPnwl90m4uLIf9Nc+e2miz9fyPKTGk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQ3qdYgkl22py3k+LKrcbw9zpQ54dTQWmtI71P
 d+k2EhZ8iSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakN6nQAKCRDRgEFAKaOo
 NnevD/9bFcMmFLppcUxT3Stqy/ZCdQagm0nYNu3Iw23Iu5+62gSHgAH7/wY1H048+MR8vOx03Zs
 X6RSHRwmJJGea7FSmXrGSQXUymVA3puvGftmVZD+sEUwHA2SvLo7mtKNgsGQJ2040zN4TEAkOVE
 hIb6XhmrxOeQIOBdFaBjkNc0FfjgTorUElBpYWYqQJTrJoeZyPbJkrbFv/uZzPPiEBLJ+Uhw2XA
 ev84tlcX63HH12qa96v40Mmf0JsBgbz3qIMmIejKjufi779uZMFABaCil1tC8d/GPFWoSUX7q9v
 4zwL/Tq61EPayBUkmQyBLt+xXjksrvP6VKVevKth5heixwdNCT0KBMp+c63usYDiaOBQ7lbLVVL
 zRQ9YxCNQINxMY35bEVQwv+tUJGmcf9N21ei+gdPC2eMau5CiEN09V/eTAfwRqB6o3xFbdhaUFo
 q8LvGUcNmyauY8Zdd/9/JQOAHfPfsXBi8GUEKf+oenItTR5OXevARVjsThrO9X3ex7MaJV8AKjF
 As4L1+TVWXwMtLpCxGXUgwh+Wlg/zA5NU+rLMlsyJ+DcW9cPtk0DfVM8E6QqVWShkdFH80SwTxo
 DQyBgYpMkQdgJkvMRJGqliqtzkN8Qq457W1GL3Tit0FoIUEwG1RpumBYT+k25rhZhCMcxF9I0ln
 /TZVWOChQh6+8GA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9989

Added by commit 41316293e442 ("lib/oe/image.py: Add image generation
for companion debug filesystem") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d23eabad8..abb154f44 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4356,6 +4356,21 @@ system and gives an overview of their function and contents.
             or ``:prepend``. You must use the ``+=`` operator to add one or
             more options to the :term:`IMAGE_FSTYPES` variable.
 
+   :term:`IMAGE_FSTYPES_DEBUGFS`
+      The :term:`IMAGE_FSTYPES_DEBUGFS` holds a list of filesystem image types
+      to generate when the :term:`IMAGE_GEN_DEBUGFS` variable is set to "1". The
+      content of this variable is the same as what is supported by the
+      :term:`IMAGE_FSTYPES` variable.
+
+   :term:`IMAGE_GEN_DEBUGFS`
+      When set to "1" in an :ref:`ref-classes-image` recipe, the
+      :term:`OpenEmbedded Build System` will generate a companion image that
+      contains the debug symbols and source code for the packages installed on
+      the image. The :term:`OpenEmbedded Build System` does this by adding all
+      the available ``-dbg`` and ``-src`` packages available in the package
+      feed, which are automatically generated during
+      :ref:`overview-manual/concepts:Package Splitting`.
+
    :term:`IMAGE_INSTALL`
       Used by recipes to specify the packages to install into an image
       through the :ref:`ref-classes-image` class. Use the

-- 
2.54.0


