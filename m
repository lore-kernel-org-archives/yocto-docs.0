Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20355CD5BB3
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:58:34 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.7659.1695128311704922641
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 05:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiaJC-0000jR-5q; Tue, 19 Sep 2023 14:58:30 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiaJB-007SWz-LJ; Tue, 19 Sep 2023 14:58:29 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiaJB-006cEm-1x;
	Tue, 19 Sep 2023 14:58:29 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: Roland Hieber <rhi@pengutronix.de>
Subject: [RESEND] [PATCH] contributor-guide: add docs for Upstream-Status patch headers
Date: Tue, 19 Sep 2023 14:57:56 +0200
Message-Id: <20230919125757.1571746-2-rhi@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919125757.1571746-1-rhi@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Sep 2023 12:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4229

Port and update the text from the OpenEmbedded wiki page [1], which has
since been deleted and replaced by a link to the Contributor Guide
(where not everything is available yet). The original text was available
under Creative Commons Attribution-ShareAlike 3.0, and the original
authors were wiki users Mhatle, Mariano, Benjamin, and McFrisk.

  [1]: https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 .../contributor-guide/recipe-style-guide.rst       | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index a0d513e8e9a4..d9e14d5d19a7 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -255,3 +255,122 @@ Tips and Guidelines for Writing Recipes
 -  Use :term:`BBCLASSEXTEND` instead of creating separate recipes such as ``-native``
    and ``-nativesdk`` ones, whenever possible. This avoids having to maintain multiple
    recipe files at the same time.
+
+.. _upstream-status:
+
+Patches
+=======
+
+In order to keep track of patches applied by recipes and ultimately reduce the
+number of patches that are required to be maintained, we need to track the
+status of the patches that are created. In addition, we also want to track if
+it's appropriate to get this particular patch into the upstream project.
+
+For each patch applied by a recipe, add an ``Upstream-Status:`` tag which
+contains one of the following items. Be sure to include any URL to bug
+tracking, mailing lists, commit IDs, or other reference material pertaining to
+the patch.
+
+``Pending``
+   No determination has been made yet or patch was not yet submitted to upstream.
+
+``Submitted [where]``
+   Submitted to upstream, awaiting approval and/or review. Include where it was
+   submitted, such as the author, date, mailing list, pull request, etc.
+
+``Accepted [version]``
+   Accepted in upstream, expect it to be removed at next update.
+   Include expected version info.
+
+``Backport [version]``
+   Backported from a new upstream version. Include upstream version info.
+
+``Denied [reason]``
+   Not accepted by upstream. Include reason in patch.
+
+``Inactive-Upstream [lastcommit: when (and/or) lastrelease: when]``
+   The upstream is no longer available.
+   This typically means a defunct project where no activity has happened for a
+   long time – measured in years. To make that judgement, it is recommended to
+   look at not only when the last release happened, but also when the last
+   commit happened, and whether newly made bug reports and merge requests since
+   that time receive no reaction. It is also recommended to add any relevant
+   links to the commit message where the inactivity can be clearly seen.
+
+``Inappropriate [reason]``
+   The patch is not appropriate for upstream. Include a brief reason on the same
+   line enclosed with ``[]``. Possible reason include:
+
+   -  ``not author``: You are not the author and do not intend to upstream this,
+      source must be listed in the comments
+   -  ``native``
+   -  ``licensing``
+   -  ``configuration``
+   -  ``enable feature``
+   -  ``disable feature``
+   -  ``bugfix`` (add bug URL here)
+   -  ``embedded specific``
+   -  ``other`` (give details in comments)
+
+The various *"Inappropriate [reason]"* status items are meant to indicate that
+the person responsible for adding this patch to the system does not intend to
+upstream the patch for a specific reason. Unless otherwise noted, another person
+could submit this patch to the upstream – if they do, the status should be
+changed to *"Submitted [where]"*, and an additional *Signed-off-by:* line
+added to the patch by the person claiming responsibility for upstreaming.
+
+CVE patches
+-----------
+
+In order to have a better control of vulnerabilities, patches that fix CVEs must
+contain a *"CVE:"* tag. This tag list all CVEs fixed by the patch. If more than
+one CVE is fixed, separate them using spaces.
+
+Examples
+--------
+
+Here's an example of a patch that has been submitted upstream::
+
+   rpm: Adjusted the foo setting in bar
+
+   [RPM Ticket #65] -- http://rpm5.org/cvs/tktview?tn=65,5
+
+   The foo setting in bar was decreased from X to X-50% in order to
+   ensure we don't exhaust all system memory with foobar threads.
+
+   Upstream-Status: Submitted [rpm5-devel@rpm5.org]
+   Signed-off-by: Joe Developer <joe.developer@example.com>
+
+A future commit can change the value to *"Accepted"* or *"Denied"* as
+appropriate.
+
+Another example of a patch that is specific to OpenEmbedded::
+
+   Do not treat warnings as errors
+
+   There are additional warnings found with musl which are
+   treated as errors and fails the build, we have more combinations
+   then upstream supports to handle
+
+   Upstream-Status: Inappropriate [OE specific]
+
+Here's a patch that has been backported from a pull request::
+
+   include missing sys/file.h for LOCK_EX
+
+   Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28651]
+
+This should be the header of patch that fixes CVE-2015-8370 in GRUB2::
+
+   grub2: Fix CVE-2015-8370
+
+   [No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=1286966
+
+   Back to 28; Grub2 Authentication
+
+   Two functions suffer from integer underflow fault; the grub_username_get() and grub_password_get()located in
+   grub-core/normal/auth.c and lib/crypto.c respectively. This can be exploited to obtain a Grub rescue shell.
+
+   Upstream-Status: Accepted [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2]
+   CVE: CVE-2015-8370
+   Signed-off-by: Joe Developer <joe.developer@example.com>

