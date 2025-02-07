Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080FEC0219D
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:29:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.73798.1738945739342152870
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 08:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WKY4mvAh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC77A4434B;
	Fri,  7 Feb 2025 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738945737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xGjhKRWBMqwPdIL1fI155CgQujsUg9DxORbbrjh3Cg=;
	b=WKY4mvAhaVMijpSxMTAAAgRFb15V/e7UdoumMJa7fM58OfoM9f9FAv1A8hH/5seZf11FFb
	DYJGRSiYV5Nw6dBRBAVZgrLdDxe02ROn6uaAa6lMjumb2txEATbUWKKhj+VkHulE6iW/M+
	g0LBsc3ZmAfFcsSpHJDZw80NrjK1SQ+vUyIHZzJp20FKGFX9vEPwyxekzgFlI0KBri0/gY
	+Tn7GchsQUGLxquUC4biZnjdJZVGJCf4BJwOsP8zhPOpGWw4iVQGf4csYq/MR9wYMATJyt
	vlISpNvld9PaXZfYbiF2lKcogEkyiA6GmmSosZ3A0exR1J0V1d/bLKaHBkfXIA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 07 Feb 2025 17:28:56 +0100
Subject: [PATCH 6/6] dev-manual/multiconfig: add suggested best practices
 and baremetal sections
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-multiconfig-doc-v1-6-f63cdab1fad9@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
In-Reply-To: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6198;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6mIbH06lIXl9v+v10wLhyCLDIGxjYNC/BCeCJu4BQcY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpjTH55saNhMheeEIneNweSRdU81smH+TnKYwj
 +B8L6sce5WJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6Y0xwAKCRDRgEFAKaOo
 NvmmEACaQfXXY/UiGV3wrO2vgGbkogwcEWZGsd/f1og1LZe3VSe13UrAhKGxK8GOJlW0oNzk5BA
 40L28kLsiAFbXgL/pWWUez7o+o6LTRKJm8EpmU5Tz2Bq3CCpbVMLk4bMo6EmIDqKi/gTIujdjFW
 xViddzH5lhY4S6+Bm/r9hMN0qZ5dhlgH4hk1ww5VZXzhvMIcrWCOlDx/lnKP8bVV4C67HbAsw8w
 YyP7M8MGXS1dUUPK2kU0aeAtwqPmlcxoL/L4iPM+sR3FAJ98QBakc1YjCW0f1Ghd6hZ6FPN1qkk
 6jta6xI89YOy+LIrdXhiAnGbtJ7ngujDKdusCAoJswPi4SfCnCUCcGIy9/DeJaZkTnySI7TXnQ3
 f/LznzTTJYzp4m8ANRkyoqw99L37MZz5HP/Np/rpzUM9c90w3/JmiQQ88u5a9y95dQPGr8OusuK
 CWQH8GXFoFg+93jAjiszohjvfCZEDbpqEK/7+npPqyrjTC4fICX2BeavJKYjc5znHy52Gwm7ebg
 GJ+qpZVu2kFB5UjLtUm3TK+v273ykOhzeUpDQwQD0mJOr+IulFQuNl3I20RPl6L4rb1i0N//6Mp
 n4ZojgLwTcs95xzWRDbetJDDVAZBQ1SwgWsuyp6uh2n45D6479v2RxYjoMwbsoy03peV/ALkx5r
 TEAdWs/AENS/fGQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhleelueehveefjeehgeeviedtieeljeeiudffhfeuveejtedvteeigfejteevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpshhouhhrtggvfigrrhgvrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtt
 hhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghrkhdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6307

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
 documentation/dev-manual/multiconfig.rst | 106 +++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index 27442a042..9560ce5a0 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -171,3 +171,109 @@ and have separate configuration files, BitBake places the artifacts for
 each build in the respective temporary build directories (i.e.
 :term:`TMPDIR`).
 
+Suggested best practices
+========================
+
+-  :term:`TMPDIR` (other then the default set in bitbake.conf) is only set in
+   ``local.conf`` by the user. This means that we should **not** manipulate
+   :term:`TMPDIR` in any way within the Machine or Distro :term:`configuration
+   file`.
+
+-  A multiconfig should specify a :term:`TMPDIR`, and should specify it by
+   appending the multiconfig name via :term:`BB_CURRENT_MC`.
+
+-  Recipes that are used to transfer the output from a multiconfig build should
+   use ``task[mcdepends]`` to trigger the build of the component, and then
+   transfer the item to the current configuration in :ref:`ref-tasks-install`
+   :ref:`ref-tasks-deploy`, assuming the value of the deployed item based on
+   :term:`TMPDIR`.
+
+-  Firmware recipes can set the :term:`INHIBIT_DEFAULT_DEPS` variable to ``1``
+   if they don't rely on default dependencies such as the standard C library.
+
+Common use case: building baremetal firmware alongside a Linux build
+====================================================================
+
+A common use for multiconfig is to use the default configuration as the regular
+Linux build, while one or more multiconfigs can be used to build special
+components, such as baremetal firmware. This section details how one can achieve
+this scenario.
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
+Additionally, ``<machine>`` should be replaced by the machine for which we are
+building in the Linux context.
+
+We can add an :ref:`ref-tasks-install` task to the ``my-parent-firmware``::
+
+   do_install() {
+       install -Dm 0644 ${FIRMWARE_FILE} ${D}/lib/firmware/my-firmware.elf
+   }
+
+Doing the above will allow the firmware binary to be transferred and packaged
+into the Linux context and rootfs.

-- 
2.47.0


