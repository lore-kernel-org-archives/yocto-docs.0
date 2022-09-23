Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF1CC04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:29 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.577.1663955604467171370
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bFOXvkTX;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3FA67200003;
	Fri, 23 Sep 2022 17:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlYaOmGJ8Cc5ujdrmLRoQHy1O7X7Oiv0OE5rqbIez+I=;
	b=bFOXvkTXqY+YLz8UTZ4PMznQh5d48zgZCC1dBSq/22q8cjcGQZJEbQA+E6f911wBf/B9N/
	UqfbfzuY5bXLjIZMD9BYte+Tpzja+qEDM5OOgwyht7ziENbWk7EaZcWHBVPZO9fMBgx9CL
	/3tF2RJteGf4Za7Jm9LIh2xn9X1098pleaqGvhg9idHQgp1L9+iFwA+WgIADTD5f2FTJEN
	s6gyj3mP1e7N9nTuL+UTjLTHcxvS8G6rGN/Ok6jOX/gjw3XN5MuMW1Tgd+sjscrepmvpZa
	FoqkLa+24IM4zrRBAXBwolQhjDDw6PB8mYOFgLq40EkWx6TmssqcNGXktTuC+g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 10/30] overview-manual: concepts.rst: add reference to
 "do_packagedata" task
Date: Fri, 23 Sep 2022 19:51:59 +0200
Message-Id: <20220923175219.6652-11-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3225

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index bbe0ec345b..36498ba1e1 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -892,7 +892,7 @@ following as well as other items: splitting out debugging symbols,
 looking at shared library dependencies between packages, and looking at
 package relationships.
 
-The ``do_packagedata`` task creates package metadata based on the
+The :ref:`ref-tasks-packagedata` task creates package metadata based on the
 analysis such that the build system can generate the final packages. The
 :ref:`ref-tasks-populate_sysroot`
 task stages (copies) a subset of the files installed by the
@@ -2106,7 +2106,7 @@ dependencies, you must manually declare the dependencies.
    located. For each module, the package that contains the module is
    registered as providing the module. The resulting module-to-package
    mapping is saved globally in :term:`PKGDATA_DIR` by the
-   ``do_packagedata`` task.
+   :ref:`ref-tasks-packagedata` task.
 
    Simultaneously, all pkg-config modules installed by the recipe are
    inspected to see what other pkg-config modules they depend on. A
@@ -2147,7 +2147,7 @@ dependencies, you must manually declare the dependencies.
    :term:`ALLOW_EMPTY` variable
    for more information.
 
-The :ref:`ref-tasks-package` task depends on the ``do_packagedata`` task of each
+The :ref:`ref-tasks-package` task depends on the :ref:`ref-tasks-packagedata` task of each
 recipe in :term:`DEPENDS` through use
 of a ``[``\ :ref:`deptask <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
 declaration, which guarantees that the required
-- 
2.34.1


