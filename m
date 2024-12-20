Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C5BE7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.150875.1734697025887775530
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ks25K4d9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 708A14000C;
	Fri, 20 Dec 2024 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMs531dinYeVl6eDR+xTTgCJlG0VLVF8hm96iB3QqaA=;
	b=ks25K4d9QcbiBw5Mm9vAtqmxUEixiuWOxAb5+uUh2f4+37q1l5Dljv4T2UznA6J+06KZAw
	88rmzPBJs07fajbbbGfw2r8m7n5iC/0VJRUVzd9xRI/P2Nhl6tJ8yp8G2gMNjx1QK1x/XX
	kwdVh+buKub/hYmbTeLfXjRiLl3lfZFZjVw1xR7IQ/nwhMvCCjITFsuejrEWezNJ1s/xoR
	FnWZfSyxYqyNAiX37/8p5COugb+ZG0o0QYdVkBvWtha0WtilRNOGvfkkd+ReXhK7FDiZNB
	DUg9fzqsNRpVDv7Po65d65hBVgLivjZTEkNYdavkJYWC383S0auVtdMunqDKyQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:29 +0100
Subject: [yocto-docs PATCH v2 02/14] ref-manual/classes: drop the
 migrate_localcount class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-2-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=chliSmUXkUtA9kCXoNfEY4Iw2QrBbAqGmQY0i9Xa0QY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA+IpK19lMxVD8wBccZfiVvI9XbDj7HCzdZw
 FRSmtl6hJaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPgAKCRDRgEFAKaOo
 Nnx2D/9smchQO1KHFJnj+HmAcm1ib5zbqGTgYxM6EEJV+mxOLfKZMRo3A4dT2vrN91SFwhgoaqv
 JLmOY8OJiVrqcLzfrls2UOBks+rVEkI0pMVYegIbyJrFehheW97KxRh2iq1Im+UpJYYJy5fo4S6
 nW2nTDouquoUCW/+Hp0OQP8gt0C09Pglr+1DWXOnFnQnHFghzs+Z3rlH2xou/vI42DJRwDeDcde
 yzuxzJk8+J4IpLlsBj5kUpmuunpczeSkWQs1AcQfbYlDaP5M7seT+R5Z3RbIbL5YVyn0DYaeOZE
 sDFxsyeE6Cbgcz1cubl4d5yxXy1B9mH/l3FPHXcVwAnjHLQQAW4Yjvl70YHoe6Bhn6huszJImoT
 tud5xZcF2MX23EXVE9PJNnq5VkD6C2L2PjcykkxISBkHix08moaahhOhKO7d45/uFKz5m0OwV9s
 w2R1VeDBNINhVotFoVcgR1KU+a7JqxEmqsciSdENPc7dRe3sFHZZcZduoKlAdR9uZ0BtOnC9yS7
 sw1KSunuwTwJYauIZZ1gielXy06o+Co6oSP746zHLIegCzRCTOE1eB0kz4H6OywBc8AXPCf7KuL
 78IPFNjz/7aFB8xJqnYvcCTdsaFjpcekfHayCc7+LB/4J3QqRO5FvETQFkaZiekbycHxQhyy2k6
 WE20yKydt8MjD7w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5998

This class is obsolete and was removed from openembedded-core with
commits fca25fc4d7721f85f64c942307ebe7ba9f2fad3e ("migrate_localcount:
Drop long obsolete code") and d0f35207f9e19b440393a79ebf621649c495738d
("bitbake: fetch2: remove localcount and use AUTOINC instead").

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e5fe44052d4b05bf1b2b3acfaf2fd368f66fb261..3d61d8d7a00b21fcff82a771f9718013fae36694 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1877,14 +1877,6 @@ each layer before starting every build. The :ref:`ref-classes-metadata_scm`
 class is enabled by default because it is inherited by the
 :ref:`ref-classes-base` class.
 
-.. _ref-classes-migrate_localcount:
-
-``migrate_localcount``
-======================
-
-The :ref:`ref-classes-migrate_localcount` class verifies a recipe's localcount data and
-increments it appropriately.
-
 .. _ref-classes-mime:
 
 ``mime``

-- 
2.47.1


