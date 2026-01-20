Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77441C9830C
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:17:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8671.1768922234187421018
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=kAXt9si2;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4B11EC214F4
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:16:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6822D606AB
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6D0410B6B52B;
	Tue, 20 Jan 2026 16:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768922232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tOByyDAsSwX+XGjbK0/MYJG3kCEyu6nDkFV9pH0+3uY=;
	b=kAXt9si2eXZORnD4OHehRT4HmK+//hgT6u7CwbwkgrtYvZihk5vd9V8He/eguq2O1nPz8Y
	3IHcChZ+Ktu1PPuLF6MsUPdcwx3UK14otWxh/1Njps8g8cE8iX4AZv0yMIa729wULsuee0
	hQ5cm3EzH9f3Qiqf5pRHw8uS42mEXmIW4ThEoH5UKc0KROvTC3ytenKvpvW1LLrVQXdlAP
	RGkZtf1P+JPFzQZHFCxd4ejj1voxSsjS/JTbyoRs55LbJpETLtSo9Xe/2Ub2D+gIib1EMr
	0+WFqViTX7U7tSTOhJYxTJeR/jPzB0Ow1XNMqKIOzRuER0TV7HpiHrZroUUMSQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 20 Jan 2026 16:17:02 +0100
Subject: [PATCH v2 3/5] ref-manual/terms.rst: simplify the Source Directory
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260120-terms-refresh-v2-3-fa49d15b209f@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
In-Reply-To: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6441;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kjrFsq/qqUZuz/BC5qCtae+Nt9GdTMn4jV+W96ug/Q0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpb5x0cQyrmD5qhZ88/Qn+4eKOkTj7EE2SwJwfG
 brfS6zRyZCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW+cdAAKCRDRgEFAKaOo
 NngrD/45osdB2VxcfhrpwAF4Fk+1EEhaePiXA+QTaC6MARs1PpCJ6eC+ApRHrW9TZjN9wOuKcho
 y5cqt2cFBoXcJFopvuS4jqbjUw8PE4o8+EhZOI524ZFoQ8zpln1uJubUtpA0juShRd1w0r/SwuU
 GWtOxs2QkzVRMYX6LB2ybbl7pe3WXLnkVEjOTt5QlVXiWcNYkudQV8pXTf1jsox69idI0AaavrW
 GjAIc3bYzxx8fDfMcZ7FpJjGBFR24NmUbS+bz1A9m3XjPHEvyVQR6+7Ale7QRGw1gm73N7qw/9P
 nvfo6+btFlAE7hsMFqnoKeYGBxiX3zYTrHEhWZrhqdSTRDw4mODDDiUgibqCWy9ksZ/8l87nxtZ
 q/gPDWRmhXs2oiHH9A7rKRy6Itn8Bf4eS5nEzuyknxPIrqgl/3dBDdS9jgPVSR20cQAmNXG1NF5
 X+aM41DX4i6RnxEGGMqdBZYMcYzxywdqY5E9btm+M+PtYPJLz6yfAs0OBIGk7OtChVPuo8jqVjw
 952bD9x7KIvHFYL6dAP3G8njW5ClRr3T74I2V410DyFf8ffyTu8Xzr5IUP5U5cNOzGmRmPd4QcM
 iRAey6v0uXg/czxmK1iQxSLPDj6bfZpo2hVc23z6IwoOR3Iqn+slmVHGFk46hKd4RJAR/Ur5w7v
 e/kUK7YHZl+nFsQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8596

Now that we no longer have Poky around, simplify the Source Directory
definition:

- Make references to existing documents that show how to create this
  Source Directory.

- This directory contains sources, the layout in which they are
  presented does not matter so much, as it can be different and/or
  freeform depending on whether we use bitbake-setup or not.

  The definition chooses "project" as the name of the source directory
  and is the one that should be used when showing examples in the
  documentation.

  A typical Source Directory would look like the following:

  project/
  =E2=94=9C=E2=94=80=E2=94=80 build/
  =E2=94=94=E2=94=80=E2=94=80 layers/

Other parts of the documentation referencing to this as the Poky
repository still have to be updated.

This will also mean that this definition will be used a lot less across
the documentation: in most cases, when the "Source Directory" is
referenced as the Poky repository, it can be replaced by
OpenEmbedded-Core, Bitbake, the documentation, or meta-yocto. We'll keep
this definition around regardless, as it can be useful to denote this
group of directories in a more general sense.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 79 +++++++++++++++-----------------=
------
 1 file changed, 31 insertions(+), 48 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
index d908af4ae..ab8eb6123 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -526,20 +526,36 @@ universal, the list includes them just in case:
       a software bill of materials`" section of the Development Tasks ma=
nual.
=20
    :term:`Source Directory`
-     This term refers to the directory structure
-     created as a result of creating a local copy of the ``poky`` Git
-     repository ``git://git.yoctoproject.org/poky`` or expanding a
-     released ``poky`` tarball.
+     This term refers to the directory structure created as a result of =
setting
+     up your environment to build images with the Yocto Project, which c=
an be
+     done in two ways:
=20
-     .. note::
+     -  Using the ``bitbake-setup`` command-line utility (see :doc:`Sett=
ing Up
+        The Environment With bitbake-setup
+        <bitbake:bitbake-user-manual/bitbake-user-manual-environment-set=
up>`).
+
+     -  Or manually setting up the :term:`Layers <Layer>` (see
+        :doc:`/dev-manual/poky-manual-setup`).
+
+     In either case, the result will be a set of :term:`Layers <Layer>` =
and a
+     :term:`Build Directory`: this is the Source Directory for your buil=
d. The
+     documentation usually denotes this directory with the name "project=
".
+
+     A typical layout for the :term:`Source Directory` would be:
+
+     .. code-block:: text
+
+        project/
+        =E2=94=9C=E2=94=80=E2=94=80 build/
+        =E2=94=94=E2=94=80=E2=94=80 layers/
=20
-        Creating a local copy of the
-        poky
-        Git repository is the recommended method for setting up your
-        Source Directory.
+     Where the ``layers/`` directory corresponds to the directory contai=
ning
+     :term:`layers <Layer>` for your project, and the ``build/`` directo=
ry
+     corresponds to the :term:`Build Directory`.
=20
-     Sometimes you might hear the term "poky directory" used to refer to
-     this directory structure.
+     We present a :term:`Source Directory` structure and its components =
in
+     details in the :doc:`/ref-manual/structure` section of the Yocto Pr=
oject
+     Reference Manual.
=20
      .. note::
=20
@@ -547,43 +563,10 @@ universal, the list includes them just in case:
         names that contain spaces. Be sure that the Source Directory you
         use does not contain these types of names.
=20
-     The Source Directory contains BitBake, Documentation, Metadata and
-     other files that all support the Yocto Project. Consequently, you
-     must have the Source Directory in place on your development system =
in
-     order to do any development using the Yocto Project.
-
-     When you create a local copy of the Git repository, you can name th=
e
-     repository anything you like. Throughout much of the documentation,
-     "poky" is used as the name of the top-level folder of the local cop=
y
-     of the poky Git repository. So, for example, cloning the ``poky`` G=
it
-     repository results in a local Git repository whose top-level folder
-     is also named "poky".
-
-     While it is not recommended that you use tarball extraction to set =
up
-     the Source Directory, if you do, the top-level directory name of th=
e
-     Source Directory is derived from the Yocto Project release tarball.
-     For example, downloading and unpacking poky tarballs from
-     :yocto_dl:`/releases/yocto/&DISTRO_REL_LATEST_TAG;/`
-     results in a Source Directory whose root folder is named poky.
-
-
-     It is important to understand the differences between the Source
-     Directory created by unpacking a released tarball as compared to
-     cloning ``git://git.yoctoproject.org/poky``. When you unpack a
-     tarball, you have an exact copy of the files based on the time of
-     release --- a fixed release point. Any changes you make to your loc=
al
-     files in the Source Directory are on top of the release and will
-     remain local only. On the other hand, when you clone the ``poky`` G=
it
-     repository, you have an active development repository with access t=
o
-     the upstream repository's branches and tags. In this case, any loca=
l
-     changes you make to the local Source Directory can be later applied
-     to active development branches of the upstream ``poky`` Git
-     repository.
-
-     For more information on concepts related to Git repositories,
-     branches, and tags, see the
-     ":ref:`overview-manual/development-environment:repositories, tags, =
and branches`"
-     section in the Yocto Project Overview and Concepts Manual.
+     The Source Directory contains BitBake, OpenEmbedded-Core (OE-Core),
+     Documentation, Metadata and other files that all support the Yocto =
Project.
+     Consequently, you must have the Source Directory in place on your
+     development system in order to do any development using the Yocto P=
roject.
=20
    :term:`SPDX`
       This term means *Software Package Data Exchange*, and is used as a=
n open

--=20
2.52.0


