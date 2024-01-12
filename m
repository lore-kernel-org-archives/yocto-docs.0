Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A9FC47DA2
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:53:45 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12601.1705078419102044145
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PxM9Z1Sa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1CF32000C;
	Fri, 12 Jan 2024 16:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3GtAzUUJKz3scuNs7LYTL8+/APIo6Uc+zrm5SSer8g=;
	b=PxM9Z1SaBDUszls6efzhSZ5u9zr+BpvvbykQ8YiN2akv+1bWcPm189Pg67UYfkTtWiiIJH
	XmXS60yaRRaSzih7hSfnkABzs7IPp6yWbUkcd1S01mkYEZGPuVYGqkmqffqIUENlXcBaos
	27kiG/AsvyhmFpoSxtpmYHsrN67iAtSe1sbmWtfXlFuM8Lvf32GLrW48/9bJH4yKXZA5nP
	obnbG9fG1eekuVRS6cu8VurjpPorLRDSnFcmTDCzdy0bsl4VJMzixnVIfOqa0iYB7Axj7l
	HGZFoUzIcPl18FRQfY8/h1V+GTjcG0C5P8rMqoBfn5byPhKNsJkaJxQ8nshGbQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 4/6] ref-manual: resources: sync with master branch
Date: Fri, 12 Jan 2024 17:53:09 +0100
Message-Id: <20240112165311.3554201-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
References: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4777

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/resources.rst | 66 +++++++++++++-------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index a175a1db8e..8c3726e83b 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -63,26 +63,28 @@ and announcements. To subscribe to one of the following mailing lists,
 click on the appropriate URL in the following list and follow the
 instructions:
 
--  :yocto_lists:`/g/yocto` - General Yocto Project
+-  :yocto_lists:`/g/yocto` --- general Yocto Project
    discussion mailing list.
 
--  :oe_lists:`/g/openembedded-core` - Discussion mailing
+-  :oe_lists:`/g/openembedded-core` --- discussion mailing
    list about OpenEmbedded-Core (the core metadata).
 
--  :oe_lists:`/g/openembedded-devel` - Discussion
+-  :oe_lists:`/g/openembedded-devel` --- discussion
    mailing list about OpenEmbedded.
 
--  :oe_lists:`/g/bitbake-devel` - Discussion mailing
+-  :oe_lists:`/g/bitbake-devel` --- discussion mailing
    list about the :term:`BitBake` build tool.
 
--  :yocto_lists:`/g/poky` - Discussion mailing list
+-  :yocto_lists:`/g/poky` --- discussion mailing list
    about :term:`Poky`.
 
--  :yocto_lists:`/g/yocto-announce` - Mailing list to
+-  :yocto_lists:`/g/yocto-announce` --- mailing list to
    receive official Yocto Project release and milestone announcements.
 
-For more Yocto Project-related mailing lists, see the
-:yocto_home:`Yocto Project Website <>`.
+-  :yocto_lists:`/g/docs` --- discussion mailing list about the Yocto Project
+   documentation.
+
+See also :yocto_home:`the description of all mailing lists </community/mailing-lists/>`.
 
 .. _resources-irc:
 
@@ -103,93 +105,91 @@ Links and Related Documentation
 
 Here is a list of resources you might find helpful:
 
--  :yocto_home:`The Yocto Project Website <>`\ *:* The home site
+-  :yocto_home:`The Yocto Project Website <>`: The home site
    for the Yocto Project.
 
--  :yocto_wiki:`The Yocto Project Main Wiki Page <>`\ *:* The main wiki page for
+-  :yocto_wiki:`The Yocto Project Main Wiki Page <>`: The main wiki page for
    the Yocto Project. This page contains information about project
    planning, release engineering, QA & automation, a reference site map,
    and other resources related to the Yocto Project.
 
--  :oe_home:`OpenEmbedded <>`\ *:* The build system used by the
+-  :oe_home:`OpenEmbedded <>`: The build system used by the
    Yocto Project. This project is the upstream, generic, embedded
    distribution from which the Yocto Project derives its build system
    (Poky) and to which it contributes.
 
--  :oe_wiki:`BitBake </BitBake>`\ *:* The tool used to process metadata.
+-  :oe_wiki:`BitBake </BitBake>`: The tool used to process metadata.
 
--  :doc:`BitBake User Manual <bitbake:index>`\ *:* A comprehensive
+-  :doc:`BitBake User Manual <bitbake:index>`: A comprehensive
    guide to the BitBake tool. If you want information on BitBake, see
    this manual.
 
--  :doc:`/brief-yoctoprojectqs/index` *:* This
+-  :doc:`/brief-yoctoprojectqs/index`: This
    short document lets you experience building an image using the Yocto
    Project without having to understand any concepts or details.
 
--  :doc:`/overview-manual/index` *:* This manual provides overview
+-  :doc:`/overview-manual/index`: This manual provides overview
    and conceptual information about the Yocto Project.
 
--  :doc:`/dev-manual/index` *:* This manual is a "how-to" guide
+-  :doc:`/dev-manual/index`: This manual is a "how-to" guide
    that presents procedures useful to both application and system
    developers who use the Yocto Project.
 
--  :doc:`/sdk-manual/index` *manual :* This
+-  :doc:`/sdk-manual/index` manual: This
    guide provides information that lets you get going with the standard
    or extensible SDK. An SDK, with its cross-development toolchains,
    allows you to develop projects inside or outside of the Yocto Project
    environment.
 
--  :doc:`/bsp-guide/bsp` *:* This guide defines the structure
+-  :doc:`/bsp-guide/bsp`: This guide defines the structure
    for BSP components. Having a commonly understood structure encourages
    standardization.
 
--  :doc:`/kernel-dev/index` *:* This manual describes
+-  :doc:`/kernel-dev/index`: This manual describes
    how to work with Linux Yocto kernels as well as provides a bit of
    conceptual information on the construction of the Yocto Linux kernel
    tree.
 
--  :doc:`/ref-manual/index` *:* This
+-  :doc:`/ref-manual/index`: This
    manual provides reference material such as variable, task, and class
    descriptions.
 
--  :yocto_docs:`Yocto Project Mega-Manual </singleindex.html>`\ *:* This manual
+-  :yocto_docs:`Yocto Project Mega-Manual </singleindex.html>`: This manual
    is simply a single HTML file comprised of the bulk of the Yocto
    Project manuals. It makes it easy to search for phrases and terms used
    in the Yocto Project documentation set.
 
--  :doc:`/profile-manual/index` *:* This manual presents a set of
+-  :doc:`/profile-manual/index`: This manual presents a set of
    common and generally useful tracing and profiling schemes along with
    their applications (as appropriate) to each tool.
 
--  :doc:`/toaster-manual/index` *:* This manual
+-  :doc:`/toaster-manual/index`: This manual
    introduces and describes how to set up and use Toaster. Toaster is an
    Application Programming Interface (API) and web-based interface to
    the :term:`OpenEmbedded Build System`, which uses
    BitBake, that reports build information.
 
--  :yocto_wiki:`FAQ </FAQ>`\ *:* A list of commonly asked
+-  :yocto_wiki:`FAQ </FAQ>`: A list of commonly asked
    questions and their answers.
 
--  *Release Notes:* Features, updates and known issues for the current
-   release of the Yocto Project. To access the Release Notes, go to the
-   :yocto_home:`Downloads </software-overview/downloads>` page on
-   the Yocto Project website and click on the "RELEASE INFORMATION" link
-   for the appropriate release.
+-  :doc:`Release Information </migration-guides/index>`:
+   Migration guides, release notes, new features, updates and known issues
+   for the current and past releases of the Yocto Project.
 
--  :yocto_bugs:`Bugzilla <>`\ *:* The bug tracking application
+-  :yocto_bugs:`Bugzilla <>`: The bug tracking application
    the Yocto Project uses. If you find problems with the Yocto Project,
    you should report them using this application.
 
 -  :yocto_wiki:`Bugzilla Configuration and Bug Tracking Wiki Page
-   </Bugzilla_Configuration_and_Bug_Tracking>`\ *:*
+   </Bugzilla_Configuration_and_Bug_Tracking>`:
    Information on how to get set up and use the Yocto Project
    implementation of Bugzilla for logging and tracking Yocto Project
    defects.
 
--  *Internet Relay Chat (IRC):* Two IRC channels on
+-  Internet Relay Chat (IRC): Two IRC channels on
    `Libera Chat <https://libera.chat/>`__ are
    available for Yocto Project and OpenEmbeddded discussions: ``#yocto`` and
    ``#oe``, respectively.
 
--  `Quick EMUlator (QEMU) <https://wiki.qemu.org/Index.html>`__\ *:* An
+-  `Quick EMUlator (QEMU) <https://wiki.qemu.org/Index.html>`__: An
    open-source machine emulator and virtualizer.
-- 
2.34.1


