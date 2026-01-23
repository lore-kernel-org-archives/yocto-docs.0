Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D0CD74EE9
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 14:58:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69572.1769180306350149643
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 06:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=A5LJ7qAM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F08DCC214FC
	for <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ABBB36070A
	for <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FA24119A87A7;
	Fri, 23 Jan 2026 15:58:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769180304; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ilTmjfve4nfDUynOP6YAsNrjbfa17iiMf/Q/z3T41YU=;
	b=A5LJ7qAMw8PD7nd7+FDfLVfGiTN7O7fHiYi6nGcuXMSbczIuspxBt7iDSL7r7AYtSz92hL
	Ko9Eciw8zeRpSQjAUVQSVmKbnl/81FSMRKzlN6RX8tLxnAa7K+VFeL0sR+8+RZGY6UxqdA
	tZt5bmpiTUpHTx2hv0WEd6lCdyHP1/SrrBNJ70A00IS5v2emznwf3Qe7VnZKmNXFby31aO
	Ic0NJ2yoeCIHa0nySJtFFb0zNhayxmu/xX0Ke+aHJHcej2urEh62j6NUDOy8MLN3pAzBGT
	PaeeYhqk5k5g+NPNEtogUbtolZkSRBDrXotq5Q7Yr3T8Cd0Om1ckhEVBWtobkQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 23 Jan 2026 15:58:13 +0100
Subject: [PATCH v3 3/5] ref-manual/terms.rst: simplify the Source Directory
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260123-terms-refresh-v3-3-41c35f0a6a13@bootlin.com>
References: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
In-Reply-To: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6434;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wjr3JGSDNcunYwJZKU0dpqcwwSp/cqTpiS7c6UMfjaI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpc4yMGChzrEpZwTUyJx3sC4ocGYiH4aiv3Tk0J
 LwXXn+9tqeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXOMjAAKCRDRgEFAKaOo
 NlZ0D/4pr8MT6G+ivjWom5BqXhIaLqI2w0jv5xWnDK3HNIVEcUgOeVTlg2ii/DrgNoKSMceLoxI
 cz1ceJU5wexqyv2nZKtpP6yfZ7vVTtFXQsuazKZZx06OowXIg+HxIfuSs0L0bp61maMYUXndovT
 dci8j3zIQsQgOG7s1pv9VXjuYN8maQ1ErdQyadVAPTBTSgOvggaJ8ahiWmyiKuuIAzHQ5mg2BJZ
 JSv67NZ2y4YU5g+T4espnoDYZ68lsHfKEgt7RzzYXJZb/FclF6/+5hZR3S/wJNMi3wfEE20ohkC
 tW/9mOAQUh52u6oesAEYr20oeWcizSutX0p1JcYMrQBMTCQHQDLO4MnuL2IZc8luBjDRPgX0cAr
 GTKwAynbrp1wKH9Rj0oDyxIx+652+1SCIEZjnWcvjmM/qevutKqKhnInmo4cUdVY2w/TGqIc1J/
 oYrO9zow90lz+ZDfLEL+2aVpSRWGkGFTFaM7WubvnzGkg4NII+/KVXpOqqpbzXnjFbyLIOFY04S
 BeHfrDTARfQvtkrAPf6h6a13qFVD5C8pkc+nj8Y6cCj6qfoSD2acwoPwQVXH5HTt8+jV3y14UcI
 Jil+1rsDJcI8mSunKTM3mka/hK/AoK7gBkahU/N4JnOjHpNZjr4pp5mL5t3C8qApnJoIASXuubs
 +ioqE/KGFUTxuAA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8643

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
 documentation/ref-manual/terms.rst | 80 +++++++++++++++-----------------=
------
 1 file changed, 32 insertions(+), 48 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
index 8e07b71ba..d384b5bbe 100644
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
+     documentation usually denotes this directory with the name "bitbake=
-builds".
+
+     A typical layout for the :term:`Source Directory` would be:
=20
-        Creating a local copy of the
-        poky
-        Git repository is the recommended method for setting up your
-        Source Directory.
+     .. code-block:: text
=20
-     Sometimes you might hear the term "poky directory" used to refer to
-     this directory structure.
+        bitbake-builds/
+        =E2=94=9C=E2=94=80=E2=94=80 build/
+        =E2=94=94=E2=94=80=E2=94=80 layers/
+
+     Where the ``layers/`` directory corresponds to the directory contai=
ning
+     :term:`layers <Layer>` for your project, and the ``build/`` directo=
ry
+     corresponds to the :term:`Build Directory`.
+
+     We present a :term:`Source Directory` structure and its components =
in
+     details in the :doc:`/ref-manual/structure` section of the Yocto Pr=
oject
+     Reference Manual.
=20
      .. note::
=20
@@ -547,43 +563,11 @@ universal, the list includes them just in case:
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
+     and other files that all support the Yocto Project.
+
+     Consequently, you must have the Source Directory in place on your
+     development system in order to do any development using the Yocto P=
roject.
=20
    :term:`SPDX`
       This term means *Software Package Data Exchange*, and is used as a=
n open

--=20
2.52.0


