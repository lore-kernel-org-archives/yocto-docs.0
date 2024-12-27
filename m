Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAE2E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 09:11:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10302.1735290714288058038
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Dec 2024 01:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VMglOI6h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AE74240006;
	Fri, 27 Dec 2024 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735290712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7K5O7TDuyMhAbUsgMDvKfp3DGhPSJdtdLWx/t/PyKHQ=;
	b=VMglOI6h3qmgGIeL5/KdxomRWBtIkIbl134Jj4E+UpX4lGsvdl9pcewYPOj96UuJLYxsVy
	PZik5/9WbIgwFSiUnR1FQo1dNH4SIzs3Ueo9ta/9GTuNAkMEHyrkI8rQqDZDXcqGM2QBTF
	9phpnwy9wBX3yOg+4ZgxspgGqCSQnGi4ZsEjKrPDucvsLucpyvPAou/m2czuclbpqt04VH
	SMalYfaX+oYX1E+SRFAN84jaGtweXXSK3cLtmakOn4XjaPFBUnbQhakRc0eC4b7J1sXUwN
	PT+nnYbDQp/GZo1Gj+hA0TWmYFb17jKiKEz9Dv9J//AqqIGdFYSor3+xvrTFRg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 27 Dec 2024 10:11:49 +0100
Subject: [PATCH] Update autobuilder URLs to valkyrie
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFRvbmcC/x3MTQ5AMBBA4avIrE2ijVCuIhbVDiakpD8iEXfXW
 H6L9x4I5JkC9MUDni4OfLgMURZgVu0WQrbZICtZCykbTKfVkVCneEyJd0sed3Ybdu0kOqNMa5S
 CXJ+eZr7/8zC+7weCmXayaQAAAA==
X-Change-ID: 20241226-update-autobuilder-link-97b19c8c7c88
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6733;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WWmTSknDRxB7iMyWs3Ib5flIt/pbt02jZXKh6BD6zUU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnbm9YaasDd9jQXugztkoWYGG7d54wxJ7n9oEoZ
 9uUUQn2a9OJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ25vWAAKCRDRgEFAKaOo
 NvOBD/wKcbTcWkdCREtDk0mOiNWYadpqcWy0gKswFFIF48leSFLf/dYJkOw7eRpfAMmxKEAx/xI
 6mainEsshPWiDBnqf4LuqmznJUDkO1eqrCbdT8gy3KlXd8b55G9IBJ4itwLO86GqaN84hTNB02V
 GXRqTYyp9nKNvTiMUpu86z/P2/usVkmnmhU1Ff1CvUogEePgKdj6PGBj9os4D+n+b7glizp4jZN
 9OfftUy+VZkFQqY1wnllUa1lzYoCGR1MenzUEOuXYGeCNgSUexofcmB0y6ycNB37vqq9rwgJqtS
 MzW50cg7xNJO1FQdgBEQ5H1NW5ClNUSJmAHsAUFV94nISz/mIV359IuBVCXNZ2giWTf1vthhgvB
 01+1tI1i6Hpirxwh9O+9KPvg/7739gNd7BJAhYmPXO1ADpVo8IqyHXzedvN8kDza/+/51r9NaP5
 zBAczrY4zMXBEsJlc1wBwH0lgf6X2LA26SdyKggcnPk/6jSxxTnL9yeQnVVRjQVeTWZtOnNzZ7O
 17lxdPr6HnjLFJjaBooSLDP5p+c0sG3LS7CeR52KL+jAxQF2nDpsvSxTdDYKGOtBxtasczcnqAd
 13vQbcZOrR8q62dSAvI6PDXoUocjN+NA1IZPI04MW8VwhZxs8LD2GP5oqE2ZbfifEPfzZYB4fjT
 MPrNP4EQGWquBnA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Dec 2024 09:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6045

We have moved to Valkyrie which is hosted on
https://valkyrie.yoctoproject.org. Update the URL in the documentation.

Also, the YOCTO_AB_URL macro was used in a single location in the
documentation so replace it by the :yocto_ab: custom extlink and remove
the macro.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/README                                 | 2 +-
 documentation/conf.py                                | 2 +-
 documentation/poky.yaml.in                           | 1 -
 documentation/ref-manual/release-process.rst         | 2 +-
 documentation/test-manual/reproducible-builds.rst    | 8 ++++----
 documentation/test-manual/test-process.rst           | 2 +-
 documentation/test-manual/understand-autobuilder.rst | 2 +-
 7 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/documentation/README b/documentation/README
index 8a47fd4a3fd07d41d61a7d681d82bd13ac74527d..043c703f38a0fe96682a3e426431facb64e8afd2 100644
--- a/documentation/README
+++ b/documentation/README
@@ -357,7 +357,7 @@ the 'documentation/conf.py' file:
   'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
   'yocto_lists': ('https://lists.yoctoproject.org%s', None),
   'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
-  'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
+  'yocto_ab': ('https://valkyrie.yoctoproject.org%s', None),
   'yocto_docs': ('https://docs.yoctoproject.org%s', None),
   'yocto_git': ('https://git.yoctoproject.org%s', None),
   'oe_home': ('https://www.openembedded.org%s', None),
diff --git a/documentation/conf.py b/documentation/conf.py
index b0e7c91eb5d8e4e855c0ca46351586cdf237fcb3..59d7fb4fa19075292955e4618193670491fc2bff 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -98,7 +98,7 @@ extlinks = {
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
     'yocto_lists': ('https://lists.yoctoproject.org%s', None),
     'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
-    'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
+    'yocto_ab': ('https://valkyrie.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
     'yocto_git': ('https://git.yoctoproject.org%s', None),
     'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 0933cbbd351985899ecaea94ae42748bd7ba1753..d045ff596e6d7d7d46be373078e8bb8b38483267 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -12,7 +12,6 @@ DISTRO_REL_TAG : "yocto-5.1"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
-YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 691e7d3ed90c98e43e558809828b5094670ccca3..4b54909c54cbcbabcf4818602d243c7882e5e5d7 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -190,7 +190,7 @@ effort has been made to automate the tests so that more people can use
 them and the Yocto Project development team can run them faster and more
 efficiently.
 
-The Yocto Project's main Autobuilder (&YOCTO_AB_URL;) publicly tests each Yocto
+The Yocto Project's main :yocto_ab:`Autobuilder <>` publicly tests each Yocto
 Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
 :yocto_git:`poky </poky>` and :oe_git:`bitbake </bitbake>` repositories. The
 testing occurs for both the current state of the "master" branch and also for
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 91f94a5c74e8e0387f1857cbbdf38e7170bb5248..c90be49223deb52ef5632b984417331cfcef3a1c 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -113,10 +113,10 @@ The project's current reproducibility status can be seen at
 
 You can also check the reproducibility status on supported host distributions:
 
--  CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`
--  Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`
--  Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`
--  Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`
+-  CentOS: :yocto_ab:`/#/builders/reproducible-centos`
+-  Debian: :yocto_ab:`/#/builders/reproducible-debian`
+-  Fedora: :yocto_ab:`/#/builders/reproducible-fedora`
+-  Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`
 
 ===============================
 Can I test my layer or recipes?
diff --git a/documentation/test-manual/test-process.rst b/documentation/test-manual/test-process.rst
index 7bec5ba8285cda1d6b0157c38eb693fde7d0e557..60e71f02691ef5be7cbd8a0f7a5454bc3bfff5ea 100644
--- a/documentation/test-manual/test-process.rst
+++ b/documentation/test-manual/test-process.rst
@@ -20,7 +20,7 @@ helps review and test patches and this is his testing tree).
 We have two broad categories of test builds, including "full" and
 "quick". On the Autobuilder, these can be seen as "a-quick" and
 "a-full", simply for ease of sorting in the UI. Use our Autobuilder
-:yocto_ab:`console view </typhoon/#/console>` to see where we manage most
+:yocto_ab:`console view </#/console>` to see where we manage most
 test-related items.
 
 Builds are triggered manually when the test branches are ready. The
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 6b4fab4f0b2be5a6806db0982e257b9059d15fa7..b30afaa36a5a9c3eae9396d459d56ce54c2d2cf2 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -10,7 +10,7 @@ Execution Flow within the Autobuilder
 The "a-full" and "a-quick" targets are the usual entry points into the
 Autobuilder and it makes sense to follow the process through the system
 starting there. This is best visualized from the :yocto_ab:`Autobuilder
-Console view </typhoon/#/console>`.
+Console view </#/console>`.
 
 Each item along the top of that view represents some "target build" and
 these targets are all run in parallel. The 'full' build will trigger the

---
base-commit: 28850c974a3896895bc921c094071523218d6d07
change-id: 20241226-update-autobuilder-link-97b19c8c7c88

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


