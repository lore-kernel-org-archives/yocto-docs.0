Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC8FE77192
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.150618.1734697026185439557
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n28KEic0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A202F4000D;
	Fri, 20 Dec 2024 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHqTkq6Vg6ZnkG+OvQm5TUh++7JfEnLt74Ko8tsDDuk=;
	b=n28KEic0fppKOcfuslO3b6sPSirHx3/hIFR2LMGutSqon/dgdEXip/EsPXAoLeRG4+9HDA
	srsaIT3KTfmEGi8+FkM92JLHOWokhxiLk/XgTyWqio1qjFjbLkOgne5yt1f/Z77gYqkqEj
	LuXYxhAzBDWBkR9K5TYANQolOqZGwN9H056yUtEOUz42/ANjDEyyK7CcDax+accsOh7U3s
	R0aa37wrbpml4w5rnw8Rn+FJyf2He+Yd7JXOTvdivc8ThjE4Ub9x9wpK1LP+zkL4GZdc7A
	81cYsRKL8qPLCqPCjUSRth7QNx49ZrgG9sQcuhuAbte5ZQ3kboCik2NaSk/tZg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:30 +0100
Subject: [yocto-docs PATCH v2 03/14] ref-manual/variables: document the
 FIRMWARE_COMPRESSION variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-3-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c504MZfaiajyKQxywhxpN2WzbqrHahHfwsNBV93p1gU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA+SrcFU2/peChptnMOj876cm3+cali8uKPw
 iiNAZ+C6uKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPgAKCRDRgEFAKaOo
 Nmy7D/4+HtoXlc/iNnl4F1C6mwU3UAflCMIVnKe0XJ4AhrFkodukjizWXZ/54Q/OAy4X0ZdoSS8
 J0GkQ74+Z7r5ZkAcMM4OX4oD2k3CdrODs7buwe6qT+ZVJ+1tLpp0IlQ4NfCSc0v3NBvN+wFWTF+
 qnlSVF7SRFq9MEFrQec3iBQKxYbZ5W7lpxiUWukQ2aeACll4731RlQOfedLKn4n5/tmj1sP0ryE
 wSCiuV9DOuocm7pbAG9cL+tTLE2KOlmQuRUHtGSOZ7tffd010iF9t4P911qUCzc6Fb2ZcxcmwZY
 ahc5tUayjlaFBpALDcEEd5vT8qbtDFJpRegreXDj8ajy0iLcaRM69e8YyKl0sqk8WSINtJY1cJz
 4tZcz8Zk0R0OeLROayg7OASWZSm91hm1MihE/g+DHT+JpnYFFrE3ELojZPvS3YQpk4dPtj31jcK
 BsTNs9EeDZld4+oqrLM7uUtD6rvVjRcCO/LUmzfSe4kec78uLDt8mrzDmBmy5YBDOeKLG6Fdf7Q
 Q6tjrQxNBB/XbyzNn5H7GZ5VsRllQBeRM1V5JZk3uviwBz/r14llpFtPRYdW4eXIQHdQ7p+DG51
 oKWsgSh52fT2GWo0LZKroKiuLTOOaAO3/NAYNruIBHsrEqd5GO7+fiycXl2WglpyCpzuYztgBHR
 4KJp8I8zWg3LcKQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6001

Added in oecore after the 20241017 update.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b31abeced4cc9b692f8bed814891a267c73f29b7..21c4c78873e67786e09ac49a0ac15efedfb0240e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3038,6 +3038,16 @@ system and gives an overview of their function and contents.
       tables, examine the existing ``fs-perms.txt``,
       ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` files.
 
+   :term:`FIRMWARE_COMPRESSION`
+      The :term:`FIRMWARE_COMPRESSION` allows compressing the firmware provided
+      by the ``linux-firmware`` recipe. The default value of this variable is an
+      empty string (no compression), and the possible values it can take are
+      ``xz`` and ``zst``. This can allow significant disk space savings.
+
+      For this to work, the Linux Kernel requires the
+      ``CONFIG_FW_LOADER_COMPRESS_XZ`` or ``CONFIG_FW_LOADER_COMPRESS_ZSTD``
+      configuration options to be set.
+
    :term:`FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
       description of the FIT image.

-- 
2.47.1


