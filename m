Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B3BD32D9C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 11:33:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.85006.1731411181351990945
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 03:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VAl+JQ+e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4391C0006;
	Tue, 12 Nov 2024 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731411180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxeIxqwEhkN7cBYjLxo/Hxm4JZ3/7uTMyNxIgkuySVE=;
	b=VAl+JQ+eCEN/r0JWzkem7Eo+wCPPniE+mSRHJwFKrE3A/5aLi9zsvSokFFqQGcYtw+6PUt
	FxFHewXaE1LMYySV2DfUttrAvyuirJH6d1cQmZicBo86sMO3jHBiAtc6BG+9QFsR3O/Uo7
	kBpdbSBIRMtqpMd4OJ7nPh8DDuqNDYtj6v4GcUEm2/T0xX7vn3Xb59w7O5VYnfRKxeMvWD
	3eY3ealaYP59KG138sdt+pgTUmtcvZjwl1ZzVN01sJhQXYO7X3ikgarap146dMA9lmdXmr
	BlPrP9Q9NyrxgT4232AQShZsBm48yjzoSyQKY3ucx4vIq55aEBjEs+AoZBxZyQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 12 Nov 2024 12:32:54 +0100
Subject: [PATCH v2 2/2] dev-manual: document how to provide confs from
 layer.conf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-layer-confs-v2-2-22a09f1a0a8e@bootlin.com>
References: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
In-Reply-To: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5568;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FY0n7gVHoLWZ/sbdFwMPwmhjER/hW9SdF9RDhn6yLOo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnMzzqfnIBVzUNh8gCW7/lmU+bV9zXojTi93f5D
 dst142nr62JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzM86gAKCRDRgEFAKaOo
 Nh+BD/9hW8JozaX46E3nj5AvvTZgJ+Hle7ThZhcKnwJ2wK/U5/wmrx3FW2p/sJHz4Qjwz9d8D0k
 8dpWtTSnI4Sb4vzjPBF2HbhDYpVFe8E/qtDY5QlSAhUIMpyHsgLSXVWIS95ILH3pbNyHyzRqTkq
 UYiDnrmufx6RAqC/iYpXJ8daxMzQGS6djNxAodX+OYScNH6LovLxa5Wz2DlgtuOwPpqYaSLV7e9
 qvm+lN2cVEVbr3KJLiMWmz9A4fatIXFRF7j7+p6XETwEg3iqNCwOveNmwMBiD5VAnAz6eGzJ7f7
 eRC1Yhy9Q8RqMHSx/kQMmR3bVNi7Yb39Ghcpj/k2IdRmxa1iTUy52SAQjayzLmjdyP6tJomAykQ
 dPGTx6iKtyY37aToVH6Ix62kbeabyYdQHuOvhl+/05gFHkCFN22t47OCv2/SsOUsNjCR4F8CluJ
 ocDptklsozzRkDG5vwvzdMNT/0LyoAHUc3JVGPcHh5WRUuHoccIaTdMPjOTvwNoMYeB/eUoRiDD
 3ExbzO3RaqiCS2gbS8kgrqSp2jqSTmIN5aWISKHp6TIgSIipFyr+zd6xlCS6pcennZkiBPal+Ez
 /Ed7qa2OZewUvCPb7MSP5oAnAGUgDYbpw6hrSI4BcW9hngFhLwoTSW1snxmbf6eT5ZD87gnQGsh
 68MPWdajlSX8jTg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Nov 2024 11:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5716

Add a section on providing global level configuration from the
layer.conf file. Since this file is parsed at an earlier stage in the
parsing process, it's not possible to combine bb.utils.contains and
{DISTRO,MACHINE}_FEATURES to conditionally set some configurations.

This patch documents:

- First that this file can be used for providing such configuration.
- Then demonstrate how to conditionally provide them, using a technique
  that is currently used in meta-virtualization
  (https://git.yoctoproject.org/meta-virtualization/tree/conf/layer.conf#n50).

Fixes [YOCTO #12688].

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 86 +++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 91889bd0ae391c7b6e62068778ae5c180c840762..e449fd43ad86c9a027e317e49b6e2f2f340a08d4 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -644,6 +644,92 @@ variable and append the layer's root name::
    order of ``.conf`` or ``.bbclass`` files. Future versions of BitBake
    might address this.
 
+Providing Global-level Configurations With Your Layer
+-----------------------------------------------------
+
+When creating a layer, you may need to define configurations that should take
+effect globally in your build environment when the layer is part of the build.
+The ``layer.conf`` file is a :term:`configuration file` that affects the build
+system globally, so it is a candidate for this use-case.
+
+.. attention::
+
+   Providing unconditional global level configuration from the ``layer.conf``
+   file is *not* a good practice, and should be avoided. For this reason, the
+   section :ref:`Conditionally Provide Global-level Configurations With Your
+   Layer` below shows how the ``layer.conf`` file can be used to provide
+   configurations only if a certain condition is met.
+
+For example, if your layer provides a Linux kernel recipe named
+``linux-custom``, you may want to define the :term:`PREFERRED_PROVIDER` for the
+``linux-custom`` recipe::
+
+  PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
+
+This can be defined in the ``layer.conf`` file. If your layer is at the last
+position in the :term:`BBLAYERS` list, it will take precedence over previous
+``PREFERRED_PROVIDER_virtual/kernel`` assignments.
+
+Conditionally Provide Global-level Configurations With Your Layer
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In some cases, your layer may provide global configurations only if some
+features it provides are enabled. Since the ``layer.conf`` file is parsed at an
+earlier stage in the parsing process, the :term:`DISTRO_FEATURES` and
+:term:`MACHINE_FEATURES` variables are not yet available to ``layer.conf``, and
+declaring conditional assignments based on these variables is not possible. The
+following technique shows a way to bypass this limitation by using the
+:term:`USER_CLASSES` variable and a conditional ``include`` command.
+
+In the following steps, let's assume our layer is named ``meta-mylayer`` and
+that this layer defines a custom :ref:`distro feature <ref-features-distro>`
+named ``mylayer-kernel``. We will set the :term:`PREFERRED_PROVIDER` variable
+for the kernel only if our feature ``mylayer-kernel`` is part of the
+:term:`DISTRO_FEATURES`:
+
+#. Create an include file in the directory
+   ``meta-mylayer/conf/distro/include/``, for example a file named
+   ``mylayer-kernel-provider.inc`` that sets the kernel provider to
+   ``linux-custom``::
+
+      PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
+
+#. Provide a path to this include file in your ``layer.conf``::
+
+      META_MYLAYER_KERNEL_PROVIDER_PATH = "${LAYERDIR}/conf/distro/include/mylayer-kernel-provider.inc"
+
+#. Create a new class in ``meta-mylayer/classes-global/``, for example a class
+   ``meta-mylayer-cfg.bbclass``. Make it conditionally include the file
+   ``mylayer-kernel-provider.inc`` defined above, using the variable
+   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``::
+
+      require ${@bb.utils.contains('DISTRO_FEATURES', 'mylayer-kernel', '${META_MYLAYER_KERNEL_PROVIDER_PATH}', '', d)}
+
+   For details on the ``bb.utils.contains`` function, see its definition in
+   :bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`.
+
+   .. note::
+
+      The ``require`` command is designed to not fail if the function
+      ``bb.utils.contains`` returns an empty string.
+
+#. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg`` class to
+   the :term:`USER_CLASSES` variable::
+
+      USER_CLASSES:append = " meta-mylayer-cfg"
+
+   This will add the class ``meta-mylayer-cfg`` to the list of classes to
+   globally inherit. Since the ``include`` command is conditional in
+   ``meta-mylayer-cfg.bbclass``, even though inherited the class will have no
+   effect until the feature ``mylayer-kernel`` is enabled through
+   :term:`DISTRO_FEATURES`.
+
+This technique can also be used for :ref:`Machine features
+<ref-features-machine>` by following the same steps. Though not mandatory, it is
+recommended to put include files for :term:`DISTRO_FEATURES` in your layer's
+``conf/distro/include`` and the ones for :term:`MACHINE_FEATURES` in your
+layer's ``conf/machine/include``.
+
 Managing Layers
 ===============
 

-- 
2.46.1


