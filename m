Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6024CE79AE
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:08:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.31933.1695197290329611218
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F34nCdp0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AF7F24000C;
	Wed, 20 Sep 2023 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tP5wxlfI2tUCirctecwEnN+DZzkUEXfraBFuUeJGuGg=;
	b=F34nCdp0MzxbxkRvJ62H7l2vezde23yfZ+BoFUS8v474RMaZzEsNkQqmb1RQWa+gfutsLe
	i/zVxloB4SxBhWO99pTDw0yhJC+BNrgsq36n1nObqlvX4WFZPNeDfDUBa6Bg5725CUlbTF
	w3ls7MetUTBu8gjLUZaHNQwp6NnyaP6l0RmoxhwNlAWlZ60c+9k37G+kEuaGTykncx2olK
	ii9r75D5DC/RWwwU/Xr3UFVCoNZzsvmJGNOH6Rd31IDcYkur9OpZtOktNcFKcqnhDOH3SL
	q8xAb8nV3V70RBKFoMXV69nuqNrBoLqCPAXpz7cdZWtd89imcaSuC9nxIIjydQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 4/7] contributor-guide: recipe-style-guide: add Upstream-Status
Date: Wed, 20 Sep 2023 10:07:51 +0200
Message-Id: <20230920080754.1225508-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
References: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4243

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/recipe-style-guide.rst  | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index a0d513e8e9..99105179a6 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -255,3 +255,84 @@ Tips and Guidelines for Writing Recipes
 -  Use :term:`BBCLASSEXTEND` instead of creating separate recipes such as ``-native``
    and ``-nativesdk`` ones, whenever possible. This avoids having to maintain multiple
    recipe files at the same time.
+
+Patch Upstream Status
+=====================
+
+In order to keep track of patches applied by recipes and ultimately reduce the
+number of patches that need maintaining, the OpenEmbedded build system
+requires information about the upstream status of each patch.
+
+In its description, each patch should provide detailed information about the
+bug that it addresses, such as the URL in a bug tracking system and links
+to relevant mailing list archives.
+
+Then, you should also add an ``Upstream-Status:`` tag containing one of the
+following status strings:
+
+``Pending``
+   No determination has been made yet or not yet submitted to upstream.
+
+``Submitted [where]``
+   Submitted to upstream, waiting for approval. Optionally include where
+   it was submitted, such as the author, mailing list, etc.
+
+``Accepted``
+   Accepted in upstream, expect it to be removed at next update, include
+   expected version info.
+
+``Backport``
+   Backported from new upstream version, because we are at a fixed version,
+   include upstream version info.
+
+``Denied``
+   Not accepted by upstream, include reason in patch.
+
+``Inactive-Upstream [lastcommit: when (and/or) lastrelease: when]``
+   The upstream is no longer available. This typically means a defunct project
+   where no activity has happened for a long time --- measured in years. To make
+   that judgement, it is recommended to look at not only when the last release
+   happened, but also when the last commit happened, and whether newly made bug
+   reports and merge requests since that time receive no reaction. It is also
+   recommended to add to the patch description any relevant links where the
+   inactivity can be clearly seen.
+
+``Inappropriate [reason]``
+   The patch is not appropriate for upstream, include a brief reason on the
+   same line enclosed with ``[]``. The reason can be:
+
+   -  ``not author`` (you are not the author and do not intend to upstream this,
+      the source must be listed in the comments)
+   -  ``native``
+   -  ``licensing``
+   -  ``configuration``
+   -  ``enable feature``
+   -  ``disable feature``
+   -  ``bugfix`` (add bug URL here)
+   -  ``embedded specific``
+   -  ``other`` (give details in comments)
+
+The various ``Inappropriate [reason]`` status items are meant to indicate that
+the person responsible for adding this patch to the system does not intend to
+upstream the patch for a specific reason.
+
+Of course, if another person later takes care of submitting this patch upstream,
+the status should be changed to ``Submitted [where]``, and an additional
+``Signed-off-by:`` line should be added to the patch by the person claiming
+responsibility for upstreaming.
+
+For example, if the patch has been submitted upstream::
+
+   rpm: Adjusted the foo setting in bar
+
+   [RPM Ticket #65] -- http://rpm5.org/cvs/tktview?tn=65,5
+
+   The foo setting in bar was decreased from X to X-50% in order to
+   ensure we don't exhaust all system memory with foobar threads.
+
+   Upstream-Status: Submitted [rpm5-devel@rpm5.org]
+
+   Signed-off-by: Joe Developer <joe.developer@example.com>
+
+A future update can change the value to ``Accepted`` or ``Denied`` as
+appropriate.
-- 
2.34.1


