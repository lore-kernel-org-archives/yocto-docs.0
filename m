Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AB4CCF9EF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.4941.1761294032159196931
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H9pTa8hc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2076C0C41D
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD57060703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AB09102F2489;
	Fri, 24 Oct 2025 10:20:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294030; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7A1LfuSbeeOv4B/28M0W30NidW8oZvO9I1s5amcKsIQ=;
	b=H9pTa8hcWl1kQPH1v0GW8vUwc3U7GSVcS5jZOkuhkPwlhbH9DnZ7qyi43ZksvqS+qGNnmN
	PhmyBLsGOSL0lajz9XHbm4ULMi2JBhO5xbZ/c3jOoS4O7VQwGerOhXXrKiRnIdDknY8uuM
	fl+yNP+KBAL8GBZKASjnVeqKlKm7I0MG5Y8ADgn22+NTro83g7TUXKQ2SZPPsC9LnDYkp+
	GzP8DhTYACUy2FmKfJn45cl6UsJdWkU4zgVSB4ow1k4NMC45ZtYO5BdYVW1Dbszj57/3Cy
	Y4C0w9ApCjc95TgFer1CUEOBKQYa4GPW7dYb7nM+Sxwp1vGlBTMgL1/34VrNOw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:51 +0200
Subject: [PATCH v2 02/16] ref-manual/features.rst: add new opencl feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-2-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=894;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=q1c8HZnxuBZqcQ4D0WuOnc3q9jhmRELDp4c9f+kBZ9o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbI5x+zdHd7fMXmhmWTIAjq/kgtrWfxxiM2J
 7zldWVNQZqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yAAKCRDRgEFAKaOo
 NjKID/4pem8d2f4ujCG7iFlveANbYNkGqFm7JGv9jlUZz4ChNxqGL2F8lq1AL+26jrxEES7izjU
 8EO5hpbtAX31qQefBviB17gVA7sLM9lI60BWr7DneFcS0RCGuUCORa+48KhPdDFjMIDyreoonqU
 3HR8CJTXd/Zl+0WtoN8V3qMBYyUwHrqJW2dp0/zcpegBTuBbC2NkIxCe+vzeaesQObbc/qaunSC
 f3vJuDA+L6usHlpzW57+zd/UwMZjHCGLnjFR0NeyrV9P5yoJJkXaGiSd6mQbFnSMTr3HIyaAMpL
 eKCnBir1Z70U03kOvSdcsagqHZiWTZ9y7AfeMAREvtRG/cIJl4rC3ACjhLbMB8YHo8FzbaL/jd0
 eB05TfNtHNsM7X0kSOGPr/L1oER7ML4dciMykyMaTFCtq8GEfAXPk96Z//ONXxuIW3693cBs9iT
 w33HlGiElwWu7iRn4vKMFFqx/z2kY2EBwneLPdHuF58P51q0Kp9BAW02s8gnLDe4eIK2pgiYct8
 uXcmIg50jMWSvilzEYjZCfcjSs6mHZ4L5vb1GKAyeabQvoET7R8bwt/NOPGtdL8GewityUM9bGJ
 r2aQK9mUKKOEfIkT8JyuOc919cIOW98LcUlGRp3zaxdTNsqXnJmDgccJyR0SPjgnZOJsZy3eZfu
 SwLQ7LDJuuuB5/g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7791

Added by commit 3061d6061e74 ("mesa: add opencl DISTRO_FEATURE") in
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 2c074ab9c..b295ab44e 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -180,6 +180,9 @@ metadata, as extra layers can define their own:
 
 -  *nls:* Include National Language Support (NLS).
 
+-  *opencl:* Include support for the :wikipedia:`OpenCL (Open Computing
+   Language) <OpenCL>` framework.
+
 -  *opengl:* Include the Open Graphics Library, which is a
    cross-language, multi-platform application programming interface used
    for rendering two and three-dimensional graphics.

-- 
2.51.0


