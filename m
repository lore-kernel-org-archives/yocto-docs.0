Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6862D5B17D
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 09:23:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10874.1730280217081196166
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 02:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=opdm1uyN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7637FFF806;
	Wed, 30 Oct 2024 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730280215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDERRJ3wsVtlLaVAdfyyQsAghmyd9evqPCyTgzYgi3A=;
	b=opdm1uyNVgrXqD0xtyVpd8DqajcuI8kEpY76H695a6+ZrT3Kkk0f0QCBFNtzM4C321AXfd
	D8jcyNxNwyjOkCIQbZlQOBzri/Zv7i+Ds7B7iqQ1Owq7bswYHk0og4Ir1kb3ngZ5GFxSny
	O0+GQlxNXCWFkHVTo/LRgA/omiq2TsMG/KNLI3bMJ90BOyfzS3WVQCLKd0s3PjJX9vce4l
	cS8V+XmEPkev48ARdFGa3ASVlvtTqZQ/2phJg2Dtxl3OMKcFq71vzH2UWnrVDxtFIvF7bZ
	wY9Bo0i8+UdrO4PcjCQ9rrsZzOA4Y6gUi9WNh183SG1oXI4ov6P0VZRHgrzAbA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 30 Oct 2024 10:23:14 +0100
Subject: [PATCH 2/2] dev-manual: document how to provide confs from
 layer.conf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-layer-confs-v1-2-0f7dcf460e27@bootlin.com>
References: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
In-Reply-To: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5357;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=h0q05y9K5h67F0EhYSSsF4eCekyktTA1bGD4CvigzQI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnIfsWmgVzBL624FUQWkZxrrKcRH/rlaXyRTAis
 En7ISE60QaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZyH7FgAKCRDRgEFAKaOo
 NijWD/9zArnynMPqkQovPnr6foDgZ/6N1nVFs4sd061XWiL0eggbwiWub1K4pk/+apGjdhshPRE
 DsiFSfHn6xfOrChXGoZLFQBc7yTLlm0fTs5ENImEBGf4VA7HmRQfectTqyiDvKOjI50noRgLaj6
 X4+SxDegHk5y93rBBhfGVCotECHv9n0voQwF8scIB3Gwi+0DgkaeFW1503Ec3MZVznL3mkWgDHc
 Znn6yeRLEjlG2j6HjrVqffRK3/FQ34YmZJfJ98oetFuaTEP0NVV4Sm+I5Od9aKnOY5Xgul1gpoY
 0PprFIqq2jOBNskVoek55Vdqai5vxHQhOiB4JQnnnUmy2xxjV2INXTks3ogUNvIm7HFmMixc8Nb
 uPx7k2f02+qJ56Nz/Z875LWrSc9QcGZ1gUVMXj/SlUtJC12W+Uy9HQt0Ce+pZxZWo34lNJAQr/n
 ZuT0ni9/wDdjzwgFLsqDPgSv7KcLyJADHG3Yr4yV0NfJa2K0uKJm1rkBD7Hv83conq7NX6TfbrK
 IqxOShKXOtLOTlr/8HEQ/lCzjBILKLaara4CAt/5hwJp0U4FYpg70QNwqKJCJ9e7t+/RzxMJVbD
 dxYldH+2OgjJH1Y4oiJM8ksUQbmWfj72rw+D2JDlFaAGaay6/V4HLOGPgmfwg7HAye+4RaROccs
 yy8cjkAORRgptAg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 09:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5611

Add a section on providing global level configuration from the
layer.conf file. Since this file is parsed at an earlier stage in the
parsing process, it's not possible to combine bb.utils.contains and
{DISTRO,MACHINE}_FEATURES to conditionally some configurations.

This patch documents:

- First that this file can be used for providing such configuration.
- Then demonstrates how to conditionally provide them, using a technique
  that is currently used in meta-virtualization
  (https://git.yoctoproject.org/meta-virtualization/tree/conf/layer.conf#n50).

Fixes [YOCTO #12688].

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 78 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 91889bd0ae391c7b6e62068778ae5c180c840762..94d959fde67e911435d99ce8dd85b3d591573c82 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -644,6 +644,83 @@ variable and append the layer's root name::
    order of ``.conf`` or ``.bbclass`` files. Future versions of BitBake
    might address this.
 
+Providing Global-level Configurations With Your Layer
+-----------------------------------------------------
+
+When creating a layer, you may need to define configurations that should take
+effect globally in your build environment when it is part of the
+:term:`BBLAYERS` variable. The ``layer.conf`` file is a :term:`configuration
+file` that affects the build system globally, so it is a candidate for this
+use-case.
+
+For example, if your layer provides an alternative to the linux kernel named
+``linux-custom``, you may want to define the :term:`PREFERRED_PROVIDER` for the
+``linux-custom`` recipe::
+
+  PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
+
+This can be defined in the ``layer.conf`` file. If your layer has a higher
+:term:`BBFILE_PRIORITY` value, it will take precedence over previous definitions
+of the same ``PREFERRED_PROVIDER_virtual/kernel`` assignments.
+
+Conditionally Provide Global-level Configurations With Your Layer
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In some cases, your layer may provide global configurations only if some
+features it provides are enabled. Since the ``layer.conf`` file is parsed at an
+earlier stage in the parsing process, the :term:`DISTRO_FEATURES` and
+:term:`MACHINE_FEATURES` variables are not yet available to ``layer.conf``, and
+declaring conditional assignments based on these variables is not possible. The
+following technique shows a way to leverage this limitation by using the
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
+     PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
+
+#. Provide a path to this include file in your ``layer.conf``::
+
+     META_MYLAYER_KERNEL_PROVIDER_PATH = "${LAYERDIR}/conf/distro/include/mylayer-kernel-provider.inc"
+
+#. Create a new class in ``meta-mylayer/classes-global/``, for example a class
+   ``meta-mylayer-cfg.bbclass``. It Conditionally includes the file
+   ``mylayer-kernel-provider.inc`` defined above, using the variable
+   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``::
+
+     include ${@bb.utils.contains('DISTRO_FEATURES', 'mylayer-kernel', '${META_MYLAYER_KERNEL_PROVIDER_PATH}', '', d)}
+
+   For details on the ``bb.utils.contains`` function, see its definition in
+   :bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`.
+
+   .. note::
+
+      The ``include`` command is designed to not fail if the function
+      ``bb.utils.contains`` returns an empty string.
+
+#. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg`` class to
+   the :term:`USER_CLASSES` variable::
+
+     USER_CLASSES:append = " meta-mylayer-cfg"
+
+   This will add the class ``meta-mylayer-cfg`` to the list of classes to
+   globally inherit. Since the ``include`` command is conditional in
+   ``meta-mylayer-cfg.bbclass``, even though inherited the class will have no
+   effect until the feature ``mylayer-kernel`` is enabled through
+   :term:`DISTRO_FEATURES`.
+
+This technique can also be used for :ref:`Machine features
+<ref-features-machine>` by following the same steps, the only difference being
+to place the include file in ``meta-mylayer/conf/machine/include/`` instead.
+
 Managing Layers
 ===============
 
@@ -916,4 +993,3 @@ above:
 .. note::
    Both the ``create-layers-setup`` and the ``setup-layers`` provided several additional options
    that customize their behavior - you are welcome to study them via ``--help`` command line parameter.
-

-- 
2.46.1


