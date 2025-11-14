Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B82CE7AEB
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 11:18:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15747.1763119122513083824
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 03:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wH78pjGS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 37C191A1AA2
	for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EC016060E
	for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90DB61037125A;
	Fri, 14 Nov 2025 12:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763119120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8wtojFxYchSTjuZbPrn3fxAJe/+iuC0c0EkBZMpPDU8=;
	b=wH78pjGSX+mR18Hf0y/mM2uNUEce0HQz/Nw0C3KK3Alvfni2Hv3nM664uUX2qZEWINu2h/
	V9slhbuUZSNvwjTbxJVsQnEN7ZJuloXrd1xlNaaqnZ1aRvjWUZJHkMgsV98CaJxyTtOo/n
	eaxEh1OMNTD+sIBhD2+52UXnsrmfic6PXLTJiBmqEdhAQKM4MFAOyzTdZHdAR74LuZAfe2
	zNZ5M5+65ms+BUj+VYHv6Sic+6kYii2peFsPnfDwdlMRWo2Ld1fy7Yt/bL20yU+KDZ1DGl
	92hcQvIZ8tQCd/XnLgFXLoON3J347Hr2tCgR7rK1SCVMiOzEE6d3XGj2LLdlAg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 14 Nov 2025 12:18:23 +0100
Subject: [PATCH 1/2] brief-yoctoprojectqs/index.rst: update the bitbake
 clone command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-update-bbsetup-doc-v1-1-07e623b8ad2a@bootlin.com>
References: <20251114-update-bbsetup-doc-v1-0-07e623b8ad2a@bootlin.com>
In-Reply-To: <20251114-update-bbsetup-doc-v1-0-07e623b8ad2a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TCzkr5zgTlvAMGFdpjM0BS1hC7u0cAWdUvIjY9iIz8o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpFxAPjVNMnLOpm/0hbK8QvhTKu5zwK/wjof/eZ
 rx7wppXIFiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaRcQDwAKCRDRgEFAKaOo
 No0kD/9MqDHLZbokC+/LEHlEMHP5jO2/iHbK2OpBn82g3ajhZLHSXvf0J7akjsAai/E7ee/jRRL
 MvhXWS+Gef96ReclGOXfVUSfLo6sgoS4LABPWZu/1YnnJopH4bh0rffHxMsMvCsvfRjsHGCspDg
 WxM7pzlMNJKQGlFBpSv5L8FSY3SEOniWloN+2Sc9DbAJxVVdCqt8KcnkdrpsI5qF7WKnv7Qt3s9
 R6x6A3sMgAJUmaCnLN9ooEtjffaEw+yuK1Jn8U4AI2YSn6q89k+e8aAZwg33Vdw5g8oOlxfRKnW
 wrsUbvKsWmrHV+0UbOgJKNO1fR3nElkE6Hm6aCKw9mPFNhd8cfVQleqqOy4QmKb0BkMXnHrJL04
 JKkQT4QjXlEVJLnCvkU6KRQ6v05Dw4oMON9q9HegJ8HSBCCE4UNOFapE5eN6+SYdlzKwJjFvQ2g
 I03eN5xHvEJ2CtErEA16jT32gufkiLgeyL3R055IZ618FQGKuJ7t1YVHgYyemNIkm6/moPQTyXl
 xl3ei7Ns15S2y2TX5qSbOeQaK8IAH0LLtfsBMn5J7YtivdR/j1nXepdyw8Q/6FxxA/bSCC6lg/d
 seYYqX+p9Fqsih0/32pt51Ac4BGYeigeK1j2rom1FAtLEt5OPZM9ExxLsE9I6OFCXsxORsYrVEa
 /FA8a6xYBUjRLEw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8041

* Clone on the master branch for now, as the current tag is pointing to
  a version where bitbake-setup does not exist.
* Clone the bitbake repository with its default name. Some users are
  likely to already have bitbake cloned under this name, and with this
  change they'll still be able to copy the command listed in this guide.
* Use https:// instead of git:// for cloning.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index ebceecabf..2a7bd575c 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -97,13 +97,13 @@ the bitbake repository.
 
 .. code-block:: shell
 
-   $ git clone -b &DISTRO_REL_LATEST_TAG; git://git.openembedded.org/bitbake bitbake-setup
+   $ git clone https://git.openembedded.org/bitbake
 
 Setup a build environment with the following command:
 
 .. code-block:: shell
 
-   $ ./bitbake-setup/bin/bitbake-setup init
+   $ ./bitbake/bin/bitbake-setup init
 
 By default, this will setup a top directory in ``$HOME/bitbake-builds``.
 
@@ -112,7 +112,7 @@ current directory, you can set it with the :ref:`bitbake:ref-bbsetup-command-set
 
 .. code-block:: shell
 
-   $ ./bitbake-setup/bin/bitbake-setup settings set --global default top-dir-prefix $PWD
+   $ ./bitbake/bin/bitbake-setup settings set --global default top-dir-prefix $PWD
 
 .. note::
 

-- 
2.51.0


