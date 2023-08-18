Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315A3FC6165
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.2.1692378641859632545
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ArwVNp3v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D37AC0002;
	Fri, 18 Aug 2023 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GnUhiuwmOVlxb9KWyxFslV02kkrwfVUJWm3B1D2Ip6M=;
	b=ArwVNp3vtkS7CFhFv0xH3MEt+eGN4hdfqMes6193DA1dbIt//CgLj1zuYCxGYtV2LGQj+Z
	qs1lnpCD18fAlClURKtKfOXFazfE8ZeuB6HzFO5gFbN5PSHiwGrLdgDvm1O0wqWbKByQA3
	73954NkZv70kpxAex7T+yHAfz3fc29sWeNvnygSpw51yMlaCOvlRXEa2RArr2qJlQ6pFXG
	G0GH3qamLLDjDmysQMk5YfAJQNb+qvq+xalYrmBhllFCcT9goKxqV5XlppI/mesTtTzITl
	KslgWkblrETQtEVdngVbQIZy4aGUEldkwOH6CdOOTR0a3n1vy4SgsixeSE9NrQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 08/10] contributor-guide: submit-changes: improvements to mailing lists section
Date: Fri, 18 Aug 2023 19:10:03 +0200
Message-Id: <20230818171005.92381-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4173

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Add missing reference to openembedded-devel list

- Improve the text to clarify explanations, remove redundant information
  and include information currently on
  http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/submit-changes.rst      | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 3098a76a6c..31674d313d 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -328,14 +328,16 @@ Finding a Suitable Mailing List
 You should send patches to the appropriate mailing list so that they can be
 reviewed by the right contributors and merged by the appropriate maintainer.
 The specific mailing list you need to use depends on the location of the code
-you are changing. Each component (e.g. layer) should have a ``README`` file
-that indicates where to send the changes and which process to follow.
+you are changing.
 
 If people have concerns with any of the patches, they will usually voice
 their concern over the mailing list. If patches do not receive any negative
 reviews, the maintainer of the affected layer typically takes them, tests them,
 and then based on successful testing, merges them.
 
+In general, each component (e.g. layer) should have a ``README`` file
+that indicates where to send the changes and which process to follow.
+
 The "poky" repository, which is the Yocto Project's reference build
 environment, is a hybrid repository that contains several individual
 pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
@@ -358,21 +360,22 @@ varies by component:
 -  *Documentation*: For changes to the Yocto Project documentation, use the
    :yocto_lists:`docs </g/docs>` mailing list.
 
-For changes to other layers hosted in the Yocto Project source
-repositories (i.e. ``yoctoproject.org``) and tools use the
+For changes to other layers and tools hosted in the Yocto Project source
+repositories (i.e. :yocto_git:`git.yoctoproject.org <>`), use the
 :yocto_lists:`yocto </g/yocto/>` general mailing list.
 
-.. note::
+For changes to other layers hosted in the OpenEmbedded source
+repositories (i.e. :oe_git:`git.openembedded.org <>`), use
+the :oe_lists:`openembedded-devel </g/openembedded-devel>`
+mailing list, unless specified otherwise in the layer's ``README`` file.
 
-   Sometimes a layer's documentation specifies to use a particular
-   mailing list. If so, use that list.
+If you intend to submit a new recipe that neither fits into the core Metadata,
+nor into :oe_git:`meta-openembedded </meta-openembedded/>`, you should
+look for a suitable layer in https://layers.openembedded.org. If similar
+recipes can be expected, you may consider :ref:`dev-manual/layers:creating your own layer`.
 
-For additional recipes that do not fit into the core Metadata, you
-should determine which layer the recipe should go into and submit the
-changes in the manner recommended by the documentation (e.g. by the
-``README`` file) supplied with the layer. If in doubt, please ask on the
-:yocto_lists:`yocto </g/yocto/>` general mailing list or on the
-:oe_lists:`openembedded-devel </g/openembedded-devel>` mailing list.
+If in doubt, please ask on the :yocto_lists:`yocto </g/yocto/>` general mailing list
+or on the :oe_lists:`openembedded-devel </g/openembedded-devel>` mailing list.
 
 Subscribing to the Mailing List
 -------------------------------
-- 
2.34.1


