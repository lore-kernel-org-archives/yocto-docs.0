Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C88C46CD4
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.3226.1702935914109132936
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iVx5kV3M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D01620003;
	Mon, 18 Dec 2023 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ud0Cl7H+GPjowcTqXdunB7T4i+sL6rJUT+IoOT2xm9o=;
	b=iVx5kV3MCe2WHWZfk5kKVYok1Y+XV1JUNNlsmV3QsF4k3tdBXKtLMY117vhfF4CuhBNyYp
	wq28UYt1aSq3C/5soYpSLfHMOSsuRc/OUG1mK1Zt6AkLf06FBCVYt6PKTEM92v4bcdCywz
	nlo54E4P4WbLBUeSaQMXY6MU5jtBV4Mj3M57qDQe3o62m7AsKuK7XCAxkKQlSHOp6qc/ke
	g/p1JiynNcIIUe0rzSaUQZvrThu1/DkzFuFonHrEAvC6Z+3+mrDbYw/a4UB7a1+Ko7huZF
	etxmZHrW7nmWqbD4HDt8Frb7Mvn/dy4boQw8lBHYZdAfN/r/lR6CxWUvDXLA4g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 14/18] test-manual: add or improve hyperlinks
Date: Mon, 18 Dec 2023 22:44:38 +0100
Message-Id: <20231218214442.147385-15-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4722

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/test-process.rst    | 32 +++++++++----------
 .../test-manual/understand-autobuilder.rst    | 31 +++++++++---------
 2 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/documentation/test-manual/test-process.rst b/documentation/test-manual/test-process.rst
index 0c560efe39..7bec5ba828 100644
--- a/documentation/test-manual/test-process.rst
+++ b/documentation/test-manual/test-process.rst
@@ -20,8 +20,8 @@ helps review and test patches and this is his testing tree).
 We have two broad categories of test builds, including "full" and
 "quick". On the Autobuilder, these can be seen as "a-quick" and
 "a-full", simply for ease of sorting in the UI. Use our Autobuilder
-console view to see where me manage most test-related items, available
-at: :yocto_ab:`/typhoon/#/console`.
+:yocto_ab:`console view </typhoon/#/console>` to see where we manage most
+test-related items.
 
 Builds are triggered manually when the test branches are ready. The
 builds are monitored by the SWAT team. For additional information, see
@@ -34,18 +34,15 @@ which the result was required.
 
 The Autobuilder does build the ``master`` branch once daily for several
 reasons, in particular, to ensure the current ``master`` branch does
-build, but also to keep ``yocto-testresults``
-(:yocto_git:`/yocto-testresults/`),
-buildhistory
-(:yocto_git:`/poky-buildhistory/`), and
-our sstate up to date. On the weekend, there is a master-next build
+build, but also to keep (:yocto_git:`yocto-testresults </yocto-testresults/>`),
+(:yocto_git:`buildhistory </poky-buildhistory/>`), and
+our sstate up to date. On the weekend, there is a ``master-next`` build
 instead to ensure the test results are updated for the less frequently
 run targets.
 
 Performance builds (``buildperf-\*`` targets in the console) are triggered
 separately every six hours and automatically push their results to the
-buildstats repository at:
-:yocto_git:`/yocto-buildstats/`.
+:yocto_git:`buildstats </yocto-buildstats/>` repository.
 
 The "quick" targets have been selected to be the ones which catch the
 most failures or give the most valuable data. We run "fast" ptests in
@@ -69,10 +66,10 @@ configured to generate and publish artifacts and the milestone number,
 version, release candidate number and other information is entered. The
 box to "generate an email to QA" is also checked.
 
-When the build completes, an email is sent out using the send-qa-email
-script in the ``yocto-autobuilder-helper`` repository to the list of
-people configured for that release. Release builds are placed into a
-directory in https://autobuilder.yocto.io/pub/releases on the
+When the build completes, an email is sent out using the ``send-qa-email``
+script in the :yocto_git:`yocto-autobuilder-helper </yocto-autobuilder-helper>`
+repository to the list of people configured for that release. Release builds
+are placed into a directory in https://autobuilder.yocto.io/pub/releases on the
 Autobuilder which is included in the email. The process from here is
 more manual and control is effectively passed to release engineering.
 The next steps include:
@@ -80,14 +77,15 @@ The next steps include:
 -  QA teams respond to the email saying which tests they plan to run and
    when the results will be available.
 
--  QA teams run their tests and share their results in the yocto-
-   testresults-contrib repository, along with a summary of their
-   findings.
+-  QA teams run their tests and share their results in the
+   :yocto_git:`yocto-testresults-contrib </yocto-testresults-contrib>`
+   repository, along with a summary of their findings.
 
 -  Release engineering prepare the release as per their process.
 
 -  Test results from the QA teams are included into the release in
-   separate directories and also uploaded to the yocto-testresults
+   separate directories and also uploaded to the
+   :yocto_git:`yocto-testresults </yocto-testresults>`
    repository alongside the other test results for the given revision.
 
 -  The QA report in the final release is regenerated using resulttool to
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index ef03955954..11e2ceb12f 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -9,8 +9,8 @@ Execution Flow within the Autobuilder
 
 The "a-full" and "a-quick" targets are the usual entry points into the
 Autobuilder and it makes sense to follow the process through the system
-starting there. This is best visualized from the Autobuilder Console
-view (:yocto_ab:`/typhoon/#/console`).
+starting there. This is best visualized from the :yocto_ab:`Autobuilder
+Console view </typhoon/#/console>`.
 
 Each item along the top of that view represents some "target build" and
 these targets are all run in parallel. The 'full' build will trigger the
@@ -18,9 +18,9 @@ majority of them, the "quick" build will trigger some subset of them.
 The Autobuilder effectively runs whichever configuration is defined for
 each of those targets on a separate buildbot worker. To understand the
 configuration, you need to look at the entry on ``config.json`` file
-within the ``yocto-autobuilder-helper`` repository. The targets are
-defined in the ‘overrides' section, a quick example could be qemux86-64
-which looks like::
+within the :yocto_git:`yocto-autobuilder-helper </yocto-autobuilder-helper>`
+repository. The targets are defined in the ``overrides`` section, a quick
+example could be ``qemux86-64`` which looks like::
 
    "qemux86-64" : {
          "MACHINE" : "qemux86-64",
@@ -88,9 +88,9 @@ roughly consist of:
 
 #. *Obtain yocto-autobuilder-helper*
 
-   This step clones the ``yocto-autobuilder-helper`` git repository.
-   This is necessary to prevent the requirement to maintain all the
-   release or project-specific code within Buildbot. The branch chosen
+   This step clones the :yocto_git:`yocto-autobuilder-helper </yocto-autobuilder-helper>`
+   git repository. This is necessary to avoid the requirement to maintain all
+   the release or project-specific code within Buildbot. The branch chosen
    matches the release being built so we can support older releases and
    still make changes in newer ones.
 
@@ -255,13 +255,14 @@ Deploying Yocto Autobuilder
 ===========================
 
 The most up to date information about how to setup and deploy your own
-Autobuilder can be found in README.md in the ``yocto-autobuilder2``
-repository.
-
-We hope that people can use the ``yocto-autobuilder2`` code directly but
-it is inevitable that users will end up needing to heavily customise the
-``yocto-autobuilder-helper`` repository, particularly the
-``config.json`` file as they will want to define their own test matrix.
+Autobuilder can be found in :yocto_git:`README.md </yocto-autobuilder2/tree/README.md>`
+in the :yocto_git:`yocto-autobuilder2 </yocto-autobuilder2>` repository.
+
+We hope that people can use the :yocto_git:`yocto-autobuilder2 </yocto-autobuilder2>`
+code directly but it is inevitable that users will end up needing to heavily
+customize the :yocto_git:`yocto-autobuilder-helper </yocto-autobuilder-helper>`
+repository, particularly the ``config.json`` file as they will want to define
+their own test matrix.
 
 The Autobuilder supports two customization options:
 
-- 
2.34.1


