Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EADE776D4
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123713.1766593910450713533
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wh8Z0nHe;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E99A11A23E4
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF82D6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E436910AB1371;
	Wed, 24 Dec 2025 17:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593908; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iPGQVNDjVAySEcJxQ7DkLx7wEZuzw6P1Zfxd9RYwhXs=;
	b=wh8Z0nHewiu6CJIEdqBfJnOjAaZy9lu1zmp7aKDFFus/xVlWItKllQUKIQBzAV6snAWxvJ
	LE2ShBYCGP5XklGBoXxfzLolXUNvp7ZA4Gq3QIpDOchQlx3ngxqLoNjEll54jeNufqlrfy
	QsIZrzzEmwj6tlXIr2t6cZDr8v0fTg/KGcg43Epq/bLVgo3sRu+qL4Vu4vc1oeHqzyceYO
	e0TKeUAJn+/Ji9u7XapHoWaKtj8rsyYjMJ7lOkxTE16eUne8Ofcw9kEryz615wHkEegl0H
	i+DJSq/JW7gtPDV55AEzQw2LrbNvq97PldxioYLfaOrCI/Ai4no+b+ao3BlIiQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:29 +0100
Subject: [PATCH 03/53] dev-manual/poky-manual-setup.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-3-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=NaBf5yNyEwypvQ/CtYyRaWs8vEWPzn7RFW9zoolx3mo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVm0vsNL6yg/8EeEany6QSpVF1p6zBonAuO0
 GcmzPB5OpKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVZgAKCRDRgEFAKaOo
 NqNbD/9cr3LBRJG9PPahSQTTQ6xEfIc+SFNO8ZqYxbYD18/TljvAEiskppoRR02UHJpHkppx7yW
 0JjsJJlusl2q9T1cC9I2/vdrzbPZc+9/qlFVKktX3n86db3/maf3bHM8DHIm8TciRQA3iSJW5I3
 Angd/64jjen7OjZ9UtAHg0KOFHFsHv2gVhCmr22hyV0jWXlgNMRIh37Sow/l27WQDXgjbb0nLtQ
 GIIEkDT4yeEQdKJbKdg6hmKSxEHeZH54Fvj2wOo6h3D1uwUrVWycd1HrcfVC0broELPB6PPxeRN
 pOCz7vmzIKLOPyOdvWJVThJjX9QItQBRC1OHx0F0q9euGYIMEps1to0OU1eogpBQfrJQqhJZt74
 t6S/QjlYAsxUBThUt8++rear3IE9Dw3qVzEZ5QzGz7uLc92VL5PSmiO/iXFY+dhP1WnWloYteuJ
 G8FOHyRIpcQOfREAa+0acYMo+b9gDhG7W65uLnvVIGsObwBfV4FJV1KLqeV7xJiH1x7et+RucHa
 s4VqqyaSv7ZkalFwvcliXjFQ0JYd813muPdjY4rQEVSBbuchgFaPRJ5gwTn7CEIhT31OKvxHna8
 uaCFPRQWcf4PD1XsloLJxlveOODJ3RifyUJD69bXopsc5jxWwiFXT1gVrVkJKWxLjxyVKw0lDNZ
 gfzuOth3kaQ45aw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8332

The commit "dev-manual/start.rst: simplify the document after poky
obsolescence" removed some of the information related to source archives
published on downloads.yoctoproject.org. Mention it in this document as
it makes sense to use those when manually setting up a Poky build.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/poky-manual-setup.rst | 28 +++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index 7ee084007..c4e36ce8b 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -13,8 +13,15 @@ document guides through this setup step-by-step.
    :doc:`/brief-yoctoprojectqs/index`, which shows how to setup :term:`Poky`
    with ``bitbake-setup``.
 
+Obtaining The Source Repositories
+=================================
+
+You can obtain the source repositories required to build the Poky reference
+distro in two ways described below: cloning the repositories with Git, or
+downloading the released archives.
+
 Use Git to Clone The Layers
-===========================
+---------------------------
 
 Go to the :yocto_home:`Releases </development/releases/>` page, and choose a release
 (such as ``&DISTRO_REL_LATEST_TAG;``), corresponding to either the latest stable
@@ -41,6 +48,25 @@ following commands:
    $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.openembedded.org/openembedded-core ./layers/openembedded-core
    $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.yoctoproject.org/meta-yocto ./layers/meta-yocto
 
+
+Using the Source Archives
+-------------------------
+
+The Yocto Project also provides source archives of its releases, which
+are available on :yocto_dl:`/releases/yocto/`. Then, choose the subdirectory
+containing the release you wish to use, for example
+:yocto_dl:`&DISTRO_REL_LATEST_TAG; </releases/yocto/&DISTRO_REL_LATEST_TAG;/>`.
+
+You will find there source archives of individual components (if you wish
+to use them individually), and of the corresponding Poky release bundling
+a selection of these components.
+
+.. note::
+
+   The recommended method for accessing Yocto Project components is to
+   use Git to clone the upstream repository and work from within that
+   locally cloned repository.
+
 Building Your Image
 ===================
 

-- 
2.51.0


