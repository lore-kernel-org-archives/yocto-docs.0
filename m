Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F464C47072
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3221.1702935910206617134
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L1gkorp1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D2F1BF203;
	Mon, 18 Dec 2023 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCNnB3WODlxYddQDPMi7SxbSrw2DakTLZrNenco51oU=;
	b=L1gkorp1XyvXXJK9RkiDNgME+jXneuqifLLr15l9hmquG9tt4kAbTB0CN88wGIUHyr5QyC
	Idq2g04pM275/0vQNfiXeQ+G4j0Ep57/+6BURaiYdZBO1kpDdVXkrbMi/QCkJZChTfK8Uv
	tKZTT5uGOdGbVZX4MwF/CLE0qR6o6yeM4dWWO0fVQhXKnAjDBhyGuGN5osCd/Rca4nDK/l
	1FQianiQ1zSExEOJPt0q7DK2GhLsKkd748MZWvFe4TWRQBFhnhfW23JdYq+/7EWCBJb7Tv
	UMnT3t/EuFYG+oX+hxEFd94RRuj1g2xNMimf+v1nIy75IxRBuSS2iFxMbVUc4w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [kirkstone][PATCH 09/18] dev-manual: Discourage the use of SRC_URI[md5sum]
Date: Mon, 18 Dec 2023 22:44:33 +0100
Message-Id: <20231218214442.147385-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4716

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

SRC_URI[md5sum] has been deprecated for a long time. Discourage its use
by removing it from examples and note that it should be replaced by
SRC_URI[sha256sum] when updating recipes.

Also mention that bitbake supports other checksums, though they are not
commonly used.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/debugging.rst  |  2 +-
 documentation/dev-manual/new-recipe.rst | 27 +++++++++++++++----------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index fea2cb30a1..bd1e716b0b 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -327,7 +327,7 @@ BitBake has determined by doing the following:
    the task. This list also includes indirect dependencies from
    variables depending on other variables, recursively::
 
-      Task dependencies: ['PV', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'base_do_fetch']
+      Task dependencies: ['PV', 'SRCREV', 'SRC_URI', 'SRC_URI[sha256sum]', 'base_do_fetch']
 
    .. note::
 
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index a031c59875..ed87f9b2d0 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -303,28 +303,33 @@ If your :term:`SRC_URI` statement includes URLs pointing to individual files
 fetched from a remote server other than a version control system,
 BitBake attempts to verify the files against checksums defined in your
 recipe to ensure they have not been tampered with or otherwise modified
-since the recipe was written. Two checksums are used:
-``SRC_URI[md5sum]`` and ``SRC_URI[sha256sum]``.
+since the recipe was written. Multiple checksums are supported:
+``SRC_URI[md5sum]``, ``SRC_URI[sha1sum]``, ``SRC_URI[sha256sum]``.
+``SRC_URI[sha384sum]`` and ``SRC_URI[sha512sum]``, but only
+``SRC_URI[sha256sum]`` is commonly used.
+
+.. note::
+
+   ``SRC_URI[md5sum]`` used to also be commonly used, but it is deprecated
+   and should be replaced by ``SRC_URI[sha256sum]`` when updating existing
+   recipes.
 
 If your :term:`SRC_URI` variable points to more than a single URL (excluding
-SCM URLs), you need to provide the ``md5`` and ``sha256`` checksums for
-each URL. For these cases, you provide a name for each URL as part of
-the :term:`SRC_URI` and then reference that name in the subsequent checksum
-statements. Here is an example combining lines from the files
-``git.inc`` and ``git_2.24.1.bb``::
+SCM URLs), you need to provide the ``sha256`` checksum for each URL. For these
+cases, you provide a name for each URL as part of the :term:`SRC_URI` and then
+reference that name in the subsequent checksum statements. Here is an example
+combining lines from the files ``git.inc`` and ``git_2.24.1.bb``::
 
    SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
               ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
 
-   SRC_URI[tarball.md5sum] = "166bde96adbbc11c8843d4f8f4f9811b"
    SRC_URI[tarball.sha256sum] = "ad5334956301c86841eb1e5b1bb20884a6bad89a10a6762c958220c7cf64da02"
-   SRC_URI[manpages.md5sum] = "31c2272a8979022497ba3d4202df145d"
    SRC_URI[manpages.sha256sum] = "9a7ae3a093bea39770eb96ca3e5b40bff7af0b9f6123f089d7821d0e5b8e1230"
 
-Proper values for ``md5`` and ``sha256`` checksums might be available
+The proper value for the ``sha256`` checksum might be available together
 with other signatures on the download page for the upstream source (e.g.
 ``md5``, ``sha1``, ``sha256``, ``GPG``, and so forth). Because the
-OpenEmbedded build system only deals with ``sha256sum`` and ``md5sum``,
+OpenEmbedded build system typically only deals with ``sha256sum``,
 you should verify all the signatures you find by hand.
 
 If no :term:`SRC_URI` checksums are specified when you attempt to build the
-- 
2.34.1


