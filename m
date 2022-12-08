Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5BFC63703
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 14:53:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.16042.1670511204772981726
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 06:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OEFqrrx4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF37460003;
	Thu,  8 Dec 2022 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670511203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7/9w+lz4JZTxIihzV9D0Zc6DS16gniwQgz6EJVuKxS8=;
	b=OEFqrrx4BTRrPdS7MxqqSeOX+HlGUFbcgjOBXC+Jf45LUAsEozLapE7pE1eXGfRQ4JZHv2
	uJgloD6vlWdiBUtQDRS1i1KdpUVkTSI8E4N8qKcg4OEY/v6Jxo1ItOs0i0gzrkiSww/Fw0
	Zed8I9eNPw+t+0Q/tObCE9t+FvGygYi/rl/b50hOvnK2Z9jyRvweS1ZMCzqLFu7dd5Szpk
	Z8w28tmZug9+YsdD6nhdC6RAnaTSWTiN/EOE0XpiXaE6+oAqHC8zhJd7vHrlI5MLtZdTWh
	8kktR5BN0Z8QXZcOYb59GK0QCIXIvOq5Gb3YdmkT/m4xPiy8B2qDFKxMgk/FPw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual/resources.rst: fix formating
Date: Thu,  8 Dec 2022 15:53:20 +0100
Message-Id: <20221208145320.17779-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Dec 2022 14:53:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3526

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Simplify formating for better looking output.
For example, mosts paragraphs had only ther ":" character in boldface.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/resources.rst | 42 +++++++++++++-------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index c737cba912..fd4aed0164 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -104,93 +104,93 @@ Links and Related Documentation
 
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
+-  Release Notes: Features, updates and known issues for the current
    release of the Yocto Project. To access the Release Notes, go to the
    :yocto_home:`Downloads </software-overview/downloads>` page on
    the Yocto Project website and click on the "RELEASE INFORMATION" link
    for the appropriate release.
 
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
2.37.2


