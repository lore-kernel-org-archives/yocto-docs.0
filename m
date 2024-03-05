Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A9FC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:47:15 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.28908.1709657225281200337
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 08:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=ldU5EIYo;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 020DC240101
	for <docs@lists.yoctoproject.org>; Tue,  5 Mar 2024 17:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1709657223; bh=xWTU9oB6ndJn5s0UpON69PPB6dJYgk7qY0jqogSpYnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ldU5EIYo9iNTeK6B3DOhlPf1GpEnciOvjxU44XuWGRjgVVawk+XWsZt5iaqvEsd83
	 1be86VD48Uuprbu5/Hp+Hv1nHxdSV4wfsPwNrLnSG3OtDXYdGJaLVa3ibvI0FDWBL3
	 AyB/4BclsWSUyIDB4P8BdK1l5oBXcx40X/c9EI8Wk+tLHlGdC5yP23daMKmrVGRC/K
	 KyjjmSz21eWAJI3FhJHga6UucCURa3gPnT4Dj0hT+cxjqkArLHQvB4mZLH/oeFuLNA
	 tQL6YZnNrLDK74J8G6w3TXBvizS3Q9M1g0eybg2gdu7OM0dbVa06wqjv7QkIqXsyFD
	 8zsPB2m6IquEg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Tq1gV2X2Dz6txY;
	Tue,  5 Mar 2024 17:47:01 +0100 (CET)
From: simone.p.weiss@posteo.com
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] contributor-guide: Add notes for tests
Date: Tue,  5 Mar 2024 16:46:51 +0000
Message-Id: <20240305164651.5132-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 16:47:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4934

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

This adds some hints that and how changes should be tested when contribut=
ing.

Fixes [YOCTO #15412]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
v2: improve ptest wording and fix spelling
 .../contributor-guide/submit-changes.rst      | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documen=
tation/contributor-guide/submit-changes.rst
index 61f3157d6..59f3c1e40 100644
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
+      - ``ptest``: run package specific tests, if they exist
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
y ``patchtest``.
+Currently, it only supports testing patches for ``openembedded-core`` br=
anches.
+To setup, perform the following::
=20
     pip install -r meta/lib/patchtest/requirements.txt
     source oe-init-build-env
--=20
2.39.2


