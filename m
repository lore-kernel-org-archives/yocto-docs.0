Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8533D61031
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17103.1769700263883458089
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sitDawYV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3E4C4C22F47;
	Thu, 29 Jan 2026 15:24:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F95B606FD;
	Thu, 29 Jan 2026 15:24:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2358119A8866;
	Thu, 29 Jan 2026 16:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gen7EeYXcilSpgYmTb6X4TomYS9sEn6doy0kRbHqf+0=;
	b=sitDawYVqmtUMA+BIGRJ57SuRC0o3ZuQTibU1FxujqDVav5zmJi3aZBTBMOlr3M1pJ+YHA
	rVt9Pyri8GWmRD8l4QFH0pjP5fG9F1z0bmnjA7OEzW88k84oZdR3GKwXgS/HS2d44d8KLT
	IV0Up2Vt72LrqFwjgZ51VOhb44JsUVk0f7C9Ls9AiXlPjLaiWaWqTkeVuHmSDC6CwEyFtg
	GEdBBj3r7Eu13yyIekY64WBVJQx9Qg9/Ezo99e6SG+mSMoPnPMvCz1heXVHY+RoC6bGfuG
	/KSyZydMz4fKW9bZk+75SH0Xp7UtonTC8YE/5II/PycIeN5x8+xFxTWuoWF9mQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:18 +0100
Subject: [PATCH v3 27/57] ref-manual/tasks.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-27-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qzmUkb+8vZsVUXeMt/+kgXll/EqB55yZ399IFQSunTA=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGl7e42gNnTnWMWkspAtyqez8xYEPjSGLil/h86cKe4B+YBtp
 IkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJpe3uNAAoJENGAQUApo6g2UXIP/0iy
 /Szo+c5iZipxG7hwEBpSzJGKsnuMKQN6lHSphYzUF+ngczGCgKp9R1F9zVXtdIFVFfEKwkXWtMf
 4cJA1nNtAuZuq1BcE8ODhfm1i4bMksqtczY0h8uSZlVuN+fUf/NL7gDpZlFg7h0+5+Qgwcgaxh+
 c1mTySz11UdlOa/Jwd2BfoFKbrJW51sUNnV/srKc0YKr4JLfZ1FLL7IE2yeTgIfEb9ZOLX2peGH
 Zj//rBYE3XBqWYiHmoJNTcufAg/HqjuaIdG7/buEibxIWq41rsoj7upg0CcTNhFnaqhfPF29wpb
 xCs25NNubvAYzl3/sK0kz5YBbQ6MsAV6rQjiAoPmXVZQtIwOyOS3NqZOC2Dw5Qv139S/hKwcDlZ
 PH0kNsEGDk51oT6afQlwetsgbAV8RMOSXgPUrtWsNm4Kz9rQknMhv/njE8oiivsitlYEwvo87EP
 2sArggbZVy/kwPBXZTHNsqdkkoW5o95whDshy//P7XUDtQ2XHYjSGE59MlRMPMGL9al5zlzEo2x
 x41Wbx5Pf8RAjqXNSegdCpRfEfpdITu49NRJr1daqqg1I/nmHYrrH8q7ne7tt15t58Pia4Mz527
 eZjt4rb4W7W0l1bhdJx0Xh7XhvaF3/3qxh6q/hEWfUuE/+6QHxDmTkDf93gsupchdt1vyoGt0r/
 glTsD
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8813

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 8651f219f..e6301e708 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -191,7 +191,7 @@ that either directly or indirectly depend on the installed files (e.g.
 
    -  The ``tar`` command with the ``--no-same-owner`` option. See the
       ``bin_package.bbclass`` file in the ``meta/classes-recipe``
-      subdirectory of the :term:`Source Directory` for an example.
+      subdirectory of :term:`OpenEmbedded-Core (OE-Core)` for an example.
 
 .. _ref-tasks-install_ptest_base:
 
@@ -288,14 +288,14 @@ to locate and apply patch files to the source code.
 Patch files, by default, are ``*.patch`` and ``*.diff`` files created
 and kept in a subdirectory of the directory holding the recipe file. For
 example, consider the
-:yocto_git:`bluez5 </poky/tree/meta/recipes-connectivity/bluez5>`
-recipe from the OE-Core layer (i.e. ``poky/meta``)::
+:oe_git:`bluez5 </openembedded-core/tree/meta/recipes-connectivity/bluez5>`
+recipe from the :term:`OpenEmbedded-Core (OE-Core)` layer::
 
-   poky/meta/recipes-connectivity/bluez5
+   meta/recipes-connectivity/bluez5
 
 This recipe has two patch files located here::
 
-   poky/meta/recipes-connectivity/bluez5/bluez5
+   meta/recipes-connectivity/bluez5/bluez5
 
 In the ``bluez5`` recipe, the :term:`SRC_URI` statements point to the source
 and patch files needed to build the package.

-- 
2.52.0


