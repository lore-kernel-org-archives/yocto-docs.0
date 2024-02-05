Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC6CC48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 16:13:28 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.66956.1707149602139889389
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 08:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=io1BDhRR;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 5002B240103
	for <docs@lists.yoctoproject.org>; Mon,  5 Feb 2024 17:13:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707149600; bh=yooOE4pu4KgGd9OKWd0SNUBPTpt13LOwvwXJvNHtTJU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=io1BDhRR/K+7k6k2ljgIpblQ8iDBXz9sNkEaat93HeWHzCttZ1mjEmzrzSuVWKmjC
	 8Zta2GpErzA+Wmoo4j1JwIWwWILlZhinQyrbF44oynnQWepjo0l3ZPwJRrUG5FQfXE
	 4kS/GjrmuNhNjJ17drklgJInzUKSxhlAlLoUH81uePRJyRrpuyThXHrdZ0b426gn82
	 gigF6mJfVAPKXd9mzolhXeIE+7fQ8qLE0BWG1AUem64uUmjZ2OyJo8mq6rXpBMC0XF
	 mfLMvsZZUnUaRBD6Gg92ShHUx72PcZX6ZQwvG7PQjVc9eyYBLJUq2sdoiuGDDeQxnn
	 s64iCS+No/ARg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TTBHz3RrGz9rxG;
	Mon,  5 Feb 2024 17:13:18 +0100 (CET)
From: simone.p.weiss@posteo.com
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] dev-manual: Rephrase spdx creation
Date: Mon,  5 Feb 2024 16:13:09 +0000
Message-Id: <20240205161309.2958827-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Feb 2024 16:13:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4813

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Make the options more clewar by providing them in a list instead of plain=
 prosa.
Also add a ref for a presentation wrt spdx 3.0 in the Yocto project.

Fixes [YOCTO 7476]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 documentation/dev-manual/sbom.rst | 40 ++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual=
/sbom.rst
index f51d08f84..b72bad155 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -30,22 +30,29 @@ To make this happen, you must inherit the
=20
    INHERIT +=3D "create-spdx"
=20
-You then get :term:`SPDX` output in JSON format as an
-``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` insid=
e the
-:term:`Build Directory`.
+Upon building an image, you will then get:
=20
-This is a toplevel file accompanied by an ``IMAGE-MACHINE.spdx.index.jso=
n``
-containing an index of JSON :term:`SPDX` files for individual recipes, t=
ogether
-with an ``IMAGE-MACHINE.spdx.tar.zst`` compressed archive containing all=
 such
-files.
+-  :term:`SPDX` output in JSON format as an ``IMAGE-MACHINE.spdx.json`` =
file in
+   ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`.
+
+-  This toplevel file is accompanied by an ``IMAGE-MACHINE.spdx.index.js=
on``
+   containing an index of JSON :term:`SPDX` files for individual recipes=
.
+
+-  The compressed archive ``IMAGE-MACHINE.spdx.tar.zst`` contains the in=
dex
+   and the files for the single recipes.
=20
 The :ref:`ref-classes-create-spdx` class offers options to include
-more information in the output :term:`SPDX` data, such as making the gen=
erated
-files more human readable (:term:`SPDX_PRETTY`), adding compressed archi=
ves of
-the files in the generated target packages (:term:`SPDX_ARCHIVE_PACKAGED=
`),
-adding a description of the source files used to generate host tools and=
 target
-packages (:term:`SPDX_INCLUDE_SOURCES`) and adding archives of these sou=
rce
-files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
+more information in the output :term:`SPDX` data:
+
+-  Make the json files more human readable by setting (:term:`SPDX_PRETT=
Y`).
+
+-  Add compressed archives of the files in the generated target packages=
 by
+   setting (:term:`SPDX_ARCHIVE_PACKAGED`).
+
+-  Add a description of the source files used to generate host tools and=
 target
+   packages (:term:`SPDX_INCLUDE_SOURCES`)
+
+-  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SO=
URCES`).
=20
 Though the toplevel :term:`SPDX` output is available in
 ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancil=
lary
@@ -65,11 +72,12 @@ generated files are available in ``tmp/deploy/spdx/MA=
CHINE`` too, such as:
=20
 See also the :term:`SPDX_CUSTOM_ANNOTATION_VARS` variable which allows
 to associate custom notes to a recipe.
-
 See the `tools page <https://spdx.dev/resources/tools/>`__ on the :term:=
`SPDX`
 project website for a list of tools to consume and transform the :term:`=
SPDX`
 data generated by the OpenEmbedded build system.
=20
-See also Joshua Watt's
+See also Joshua Watt's presentations
 `Automated SBoM generation with OpenEmbedded and the Yocto Project <http=
s://youtu.be/Q5UQUM6zxVU>`__
-presentation at FOSDEM 2023.
+at FOSDEM 2023 and
+`SPDX in the Yocto Project <https://fosdem.org/2024/schedule/event/fosde=
m-2024-3318-spdx-in-the-yocto-project/>`__
+at FOSDEM 2024.
--=20
2.39.2


