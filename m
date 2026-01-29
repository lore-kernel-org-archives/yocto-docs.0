Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC47DD6B080
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17115.1769700272519066519
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tj/Zu8z3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 08BDE1A2B09
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D40CE606FD;
	Thu, 29 Jan 2026 15:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2697B119A887B;
	Thu, 29 Jan 2026 16:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JVHAkd1vK7j6uW092t8sXAgAsL7gXq3WUl8+T0wNZeE=;
	b=tj/Zu8z31Bm/mUBhc6fIYAF9yTOx/MlpocDdjE2Q6vrt5ZIXk1gD4wH1cOHPqAodghFJOY
	z53tBw0Z8k/BhJd6b7BgGlqzyQF6s5yaWWHYHV4q1EjZCb/yAcXZR2IOQu4QaLOPWN0QeV
	tZKSudvg5QqHvM8Mq2EpLg2Ljq7DqvFuh6M1LecQbhCjvlDKHVftA8AUc8xQOvHgiBmHmQ
	Q6/Y3a6ZOGSVIzL0Tsf1WPAe0akgXtWp5SdzxpPTqrO3NowpH9R4saNzXN7Yp6tMg8fTrA
	8cN7mCY+9/r2RCJS47f5iN7q7GVdQeO9fId4IHXls11ONzMyyyczBnNsndDMsA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:31 +0100
Subject: [PATCH v3 40/57] dev-manual/licenses.rst: instruct to use
 git-archive instead of removing .git
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-40-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rAWlZShkfs57Y9FF9FS6IBeYULfrOE3o12GLvaqUI8E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uPilvInU0b0LrkZIN4MBVhGPeFx3DRpsDFw
 SA7UNm06gCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jwAKCRDRgEFAKaOo
 NiLgD/9FElyzaWqLKLdApqF3rFwpbaFubMkNHyI7oyhj7xmDwaUl8CfuRdid1N6AeqVE13UBg6s
 YlS3awKc6zAbYeO5CXyowj7IfIQh1lr2zWTPrAescYm546s7ZaXUBr94gMMvC5fL3uX7IDUtuDl
 ef//3rBfcyCYppORMP3V5zXRu0j38OeQvWzlF+VKZdu9KBf8+/SE5kB70rcgeXElgfkCfYV9Fmy
 roE6DJb90dXZd5Be0puWBKvCKOfYMoI3qMZfuoQ0jclfZFFAZLPazbQfEfn6QIJpkI0vrzsYYfU
 Jx1twizFjtsCD6Rn12PSw0IuYeZ0qvFOqJdagrnJ9ylOvxe5GEoYl2hMqcnrUWGRMlt2W+6zY6L
 N/2tLm7T1wooap6OODfwET2TTsT49YblxKhfbfMgYJBgGiDwnKDtWTEoOCfPxfZPGHBwS9F0qTd
 IcAhYiMk/qKG0sN+XJbbgSrxft8eRSM+x6FOzdVHUkcE40eHKgdhqSaY3Q1NsM849Ky80JBVfzu
 CVL9rxH3vJEkZo0RAS+xDXFoZgu2PBYviHNcqPgMC+NMUSmxqdWzgwJ2+2s9TPaDc2SWPyCmdsP
 T5n6qfT9pIIGMFwncbLiRU2Cvz46N4eWZmF6E8odcqL0byyf2Ou/7Iyqvq9ENbXNXN8FxFBp111
 GTY9azFvATXtn6w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8826

Removing .git directories is destructive. Instruct to use git archive
instead.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/licenses.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index fff4abb11..4bc1f7376 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -465,12 +465,8 @@ layers are used to patch, compile, package, or modify (in any way)
 any open source software included in your released images, you might be
 required to release those layers under section 3 of GPLv2 or section 1
 of GPLv3. One way of doing that is with a clean checkout of the version
-of the Yocto Project and layers used during your build. Removing the Git
-objects can be done like so:
-
-.. code-block:: console
-
-   $ find . -name ".git" -type d -exec rm -rf {} \;
+of the Yocto Project and layers used during your build. Archiving a Git
+repository can be done with the :manpage:`git-archive <git-archive(1)>` command.
 
 One thing a development organization might want to consider for end-user
 convenience is to modify

-- 
2.52.0


