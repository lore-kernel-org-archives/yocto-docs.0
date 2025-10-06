Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47366CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:03:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.33338.1759755799565371812
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 06:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IJRmE23k;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 352704E40E28;
	Mon,  6 Oct 2025 13:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CF46606B7;
	Mon,  6 Oct 2025 13:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 285AB102F1D6B;
	Mon,  6 Oct 2025 15:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759755797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pqFXjyY5pXVLFggkVEnTEzr8NZD++wgI1u45yc0bY00=;
	b=IJRmE23kWR4rqepRwceSATRH97kxi9Vw/IeSsUhh4jc4Zhb0J389VzbdFL4bHIhn96De+6
	y23QMVdrqIQNFFznthEaRpdbvge1DtKJms0YSweU+Yu0b9/rnjdoZ3Ajb9ZWfalvdwPdmE
	otLtLTRPw6ANJLUePXmg5IdG+VpWwm9WqzcF4SydoZHntHRsoVE5ND43PXSiByebD9mswf
	7U8CLtwvb7mWquYDiqR9G8KJCe38w66YL6soNkVPbeY4Kq12KY2j8RG2ALjPL+ie5xEbX5
	RujH97k+JZUVH6hsiSDiW7YugeK9IByx1Am/Fkvcr5/SbISpMjw/ImnyMDhM2g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 06 Oct 2025 15:03:05 +0200
Subject: [PATCH 2/2] ref-manual/classes.rst: extend the uninative class
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-uninative-class-extend-v1-2-1a9e30e95e8f@bootlin.com>
References: <20251006-uninative-class-extend-v1-0-1a9e30e95e8f@bootlin.com>
In-Reply-To: <20251006-uninative-class-extend-v1-0-1a9e30e95e8f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4578;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kRDrFgLgBoVZX8IepkfXnELSb37AyQJjoUV8OBPX0Eo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo474Ru/Sn4bacZ7CBOSp+ZZqAm0rWqqiZ7+j4b
 6PoeuummDaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOO+EQAKCRDRgEFAKaOo
 NlM6EADB3kxxHnY4cf0pa3VUbtL57yCvLPTEipU+rIbBp8gKXRA4g2ahfXQyX7fIIywtG+n155O
 UmyUEmcpjso0MdYREK4l36tIgqcFwVx2RENgGRQvGPDslVri8pIM10ERVEQka9MDaOtOKtqtDXY
 NwF8DaTR8B+wwfz0winGotxv9wmg6MY/coeLEr6oKlqqo8U24TPtr3hi2Ml3Wtbzhq89lNFLZsO
 QaVe5u9uIcQHk5BxqtCLlKvy3KnTlJpY94louPGD7fZD0tNjY+5XJ9/CPtiYoyUy7MmCmoIYqPf
 mPMePjgw5TEWRUXdTxELaE47z4U8bdmZ+vIqYGte2Vj6tS+DB7WmGWmz1LFcZsuFwtk0myIZxtw
 jrWVPIV56z7jB3ms8pB7XUNRduWIKqgw7U3oB51axFTqI60zjOMHav1y9DhBqYRsWpau6gL9DoP
 EB9/RaXKeG56iTzph7SpG/RwwXXarcxzA5QHWvG7U7CCHgwpxO/AYaExac8spTitOf/+SyOyOt3
 M0fffto2i6iTfxF3AK2AA9AgU12xiF9Lp5FGtbjJjsIqldSourDAJm5yMdYw+WR/ayrU4zLE2eq
 rYXCqj8HM1QWhwdeippbWFPB2o0J/q8r9SvSke6UrRbP2piP6GSmsTgYffaMT+VbuzVM5JcCgfK
 Z4hXnqNXxttb6qA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 13:03:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7656

Extend the documentation of the uninative class based on [1].

[1]: https://lore.kernel.org/r/061e6150ce177221f7b6ee8754b03a20347a92c3.camel@linuxfoundation.org

Co-developed-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 61 ++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 662121ed9..f77f99f96 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3293,22 +3293,51 @@ buildtime via :term:`UKI_FILENAME`.
 ``uninative``
 =============
 
-Attempts to isolate the build system from the host distribution's C
-library in order to make re-use of native shared state artifacts across
-different host distributions practical. With this class enabled, a
-tarball containing a pre-built C library is downloaded at the start of
-the build. In the Poky reference distribution this is enabled by default
-through ``meta/conf/distro/include/yocto-uninative.inc``. Other
-distributions that do not derive from poky can also
-"``require conf/distro/include/yocto-uninative.inc``" to use this.
-Alternatively if you prefer, you can build the uninative-tarball recipe
-yourself, publish the resulting tarball (e.g. via HTTP) and set
-``UNINATIVE_URL`` and ``UNINATIVE_CHECKSUM`` appropriately. For an
-example, see the ``meta/conf/distro/include/yocto-uninative.inc``.
-
-The :ref:`ref-classes-uninative` class is also used unconditionally by the extensible
-SDK. When building the extensible SDK, ``uninative-tarball`` is built
-and the resulting tarball is included within the SDK.
+The :ref:`ref-classes-uninative` class allows binaries to run on systems with
+older or newer :wikipedia:`Glibc <Glibc>` versions. This means
+:ref:`ref-classes-native` recipe :ref:`overview-manual/concepts:shared state
+cache` can be shared among different host distributions of different versions,
+i.e. the :ref:`overview-manual/concepts:shared state cache` is "universal".
+
+To allow this to work, the dynamic loader is changed to our own :manpage:`ld.so
+<ld.so.8>` when binaries are compiled using the
+``--dynamic-linker`` option. This means when the binary is executed, it finds
+our own :manpage:`ld.so <ld.so.8>` and that loader has a modified search path
+which finds a newer Glibc version.
+
+The linking of the binaries is not changed at link time since the
+headers on the system wouldn't match the newer Glibc and this causes
+obtuse failures. Changing the loader is effectively the same as if the
+system had a Glibc upgrade after the binary was compiled, so it is a
+mechanism supported by upstream.
+
+One caveat to this approach is that the uninative Glibc binary must be
+equal to or newer in version to the versions on all the systems using
+the common :ref:`overview-manual/concepts:shared state cache`. This is why
+:ref:`ref-classes-uninative`  is regularly changed on the development and stable
+branches.
+
+Another potential issue is static linking: static libraries created on
+a system with a new Glibc version may have symbols not present in older
+versions, which would then fail during linking on older systems. This
+is one reason we don't use static linking for our :ref:`ref-classes-native`
+binaries.
+
+With this class enabled, a tarball containing a pre-built C library is
+downloaded at the start of the build. In the Poky reference distribution this is
+enabled by default through :oe_git:`meta/conf/distro/include/yocto-uninative.inc
+</openembedded-core/tree/meta/conf/distro/include/yocto-uninative.inc>`. Other distributions that do
+not derive from Poky can also "``require conf/distro/include/yocto-uninative.inc``"
+to use this. Alternatively if you prefer, you can build the uninative-tarball
+recipe yourself, publish the resulting tarball (e.g. via HTTP) and set
+:term:`UNINATIVE_URL` and :term:`UNINATIVE_CHECKSUM` appropriately. For an
+example, see :oe_git:`meta/conf/distro/include/yocto-uninative.inc
+</openembedded-core/tree/meta/conf/distro/include/yocto-uninative.inc>`.
+
+The :ref:`ref-classes-uninative` class is also used unconditionally by the
+:doc:`extensible SDK </sdk-manual/extensible>`. When building the extensible
+SDK, ``uninative-tarball`` is built and the resulting tarball is included within
+the SDK.
 
 .. _ref-classes-update-alternatives:
 

-- 
2.51.0


