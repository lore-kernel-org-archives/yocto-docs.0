Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46136CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:50:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30258.1782460218956226602
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 00:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=UbJEmq08;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5EE23C5CD64
	for <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 07:50:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FE6A60232
	for <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 07:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24F9A104C978A;
	Fri, 26 Jun 2026 09:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782460216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XniipzAjWbrYxZrpUOZzPiIm8Sz7MpVJWMv45Ls9fzw=;
	b=UbJEmq08dc2lerCiZqerUmWPIUHfZybMp0qUPR6NoFXvhNL3By6ID0X5gr7UTNgAJGZrmu
	71pq/ylxwniPB6tTrb7Vic26JGpvVdbG53n88gHOvS9E2IkmW6MWxluN0NQlIJG7mO293n
	/oqM9VDMMgkBufxwq72Aqn9POJm89m38sYPFIXrTnEfdTTdp5fWtQcXsxkVDsd5qxcc85U
	AFCUybtMopROSlRNlpgCXgEdHit9g/+FXZdY9Aj9Vg6K/S1WyNlTimr3lrCQAH1Dd7wt7J
	+gArc93AMKqDU2J6jW7kZ1O/67ITgTZckFwgSp+cU6B+sb2cO5ioyWQIQYJAPw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 26 Jun 2026 09:49:50 +0200
Subject: [PATCH] migration-guides/migration-6.0.rst: fix wks file move note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260626-fix-6-0-migration-wic-note-v1-1-718c24a05619@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB2IwYTWq4gLTUY7BaMk8QfEu
 3faLj94vAsSRaYETXFBpJ0TL0FQlQW4Vx8mQvZi0EpbZbXBkU+0qHDmKfZZajzYYVgyoR+NGer
 q4ZV7ggzWSFL/5m33d9qGN7n8PcJ9fwDGKuPQfgAAAA==
X-Change-ID: 20260625-fix-6-0-migration-wic-note-df55b418d0c9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2084;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=L6DNge3kYlRpZpMWDI1kJIum9xhxN+qixHAMwoPznVE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPi82j7nDboUDXdd64JrhKCk3ISKs6Fhfc2k5+
 gEiH7fjxrGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaj4vNgAKCRDRgEFAKaOo
 Nkb6D/wLtgnIMXTVOeGCX2URQ9oGjisWnfE62HtQjgr1gv7YfWvOPmEU1TtgkLk+1A7lVc+7/E0
 nTrV2jBGOFlW4hMcpCRATr4r4mntg93+o8rVvVcFP8oXhsKiU1R8VlCG1j7IuizOD0DdLVE5ZsH
 i2jXwLLkmKwa/M27rvdCfQcfQOg+wqy3IqfcdeyyZI6uRGhr+QTwTXSQF29JZZOLqG99ciodhsg
 OfHfbXXkRw6CNhclIPYfA2J6+/ggwZ7rk0X2Yu9Y3qpR+w8YT1aJzQ1PHCnd8poxoaNI8jxR5tO
 BhQcS1pT4gScS8yny9PpXdLgpTaBm8DfJHf9e/3/KI4mvs/1K3PAiEQl2gGqCeASXRpfQ9XqAJZ
 j17IOxBRB10/VHq+QEgPbShZ5lexjLu7rsyYbLKZKD8AFpgf3r/+iOANmHgcM0Q3LB/mEpAtuGB
 IIo4fbaOQB65BgG9r69OO34fZsosiI7DzqdNLl1BTekoSe+lIJ6Xe2QZsH4/4E9fPg20o8+yVu3
 PxKBFrlghcUlMVISz4YeCq4y3HOAW95a4InI6yPbcv+RXKEzM8ZiDqbZh2mQQphs9heZL0zguKI
 Cq0PuarsOw01SPdgIeaMwwYJNnmRQLoezV0YHDl0SsWgIxYmR1jYbJ3ZOCEB1/dL3a0NyxsgCoq
 1G6Hfe9RELPUhdg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 07:50:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9901

This migration note wrongly mentioned that WIC plugins should be be
moved under files/wic. This is wrong, only kickstart files should be.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documenta=
tion/migration-guides/migration-6.0.rst
index 25bcac207..eed4b16e7 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -406,12 +406,12 @@ Should be replaced by::
 See commit :oecore_rev:`b50d6debf7baa555fbfb3521c4f952675bba2d37` for mo=
re
 information.
=20
-:doc:`WIC </dev-manual/wic>` files to be moved under ``files/wic``
-------------------------------------------------------------------
+:doc:`WIC </dev-manual/wic>` kickstart files to be moved under ``files/w=
ic``
+------------------------------------------------------------------------=
----
=20
-:doc:`WIC </dev-manual/wic>` related files such as :doc:`WKS
-</ref-manual/kickstart>` files or custom WIC plugins should be moved to =
the
-``files/wic/`` directory of the layer containing them.
+:doc:`WIC </dev-manual/wic>` kickstart files (:doc:`WKS </ref-manual/kic=
kstart>`
+files) should be moved to the ``files/wic/`` directory of the layer cont=
aining
+them.
=20
 If not done, the build will fail with errors indicating how to move thes=
e files,
 for example::
@@ -439,6 +439,9 @@ For example, here is the content of the :term:`OpenEm=
bedded-Core (OE-Core)`
    =E2=94=9C=E2=94=80=E2=94=80 sdimage-bootpart.wks
    =E2=94=94=E2=94=80=E2=94=80 systemd-bootdisk.wks
=20
+This change does not affect :ref:`WIC plugins <dev-manual/wic:Using the =
Wic
+Plugin Interface>`, which should remain in ``scripts/lib/wic/plugins/sou=
rce/``.
+
 Support for SysVinit compatibility in systemd was dropped
 ---------------------------------------------------------
=20

---
base-commit: be424bf52cd3ac9c83a4617d0b06afe8cde055be
change-id: 20260625-fix-6-0-migration-wic-note-df55b418d0c9


