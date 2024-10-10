Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0D4CF11E2
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41795.1728562261038865478
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IdvEKsUW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85BD1FF813;
	Thu, 10 Oct 2024 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6VDvMXROLY6SON2BjPV5w0gr8kc7mTacRGsHj4uIKmM=;
	b=IdvEKsUWf3tIQ8isPsnRutoq+0Ts4JjiLmy1WHtEt/cXqPip43zoP2dlsihmsJ1Mxareo3
	7cfnfzEKxOVuS7ncEZhdXKHKz2QW/R/RL3x/9sfp8qM7Fj0+nSmkdTuegAyINeKU5ajexo
	LWw4wQCXMr9inQEd/2D97HfpFecRf7H7pllO2+wybrHjcs5+bj/VswwKMHEXerApbqXNQn
	xjaVPHIZf2p1IwlwyFa6fzMXe7+CjnwMEepoZhdKnsYLkRheTz8Fq/hoLAvKO8ub4QkMhj
	KeagqcfizHrJNQ0QuTRtVA54tf9DBcaYzwY/kiSzBSaqkfnVe7al6ca9+1LM3g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:38 +0200
Subject: [PATCH v3 13/16] ref-manual: merge patch-status-* to patch-status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-13-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CF7qUB1hnvspj7dtirPq8h6wC3DK4URWnwfXYCqQ2aw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8ROjjgtz/FQlebpPZTw3jyEToL29w6CIMLw7
 kWJ++BjUOGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 NprlEAC2acDMKk0EnLM3/jhzbozpbRT4l478jxRWVb4OgZpJfMYt4+hfypknWpVIX4gd44XlT3L
 5Sz7dxV5VvH5zqk2SotuWY1wh7gL32GqtE5YgZXScZTUbdHj3WxFvxiDuW95uM5Fb2tgGdGxD3w
 ici1ZqTCiD68pIJgbpPw4sZf/M9F+qKUzZSeIMGQYo5Gpmw5UcbaK9BTYHaIK+zEDe6sgbg5sy1
 KxyTiLAeOh4g+8Qqjfnohaziqvn39y+EtDWOEUA3hjpIChsEJb2tiyQ8M/UdykWqSwnXcqoD6h4
 hRzEb6wpO8hi88MHQ5xaRPaTDf1sR+UJBZzQYSfZTumcxgZGpOKWaplV9aHA3xw+yRNrsZ82NbU
 9XqCqp1Cis5Ouu8KDnaLUfFQpsc61A/EhkfuhvukXYmK8Y8cHNwl3ARW/2JQ0cQ2FBnvOF9OJZM
 U4jr9WtKxpzVZ5yfv6KJvGQauBYKreyjimsOS6BMUBnJfoDOthmF07bjl9siZ/MqA+QkgXHpn+5
 zCbR1MMviNA91D0wrd2WmTtV7eBxU/GvCkIiy5pPP7tb5kqCP8j0Q8wdhfEGEQA2+xTcnmXstwB
 aHOn1TQUUEIWGXteTLwvJTYsPwEhboC1NDNWkzl793hpYqOql6gYR/Dvgg4WM/oyNKM8nKiWt4x
 kx6duEd6lpaTcFQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5466

These are not distinct anymore and check for any patches in any layer.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 121887d1f..cdfd1f7e3 100644
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
+-  ``patch-status:`` Checks that the ``Upstream-Status`` is specified and valid
+   in the headers of patches for recipes.
 
 -  ``perllocalpod:`` Checks for ``perllocal.pod`` being erroneously
    installed and packaged by a recipe.

-- 
2.46.0


