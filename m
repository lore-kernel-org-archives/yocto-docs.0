Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2A3D6102E
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17099.1769700259156405244
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0svki5M6;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A1B4C22F47;
	Thu, 29 Jan 2026 15:24:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97827606FD;
	Thu, 29 Jan 2026 15:24:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B57DC119A8859;
	Thu, 29 Jan 2026 16:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+2xjNaC9b/ELtYqlQzSPG+Jc5NL5biO7pMHI15uRHP4=;
	b=0svki5M6zbPCxefXUkD815o6pq0ULDjMoCy7GtlNfMIXM7TcK1YRsWscfua46KO+9mK5MT
	n9PuzYGgR5G0wGnU62EEJE6oK/CosgvRNHotCjjVSdUW9Br+wtKAxyZEtVBKKzEm+DWCLx
	ktLGajtlrrraLlio0tW5EOV8F98SAMwUoG9smskx+3ymtfcTdGAnoJwRxY0TBnWBCZGms/
	7V49wYuX+637QQrzktjDHdmdsBVYFNjVvYLkSAjunOyyJV4MZcozbC0nwQrdLfsMpQmxEl
	jH12Uw7cUIVr3tEs46urvVRgWoYw4//hAEjI2tNjJbZV/xPb3zE85apkOCw0fQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:11 +0100
Subject: [PATCH v3 20/57] migration-guides/migration-1.4.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-20-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=b8WI5BuZdIqh8ndEv21J3B59uLjRO27TWlFHwLrS+Tw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uMbHzyNnf8zOLxlsXNpz1babuc7EJUW97EU
 /ecYytrndeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jAAKCRDRgEFAKaOo
 Nh0FEAC2gNE0wuviiszD4wpUb5mkc5aeCYlK4Om1QUUayykyKrpiRVFIAWO4hY6VStr0B96bcKy
 RONdtPkwp4N12zHJetWxN4D2AGnL6EpbpEu6eJq0FY/b8AJqZd7zy6CcWGGQ/AV888ZURT5/dis
 Gs3qjOGNWd/gwwu7p3WIvGNKWBaGorDoKlyDsAqtrQL7aQQI9gSBs8Eht8f0xWCRTQdTQdONyrc
 Rtf2yT0ZBymczpR8zUFp4qWzaUuJl+LoynzZG9XyHzdQaw6n/wwM0f2p2jjvDcwKsf4b/KvCZAU
 F35KT6UHQRwO7WWrGL2pmhGtrgve1GVVDE3HuBxtBnMjYKmmroE029rWugYC/n3/+xGeSPI6YJH
 9AJDr7guRiloLnj+2/PJtfSY6d+pnxFviVhMYBPS9bW9vohPxA0PYkQa9CKGmiwl2NcEE0bgXKY
 b27O7NFP270fHiTtp+ZczXdJ1eyinxvMgf9txh6REN/prV/5e30aLoDXX99J0FUfQgc7dX5qmxn
 YCcDdfs3Zg4SpPsOirpxnax8pdw/+f2g7VZH0Sn8zrWtMb3UJtAqLaKEECNt4e7n9PuQJ8Zxrtl
 7SYPSc90QU2BfqFhzmAYMZs6lzYydD459SMxCkkH4XAQFj0XAbMBVqLrUcYkWZIcnNtUEyhblvc
 GlKIkQpvaKqNifA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8806

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-1.4.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-1.4.rst b/documentation/migration-guides/migration-1.4.rst
index 6db2a035b8..5d8d0ffde8 100644
--- a/documentation/migration-guides/migration-1.4.rst
+++ b/documentation/migration-guides/migration-1.4.rst
@@ -82,7 +82,7 @@ Custom Interfaces File (netbase change)
 If you have created your own custom ``etc/network/interfaces`` file by
 creating an append file for the ``netbase`` recipe, you now need to
 create an append file for the ``init-ifupdown`` recipe instead, which
-you can find in the :term:`Source Directory` at
+you can find in :term:`OpenEmbedded-Core (OE-Core)` at
 ``meta/recipes-core/init-ifupdown``. For information on how to use
 append files, see the
 ":ref:`dev-manual/layers:appending other layers metadata with your layer`"

-- 
2.52.0


