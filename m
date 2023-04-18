Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EB3C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 12:22:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.7045.1681820519270006290
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 05:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mBMw+Z+x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CB74320014;
	Tue, 18 Apr 2023 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681820517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qecK8gSBg01A1AGkvfwucGM/iPi4xcptisBOia4yekI=;
	b=mBMw+Z+xqzjtUCKQPlaYnZYdBqzSA5Ak0hvTK28x1Mh2JyRZMZSmNDAKN1IUQbAt7NaSZ4
	fQKTWfFYp63hhYY+vHMdekWjftGbuVqP6bziGOeu2OR9SuHw9awytoYicORA+iEsdv1Wpr
	ZIivvY0LRLtBWwbXkzBNRdfLY8KS933e7rkg4EM+4PMveEu0Kjl041wUoYohTcN14qBHU5
	ZB27OKhAK3WC4JnmxgCXsihTQWBjlVutOe4FqUtBuSI1QrvqWG8LdOxM1attRr9WQgHKo5
	qODda0NRq390ATnGI1YWm/dHD6NEIUs9VtnpeSXFYFwv6fhuKq6S7oktJIP6Ow==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] overview-manual: update section about source archives
Date: Tue, 18 Apr 2023 14:21:53 +0200
Message-Id: <20230418122153.1293051-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Apr 2023 12:22:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3843

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Except the "yocto" and "uninative" directories, everything
under https://downloads.yoctoproject.org/releases/, in particular
"bitbake".

Point to https://downloads.yoctoproject.org/releases/yocto/
instead for people interested in tar archives.

Simplify the description too, unnecessarily verbose.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst            | 45 +++++--------------
 .../development-environment.rst               |  2 +-
 2 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 27fc0fcd01..4881481044 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -613,44 +613,23 @@ Use the following procedure to locate the latest upstream copy of the
       For information on cloning a repository, see the
       ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" section.
 
-Accessing Index of Releases
----------------------------
+Accessing Source Archives
+-------------------------
+
+The Yocto Project also provides source archives of its releases, which
+are available on :yocto_dl:`/releases/yocto/`. Then, choose the subdirectory
+containing the release you wish to use, for example
+:yocto_dl:`yocto-&DISTRO; </releases/yocto/yocto-&DISTRO;/>`.
 
-Yocto Project maintains an Index of Releases area that contains related
-files that contribute to the Yocto Project. Rather than Git
-repositories, these files are tarballs that represent snapshots in time
-of a given component.
+You will find there source archives of individual components (if you wish
+to use them individually), and of the corresponding Poky release bundling
+a selection of these components. 
 
 .. note::
 
    The recommended method for accessing Yocto Project components is to
    use Git to clone the upstream repository and work from within that
-   locally cloned repository. However, this section documents how to
-   use a tarball snapshot of any given component.
-
-Follow these steps to locate and download a particular tarball:
-
-#. *Access the Index of Releases:* Open a browser and go to
-   :yocto_dl:`Index of Releases </releases>`. The
-   list represents released components (e.g. ``bitbake``, ``sato``, and
-   so on).
-
-   .. note::
-
-      The ``yocto`` directory contains the full array of released Poky
-      tarballs. The ``poky`` directory in the Index of Releases was
-      historically used for very early releases and exists now only for
-      retroactive completeness.
-
-#. *Select a Component:* Click on any released component in which you
-   are interested (e.g. ``yocto``).
-
-#. *Find the Tarball:* Drill down to find the associated tarball. For
-   example, click on ``yocto-&DISTRO;`` to view files associated with the
-   Yocto Project &DISTRO; release.
-
-#. *Download the Tarball:* Click the tarball to download and save a
-   snapshot of the given component.
+   locally cloned repository.
 
 Using the Downloads Page
 ------------------------
@@ -659,7 +638,7 @@ The :yocto_home:`Yocto Project Website <>` uses a "DOWNLOADS" page
 from which you can locate and download tarballs of any Yocto Project
 release. Rather than Git repositories, these files represent snapshot
 tarballs similar to the tarballs located in the Index of Releases
-described in the ":ref:`dev-manual/start:accessing index of releases`" section.
+described in the ":ref:`dev-manual/start:accessing source archives`" section.
 
 #. *Go to the Yocto Project Website:* Open The
    :yocto_home:`Yocto Project Website <>` in your browser.
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 0d931df3dc..8d470c9ce7 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -193,7 +193,7 @@ development:
       :width: 50%
 
    For steps on how to view and access these files, see the
-   ":ref:`dev-manual/start:accessing index of releases`"
+   ":ref:`dev-manual/start:accessing source archives`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *"DOWNLOADS" page for the* :yocto_home:`Yocto Project Website <>` *:*
-- 
2.34.1


