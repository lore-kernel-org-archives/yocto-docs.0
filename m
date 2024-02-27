Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103C5C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:58:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12585.1709042326772586441
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 05:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oUbgVm7t;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D77271C0009;
	Tue, 27 Feb 2024 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0okzdLJ7L2+5dznWqlXiiXI/wnQUQc4aLxrU2LoI08=;
	b=oUbgVm7tqmcunvYI5J+HQ2CCiqjTQqcL71stwGfJgRgOIPP47qnkNGHsE6PzKyJTNkbuNn
	2lbyEmD3+KSiSjR2rqn4K0UWNju9HkW4gUQWVOYmr7+9KnCkPVfApI+QR88sEjCRmDdOrc
	uKk962Scv8jnueK+tm/bZcZRz6oDG3d2mm4v32/F4GQja7kCrfykZNC6KR1PNA8Bk5XxOK
	395Clg3KiI5MHMOFE7thYNRzKhNsXioqg4xrChJKiv+l2p0lnc+Q+UobqNJAvljNbt5NAf
	FwG0t784aVVZpYj1Kll982ebOUJ8QaS+ArvqonSezuBXFYWEUQCA65MSB9yrbg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [nanbield][PATCH 1/6] dev-manual: Rephrase spdx creation
Date: Tue, 27 Feb 2024 14:58:25 +0100
Message-Id: <20240227135830.481147-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227135830.481147-1-michael.opdenacker@bootlin.com>
References: <20240227135830.481147-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 13:58:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4885

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

Make the options more clear by providing them in a list instead of plain prosa.
Also add a ref for a presentation wrt spdx 3.0 in the Yocto project.

Fixes [YOCTO 7476]

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/sbom.rst | 40 ++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index f51d08f84d..b72bad1554 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -30,22 +30,29 @@ To make this happen, you must inherit the
 
    INHERIT += "create-spdx"
 
-You then get :term:`SPDX` output in JSON format as an
-``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside the
-:term:`Build Directory`.
+Upon building an image, you will then get:
 
-This is a toplevel file accompanied by an ``IMAGE-MACHINE.spdx.index.json``
-containing an index of JSON :term:`SPDX` files for individual recipes, together
-with an ``IMAGE-MACHINE.spdx.tar.zst`` compressed archive containing all such
-files.
+-  :term:`SPDX` output in JSON format as an ``IMAGE-MACHINE.spdx.json`` file in
+   ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`.
+
+-  This toplevel file is accompanied by an ``IMAGE-MACHINE.spdx.index.json``
+   containing an index of JSON :term:`SPDX` files for individual recipes.
+
+-  The compressed archive ``IMAGE-MACHINE.spdx.tar.zst`` contains the index
+   and the files for the single recipes.
 
 The :ref:`ref-classes-create-spdx` class offers options to include
-more information in the output :term:`SPDX` data, such as making the generated
-files more human readable (:term:`SPDX_PRETTY`), adding compressed archives of
-the files in the generated target packages (:term:`SPDX_ARCHIVE_PACKAGED`),
-adding a description of the source files used to generate host tools and target
-packages (:term:`SPDX_INCLUDE_SOURCES`) and adding archives of these source
-files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
+more information in the output :term:`SPDX` data:
+
+-  Make the json files more human readable by setting (:term:`SPDX_PRETTY`).
+
+-  Add compressed archives of the files in the generated target packages by
+   setting (:term:`SPDX_ARCHIVE_PACKAGED`).
+
+-  Add a description of the source files used to generate host tools and target
+   packages (:term:`SPDX_INCLUDE_SOURCES`)
+
+-  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
 
 Though the toplevel :term:`SPDX` output is available in
 ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
@@ -65,11 +72,12 @@ generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
 
 See also the :term:`SPDX_CUSTOM_ANNOTATION_VARS` variable which allows
 to associate custom notes to a recipe.
-
 See the `tools page <https://spdx.dev/resources/tools/>`__ on the :term:`SPDX`
 project website for a list of tools to consume and transform the :term:`SPDX`
 data generated by the OpenEmbedded build system.
 
-See also Joshua Watt's
+See also Joshua Watt's presentations
 `Automated SBoM generation with OpenEmbedded and the Yocto Project <https://youtu.be/Q5UQUM6zxVU>`__
-presentation at FOSDEM 2023.
+at FOSDEM 2023 and
+`SPDX in the Yocto Project <https://fosdem.org/2024/schedule/event/fosdem-2024-3318-spdx-in-the-yocto-project/>`__
+at FOSDEM 2024.
-- 
2.34.1


