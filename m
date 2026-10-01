Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D902CA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 13:09:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10786.1790860188687568612
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 06:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=sc7FGCHg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C8A54E40EF7;
	Thu,  1 Oct 2026 13:09:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D643C60341;
	Thu,  1 Oct 2026 13:09:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D0A3103280F3;
	Thu,  1 Oct 2026 15:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790860186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TVEYjFI0Ssn1T05CSJSBGODC4P0i80ReJ35osNexOr4=;
	b=sc7FGCHgUGxt10GvnKEGUn7G9+XH3B1tbcyp0Z2+hzLa/YQkLD9spzp39/bb9b2RZTZYit
	9XHDGFyIX2Cn64od+COPSVGl7jsCpwXSadfk2UCdCO1lXGQWbgkYk3d5OAIXfRADRdxDRo
	sqNbUn54ySemXDX2VfAUNptY7w1JvHgBFixvBF/O/tE4/fEXnAGbLRxvEHY/lOAoXsU8Ug
	kMRaK/uBEQUs8fwrXy81eWX+OfAFke8BxP+25PTJ8rVOddEaADQZNNXSG1qxJoM9XFuNSB
	u/A8DjhOCylaPVuvrYBcH94V7oAGiaMHidmFovR+oUGnYVHMSfwprkplgXpjvQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	antonin.godard@bootlin.com,
	paul@pbarker.dev,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 4/4] migration-guides/release-notes-6.1.rst: add latest changes
Date: Thu,  1 Oct 2026 15:09:04 +0200
Message-ID: <20261001130904.2061644-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
References: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 13:09:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10652

Cover the changes in openembedded-core from d48e03cf74 to 419c1b0f1e:

- new PACKAGECONFIG options
- Miscellaneous changes

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/release-notes-6.1.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.1.rst b/docum=
entation/migration-guides/release-notes-6.1.rst
index d6f992fe0..915c22200 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -611,6 +611,7 @@ New Features / Enhancements in |yocto-ver|
    -  ``p11-kit``: ``systemd``, ``trust``
    -  ``pciutils``: ``dns``, ``shared``
    -  ``perf``: ``bpf-skel``, ``llvm``
+   -  ``python3-requests``: ``chardet``, ``charset-normalizer``
    -  ``seatd``: ``manpages``
    -  ``strace``: ``libdw``
    -  ``vim``: ``desktop``
@@ -730,6 +731,10 @@ New Features / Enhancements in |yocto-ver|
    -  :ref:`ref-classes-pypi`: Only set ``downloadprefix`` in :term:`SRC=
_URI` if needed
       (:oecore_rev:`be391d8a8b7d4898063ceae1fbd707bfd2218be3`)
=20
+   -  ``sqlite3``: Squash ``sqlite3.inc`` into the recipe, since this is=
 the only place
+      where it is used.
+      (:oecore_rev:`35db54823f0eebc8258f29f18bbd59b04dbca88d`)
+
 Known Issues in |yocto-ver|
 ---------------------------
=20
--=20
2.55.0


