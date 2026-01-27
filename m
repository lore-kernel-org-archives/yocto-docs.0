Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE05CA6C86
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6049.1769501971530026451
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n7HOxbHE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 080DE4E422CA;
	Tue, 27 Jan 2026 08:19:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3111606F5;
	Tue, 27 Jan 2026 08:19:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED697119A8685;
	Tue, 27 Jan 2026 09:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H+nLSLEZ2vBAjEQ1gjOvryk+9enXap0cDufOE5mnwyo=;
	b=n7HOxbHENVUzaUi1xgjxe/wfyCKr6PBO5+DtSIuKsC0TOH6CcAJCpNlJD8tcAyYQh5KXz5
	Sh8JROqHwKKnS3HLS3qc66Ce6hkS3zmTMwGsGcdiKCufehApNwZZqxvuHSzylxBXDJNoL2
	3CqonkZF0LPwhBh0F1CJFUBdl5bWTVudMYeUnfKGTdQEFv9yGyc19fSyuKBDFORzwUvVPn
	uE/rOB+YdgDo4Q3R/4oWlUuNTuyOwWmfbDUAZK8Cs9mjeAMqZNHy1ahfplOpd+bsr8m2ii
	DtEWDKUL9CH1mp3d+ipYlVoBxmhD2AVfA2YK6meaQuIEXjrF2w4MRT00VJ1Eiw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:08 +0100
Subject: [PATCH v2 13/56] dev-manual/libraries.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-13-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JPaNl44+NYCzXwISX+B8zxF55Je4/P+9L5sCi/2m/Z8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUA8rshgrurX5uJZnTGpBoK4NfipOHZVeVcp
 ockxFExDjWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AAAKCRDRgEFAKaOo
 Nm3eEACkbtJoJMP57ZvZQsggYMctvyCz2vRk09P3lquchqyZgvu/tY09vlYcyeI6PkDTNkw/AKy
 nXYqc1feB+K2DWHe2LQLg/InIlXTYU+ebbu+XM7UBICQAbM2vZR0ihY4zTn+WuREFogwB9Tp3aH
 dtRNcrHAGBlnFJgf/wH8IuQvztCuWii2+qLS+e3m5rdFTe6qKNWEs9tUF8on6TjSubawO/vydPT
 2idhPpQ8y+jTE1y1Uhbu7+mVuOxBf3ZpJMWWOmXLUzM1Ijpsybkyyg2C/cl24toMAh1nZSgDtpt
 Hbn6kuEaowKH1Vmfpnz9U8NtF6tKrMj4mdC62fC9229y5WFKKgaVPNs1rRYtyixyQTl90Zf3Qp1
 MW1hVUMlQoYBncl1YCRpp1iou+PdzOVbdRUHdK/39EMXRYce0qr0+1J1PjMBG/UMqUiCTMKAein
 w9ZvfXFxPCZ3zeORa/n77MNoakHj1qmZafZqXsDfyzEIon7DN1q+fHVxA5bSXqV8+760hSc6vHx
 T3qwXnNq9L2/QfB/dL/vFNTp0sHU1jdXRgeKUAWZnvAcf5g6L2SsG3onsWjVtpxlQJOfn0LqxF8
 QlUmxXoqFeq25mOta0/yh/S7Vx0Zt5IpnY/0l4OQJre/oElAwNfYz1Euf/7m36O+cBGwrCvOeRY
 2OuXhoa5PT+5X1g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8674

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/libraries.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index a8c38128e..697ea48e4 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -68,8 +68,8 @@ libraries and other binaries to use a different set of libraries. The
 libraries could differ in architecture, compiler options, or other
 optimizations.
 
-There are several examples in the ``meta-skeleton`` layer found in the
-:term:`Source Directory`:
+There are several examples in the ``meta-skeleton`` layer found in
+:term:`OpenEmbedded-Core (OE-Core)`:
 
 -  :oe_git:`conf/multilib-example.conf </openembedded-core/tree/meta-skeleton/conf/multilib-example.conf>`
    configuration file.
@@ -90,8 +90,8 @@ meet your needs.
 In order to enable Multilib, you first need to ensure your recipe is
 extended to support multiple libraries. Many standard recipes are
 already extended and support multiple libraries. You can check in the
-``meta/conf/multilib.conf`` configuration file in the
-:term:`Source Directory` to see how this is
+``meta/conf/multilib.conf`` configuration file in
+:term:`OpenEmbedded-Core (OE-Core)` to see how this is
 done using the
 :term:`BBCLASSEXTEND` variable.
 Eventually, all recipes will be covered and this list will not be

-- 
2.52.0


