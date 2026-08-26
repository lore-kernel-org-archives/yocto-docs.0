Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF748C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:32 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3409.1787708126105113914
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IAW1pWAV;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9309d4ea213so29391685a.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708125; x=1788312925; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3XSR08E7r1RgV8Y5/hOJT3YYkP3uNQEOnQIejqVtbBs=;
        b=IAW1pWAVRUNyFtpgRgxhM+rjdRKiIEmGvwyuT7XwQOoiPJxMPkrCCaY4z8yP3nPGXC
         dch2IXyrLyla1tfGAorjPmpIxTchouWnY210eiLVyc1p4hCmHOee9ecYRs8enEUD/ARP
         FRZwrn8cpjDx2B7FmgYfGez5Dcqi/JSvWWlX02ODibdzMQtgh3n3D5GfOLyaGW6xdD8z
         TBqSkgeazHfZUQ/HjC8aWBKWWMzyZPQyKQcvLZT2qAE9BCGxgsTPN3Zda9hzdp0W0tFP
         dRF4YWvL91BqCmd8ctw8iSkBSuGtFva1kB+RAgUFBbOqJJaZ1N4VIgUyKebE+BxfXbWi
         SE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708125; x=1788312925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3XSR08E7r1RgV8Y5/hOJT3YYkP3uNQEOnQIejqVtbBs=;
        b=qqybVDoWQ/lB01JMulGUzsBUhdBdxYPsuFQ+caZk/v1V78BDTpqe64uMmvz5g4Zpcu
         rIg0EpU+UrhFDzOpkMgIPIb0xZ2NkYUdGgo2lJIKxErILj1mKcAN/UGf4lWCgCg0XX29
         i97G/+u0a/WClmCaz2LI5gboFaqb0XAoZMKsLcOaLRwTDVjL99P0Bk1P1qsWYcGoIxrz
         LDDvSFXXyBPVWx2KgK5PqBIUrraASkeT03JUnNi8qyCaz7JkeLa9EagT5bxgUkqDZoe/
         VQ4dA5Gn3XjUGnRK0iEjeJGHQWqxZKPXGP34EwsYrDPPqu08kPwLc7uYJOwtnOdF1mag
         Vwlg==
X-Gm-Message-State: AFuF++l8n1msTJDgagxEfWC9pPBF1JttFRMxBFnf7fTDGrlakYTP9yxY
	/i0PI0ev0KuF25o3iFceCoWy61AI9KtBlDHm7ZStW9kVdh9l6haSx5OpNHcJSYTD
X-Gm-Gg: AR+sD11DCM5xaouinvjh7Rs0Fn6x3bSTqlk2wzlX6Ic6OYkqDsvfwXD73P3sWgTU1Nq
	EAVeo/Rm2pmV+yJ98JuRE82q48PRhkcZf7YbFm8U0/lBjC8WwZcbo+mtJvpv2DIiIj0XJOAdFog
	TjXlhlJm+xuhv7ZF7wyMv6wvuQii4C+eM+U2wwucFdkovps/pjc5SN37p/wQvfE3Te7I0Pb1o7R
	zTwtgvyfF8YH0EG9qcY/R5SLwXy5YW8Yg0sv96hsZnxO7laDwpyryyuefUmzBbmAmiDZEkdrHic
	2fDexSdSsbt1vWMwmToDJ9EnP705ZZR3AAT6ixKmkFxot3nE2qJd9OuPRusnf1hTHVi7vQXOgRH
	ebDzYi1pFQDNJ7Ex1dg1wlj474+5zFmDkFGLV0lb6I6xtwvBVcaB/koemIUyGC+dOySw00XFrnu
	nz962uZN0x6C5yVLfFGTuPsETmwRjnBV08JwrDyFWuQ3GW7VStnfRz05J3SHOSPWIaKYB6PsPqN
	gcK5X/5kUQSLBiXO1as8tTrjjcfFgg=
X-Received: by 2002:a05:620a:6083:b0:930:db8a:c608 with SMTP id af79cd13be357-937801092cfmr307937285a.7.1787708119982;
        Tue, 25 Aug 2026 18:35:19 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.18
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:19 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 07/10] overview-manual: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:52 -0400
Message-ID: <20260826013502.2674000-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10353

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 18 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/overview-manual/concepts.rst | 68 ++++++++++++++++------
 1 file changed, 51 insertions(+), 17 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index d4530e97fed9..c82f26961a3c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -894,7 +894,9 @@ the analysis and package splitting process use several areas:
 
 Packages for a recipe are listed in the :term:`PACKAGES` variable. The
 :oe_git:`bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`
-configuration file defines the following default list of packages::
+configuration file defines the following default list of packages:
+
+.. code-block:: bitbake
 
   PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 
@@ -902,7 +904,9 @@ Each of these packages contains a default list of files defined with the
 :term:`FILES` variable. For example, the package ``${PN}-dev`` represents files
 useful to the development of applications depending on ``${PN}``. The default
 list of files for ``${PN}-dev``, also defined in :oe_git:`bitbake.conf
-</openembedded-core/tree/meta/conf/bitbake.conf>`, is defined as follows::
+</openembedded-core/tree/meta/conf/bitbake.conf>`, is defined as follows:
+
+.. code-block:: bitbake
 
   FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
                   ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
@@ -940,12 +944,16 @@ package.
 
 To add a custom package variant of the ``${PN}`` recipe named
 ``${PN}-extra`` (name is arbitrary), one can add it to the
-:term:`PACKAGE_BEFORE_PN` variable::
+:term:`PACKAGE_BEFORE_PN` variable:
+
+.. code-block:: bitbake
 
   PACKAGE_BEFORE_PN += "${PN}-extra"
 
 Alternatively, a custom package can be added by adding it to the
-:term:`PACKAGES` variable using the prepend operator (``=+``)::
+:term:`PACKAGES` variable using the prepend operator (``=+``):
+
+.. code-block:: bitbake
 
   PACKAGES =+ "${PN}-extra"
 
@@ -1661,7 +1669,9 @@ to the task.
 
 Like the :term:`WORKDIR` case, there can be situations where dependencies should be
 ignored. For these situations, you can instruct the build process to
-ignore a dependency by using a line like the following::
+ignore a dependency by using a line like the following:
+
+.. code-block:: bitbake
 
    PACKAGE_ARCHS[vardepsexclude] = "MACHINE"
 
@@ -1671,7 +1681,9 @@ reference it.
 
 Equally, there are cases where you need to add dependencies BitBake is
 not able to find. You can accomplish this by using a line like the
-following::
+following:
+
+.. code-block:: bitbake
 
    PACKAGE_ARCHS[vardeps] = "MACHINE"
 
@@ -1701,7 +1713,9 @@ and the dependent task hashes can be influenced. Within the BitBake
 configuration file, you can give BitBake some extra information to help
 it construct the basehash. The following statement effectively results
 in a list of global variable dependency excludes (i.e. variables never
-included in any checksum)::
+included in any checksum):
+
+.. code-block:: bitbake
 
    BB_BASEHASH_IGNORE_VARS ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \\
        SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \\
@@ -1722,7 +1736,9 @@ desired. This file defines the two basic signature generators
 "OEBasicHash". By default, a dummy "noop" signature handler is enabled
 in BitBake. This means that behavior is unchanged from previous
 versions. OE-Core uses the "OEBasicHash" signature handler by default
-through this setting in the ``bitbake.conf`` file::
+through this setting in the ``bitbake.conf`` file:
+
+.. code-block:: bitbake
 
    BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 
@@ -1771,7 +1787,9 @@ directory tree such as the sysroot.
 The Yocto Project team has tried to keep the details of the
 implementation hidden in the :ref:`ref-classes-sstate` class. From a user's perspective,
 adding shared state wrapping to a task is as simple as this
-:ref:`ref-tasks-deploy` example taken from the :ref:`ref-classes-deploy` class::
+:ref:`ref-tasks-deploy` example taken from the :ref:`ref-classes-deploy` class:
+
+.. code-block:: bitbake
 
    DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
    SSTATETASKS += "do_deploy"
@@ -1814,7 +1832,9 @@ The following list explains the previous example:
       instead, skipping the :ref:`ref-tasks-deploy` task.
 
 -  The following task definition is glue logic needed to make the
-   previous settings effective::
+   previous settings effective:
+
+   .. code-block:: bitbake
 
       python do_deploy_setscene () {
           sstate_setscene(d)
@@ -1846,7 +1866,9 @@ The following list explains the previous example:
       In cases where ``sstate-inputdirs`` and ``sstate-outputdirs`` would be
       the same, you can use ``sstate-plaindirs``. For example, to preserve the
       ${:term:`PKGD`} and ${:term:`PKGDEST`} output from the :ref:`ref-tasks-package`
-      task, use the following::
+      task, use the following:
+
+      .. code-block:: bitbake
 
               do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST}"
 
@@ -1862,21 +1884,27 @@ The following list explains the previous example:
    multiple directories. For example, the following declares
    :term:`PKGDESTWORK` and ``SHLIBWORK`` as shared state input directories,
    which populates the shared state cache, and :term:`PKGDATA_DIR` and
-   ``SHLIBSDIR`` as the corresponding shared state output directories::
+   ``SHLIBSDIR`` as the corresponding shared state output directories:
+
+   .. code-block:: bitbake
 
       do_package[sstate-inputdirs] = "${PKGDESTWORK} ${SHLIBSWORKDIR}"
       do_package[sstate-outputdirs] = "${PKGDATA_DIR} ${SHLIBSDIR}"
 
 -  These methods also include the ability to take a lockfile when
    manipulating shared state directory structures, for cases where file
-   additions or removals are sensitive::
+   additions or removals are sensitive:
+
+   .. code-block:: bitbake
 
       do_package[sstate-lockfile] = "${PACKAGELOCK}"
 
 Behind the scenes, the shared state code works by looking in
 :term:`SSTATE_DIR` and
 :term:`SSTATE_MIRRORS` for
-shared state files. Here is an example::
+shared state files. Here is an example:
+
+.. code-block:: bitbake
 
    SSTATE_MIRRORS ?= "\
        file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
@@ -2024,13 +2052,17 @@ variables:
 -  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set to ``OEEquivHash``.
 
 Therefore, the default configuration in Poky corresponds to the
-below settings::
+below settings:
+
+.. code-block:: bitbake
 
    BB_HASHSERVE = "auto"
    BB_SIGNATURE_HANDLER = "OEEquivHash"
 
 Rather than starting a local server, another possibility is to rely
-on a Hash Equivalence server on a network, by setting::
+on a Hash Equivalence server on a network, by setting:
+
+.. code-block:: bitbake
 
    BB_HASHSERVE = "<HOSTNAME>:<PORT>"
 
@@ -2189,7 +2221,9 @@ accomplished using fakeroot.
    under fakeroot. Otherwise, the task cannot run root-only operations,
    and cannot see the fake file ownership and permissions set by the
    other task. You need to also add a dependency on
-   ``virtual/fakeroot-native:do_populate_sysroot``, giving the following::
+   ``virtual/fakeroot-native:do_populate_sysroot``, giving the following:
+
+   .. code-block:: bitbake
 
       fakeroot do_mytask () {
           ...

