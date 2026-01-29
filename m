Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46E5D61038
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17194.1769700257415975913
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=adfOackt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF93D4E4231D;
	Thu, 29 Jan 2026 15:24:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7465606FD;
	Thu, 29 Jan 2026 15:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C706E119A868D;
	Thu, 29 Jan 2026 16:24:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kP+D3YJ8WN+qLf/jP0L/uWEt9anDHVMCac7gvyUU8C8=;
	b=adfOackthHRJ008G6VBnuh5GJy91SFrcJk95FKZC7aK+uXfKM3tmjmaSUVnK5XIOCe6b4U
	Mmoseh2UY7R6D/FRH3pd0pq4jY9xhisGzY3JYGw1D/xx+GgaFIqhgDdnEfrMMTd3tPHewk
	kjCZf6s4yqBye/9NdKiFLPmw4f1anlefqfbmj4lK0KYivNWROr4ep4xbedfvww5CW8O0Yw
	22vqJcPtsWLZjhbynpNDM+2YQQZBwV7OFts3fXEr6F3RgXiy6ljsQ8WEYmB+azHqSoiU71
	blpCpWtX4m9mg8DD2und/OhPPg+TkSqq6r6zlvcWlvR5A81nsJwtZTc771NjFg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:08 +0100
Subject: [PATCH v3 17/57] dev-manual/wayland.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-17-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ArZdQ9IJBWORZ7l/hoZaNdZttPXDgevMN8FGCm7e6Lc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uL/6BFtEAP5gNjyPZLuATXsHXrHPO/hpfWQ
 A1RlfZ9J96JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iwAKCRDRgEFAKaOo
 NvwxD/49IqmLpAZsvZSCCEF+Sy6oS0DN38b4S9Uvl4JQe+Q96LpU3ESMF5Uoev0EDmrtrX9ZRy6
 cU4xCP9dr++1ahkuvjvNkN5LCMY+1tPgZYNWjeaEBstYISWcrwj/zjcctGj2Rma9eYRFjXe1BKE
 s1AglwT5+gRzHcwW1F/2ymNZ567065NX44GEOB22qNtntYoVEyWtSLLTRg8GjcgZXvipK+DZykK
 MueZEzco4pmimbua248q8vrYns2tdleecgaHMJT6YdBl0Mv0IxKWxwzBk4YkwcIvUtvxoS8hBmb
 vLM1M+4h7z7VJ1KBJ6kxt7cotINA+HclFWLhBgscxjfi0SqBQX72NKtu2LsyN6OqCez08mVTHwl
 2/rbzompWU9S3Al7MbljGvwxlU+qWw2aJQeYkxxoCtPx4geHddqWt9aj+koRVj4/seHultp/rkz
 /1ht5Kd4uOZZr+Ns5wCqkPxDp8Tw3b3rvpNJzDdQXZW+1xkUecG4lNaV6b2Yv4nhpr92u5OOCqb
 dcQAZzyKkdU6C5JLzgXQ2NnFUO6B2kexx8plhtO0sjG/Zov0Q89oRbbiifNcbpnVNYrivH6XvdZ
 GPr9sxzKJJyfzMeL+A6C2WIgiHNm/XfMwc6nZCqFdRJJc+6iS2xq8+Q+uIfqW4I8kgnjfWRTFLo
 3dVWmK2b92HD/uA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8803

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wayland.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
index 097be9cbde..18d1bfb0a6 100644
--- a/documentation/dev-manual/wayland.rst
+++ b/documentation/dev-manual/wayland.rst
@@ -14,7 +14,7 @@ might otherwise achieve.
 The Yocto Project provides the Wayland protocol libraries and the
 reference :wikipedia:`Weston <Wayland_(display_server_protocol)#Weston>`
 compositor as part of its release. You can find the integrated packages
-in the ``meta`` layer of the :term:`Source Directory`.
+in the ``meta`` layer of :term:`OpenEmbedded-Core (OE-Core)`.
 Specifically, you
 can find the recipes that build both Wayland and Weston at
 ``meta/recipes-graphics/wayland``.

-- 
2.52.0


