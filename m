Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061C3D16274
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:12:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.56096.1728915137506086995
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 07:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dVXa5MOM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E8811BF206;
	Mon, 14 Oct 2024 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728915135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mm7+QoWKOSGNWn3B397NStTEHa7W2iuTUfRki8MPUf4=;
	b=dVXa5MOMwej/+cFelpbtl5XZbJ70NGQzuSqigu5enpgL3ZTrWALSFvGiM+jT9y7SoJ3Prw
	d26+6DrN2cOYdRQwb5+R0XfcLvcMg5u0tz6KdNfgC5ygG3WxsdRN3fRtYKnB+luTe+dwEr
	L0ZeEa1QfERaTkaa+pltsrkyFP2Rk4STsXtGP3s/OlN93pCzuxmn/jOvbCiOSbDnQHLACR
	YLicqo16/rcdm76nOWxJSoW1JJB7Apfbs/w7VdrylHpiuggDnnDQlvAyHfASfyGVZmFBBP
	LbMsAveEVziis8Li96hq60Vg/eukpkZHiSHpTSkrrrR7cttj//6ih5sMyAVH4w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 14 Oct 2024 16:11:44 +0200
Subject: [PATCH] ref-manual: fix ordering of insane checks list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-insane-ordering-v1-1-0b51976580ba@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJ8mDWcC/x3MTQqAIBBA4avIrBP8A6GrRAvR0WYzhkIE4t2Tl
 m/xvQEdG2GHXQxo+FCnyiv0JiBegQtKSqvBKOO00k4S98Aoa0sLcpHRGp+tdxqTg6Xuhpne/3i
 cc36LIlw7YQAAAA==
X-Change-ID: 20241014-insane-ordering-c327f3741ed4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dG2yM5n+b+EVX9Mf3q5DN3Iy9iJOGaY9YnaarlB9k84=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnDSa/8Xrgl2/eTWR7nYESRw2RnfpuNKxRFjoYB
 H2ulxZoxhyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZw0mvwAKCRDRgEFAKaOo
 NgOGEACKoPL5zbCJIkAxx3KWI6IlvncSL8K/n+ri5iugjyVAT9Nud48ks6lP/AyUr8NayDOhm67
 cu9njTWQAR1WAbbCZBAmk4MJLbDnOYsTrmT9c78ZssIbuCe8D5sr4cgRJ3wLl/UR+O0NJY81pg8
 pyH+HbzW1cTfSlpDs8WwAtAkqZQ7xUo4ct/vxcmV6MmJpt8uUabdM0yn9vpNW9Gptizkaoh7qBc
 Puz9F1ulo2ylaj/fsLfVz9I8bsE23CNZQCZNnh8FvyfWuVy496A6dfomRJ5LnI02BgZkreTeB7q
 rBoScSZt6fjlZcCK9zMOtoTZdYA22yctZoGSTOqcCPFuBFIUXgO3qKKG+DHQ2rmaiu7/d6ookBp
 62zv8rZRTDkk8+YcZxE85LwSI1S21GObeU77/R7AD2BPJcoq+iVmH0SZY+aOp4TswQIQNxSGhTF
 6eIpiYz+/QmV3uX1J7XL33cpC0FyLe/j21xFRUASRG6iGawkEC6arWno+gVbVfKovloDDIH/Os7
 FOtC5tciTXLaeh+4q/phMoGqsg3BZUmwyaZhsnA/7LUrQjuSHIxrtwReOyCc4rarbbLC56s0EJ3
 TTzaZ3Xi/WQZtX2ZG5vGhjleDT/N8E7IfryaG+WDnvEMzllyAE2dUd1rTu6pHqupMa0/43mGBfu
 FSa1EoR6b2Bx79g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 14:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5486

It should be before "perllocalpod" and after "patch-status".

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/classes.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a715be97dc3469dc3c219b78548b79e8e3e4b95f..b92f4e4f20ea8f702c90f4e3d29251b2461d07d0 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1464,6 +1464,9 @@ The tests you can list with the :term:`WARN_QA` and
 -  ``patch-status:`` Checks that the ``Upstream-Status`` is specified and valid
    in the headers of patches for recipes.
 
+-  ``pep517-backend:`` checks that a recipe inheriting
+   :ref:`ref-classes-setuptools3` has a PEP517-compliant backend.
+
 -  ``perllocalpod:`` Checks for ``perllocal.pod`` being erroneously
    installed and packaged by a recipe.
 
@@ -1478,9 +1481,6 @@ The tests you can list with the :term:`WARN_QA` and
 
 -  ``perms:`` Currently, this check is unused but reserved.
 
--  ``pep517-backend:`` checks that a recipe inheriting
-   :ref:`ref-classes-setuptools3` has a PEP517-compliant backend.
-
 -  ``pkgconfig:`` Checks ``.pc`` files for any
    :term:`TMPDIR`/:term:`WORKDIR` paths.
    Any ``.pc`` file containing these paths is incorrect since

---
base-commit: 67a239f372ed1667c923e2f407da976627be2039
change-id: 20241014-insane-ordering-c327f3741ed4

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


