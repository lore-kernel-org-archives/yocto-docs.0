Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9509CF459E0
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158228.1775832231298698189
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i9Khl1RJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF48DC5C1B4
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2475603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0331C10450075;
	Fri, 10 Apr 2026 16:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J/Wp3tVBrgNMzVko3+SXZkugZw2KbnudAFxt+AuC9e0=;
	b=i9Khl1RJnknVwaij9yLAtpezr4cwFUwKFY0Sc6O6c+ANslt9KaEh31PUgFeCX0IPS13D0D
	ACYfMvQG9OXaEXBoEu39E8Arg2sbqJJV9m45KpmH/RVeBR1IY2xnZ7tiIZwjd8YJi6E/DR
	sZLx5nDWpkwa48a1jcqnhJBFgxV5msVaKBUf52VqKDGyzZaNwKqLvS4uXmYIABx9BaEJID
	4FAqalRO/cioDcUavCPkdLEJFWSxWSdzzcKokxAvuHWsZJ0BSwAujhqyzcfCWDuMDc7H11
	qgCLLJkViDBsxs9q6SlerHQx8Oj3/xlg3VBIaK/TURMNjD/tOfuXgckV/Muixg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:40 +0200
Subject: [PATCH 16/18] docs-wide: replace meta-poky/conf/templates/default
 by oecore's templates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-16-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8660;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vzyMSZYNceVNyBPBXqCepIPCBRTuBPtXqmx3jLe5HtQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyZ8d3Df1yvkWN/Gim7qmiViqISZ5w7XFD+X
 6Cypsjw04SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMmQAKCRDRgEFAKaOo
 NvZFD/9sO1F+qmSZqVDhQU4pyTcJeQ3XnIsAMKuvw9XpvkzdiROY8ffl4MQXts3zME2e1bXm5RD
 tgu8KfqRgePzQESahz6xD6h4Ro4LTXBhTbzijXqR4Dgb7kOr9kyxEltA55DtSJ+CEDrXkyuCo8s
 RhK4YGKYsMAutvkZu8PqKcsJoL5ZXjBvzGORYziJBivfO5fuZfzFsdQpRFz5ld2eojn4kOQscte
 zGTec0lQWug4eCTvt8cotX0IvqmDs86UOi3SVhxN1KaP180oqDvqWRqieCnWmYZJlEa9KgAG4j0
 RCt+fJA1xqa9jeYAhkPDTJddHDpDZ3ttnLMJiLjZTqlwHOgpIAWdODQaUoR1CftE9x5iuQu5SYe
 PgpNf16v3laQgiLPb2/4cYe7e0Ng6cmeQpyLxW6ulXEOqmG+4kysG6a6m56oPzMZEzWdxZfyfFC
 vT1z6vY2aI1uzWMoqHxB4OcSc50jSSA/U2pztKc/A+ZAfvVgOoJDXP99h/7b5bb88jnsQRd/D4W
 dN0qyoOibzG8JBOph6EMzIPnwHtxm/GOT6OYp83djF30FWfwOkoFm3vcG9+wKtdq/fO1HsZJowl
 aepGemh42SbnqsAAw/FsYWL53xEY5p3VenKgNTJ2ocMNpx6wdqsyUGUi8hlA5RLMp4ncphHE0wW
 1Xvn0qr4pziZYUA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9247

The meta-poky's templates have been removed with [1]. They're intented
to be replaced with the ones from OpenEmbedded-Core.

Replace the occurences of these paths and replace accordingly.

[1]: https://git.yoctoproject.org/meta-yocto/commit/meta-poky/conf?id=ac300baea7314ea3c80f2330b2a993f729f32150

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../custom-template-configuration-directory.rst        |  2 +-
 documentation/dev-manual/licenses.rst                  |  4 ++--
 documentation/dev-manual/poky-manual-setup.rst         |  2 +-
 documentation/overview-manual/concepts.rst             |  5 ++---
 documentation/ref-manual/faq.rst                       |  2 +-
 documentation/ref-manual/structure.rst                 | 18 ++++++------------
 documentation/ref-manual/variables.rst                 |  2 +-
 7 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/documentation/dev-manual/custom-template-configuration-directory.rst b/documentation/dev-manual/custom-template-configuration-directory.rst
index 8bf763569..597772f7f 100644
--- a/documentation/dev-manual/custom-template-configuration-directory.rst
+++ b/documentation/dev-manual/custom-template-configuration-directory.rst
@@ -39,7 +39,7 @@ from ``.templateconf`` file that is read from the same directory as
 ``oe-init-build-env`` script. For the Poky reference distribution this
 would be::
 
-   TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf/templates/default}
+   TEMPLATECONF=${TEMPLATECONF:-meta/conf/templates/default}
 
 If you look at a configuration template directory, you will
 see the ``bblayers.conf.sample``, ``local.conf.sample``, ``conf-summary.txt`` and
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 4bc1f7376..774b5db23 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -469,8 +469,8 @@ of the Yocto Project and layers used during your build. Archiving a Git
 repository can be done with the :manpage:`git-archive <git-archive(1)>` command.
 
 One thing a development organization might want to consider for end-user
-convenience is to modify
-``meta-poky/conf/templates/default/bblayers.conf.sample`` to ensure that when
+convenience is to provide its own version of the
+:oecore_path:`meta/conf/templates/default/bblayers.conf.sample` file to ensure that when
 the end user utilizes the released build system to build an image, the
 development organization's layers are included in the ``bblayers.conf`` file
 automatically::
diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index 2b1c3f63d..cade9e2b1 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -94,7 +94,7 @@ an entire Linux distribution, including the toolchain, from source.
 
     .. code-block:: shell
 
-       $ TEMPLATECONF=$PWD/layers/meta-yocto/meta-poky/conf/templates/default source ./layers/openembedded-core/oe-init-build-env
+       $ source ./layers/openembedded-core/oe-init-build-env
 
     Among other things, the script creates the :term:`Build Directory`, which is
     ``build`` in this case and is located in the :term:`Source Directory`.
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ab723d7c3..1faa790f3 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -228,9 +228,8 @@ Directory` at the time you source the build environment setup script.
 :term:`Configuration files <Configuration File>` provide many basic variables
 that define a build environment. To show a list of possible variables to
 configure from :term:`configuration files <Configuration File>`, see the
-:yocto_git:`local.conf.sample
-</meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample>` in the
-``meta-poky`` layer:
+:oecore_path:`local.conf.sample <meta/conf/templates/default/local.conf.sample>`
+file in :term:`OpenEmbedded-Core (OE-Core)`:
 
 Here is a non-exhaustive list:
 
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 248cf3d2d..adb5659b7 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -196,7 +196,7 @@ and ``all_proxy`` set as to standard shell environment variables to redirect
 requests through proxy servers.
 
 The Yocto Project also includes a
-``meta-poky/conf/templates/default/site.conf.sample`` file that shows
+:oecore_path:`meta/conf/templates/default/site.conf.sample` file that shows
 how to configure a Git proxy server if needed.
 
 .. note::
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 06cd2b770..ff84b250b 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -315,10 +315,10 @@ The :term:`OpenEmbedded Build System` can create the ``local.conf`` file from a
 setup script :ref:`structure-core-script`.
 
 The source ``local.conf.sample`` file used depends on the
-:term:`TEMPLATECONF` script variable, which defaults to ``layers/meta-yocto/meta-poky/conf/templates/default``
-when you are building from the Yocto Project development environment,
-and to ``layers/openembedded-core/meta/conf/templates/default`` when you are building from the OpenEmbedded-Core
-environment. Because the script variable points to the source of the
+:term:`TEMPLATECONF` script variable, which defaults to
+:oecore_path:`meta/conf/templates/default` in :term:`OpenEmbedded-Core
+(OE-Core)`.
+Because the script variable points to the source of the
 ``local.conf.sample`` file, this implies that you can configure your
 build environment from any layer by setting the variable in the
 top-level build environment setup script as follows::
@@ -334,8 +334,6 @@ file, it uses ``sed`` to substitute final
 
    You can see how the :term:`TEMPLATECONF` variable is used by looking at the
    ``layers/openembedded-core/scripts/oe-setup-builddir`` script in :term:`OpenEmbedded-Core (OE-Core)`.
-   You can find the :term:`Poky` version of the ``local.conf.sample`` file in
-   the ``layers/meta-yocto/meta-poky/conf/templates/default`` directory.
 
 .. _structure-build-conf-bblayers.conf:
 
@@ -354,9 +352,7 @@ when you ``source`` the top-level build environment setup script (i.e.
 
 As with the :ref:`structure-build-conf-local.conf` file, the source ``bblayers.conf.sample``
 file used depends on the :term:`TEMPLATECONF` script variable, which
-defaults to ``meta-poky/conf/templates/default`` when you are building using the
-:term:`Poky` reference distro, and to ``meta/conf/templates/default`` when you are
-building from the OpenEmbedded-Core environment (default). Because the script
+defaults to :oecore_path:`meta/conf/templates/default` . Because the script
 variable points to the source of the ``bblayers.conf.sample`` file, this
 implies that you can base your build from any layer by setting the
 variable in the top-level build environment setup script as follows::
@@ -369,9 +365,7 @@ Once the build process gets the sample file, it uses ``sed`` to substitute final
 .. note::
 
    You can see how the :term:`TEMPLATECONF` variable is defined by the ``scripts/oe-setup-builddir``
-   script in :term:`OpenEmbedded-Core (OE-Core)`. You can find the :term:`Poky`
-   version of the ``bblayers.conf.sample`` file in the ``layers/meta-yocto/meta-poky/conf/templates/default``
-   directory.
+   script in :term:`OpenEmbedded-Core (OE-Core)`.
 
 .. _structure-build-conf-site.conf:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9ce2803b3..606466313 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5050,7 +5050,7 @@ system and gives an overview of their function and contents.
          configuration file. You cannot set the variable in a recipe file.
 
       See the
-      :yocto_git:`local.conf.sample.extended </meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample.extended>`
+      :oecore_path:`local.conf.sample.extended <meta/conf/templates/default/local.conf.sample.extended>`
       file for additional information. Also, for information on creating an
       :term:`Initramfs`, see the ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section
       in the Yocto Project Development Tasks Manual.

-- 
2.53.0


