Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C28BC7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:16 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.1284.1682133606516867956
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id DD7E3E75A8;
	Fri, 21 Apr 2023 23:20:05 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 174E0E6451;
	Fri, 21 Apr 2023 23:20:04 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 04/17] Remove references to INC_PR
Date: Sat, 22 Apr 2023 15:19:40 +1200
Message-Id: <4810021c6f6e1bd09e45f8662700e4d79162afb2.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3855

This technique is no longer used (nor necessary), let's just remove it
to avoid any confusion.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/dev-manual/packages.rst  | 12 ---------
 documentation/ref-manual/variables.rst | 37 --------------------------
 2 files changed, 49 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-ma=
nual/packages.rst
index 90c52beb299..79f21d9f34d 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -227,18 +227,6 @@ default value is "r0", the practice of adding it to =
a new recipe makes
 it harder to forget to bump the variable when you make changes to the
 recipe in future.
=20
-If you are sharing a common ``.inc`` file with multiple recipes, you can
-also use the :term:`INC_PR` variable to ensure that the recipes sharing =
the
-``.inc`` file are rebuilt when the ``.inc`` file itself is changed. The
-``.inc`` file must set :term:`INC_PR` (initially to "r0"), and all recip=
es
-referring to it should set :term:`PR` to "${INC_PR}.0" initially,
-incrementing the last number when the recipe is changed. If the ``.inc``
-file is changed then its :term:`INC_PR` should be incremented.
-
-When upgrading the version of a binary package, assuming the :term:`PV`
-changes, the :term:`PR` variable should be reset to "r0" (or "${INC_PR}.=
0"
-if you are using :term:`INC_PR`).
-
 Usually, version increases occur only to binary packages. However, if
 for some reason :term:`PV` changes but does not increase, you can increa=
se
 the :term:`PE` variable (Package Epoch). The :term:`PE` variable default=
s to
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 02703a39b17..2ed69c0b214 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3859,43 +3859,6 @@ system and gives an overview of their function and=
 contents.
       files to be deployed into :term:`IMGDEPLOYDIR`, and the class will=
 take
       care of copying them into :term:`DEPLOY_DIR_IMAGE` afterwards.
=20
-   :term:`INC_PR`
-      Helps define the recipe revision for recipes that share a common
-      ``include`` file. You can think of this variable as part of the
-      recipe revision as set from within an include file.
-
-      Suppose, for example, you have a set of recipes that are used acro=
ss
-      several projects. And, within each of those recipes the revision (=
its
-      :term:`PR` value) is set accordingly. In this case, when
-      the revision of those recipes changes, the burden is on you to fin=
d
-      all those recipes and be sure that they get changed to reflect the
-      updated version of the recipe. In this scenario, it can get
-      complicated when recipes that are used in many places and provide
-      common functionality are upgraded to a new revision.
-
-      A more efficient way of dealing with this situation is to set the
-      :term:`INC_PR` variable inside the ``include`` files that the reci=
pes
-      share and then expand the :term:`INC_PR` variable within the recip=
es to
-      help define the recipe revision.
-
-      The following provides an example that shows how to use the
-      :term:`INC_PR` variable given a common ``include`` file that defin=
es the
-      variable. Once the variable is defined in the ``include`` file, yo=
u
-      can use the variable to set the :term:`PR` values in each recipe. =
You
-      will notice that when you set a recipe's :term:`PR` you can provid=
e more
-      granular revisioning by appending values to the :term:`INC_PR` var=
iable::
-
-         recipes-graphics/xorg-font/xorg-font-common.inc:INC_PR =3D "r2"
-         recipes-graphics/xorg-font/encodings_1.0.4.bb:PR =3D "${INC_PR}=
.1"
-         recipes-graphics/xorg-font/font-util_1.3.0.bb:PR =3D "${INC_PR}=
.0"
-         recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR =3D "${INC_PR=
}.3"
-
-      The
-      first line of the example establishes the baseline revision to be
-      used for all recipes that use the ``include`` file. The remaining
-      lines in the example are from individual recipes and show how the
-      :term:`PR` value is set.
-
    :term:`INCOMPATIBLE_LICENSE`
       Specifies a space-separated list of license names (as they would
       appear in :term:`LICENSE`) that should be excluded
--=20
2.34.1


