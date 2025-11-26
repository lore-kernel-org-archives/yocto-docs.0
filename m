Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55534D11183
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 16:16:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16781.1764173797029553170
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 08:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l7Goo8mH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0F18C4E418DE
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 16:16:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA69C60721
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 16:16:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B86CF102F1B84;
	Wed, 26 Nov 2025 17:16:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764173794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=E5TCjVIk2iELzRSmgXrTgBSpRtknID2ggOYxaaVrq7w=;
	b=l7Goo8mHgwew9J1s3N2Sfgcjh3Ue/ecTe5NG8YuGpEkdR7cATXB4bQi3m4unz4VJVaoQn4
	mYsl9M2zk3hFv58weAyY4Mg4hlaWcEI/eYhbu39L7H5BRPxsJIcvn3b7CitVvbxzq/oDMk
	p33IsDD5UfgQPAMU16PFJc71B/g7qPwXqaHvSKmqxb3AZ8Ui+Gw4ve18IW7/hRQa8W0Kd1
	a/7r2v2we+Pv+X6q2J0nzWyyG/lrK9cLHYHPcYA8CWLYTdWZIlhysAp1EdcL0XOC98iEPy
	ffAIA7umbu5rbaGyP+B79hkqu+/YFoOzsqOwuxGsZ7UkfBX+tShBVxZor5MWxw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 26 Nov 2025 17:16:30 +0100
Subject: [PATCH] migration-guides/migration,release-notes-5.3.rst: add poky
 master branch/bitbake-setup changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-update-release-notes-bitbake-setup-v1-1-8c040f91c438@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAN0nJ2kC/yXNywrCMBBG4Vcps3bAVKzoq4iLXP7oqKQhk4hQ+
 u5GXX6bcxZSFIHSaVio4CUqc+owm4H8zaYrWEI3jdtxb8w4ccvBVnDBE1bBaa5QdlKdfYAVtWU
 GDtMxwCPGHfVQLojy/k3Ol7+1uTt8/ZZpXT+yUfZLhgAAAA==
X-Change-ID: 20251126-update-release-notes-bitbake-setup-ee769deceff3
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4054;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4gCKkP57ui2dKPtFUJZKZJ0cxxKmEvHrix3KL2py8qk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpJyfh2M02yApiZl8UsEUUnb4fniLbLPOKGGdcp
 eOT996NVnGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaScn4QAKCRDRgEFAKaOo
 Nl/aD/9iV/XickRtxhrRMm/9UCkLSYJgUw5xzN9fQY4ktzE1bp/bB546hyaT4SseuaOR0XqtHCE
 gguR3plvDvt+p+fI9g+rPO0sWmd7x2I95lASdDRAru1THYZtRBibr+oDhYGDiD5jXBXRReiDibp
 3F4Gzu0ZFzM64dYufL045HUNl6Ag/oWzee6rXNEDlosp1nYtyfAkRdI+rkIlBz+cHOEQalc7EpE
 U+kC678onCmcZ2Pg5pubgxHpkl6ZQzs1fwh2023BpLT0fCsfm8cG7lwmWbLDpqpfIYmLSfopEgV
 XHr9j/dex4o6a4XSbM+QL4v11JMcg00uYFGdiTZtvNLL659Sl2268q7AySN7ZqtBg366xIF4n5w
 ZHhSSE8k3pp/zBq7vimlnAup4FNiHtMnot4aYE/ETvd6eoNB2phjsGy2bZLnqTPewuq6Tb+iaYa
 SNSXCWieEdICpmGfSCh/8uw2e3DSBSuowtw36zyNvP1Vzvd0frAR1I6vCRU+GGUxCupxvfLivOq
 K6Sb/9IdWhAhXa9bplpsmAcYUNXysozPD8DSxq5MJ++GQkCe9BzVYul12/G8aYUdh7JEbSG4TjX
 LVkANZ9yP2WdHGbSsg/tJcIH0SaGIFqtTLTeHVItYpRjoupsKkLxb3sLSy5zGVYz+FA7a6ZCIla
 ybep9rHCVhWFnZw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 16:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8148

Add a note in the migration guide about the deprecation of the poky
repository master branch, give ways to update. Update the release notes
with bitbake-setup and the new poky-manual-setup document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.3.rst   | 28 ++++++++++++++++++++++
 .../migration-guides/release-notes-5.3.rst         | 14 +++++++++++
 2 files changed, 42 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index d3e583808..b17cffe5a 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -14,6 +14,34 @@ Migration notes for |yocto-ver| (|yocto-codename|)
 This section provides migration information for moving to the Yocto
 Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
 
+The Poky repository master branch is no longer updated
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The master branch of the :yocto_git:`Poky </poky>` repository is no longer being
+updated. This does *not* mean that the :term:`Poky` distribution is deprecated,
+but that the way to clone the base layers and setup the environment for building
+:term:`Poky` has changed.
+
+You can either:
+
+-  Switch to individual clones of :oe_git:`bitbake </bitbake>`,
+   :oe_git:`openembedded-core </openembedded-core>`, :yocto_git:`meta-yocto
+   </meta-yocto>` and :yocto_git:`yocto-docs </yocto-docs>` by following the
+   :doc:`/dev-manual/poky-manual-setup` section of the Yocto Project Development
+   Tasks Manual.
+
+-  Use the new ``bitbake-setup`` tool by following the
+   :doc:`/brief-yoctoprojectqs/index` document.
+
+   See the :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup`
+   of the BitBake User Manual for reference documentation on ``bitbake-setup``.
+
+Releases older than Whinlatter will still have their branch on the Poky
+repository updated until they reach end-of-life.
+
+Some further information on the background of this change can be found
+in: https://lists.openembedded.org/g/openembedded-architecture/message/2179
+
 :term:`WORKDIR` changes
 ~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 5cd875e9b..b3a96c2d9 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -29,6 +29,14 @@ New Features / Enhancements in |yocto-ver|
 
 -  BitBake changes:
 
+   -  A new ``bitbake-setup`` tool can be used to clone the initial layers and
+      setup the environment. See the :doc:`/brief-yoctoprojectqs/index` section
+      for instructions on how to build an image that uses the :term:`Poky`
+      distribution with this new tool.
+
+      See the reference documentation of ``bitbake-setup`` at
+      :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup`.
+
    -  ``codeparser``: Add function decorators for ``vardeps``
 
       Adds ``bb.parse.vardeps`` and ``bb.parse.excludevardeps`` function
@@ -473,6 +481,12 @@ New Features / Enhancements in |yocto-ver|
    -  The QA checks defined in the :term:`OpenEmbedded Build System` were
       gathered in :doc:`/ref-manual/qa-checks`.
 
+   -  A new :doc:`/dev-manual/poky-manual-setup` document was added to instruct
+      how to setup the :term:`Poky` reference distribution manually, after the
+      :ref:`master branch of the Poky repository has stopped being updated
+      <migration-guides/migration-5.3:The Poky repository master branch is no
+      longer updated>`.
+
 -  Core library changes:
 
    -  Add :oe_git:`license_finder.py </openembedded-core/tree/meta/lib/oe/license_finder.py>`,

---
base-commit: dba7940543d7d305eda71af18f6626011a3a8d9c
change-id: 20251126-update-release-notes-bitbake-setup-ee769deceff3


