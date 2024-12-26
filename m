Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF54BE7718F
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 15:22:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.22781.1735226517029955022
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 07:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qr2N9RMz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78E70FF805;
	Thu, 26 Dec 2024 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735226515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hII0R+YSHxLPsxqO3anXnwPYejNbUuUJdr1Xt20Dmd0=;
	b=Qr2N9RMz54yHeg142fywthEd+rwfOHQe5V5vguh5TjGV2jeEbHLcXwAs6hCBDYcp1UtUQ8
	XpkQAo0u4EeCtF+IKa71NU+dnV/OLwvwg+JogsMQri9pBgvJMnL6Kph1pS1E35tez2DqQ0
	DxFNfeFQk93qahywIQWS7v8z0WgmYnA4QdppF2KHUUHxGFeoMhWZigKAx2h+4vnw7YKWM+
	feqRfLmC15rIwsuNANI9vzCrNgLqD2VXvEWnwVlBXl/QeT7tFZPnErpX3QQN68f8lz3zZp
	r/D4Pbw1zSCsK4gtDjGh9DBlK2zacyhca7OvT7o1UJBgocj3y7qv8rdmouIpeg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Dec 2024 16:20:17 +0100
Subject: [PATCH v2 2/2] ref-manual: move runtime-testing section to the
 test-manual
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-move-ptest-to-test-manual-v2-2-227db1b045a2@bootlin.com>
References: <20241226-move-ptest-to-test-manual-v2-0-227db1b045a2@bootlin.com>
In-Reply-To: <20241226-move-ptest-to-test-manual-v2-0-227db1b045a2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12417;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=irj39Ts3A2TL/LZ/TyIMbNmng2jSY11Z+CZxEIsV6sw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnbXSSaxVJ6KR0tKEt3AKA16gsYNowl2XR1+mqp
 6Ch7Q9LCdmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ210kgAKCRDRgEFAKaOo
 Nt+XEACKSY4hjJamf6KdaTawB56Koboe4o7VtesseBIvGTTh7j2X4/oLQ9CTDJBaxGae/xo7T5Y
 ajjiyKJrsK3ue0AKNxqFEVokguW+rR4ajURq2l0YDyn1MTdy/gAGpwnudx50ehM2vSZ9ynChBbr
 GtZKHU39Z14duJh+5TFN28LkjXMQcs8Pib5BABLAFgdNkspb16gJ0Pv7leYs2+YqadUJaDgyTIf
 rK0D2KiPgd/cirdjwauZFcKZ8y+CQOWQEwqYjLp710NT11RCLg+bYXLlIMt4hjKzgsD2iyXKoB1
 X+AdeX/9VRA1r/fuOLA+wHCBuOa7yKw/YT+EPT7EajcLHvppqfBChfZgnmRHtnrZ9WVP6vXK7gU
 VTkvWdx/YrRf6+OC14Kh9WvUoTqvhACNWApBU68uW8V+Am8n3CHV54AOGfVhiDN5QmSETFSPWTb
 GLXu4q9oqXW2M2Ykk9/cmgj9xaScQp7yyt0zdR5L9sP+N1ch7KtFuXt1dgZa17FQuGNgVP/ESG+
 tWuzyNoLA9ZmLVQNkAvfp3o72B1nMkEAk5vIjDinVbu/zYDA++gGf1VL7FDw4m1r1nTqlTCZxXH
 uKhUcCcJFLn91AK21TS1VtR+rdK8q31JAdI/ucKVouHol5Ctvrh/bA14Pu3eiaUT9ECkQ9oOu1Y
 lqTt/8qauZg6bNA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 15:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6044

In the same fashion as 32bcaa6b5765fff561afd531b03b9735da6eb6e1
("ref-manual/packages: move ptest section to the test-manual"), move the
runtime testing section of the development tasks manual to the test
environment manual.

Add a link to it from the test-manual/intro document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/index.rst                   |  1 -
 documentation/migration-guides/migration-1.5.rst     |  4 ++--
 documentation/ref-manual/classes.rst                 |  4 ++--
 documentation/ref-manual/images.rst                  |  4 ++--
 documentation/ref-manual/release-process.rst         |  4 ++--
 documentation/ref-manual/tasks.rst                   |  8 ++++----
 documentation/ref-manual/variables.rst               | 20 ++++++++++----------
 documentation/test-manual/index.rst                  |  1 +
 documentation/test-manual/intro.rst                  |  4 +++-
 .../{dev-manual => test-manual}/runtime-testing.rst  |  5 +++--
 10 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 7afd0d820e94d56cb2145962b9b1a976c7951936..8243c0f4cb2598fedee27d3d29e5d0d5b3d1e107 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -39,7 +39,6 @@ Yocto Project Development Tasks Manual
    external-scm
    read-only-rootfs
    build-quality
-   runtime-testing
    debugging
    licenses
    security-subjects
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index c8f3cbc1655421e43968af23faad08d4ce1bd525..da26cca63d2336ada8acda3ea22dc8d45a47bbc2 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -248,8 +248,8 @@ A new automated image testing framework has been added through the
 framework replaces the older ``imagetest-qemu`` framework.
 
 You can learn more about performing automated image tests in the
-":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-section in the Yocto Project Development Tasks Manual.
+":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+section in the Yocto Project Test Environment Manual.
 
 .. _migration-1.5-build-history:
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 7da2a6d70955976c3c10e2971a4b6c5324c570b9..a4168624e4a4bf117e00ed20bd338729d032eadc 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3231,8 +3231,8 @@ after it is built, you can set :term:`TESTIMAGE_AUTO`::
    TESTIMAGE_AUTO = "1"
 
 For information on how to enable, run, and create new tests, see the
-":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-section in the Yocto Project Development Tasks Manual.
+":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+section in the Yocto Project Test Environment Manual.
 
 .. _ref-classes-testsdk:
 
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index c45f9104a949f7470fe11e8e70533c7a2ee8b16e..d6bdc92f0744eae5761bf499b8a0e2bd094f1822 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -119,8 +119,8 @@ Here is a list of supported recipes:
    deployed to a separate partition so that you can boot into it and use
    it to deploy a second image to be tested. You can find more
    information about runtime testing in the
-   ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-   section in the Yocto Project Development Tasks Manual.
+   ":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+   section in the Yocto Project Test Environment Manual.
 
 -  ``core-image-testmaster-initramfs``: A RAM-based Initial Root
    Filesystem (:term:`Initramfs`) image tailored for use with the
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 3383a4e1b099f92e3d2b6f412698c3fe12cfe7fc..c4452228a70268649f56ed3ecfde1f7418926fc6 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -148,8 +148,8 @@ Additionally, because the test strategies are visible to you as a
 developer, you can validate your projects. This section overviews the
 available test infrastructure used in the Yocto Project. For information
 on how to run available tests on your projects, see the
-":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-section in the Yocto Project Development Tasks Manual.
+":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+section in the Yocto Project Test Environment Manual.
 
 The QA/testing infrastructure is woven into the project to the point
 where core developers take some of it for granted. The infrastructure
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index df751d75a34bcdba51d9838a819dc9c1d99f19e6..d2e1f4ce143c6dce2c9110a8c98d1945faf71fea 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -615,8 +615,8 @@ information on how the root filesystem is created.
 
 Boots an image and performs runtime tests within the image. For
 information on automatically testing images, see the
-":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-section in the Yocto Project Development Tasks Manual.
+":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+section in the Yocto Project Test Environment Manual.
 
 .. _ref-tasks-testimage_auto:
 
@@ -628,8 +628,8 @@ after it has been built. This task is enabled when you set
 :term:`TESTIMAGE_AUTO` equal to "1".
 
 For information on automatically testing images, see the
-":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-section in the Yocto Project Development Tasks Manual.
+":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+section in the Yocto Project Test Environment Manual.
 
 Kernel-Related Tasks
 ====================
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f78403fad0f844e54267c7f547b1abd98e1816af..a84acfd77effab04ad7834da9330586c6ee35ba7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9204,8 +9204,8 @@ system and gives an overview of their function and contents.
       file.
 
       For more information on testing images, see the
-      ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-      section in the Yocto Project Development Tasks Manual.
+      ":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+      section in the Yocto Project Test Environment Manual.
 
    :term:`TEST_SERIALCONTROL_CMD`
       For automated hardware testing, specifies the command to use to
@@ -9276,8 +9276,8 @@ system and gives an overview of their function and contents.
          TEST_SUITES = "test_A test_B"
 
       For more information on testing images, see the
-      ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-      section in the Yocto Project Development Tasks Manual.
+      ":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+      section in the Yocto Project Test Environment Manual.
 
    :term:`TEST_TARGET`
       Specifies the target controller to use when running tests against a
@@ -9295,8 +9295,8 @@ system and gives an overview of their function and contents.
       You can provide the following arguments with :term:`TEST_TARGET`:
 
       -  *"qemu":* Boots a QEMU image and runs the tests. See the
-         ":ref:`dev-manual/runtime-testing:enabling runtime tests on qemu`" section
-         in the Yocto Project Development Tasks Manual for more
+         ":ref:`test-manual/runtime-testing:enabling runtime tests on qemu`" section
+         in the Yocto Project Test Environment Manual for more
          information.
 
       -  *"simpleremote":* Runs the tests on target hardware that is
@@ -9311,8 +9311,8 @@ system and gives an overview of their function and contents.
             ``meta/lib/oeqa/controllers/simpleremote.py``.
 
       For information on running tests on hardware, see the
-      ":ref:`dev-manual/runtime-testing:enabling runtime tests on hardware`"
-      section in the Yocto Project Development Tasks Manual.
+      ":ref:`test-manual/runtime-testing:enabling runtime tests on hardware`"
+      section in the Yocto Project Test Environment Manual.
 
    :term:`TEST_TARGET_IP`
       The IP address of your hardware under test. The :term:`TEST_TARGET_IP`
@@ -9348,8 +9348,8 @@ system and gives an overview of their function and contents.
 
       For more information
       on enabling, running, and writing these tests, see the
-      ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
-      section in the Yocto Project Development Tasks Manual and the
+      ":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+      section in the Yocto Project Test Environment Manual and the
       ":ref:`ref-classes-testimage`" section.
 
    :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`
diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
index ad71f379106261af32dc925d700ed36da43d234b..d365d337ea5ba71a71707aee996444cb7d155ddc 100644
--- a/documentation/test-manual/index.rst
+++ b/documentation/test-manual/index.rst
@@ -13,6 +13,7 @@ Yocto Project Test Environment Manual
    intro
    test-process
    ptest
+   runtime-testing
    understand-autobuilder
    reproducible-builds
    yocto-project-compatible
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 252d3ea731c39709b8fbe64d281722c172a282a9..1a8e938a2ea23e1b441e0b30ac4fa69229dafac6 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -130,7 +130,9 @@ the following types of tests:
       $ bitbake image -c testimage
 
    The tests use the :ref:`ref-classes-testimage`
-   class and the :ref:`ref-tasks-testimage` task.
+   class and the :ref:`ref-tasks-testimage` task. See the
+   :ref:`test-manual/runtime-testing:Performing Automated Runtime Testing`
+   section of the Yocto Project Test Environment Manual for more information.
 
 -  *Layer Testing:* The Autobuilder has the possibility to test whether
    specific layers work with the test of the system. The layers tested
diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
similarity index 99%
rename from documentation/dev-manual/runtime-testing.rst
rename to documentation/test-manual/runtime-testing.rst
index 7a2b42f25af2cd6e3488d706276d52f0cc6ebae9..557e0530b05513cc6dfab2f75cbfa54c86e685d3 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
+************************************
 Performing Automated Runtime Testing
 ************************************
 
@@ -153,7 +154,7 @@ options are available:
 
    If you choose "SystemdbootTarget", there are additional requirements
    and considerations. See the
-   ":ref:`dev-manual/runtime-testing:selecting systemdboottarget`" section, which
+   ":ref:`test-manual/runtime-testing:selecting systemdboottarget`" section, which
    follows, for more information.
 
 -  *"BeagleBoneTarget":* Choose "BeagleBoneTarget" if you are deploying
@@ -179,7 +180,7 @@ Selecting SystemdbootTarget
 
 If you did not set :term:`TEST_TARGET` to "SystemdbootTarget", then you do
 not need any information in this section. You can skip down to the
-":ref:`dev-manual/runtime-testing:running tests`" section.
+":ref:`test-manual/runtime-testing:running tests`" section.
 
 If you did set :term:`TEST_TARGET` to "SystemdbootTarget", you also need to
 perform a one-time setup of your controller image by doing the following:

-- 
2.47.1


