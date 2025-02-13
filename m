Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11D1C021A5
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:23:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.6630.1739435004616616327
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 00:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TAZzolwa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B5A4204AE;
	Thu, 13 Feb 2025 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739435003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQwYFbA8DoCGnrMfPE9Wsx6jAg4X+nAFa9s2MsuvEAw=;
	b=TAZzolwajHHHTCA+sl3IehD4G1QaneJzJJQD/1TyDmDu6ZFzAscnbs6xUQPZN1CwadfxAR
	J1wid5fZle79MPkyO98xtZbAU6U68jj2nysN++hUYREmcwsd7+y95CsiQfaZt/8G745pvI
	5rUTFxioaYWuhYRC1kPDxz7/T1Dw2VIpyShflDQDoQvjiKIPsWW4rYoPrtt25zS8ll3Rcw
	bN09mIkqDsM+E9icbbEyIi7wRdsMrIg04fp64ghwrID6YYxGcGSOVz1UhbegfFhpnicJRl
	sReXFSO2tA8FpmQK5w2pDdMHX0Q/OtPOM8xOswzQuyZjNrWtE2ypEu2iP3Sl/w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Feb 2025 09:23:20 +0100
Subject: [PATCH v2 6/6] dev-manual/multiconfig: add suggested best
 practices and baremetal sections
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-multiconfig-doc-v2-6-f2bd35115cb7@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
In-Reply-To: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7622;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CqmhClU+/fhikUvQzwkPlsav8L8G4oY+QvwIZfR/iUA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnrav54fG5e5esNZEIHcapzHLNj5Rkzt6KLE5S4
 8ehad9JmVKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ62r+QAKCRDRgEFAKaOo
 NmDoD/sGRx6jtdvv2V46nBTFUmBbsdvgQBDSp9wYO20Nse9BdHyk3M0vIN9C5H6AvY7bEaaeQlY
 AJ1BJ+1G5am9MrLdkKJ3wq2ikySCx+G9mNWLiV2REO9WQd05GBwcWtnUnVOc0BIgKGDOgC0bOIo
 ejQlyrVhAQx9GHWJo86FjX+7w9qaSlHqU7eN3mM+X83OkSTyJ/GENNe1TH7yM6X6VEoy3JU77hG
 6SSWa+KPFTmHj3HWafd6OdCMSmd8HZfGt+tTgCaCdM+8mafbGCJ/kS6bHXLZccu9hnjEtaBakiD
 PynUn5kQCeNhdtXO74UUIR9HL89/yuilVOCaV2F96JVEQiqIOkLROimJ8/baAWC0A5tvPeBAuAJ
 ixookfFDFWfxNITS5+lzC+4S7a0ZP74E2qNEPUpgvaGVLg01jILiG7IwD+zZxTQJwKHC2cEUkxS
 NdVz+a/FGsL5HVEjSzIHWbUKPxWlep3S8jyT1s/DYFFAayOmlnGrK6L7pFSLZSkLli0vFrGYXVg
 877SeEKPUZVfbWXHwyfW5eK8kUP4frreKrWL3r12uymT4BI5lvs16zjRALk+7sT6EZxRFQcbXXD
 e/ZfVed6mcfVSkGSP6j6/60DCB9775GNMecVXsKDrymmYTFEqCz8GMWHtKMXBGpkd12n6DEVFpm
 WCPQe0piLdJ9PuQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhleelueehveefjeehgeeviedtieeljeeiudffhfeuveejtedvteeigfejteevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpshhouhhrtggvfigrrhgvrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiio
 hhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghrkhdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 08:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6363

After the suggestions from Mark Hatle on the list
(https://lists.yoctoproject.org/g/docs/topic/110487932), add two
sections to the multiconfig doc:

- Suggested best practices: suggestion for better design of multiconfig
  builds.

- Common use case: baremetal build.

  This section applies the guidelines from the first sections and apply
  it to a real-life example of how to use multiconfig. This one to build
  some baremetal firmware alongside a regular Linux build.

Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/multiconfig.rst | 136 +++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index 49e32b04a..cdf06d2ca 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -171,3 +171,139 @@ and have separate configuration files, BitBake places the artifacts for
 each build in the respective temporary build directories (i.e.
 :term:`TMPDIR`).
 
+Suggested best practices
+========================
+
+-  :term:`TMPDIR` (other than the default set in bitbake.conf) is only set in
+   ``local.conf`` by the user. This means that we should **not** manipulate
+   :term:`TMPDIR` in any way within the Machine or Distro :term:`configuration
+   file`.
+
+-  A multiconfig should specify a :term:`TMPDIR`, and should specify it by
+   appending the multiconfig name via :term:`BB_CURRENT_MC`.
+
+-  Recipes that are used to transfer the output from a multiconfig build to
+   another should use ``do_task[mcdepends]`` to trigger the build of the
+   component, and then transfer the item to the current configuration in
+   :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy`, assuming the value of
+   the deployed item based on :term:`TMPDIR`.
+
+   The :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy` tasks should look
+   like this::
+
+      do_install() {
+          install -m 0644 ${TMPDIR}-<multiconfig>/tmp/deploy/images/<machine>/somefile ${D}/some/path
+      }
+
+      do_deploy() {
+          install -m 0644 ${TMPDIR}-<multiconfig>/tmp/deploy/images/<machine>/somefile ${DEPLOYDIR}/somefile
+      }
+
+   In the examples above:
+
+   -  ``<multiconfig>`` is the multiconfig name as set by the multiconfig
+      :term:`configuration file` (see the :ref:`dev-manual/multiconfig:Setting
+      Up and Running a Multiple Configuration Build` section above).
+
+   -  ``<machine>`` must be the :term:`MACHINE` for which ``somefile`` was built
+      and deployed. This value depends on whether the multiconfig
+      :term:`configuration file` is overriding the :term:`MACHINE` value or not.
+
+-  Firmware recipes can set the :term:`INHIBIT_DEFAULT_DEPS` variable to ``1``
+   if they don't rely on default dependencies such as the standard C library.
+
+Common use case: building baremetal firmware alongside a Linux build
+====================================================================
+
+A common use for multiconfig is to use the default configuration as the regular
+Linux build, while one or more multiconfigs can be used to build special
+components, such as baremetal firmware. It would also apply to a scenario where
+a microcontroller, for example, is companion to a main processor where Linux is
+running. This section details how one can achieve these kinds of scenarios with
+a multiconfig build.
+
+Adding a multiconfig configuration file and recipe for a baremetal firmware
+---------------------------------------------------------------------------
+
+As described in :ref:`dev-manual/multiconfig:Setting Up and Running a Multiple
+Configuration Build`, each multiconfig will require a separate
+:term:`Configuration File`. In our case, we will make a separate temporary
+directory for our baremetal firmware build configuration.
+
+For example, we will define a new ``conf/multiconfig/baremetal-firmware.conf``
+as follows::
+
+   TMPDIR .= "-${BB_CURRENT_MC}"
+   TCLIBC = "newlib"
+
+The ``baremetal-firmware.conf`` configure a separate :term:`TMPDIR` for holding
+binaries compiled with the `newlib <https://sourceware.org/newlib/>`__ toolchain
+(see :term:`TCLIBC`).
+
+.. note::
+
+   Here, the default :term:`MACHINE` is not overriden by the multiconfig
+   configuration file. As a consequence, the architecture of the built baremetal
+   binaries will be the same. In other cases, where the firmware runs on a
+   completely different architecture, the :term:`MACHINE` may be overriden.
+
+We then create a recipe ``my-firmware.bb`` that defines how the baremetal
+firmware is built. The recipe should contain enough information for the
+:term:`OpenEmbedded build system` to properly compile the firmware with our
+toolchain. The building tasks may vary depending on the nature of the firmware.
+However, the recipe should define a :ref:`ref-classes-deploy` task that deploys
+the output into the :term:`DEPLOYDIR` directory. We will consider in the
+following that the file is named ``my-firmware.elf``.
+
+Building the firmware
+---------------------
+
+The firmware can be built with BitBake with the following command::
+
+   $ bitbake mc:baremetal-firmware:my-firmware
+
+However, we would prefer for ``my-firmware`` to be automatically built when
+triggering a normal Linux build.
+
+Using an ``mcdepend``, a recipe belonging to the Linux build can trigger the
+build of ``my-firmware``. For example, let's consider that our Linux build needs
+to assemble a "special" firmware that uses the output of our ``my-firmware``
+recipe - let's call it ``my-parent-firmware.bb``. Then, we should specify this
+dependency in ``my-parent-firmware.bb`` with::
+
+   do_compile[mcdepends] = "mc::baremetal-firmware:my-firmware:do_deploy"
+
+The above will ensure that when the :ref:`ref-tasks-compile` task of
+``my-parent-firmware`` is triggered, the :ref:`ref-tasks-deploy` task of
+``my-firmware`` will already have run successfully.
+
+Using the output of ``my-firmware``
+-----------------------------------
+
+After we have deployed ``my-firmware`` by using ``mcdepends``, we need to use
+the output in some way. We can make a series of assumptions, based on the
+default Yocto Project variables in order to get the binary for packaging.
+
+First, we can set the following in ``my-parent-firmware.bb``::
+
+   FIRMWARE_FILE ??= "${TMPDIR}-baremetal-firmware/deploy/images/<machine>/my-firmware.elf"
+   FIRMWARE_FILE[vardepsexclude] += "TMPDIR"
+
+The first assignment stores the value of the path to the firmware built and
+deployed by the ``my-firmware.bb`` recipe. The second assignment excludes the
+:term:`TMPDIR` variable from being part of ``FIRMWARE_FILE``'s dependencies -
+meaning that changing the value of :term:`TMPDIR` (for example, changing the
+host on which the firmware is built) will not invalidate the :ref:`shared state
+cache <overview-manual/concepts:shared state cache>`.
+
+Additionally, ``<machine>`` should be replaced by the :term:`MACHINE` for which
+we are building in the baremetal-firmware context.
+
+We can then add a :ref:`ref-tasks-install` task to ``my-parent-firmware``::
+
+   do_install() {
+       install -Dm 0644 ${FIRMWARE_FILE} ${D}/lib/firmware/my-firmware.elf
+   }
+
+Doing the above will allow the firmware binary to be transferred and packaged
+into the Linux context and rootfs.

-- 
2.47.0


