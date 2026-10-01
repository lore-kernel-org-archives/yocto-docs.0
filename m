Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC36CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 13:09:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10785.1790860183350179742
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 06:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=D3L81JRn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 99F8D4E40EF7;
	Thu,  1 Oct 2026 13:09:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6833E60341;
	Thu,  1 Oct 2026 13:09:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D971103280DF;
	Thu,  1 Oct 2026 15:09:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790860181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rem4Z18CiQPZB9DMHrlbI/1vZm88Eg796CgcUi/5080=;
	b=D3L81JRnoxiYGmJTIDFZKf/0jiaZJ8v5E3LfySG7l9YuzhILeKAbsMle670nSO1+4Guucc
	cibHztk3jPhs5Q6bXanX+yDK+PiBNl/8EmAsSTzT9Tx5j50xf9NjESqlIxgMlE5Fk7EHW1
	YtEFZ0v1iKphtQtI15X6BtNsY/RBrmfYZ0CmB3IvREm+c/BRbvs+E2iDVRrtq0wQvmBa1W
	uDeaCX8IgWgBAWf079wEyEyQksXPSFjXKmS2V6I1222IWX44pe9q8ykLCRz4SsxtvrlCAa
	ZPZVUsa9V+FM1b14fEcFyGORWTQhLaF6RLu/6mTrx51qvpITyC6t2PJJSeh7BQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	antonin.godard@bootlin.com,
	paul@pbarker.dev,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 1/4] migration-guides/release-notes-6.1.rst: add recipe upgrades
Date: Thu,  1 Oct 2026 15:09:01 +0200
Message-ID: <20261001130904.2061644-2-joaomarcos.costa@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 13:09:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10649

Cover the upgrades in openembedded-core from d48e03cf74 to 419c1b0f1e.

Using a local script to parse 'git log --oneline HEAD...d48e03cf74'.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../migration-guides/release-notes-6.1.rst    | 55 +++++++++++++------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.1.rst b/docum=
entation/migration-guides/release-notes-6.1.rst
index 231b8f0a3..354d6b0ae 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -950,7 +950,7 @@ The following recipes have been upgraded:
      - 1.6.5
    * - ``at-spi2-core``
      - 2.60.0
-     - 2.60.6
+     - 2.62.0.1
    * - ``attr``
      - 2.5.2
      - 2.6.0
@@ -959,7 +959,7 @@ The following recipes have been upgraded:
      - 0.9~rc5
    * - ``barebox``
      - 2026.04.0
-     - 2026.08.0
+     - 2026.09.0
    * - ``barebox-tools``
      - 2026.04.0
      - 2026.08.0
@@ -968,7 +968,7 @@ The following recipes have been upgraded:
      - 2.18.0
    * - ``bind``
      - 9.20.26
-     - 9.20.27
+     - 9.20.29
    * - ``binutils``
      - 2.46.1
      - 2.47
@@ -1005,6 +1005,9 @@ The following recipes have been upgraded:
    * - ``ca-certificates``
      - 20260601
      - 20260816
+   * - ``cairo``
+     - 1.18.4
+     - 1.18.6
    * - ``cargo``
      - 1.94.1
      - 1.98.1
@@ -1103,7 +1106,7 @@ The following recipes have been upgraded:
      - 8.2.10
    * - ``ffmpeg``
      - 8.0.3
-     - 8.1.2
+     - 9.0.2
    * - ``file``
      - 5.47
      - 5.48
@@ -1245,6 +1248,9 @@ The following recipes have been upgraded:
    * - ``gtk4``
      - 4.22.2
      - 4.22.4
+   * - ``gzip``
+     - 1.14
+     - 1.15
    * - ``harfbuzz``
      - 12.3.2
      - 14.4.0
@@ -1370,19 +1376,25 @@ The following recipes have been upgraded:
      - 1.21.0
    * - ``librsvg``
      - 2.61.3
-     - 2.62.3
+     - 2.63.2
    * - ``libseccomp``
      - 2.6.0
      - 2.6.1
+   * - ``libsecret``
+     - 0.21.7
+     - 0.21.8.2
    * - ``libslirp``
      - 4.9.1
-     - 4.9.4
+     - 4.9.5
    * - ``libsolv``
      - 0.7.36
      - 0.7.39
    * - ``libstd-rs``
      - 1.94.1
      - 1.98.1
+   * - ``libtest-fatal-perl``
+     - 0.018
+     - 0.019
    * - ``libtool``
      - 2.5.4
      - 2.6.2
@@ -1421,7 +1433,7 @@ The following recipes have been upgraded:
      - 1.4.85
    * - ``linux-firmware``
      - 20260410
-     - 20260810
+     - 20260916
    * - ``linux-libc-headers``
      - 6.18
      - 7.2
@@ -1481,7 +1493,7 @@ The following recipes have been upgraded:
      - 6.19
    * - ``mesa``
      - 26.0.5
-     - 26.2.2
+     - 26.2.3
    * - ``mesa-demos``
      - 9.0.0
      - 9.0.0+git
@@ -1538,7 +1550,7 @@ The following recipes have been upgraded:
      - 10.5p1
    * - ``openssl``
      - 3.5.7
-     - 4.0.2
+     - 4.0.3
    * - ``opkg``
      - 0.9.0
      - 0.10.0
@@ -1556,7 +1568,7 @@ The following recipes have been upgraded:
      - 1.58.2
    * - ``parted``
      - 3.6
-     - 3.7
+     - 3.8
    * - ``patchelf``
      - 0.18.0+git
      - 0.19.1
@@ -1580,7 +1592,7 @@ The following recipes have been upgraded:
      - 2.16
    * - ``ppp``
      - 2.5.2
-     - 2.5.3
+     - 2.5.4
    * - ``procps``
      - 4.0.6
      - 4.0.7
@@ -1637,7 +1649,7 @@ The following recipes have been upgraded:
      - 6.167.0
    * - ``python3-idna``
      - 3.11
-     - 3.19
+     - 3.20
    * - ``python3-imagesize``
      - 2.0.0
      - 2.0.1
@@ -1662,6 +1674,9 @@ The following recipes have been upgraded:
    * - ``python3-meson-python``
      - 0.19.0
      - 0.20.0
+   * - ``python3-more-itertools``
+     - 10.6.0
+     - 10.8.0
    * - ``python3-numpy``
      - 2.4.3
      - 2.5.2
@@ -1701,6 +1716,9 @@ The following recipes have been upgraded:
    * - ``python3-pyopenssl``
      - 26.0.0
      - 26.4.0
+   * - ``python3-pyproject-hooks``
+     - 1.2.0
+     - 1.3.3
    * - ``python3-pyproject-metadata``
      - 0.11.0
      - 0.12.1
@@ -1709,7 +1727,7 @@ The following recipes have been upgraded:
      - 9.1.1
    * - ``python3-pytz``
      - 2026.1
-     - 2026.3
+     - 2026.3.post1
    * - ``python3-requests``
      - 2.32.5
      - 2.34.2
@@ -1757,7 +1775,7 @@ The following recipes have been upgraded:
      - 6.1.3
    * - ``python3-urllib3``
      - 2.6.3
-     - 2.7.0
+     - 2.8.0
    * - ``python3-uv-build``
      - 0.10.10
      - 0.12.9
@@ -1802,10 +1820,10 @@ The following recipes have been upgraded:
      - git (359ab169da6a=E2=80=A6)
    * - ``rsync``
      - 3.4.1
-     - 3.5.0
+     - 3.5.1
    * - ``ruby``
      - 4.0.5
-     - 4.0.6
+     - 4.0.7
    * - ``rust``
      - 1.94.1
      - 1.98.1
@@ -1893,6 +1911,9 @@ The following recipes have been upgraded:
    * - ``ttyrun``
      - 2.41.0
      - 2.44.0
+   * - ``tzdata/tzcode-native``
+     - 2026c
+     - 2026d
    * - ``u-boot``
      - 2026.01
      - 2026.07
@@ -1904,7 +1925,7 @@ The following recipes have been upgraded:
      - 4.2.0
    * - ``util-linux``
      - 2.41.5
-     - 2.42.3
+     - 2.42.4
    * - ``util-linux-libuuid``
      - 2.41.5
      - 2.42.3
--=20
2.55.0


