Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F0BCDE002
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7578.1782380029376161909
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lOiPSKVL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF15B4E408CA
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 860745FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA333106F07A9;
	Thu, 25 Jun 2026 11:33:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i0IAOSCt6FvMQccjNhduY7MmxXq91mVKxc2jgjyGYtc=;
	b=lOiPSKVLxCU3klGf3V92oGb5L0Eh++xtnQL2FZfd4kdH5cqF27lPpFlf/oWpA7rpgnbuza
	FC5RnuOiWoIPUApUHluyuGQnQOrYkzoWHxZRa/BVLSuJZDJi78jPySJ4GbJh6TNP8EtpWR
	MjMfHVsY7p4Ym4i84xHNOnWRC3bMSNPAUR+kiTO5kF+7wdW4YCxj3kjVc2TpYCGH3GwV/R
	Zab3NfsCwPg2q5RsI2auN/dPwQ+6WD5qGpayY2KZFVK7x+2jZf+UcX77/uQOHgQOVikopw
	FsqnOvc8VfcDyZLNyXxmO3axhnGKjPm3ggHABnPv6fBIlKbRvRMX7AQq/FqIOw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:33 +0200
Subject: [PATCH 06/11] dev-manual/wic.rst: remove bullet point on host
 requirements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-6-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=W446PYSDclS7pRl8zPZhWcoH9qVddFZtuKtHaPfEA7E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX19Gt95IxlHkcGs1DMzI2S7eD7kpCN+AHRa
 ImRoefbp52JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19QAKCRDRgEFAKaOo
 NhFwD/sHR+ua0d58vzS+atPWtdTk1l1PgRFomfS6oko25U2JIxR2I4uMYuaX2T8XA/MDUtpERTO
 C1mNYVBZaKzzh67X2Bdi3QXtCLTuUSNU7PTlpxr6U4G7sT6zhshHfKTwjRvq0eso+PnaVbcz1Dg
 eBhT6sE4CBTGOgxESSmZU3JjVIZ9gMUNzNFMYRnXsmvcXv3eUpBAE4fX2iOkLWeNcdRNRoTCTfo
 A2Pg8a2lIa/srgS64izrN6r+iEx0hWT/9ouZSVqTNgngIYACcDhReJ3lLATulnI7c51MTd5u69q
 R+nJRkOfB7uYLiNmElQXBCwcgUXrco7rCjiSgHnnoM7IjfzQhDrpjFpH1MRKWtX0a/3cc26fX3S
 8pLCWf0U1oeHhwFZoKiD7BCXgxB0pyYni8T8q6oG+CkG4B6kqxH6V8voEYlc6kVpVp/B098WDsk
 mhUPseTvtTAgKlbmXfXEyBxSoSjqTj1S5UbbaTDlBiTUsOa6Z0LtXulScVaOW/nuwynWclqOnrt
 w85pnzZ1hhfHLtvZ1H+kiwqTEaf+1id4EhZn3OcEOHql7ynGdzqBnXWH/MejcrDr/MTR+HIx32D
 JYHy4AIWtQLlDIVOtxeAqSEywPGgUZcchDuEQudZbJbQ4Ca5qCSiFmn4Gu2bD/0OsZTX4ZyPSOk
 5bhbfJp7A38ihIg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9889

Using wic requires the build directory to be created, which implies a
host that meets the usual requirements. Most of our manuals are based on
this hypothesis, so no need to add this note here. Instead, simply
mention that the environment should be ready for use.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wic.rst | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index c74f898b6..ef8c530c2 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -71,16 +71,9 @@ Requirements
 In order to use the Wic utility with the OpenEmbedded Build system, your
 system needs to meet the following requirements:
 
--  The Linux distribution on your development host must support the
-   Yocto Project. See the ":ref:`system-requirements-supported-distros`"
-   section in the Yocto Project Reference Manual for the list of
-   distributions that support the Yocto Project.
-
--  The standard system utilities, such as ``cp``, must be installed on
-   your development host system.
-
--  You must have sourced the build environment setup script (i.e.
-   :ref:`structure-core-script`) found in the :term:`Build Directory`.
+-  You environment and :term:`Build Directory` must be ready, as if you were
+   going to run ``bitbake`` commands. See :ref:`dev-manual/start:Initializing
+   the Build Environment` for more details.
 
 -  You need to have the build artifacts already available, which
    typically means that you must have already created an image using the

-- 
2.54.0


