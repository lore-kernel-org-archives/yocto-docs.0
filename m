Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65783D462C5
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:28:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.14132.1731511703719995274
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 07:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kR0wXC3k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4490B240007;
	Wed, 13 Nov 2024 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731511702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SruzrTvMbnIuycwYyfh1+XkATD5YTAIe//gRRR4VAMA=;
	b=kR0wXC3kHMGdBxbzBo0nlWjWX5H/iEGieHOl61PNo3GlnogbLyLe0Nbz48EoxR3mKigUGQ
	o11ZkSEQBJzBn6X+aKNusus9krDSRejNyAtnuUKFCFv7GyAL3c5rbQqiTH/QcJ2FVdZaK4
	FS1hx3GRMjQ2AzIfgn4j8vBTpWYm+SfNJY7/YjScyIM6BLPXT+N8ZlFVWKcXCYvcFSNzAX
	EmWhBtIknlo9zVNxnmD4/yfu9OoiKig5DBuTwm8t8oclXYySnQQ4l1OPkmAJ2h8W9bk+b4
	QjcPsOidrjLVRL1K+ux1APfePrJLF/Xag2SDo8QaLVIF52w5JVRAdjcUi9bpkA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 13 Nov 2024 16:28:12 +0100
Subject: [yocto-docs PATCH v4 2/2] dev-manual: document how to provide
 confs from layer.conf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-layer-confs-v4-2-a4758fa4d1a8@bootlin.com>
References: <20241113-layer-confs-v4-0-a4758fa4d1a8@bootlin.com>
In-Reply-To: <20241113-layer-confs-v4-0-a4758fa4d1a8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5773;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ffvRsdrOMeJvt3WWrg569RW5SKmjZWeNGTxnKb+7ZzU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnNMWVredeVK5eAIe1jgAAgJkrU/pJ/d/8CQUxa
 zXeixvJTT+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzTFlQAKCRDRgEFAKaOo
 Nt48D/44OI08IPR/4U3CkGZJLNrbR9xu4pDJMStutuWun98iZqxLnEPeYo9yE5QZOmVsHVumbnk
 2aY2eUiofDlo34hsXDbxE5UoSuZf7BrsXblW3bF3VZCO5B81pNkJx2c6YD5AYfPw8x2MBBQKYB0
 YxtZBS/cJbPInal2QjklxR5jDqpQ8SztEkvQN4dAYK+n9rkpQJ7N/u4VakIunceDPVU2ttukEUU
 vjUI0vRPx8p3lAQ4zB2SHDcKc1hJg8obsM9iROgi0NDSspnRkliRuvws9Vsd9dkpIh5govSteTS
 7jcLAuYFKNBanCu2lLBYRvBKYx1dJfSqQ8dUjF8oVdMxjvV11zMihrDrsE4rzYXwmiqoUgEUdEf
 yrkrYU2L3oy5xuEkh58fJ+ZFn4NxIjX6BdQQNm5fWWFyXq4EAC/omKi5Mhk4UOGKUNUBQ3hWcYX
 Mein6KOE54hzrBDpvRakk7dEg7zPWjKuaIJZhL94OrwTwgEH1UcIRmdi2fyQY9+CYKKOiOOHRhk
 iqp1247YScpDIz3dQXBegVfsuPXczmlHJPTTkfFbnID2oudjSvFIzqj5UEBwM2sl4pN5Fj/63Al
 Okd/wZcT9WXkfQKPKHANNSZVJHE10ajjirqVNPHeITPYRM600QLnBksAF5toi/dasoh3kCjk481
 T3DjyskJLctSQCQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 15:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5740

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

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 90 +++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 91889bd0ae391c7b6e62068778ae5c180c840762..39cd1963a60086902d7e04e4bdde01f7e661371f 100644
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
+``PREFERRED_PROVIDER_virtual/kernel`` assignments (unless one is set from a
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
+:term:`USER_CLASSES` variable and a conditional ``require`` command.
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
+   ``meta-mylayer-cfg.bbclass``. Make it conditionally require the file
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
+   globally inherit. Since the ``require`` command is conditional in
+   ``meta-mylayer-cfg.bbclass``, even though inherited the class will have no
+   effect unless the feature ``mylayer-kernel`` is enabled through
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


