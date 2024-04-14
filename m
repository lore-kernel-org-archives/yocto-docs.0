Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6546C05023
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.6165.1713127419350593697
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id B3C5C16B53;
	Sun, 14 Apr 2024 16:43:38 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 5FF07169FC;
	Sun, 14 Apr 2024 16:43:38 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 6/9] dev-manual: update custom distribution section
Date: Sun, 14 Apr 2024 13:43:15 -0700
Message-Id: <cb839b9d7e58ddf1927685c3fefcd2fa7e551618.1713127068.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713127068.git.bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 20:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5141

In keeping with the addition of the motd message pointing out that
the poky DISTRO is a reference distribution, adjust the opening of the
Creating Your Own Distribution section to match. Additionally, add a
section on the end pointing out what users need to consider if they just
take a copy of the poky distribution and modify it.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 .../dev-manual/custom-distribution.rst        | 34 ++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/custom-distribution.rst b/documenta=
tion/dev-manual/custom-distribution.rst
index 47faed0d04..93a1961d17 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -4,10 +4,16 @@ Creating Your Own Distribution
 ******************************
=20
 When you build an image using the Yocto Project and do not alter any
-distribution :term:`Metadata`, you are
-creating a Poky distribution. If you wish to gain more control over
-package alternative selections, compile-time options, and other
-low-level configurations, you can create your own distribution.
+distribution :term:`Metadata`, you are using the ``poky`` distribution.
+``poky`` is explicitly a *reference* distribution for testing and
+development purposes. It enables most hardware and software features
+so that they can be tested, but this also means that from a security
+point of view the attack surface is very large. Additionally, at some
+point it is likely that you will want to gain more control over package
+alternative selections, compile-time options, and other low-level
+configurations. For both of these reasons, if you are using the Yocto
+Project for production use then you are strongly encouraged to create
+your own distribution.
=20
 To create your own distribution, the basic steps consist of creating
 your own distribution layer, creating your own distribution
@@ -107,3 +113,23 @@ layer. The following steps provide some more detail:
    For information on append files, see the
    ":ref:`dev-manual/layers:appending other layers metadata with your la=
yer`"
    section.
+
+Copying and modifying the ``poky`` distribution
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Instead of creating a custom distribution from scratch as per above, you=
 may
+wish to start your custom distribution configuration by copying the ``po=
ky``
+distribution provided within the ``meta-poky`` layer and then modifying =
it.
+This is fine, however if you do this you should keep the following in mi=
nd:
+
+-  Every reference to ``poky`` needs to be updated in your copy so that =
it
+   will still apply. This includes override usage within files (e.g. ``:=
poky``)
+   and in directory names. This is a good opportunity to evaluate each o=
ne of
+   these customizations to see if they are needed for your use case.
+
+-  Unless you also intend to use them, the ``poky-tiny``, ``poky-altcfg`=
` and
+   ``poky-bleeding`` variants and any references to them can be removed.
+
+-  More generally, the ``poky`` distribution configuration enables a lot=
 more
+   than you likely need for your production use case. You should evaluat=
e *every*
+   configuration choice made in your copy to determine if it is needed.
--=20
2.25.1


