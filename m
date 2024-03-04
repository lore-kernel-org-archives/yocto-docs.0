Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8239C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 20:50:49 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.2955.1709585448711620368
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 12:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=nO8oFhCV;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E3202240103
	for <docs@lists.yoctoproject.org>; Mon,  4 Mar 2024 21:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1709585446; bh=VKYcynreBlzETpoUYffB/3pEneWLY0wdcausBcIW8Yw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=nO8oFhCVAU8YeQhbqBDnBqxjD/9GXZnPUxw4noWnFkk4w1pWAcr/MZUHU70T4ROv4
	 YJ86L+oTNfBdXN91mPl76+p07EKxgouHow/ksWU2WxcZOIJKCA44A/pkgxEtHL/c+h
	 OKULVf/LqfYoorkUfng8QzRQQuZ1eOh4t+FoQ0mphIitB7kgMs1FmMdJFXHcG1ZFuR
	 0YBFC7jaHJ/S8U9T5Tq6p8A7Kny8UQbXGu7Qbyf7OyE5zrTKvyzUonIohZCVTLinpY
	 MnTuihKC8jI/Jooln8hWrX88FMfvCIWoLF/ecYC7jJHq8Yw16ALTnW4K9EG1Szz7+v
	 pdNFOIp9wpfOw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TpW796Br5z6txV;
	Mon,  4 Mar 2024 21:50:45 +0100 (CET)
From: simone.p.weiss@posteo.com
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] contributor-guide: Add notes for tests
Date: Mon,  4 Mar 2024 20:50:38 +0000
Message-Id: <20240304205038.9060-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Mar 2024 20:50:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4928

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

This adds some hints that and how chnages should be tested when contribut=
ing.

Fixes [YOCTO #15412]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../contributor-guide/submit-changes.rst      | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documen=
tation/contributor-guide/submit-changes.rst
index 61f3157d6..d2167a2f3 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -221,6 +221,38 @@ to add the upgraded version.
    <https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>`__
    in the Linux kernel documentation.
=20
+Test your changes
+-----------------
+
+For each contributions you make, you should test your changes as well.
+For this the Yocto Project offers several types of tests. Those tests co=
ver
+different areas and it depends on your changes which are feasible. For e=
xample run:
+
+   -  For changes that affect the build environment:
+
+      -  ``bitbake-selftest``: for changes within BitBake
+
+      -  ``oe-selftest``: to test combinations of BitBake runs
+
+      -  ``oe-build-perf-test``: to test the performance of common build=
 scenarios
+
+   -  For changes in a recipe:
+
+      - ``ptest``: of the package, if it exists
+
+      - ``testimage``: build an image, boot it and run testcases on it
+
+      - If applicable, ensure also the ``native`` and ``nativesdk`` vari=
ants builds
+
+   -  For changes relating to the SDK:
+
+      - ``testsdk``: to build, install and run tests against a SDK
+
+      - ``testsdk_ext``: to build, install and run tests against an exte=
nded SDK
+
+Note that this list just gives suggestions and is not exhaustive. More d=
etails can
+be found here: :ref:`test-manual/intro:Yocto Project Tests --- Types of =
Testing Overview`.
+
 Creating Patches
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -285,8 +317,9 @@ Validating Patches with Patchtest
 ``patchtest`` is available in ``openembedded-core`` as a tool for making
 sure that your patches are well-formatted and contain important info for
 maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
-tags. Currently, it only supports testing patches for
-``openembedded-core`` branches. To setup, perform the following::
+tags. Note that no functional testing of the changes will be performed b=
y ``patchtesti``.
+Currently, it only supports testing patches for ``openembedded-core`` br=
anches.
+To setup, perform the following::
=20
     pip install -r meta/lib/patchtest/requirements.txt
     source oe-init-build-env
--=20
2.39.2


