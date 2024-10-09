Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF15ACEDDB1
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19654.1728487498469080636
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OLfaksyv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C973B240007;
	Wed,  9 Oct 2024 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=awS1kCrkV1XVRxCulAUYpy+LCAh7c75D14nwagKc4ow=;
	b=OLfaksyvN4fjABu7Sl5pCspXokHmdS0RIDGYhXwbagM/mT9nDdHSMKgw62+KKbZ3+0QzPf
	9NeDY9FiX/3GfyPcZqPFuwnT5N0nQ7SLwpaUGWpqPyaddZEBWqDZG2Nc+3BL2cCCvK9fYo
	DrcYYU518NggZahI+Ff4V25c4ApCC18/8E2W1vfPdugZ/zuTBHWleYLOoFEKXMDRC/u3Nn
	dscbMIi+RllFN5KrPWdacKQdj1vaiwOvWU2lMOQJ/yL0R8caN+dIxt+/TpAAB6d+4Y0ktp
	xQIRfTDFheXJLIWm6RRmoXWzKNrE0/kesjBTfgeTBLjUXY3ZhMb5NyrxQJ5g3g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:21 +0200
Subject: [PATCH v2 13/16] ref-manual: merge patch-status-* to patch-status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-13-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=gep1i5X738inNYKMffrTEf6G6Ja678Ykw/EK3Yt1Lgc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBELqROat0ENjJnE/kE/UjyvdSDnDeyIP5lq
 eSpWCdlOiSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagRAAKCRDRgEFAKaOo
 NvY2D/9QkYJ14QZ+DybUuZAAEKTaSkVCW+gvg0NtgTUKdgScfLK/v0B1dbPIUpape8281HibjXZ
 IBVCDo/eFSMHXB9hH+J4M9SJUKNKQB2MznMValALHED9sP/OArWu39b5c+ck1fW4bfdRBhFSaHh
 wdlcOaa7ktz1bLGo1pnejcwbWIi3Lfh3T4eeUknDgbbMJGAo9zH3o1KZJf/KzqK4uoAF5fh8M/X
 J41HL/PIy7mcHrp+0VRavIvlr8fkhbzMgW3rMfU5OlusI2Kn8gX4NNxP+pPg76vhC7P2lnLmUqi
 wKUXGN8wFU1EUpppDW42oKwf/UKl4NBNrDzzVq7XFgsls51QEEJMxCOP7Ow25+Lk9FX9SP6eA+H
 6p6PC6b5jYobUlJb44vS0Ec7b/1x4rcz4v7yBrFsCouVPwdtF1eSLdXaJhDbOFyJXdWeBx08tdq
 6sUPHrwpgS24KR7iEiDRbnSh7kJfZicXm6LXuvAzwWgpbUGXm7CoG5A5j5bUG5yXkPKZmrQ5Nc0
 hVe25aLLhrRiK5rqtkKXVFaDRNcRWoeWTTAd0zsa5QS9lE165giw/TBegADgGyK1UTqm82hlOiq
 iiZbJL8EddNaODJP1XLtWDjaxMVwBdS3jNJCoWe0CcmYr6UB2P+d3x3x2J3grRmT/K/viEjgz4B
 XMgw+osklfFls8A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5442

These are not distinct anymore and check for any patches in any layer.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 121887d1f..0fce37cfa 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1461,12 +1461,8 @@ The tests you can list with the :term:`WARN_QA` and
 -  ``patch-fuzz:`` Checks for fuzz in patch files that may allow
    them to apply incorrectly if the underlying code changes.
 
--  ``patch-status-core:`` Checks that the Upstream-Status is specified
-   and valid in the headers of patches for recipes in the OE-Core layer.
-
--  ``patch-status-noncore:`` Checks that the Upstream-Status is specified
-   and valid in the headers of patches for recipes in layers other than
-   OE-Core.
+-  ``patch-status:`` Checks that the Upstream-Status is specified and valid in
+   the headers of patches for recipes.
 
 -  ``perllocalpod:`` Checks for ``perllocal.pod`` being erroneously
    installed and packaged by a recipe.

-- 
2.46.0


