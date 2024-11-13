Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F57D462B2
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:30:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.12687.1731508239256718519
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lFxM1GHI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFB91E000B;
	Wed, 13 Nov 2024 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731508238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9/faj15S2KBo2esBcjl9cxqjnh17QeCefJq626YF/M=;
	b=lFxM1GHITO5GgbRpCC+ge3EAaFsmub8MLMfAYSFZQlaZNtQkyhoIJywP4yGnvinlNOMhKU
	jyw4+f7OQUM1EvLhV/jSkC0CE2GL7PCOgMGMs7IB66hQBq991vlbj9HxO655XSqtzAh0LF
	CJ4w8/kqIkNQqKyLvXWcRZVzv/LYXp5qZzP/TjxMnxoNbcA94glRAJo5yBjvX6u66aWgXY
	yH88MHGcgp9T9AQcgk7vskqlOYiOSq5hVXwBmt17vjaDPDYEVKwrvL8u5HSJIwcCA4fiY/
	Yd+DVn6Dpf16a/wotlfs0QGiI9NNMOyQjtHhQJjmpMCBTvGMiad3ujfb438WXw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 13 Nov 2024 15:30:23 +0100
Subject: [yocto-docs PATCH v3 2/2] dev-manual: document how to provide
 confs from layer.conf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-layer-confs-v3-2-3a84b0eb2750@bootlin.com>
References: <20241113-layer-confs-v3-0-3a84b0eb2750@bootlin.com>
In-Reply-To: <20241113-layer-confs-v3-0-3a84b0eb2750@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5715;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rjkmO/atq7NG19ncxeDQvBme2qTII5INRQS2zRm8j4E=;
 b=kA0DAAgB0YBBQCmjqDYByyZiAGc0uAujDVcvlQNj1GEHeNviyKwePb2eW04TTW1OUtpStt1Hl
 IkCMwQAAQgAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJnNLgLAAoJENGAQUApo6g2PAYP/AoX
 73IKW3N4gfbDqxAlpim2r6tQJx+j1T7eGRiHVJj8hFHC+Rs7NRTsuBr7FdSiVb0mE3xEtYNd/Jc
 gQ2jFdxySEAHks6W5GMKEk+3jtgzkE8sJts6XDmhzOKgg7+CQyb8hbIpHB86Cq9iZow5IHhLlIm
 XwjVr51dXePNzpN7DOPj2ZEOj8cocA1o0LUegV3RasJuFUXzaPfSX0xLPiUpcws4RW/jg/AUxaC
 5y0i9c7RGf652hJfzhX+JdtZAv2V5q9cv46LLt9BC6X9HFHr4McudRqHdDQWFMf60ZG7eD109KJ
 htgiESf49Dj4tPFi8ds2IsCQClfy6T5CmGn2xmnsunyQfUMNPzTrq8YU2VUgHBMMv1sKEi3eeYy
 IpTTGyXW6/wwA7GBrHmNQy7v/g5fU9BFM7T/PfG1YzDw71judKbzghVVeWm6CAPPhnnhOIzS8+s
 9+8wO1tTgD389dGsafrLlQJXxRdGzK8CS/9N57hWbDlF5mSzywkt7s3lcZZw2TKWpDr9jJXf0JG
 Xyru3pXEgDCruZIlHkQ0QTmm90+41QLLnN7+UlfJsz5frO1vxF+8A75U5eHeMGzQCt1AKgCLd3V
 9nQV+4iiCzpY4xN6pdUm0NG3ERTvKSNPhW6+lPEI9gVd8eHmUyStq/F2r5AlsT2ZZJGPQ7PPegH
 27mTD
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:30:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5733

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
 documentation/dev-manual/layers.rst | 90 +++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 91889bd0ae391c7b6e62068778ae5c180c840762..ac18321b04d08bceae63672cf6da26660646fc59 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -644,6 +644,96 @@ variable and append the layer's root name::
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
+.. warning::
+
+   Providing unconditional global level configuration from the ``layer.conf``
+   file is *not* a good practice, and should be avoided. For this reason, the
+   section :ref:`ref-conditional-layer-confs` below shows how the ``layer.conf``
+   file can be used to provide configurations only if a certain condition is
+   met.
+
+For example, if your layer provides a Linux kernel recipe named
+``linux-custom``, you may want to make :term:`PREFERRED_PROVIDER_virtual/kernel
+<PREFERRED_PROVIDER>` point to ``linux-custom``::
+
+  PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
+
+This can be defined in the ``layer.conf`` file. If your layer is at the last
+position in the :term:`BBLAYERS` list, it will take precedence over previous
+``PREFERRED_PROVIDER_virtual/kernel`` assignments (unless it is set from a
+:term:`configuration file` that is parsed later, such as machine or distro
+configuration files).
+
+.. _ref-conditional-layer-confs:
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


