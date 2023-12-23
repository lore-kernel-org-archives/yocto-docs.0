Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA986C3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 12:02:40 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.5282.1703332957955195180
 for <docs@lists.yoctoproject.org>;
 Sat, 23 Dec 2023 04:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=gWvSB9JR;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 31FF8240027
	for <docs@lists.yoctoproject.org>; Sat, 23 Dec 2023 13:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1703332956; bh=flDh4pRGZwOKVybz5yycxmdRsE3h57QE1D0/d8nLFoU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=gWvSB9JRYm6n7RSjHeuL/2x6H5Fwf1zghwvSX6XMdB1fIrHp/6Oky8BvHQFTJH6E+
	 TEOwfQG/M3bpKvBVEQn4DT7NFLZfYYMdBWKUHzDV4CiPTtRRKcI1Y47EDXCVIzL9J0
	 ewwUCOLRo0Xp08L5OWsB3PRIpEGXwRYBSLg3E9EBoxRnPoxd47El6Z7fT5E/AZbgSq
	 RkX03ET8VdDwNpWxPfd6clMLo/5L7yQnG/87j0EOni2gfH94P+ArkW0xCkFh84qH6v
	 H8azivLVIfTN1TlrIM+IPPeO+5DC/xltNhFM7dMaImzppHGSQMJ0Avm8k/+LVJCyvt
	 8j7d0x1PrGPjg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Sy2pz32W0z6tx2;
	Sat, 23 Dec 2023 13:02:34 +0100 (CET)
From: simone.p.weiss@posteo.com
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] dev-manual: start.rst: Update use of Download page
Date: Sat, 23 Dec 2023 11:51:24 +0000
Message-Id: <20231223115124.62413-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 23 Dec 2023 12:02:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4737

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

The yocto website has changed its structure. Update the section for
Accessing the Downloads page to match the new structure.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 documentation/dev-manual/start.rst | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manua=
l/start.rst
index 4a556967e..f2027badd 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -621,7 +621,7 @@ a selection of these components.
 Using the Downloads Page
 ------------------------
=20
-The :yocto_home:`Yocto Project Website <>` uses a "DOWNLOADS" page
+The :yocto_home:`Yocto Project Website <>` uses a "RELEASES" page
 from which you can locate and download tarballs of any Yocto Project
 release. Rather than Git repositories, these files represent snapshot
 tarballs similar to the tarballs located in the Index of Releases
@@ -630,11 +630,13 @@ described in the ":ref:`dev-manual/start:accessing =
source archives`" section.
 #. *Go to the Yocto Project Website:* Open The
    :yocto_home:`Yocto Project Website <>` in your browser.
=20
-#. *Get to the Downloads Area:* Select the "DOWNLOADS" item from the
-   pull-down "SOFTWARE" tab menu near the top of the page.
+#. *Get to the Downloads Area:* Select the "RELEASES" item from the
+   pull-down "DEVELOPMENT" tab menu near the top of the page.
=20
-#. *Select a Yocto Project Release:* Use the menu next to "RELEASE" to
-   display and choose a recent or past supported Yocto Project release
+#. *Select a Yocto Project Release:* On the top of the "RELEASE" page cu=
rrently
+   supported release are displayed, further down past supported Yocto Pr=
oject
+   releases are visible. The "Download" links in the rows of the table t=
here
+   will lead to the download tarballs for the release.
    (e.g. &DISTRO_NAME_NO_CAP;, &DISTRO_NAME_NO_CAP_MINUS_ONE;, and so fo=
rth).
=20
    .. note::
@@ -645,9 +647,9 @@ described in the ":ref:`dev-manual/start:accessing so=
urce archives`" section.
    You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
    Project releases.
=20
-#. *Download Tools or Board Support Packages (BSPs):* From the
-   "DOWNLOADS" page, you can download tools or BSPs as well. Just scroll
-   down the page and look for what you need.
+#. *Download Tools or Board Support Packages (BSPs):* Next to the tarbal=
ls you
+   will find download tools or BSPs as well. Just select a Yocto Project
+   release and look for what you need.
=20
 Cloning and Checking Out Branches
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.39.2


