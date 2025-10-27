Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3030CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 21:51:34 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.3646.1761601891872821706
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 14:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=mkzta21V;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2025102721512999932683b60002071a-s7kigo@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025102721512999932683b60002071a
        for <docs@lists.yoctoproject.org>;
        Mon, 27 Oct 2025 22:51:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Sxwz6o2QqZ0Lit3wOTw0DO4q8b9V2DyUdgRlelef8zU=;
 b=mkzta21VnFV6AY+/cbDGv0AiAE3N+P4NU18j17qy7PeW8k/+RTiriMGmGBfu87yhLYGyyu
 p/NFYu1eBR1/s2Xy3eaCpLIMn15L++JODV+ZJCVTAPqGOv/aLmJ+mloOrj8IyG6mM8ErO0eQ
 L1XUmhFxcvYhZtxxZeY2CLgIDE+q0E3Ob02MHQ3R8TV6YLaTDmlTh8tkCxhCYEBRdNxosj2N
 53Tdgub1thItt+Pn75tdvS2MQy0yLgtV/RtAmZo0CwkPBq2FiMSRPlwACgOKQt/uG+lwLPXe
 t/ynd4DVSAqNyBO/beoo2yzDh2wNdteOQgkJG502Wj5WtgIUtmptFgZQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual/variables.rst: cover new FIT_KERNEL variables
Date: Mon, 27 Oct 2025 22:51:25 +0100
Message-ID: <20251027215125.2457508-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 21:51:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7873

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Document the new variables:
- FIT_KERNEL_SIGN_ENABLE
- FIT_KERNEL_SIGN_KEYNAME
- FIT_KERNEL_SIGN_KEYDIR

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 65 ++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 591c03028ce..9be3075c041 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3414,6 +3414,47 @@ system and gives an overview of their function and contents.
       set :term:`FIT_KERNEL_COMP_ALG` to "lzo", you may want to set this
       variable to ".lzo".
 
+   :term:`FIT_KERNEL_SIGN_ENABLE`
+
+      This variable is used by the :ref:`ref-classes-kernel-fit-image` class
+      to enable or disable signing of the FIT image.
+      By default it gets the value from :term:`UBOOT_SIGN_ENABLE`, which means
+      that when U-Boot FIT image signing is enabled, the FIT image will also be
+      signed at build-time and U-Boot will verify the FIT image signature at
+      run-time.
+
+      If this variable is set to "1", the FIT image will be signed using the
+      key specified by :term:`FIT_KERNEL_SIGN_KEYNAME` from the directory
+      :term:`FIT_KERNEL_SIGN_KEYDIR`.
+
+      If this variable is overridden independently from :term:`UBOOT_SIGN_ENABLE`,
+      the :term:`FIT_KERNEL_SIGN_KEYDIR` and :term:`FIT_KERNEL_SIGN_KEYNAME`
+      variables should also be set appropriately.
+
+   :term:`FIT_KERNEL_SIGN_KEYDIR`
+
+      This variable is used by the :ref:`ref-classes-kernel-fit-image` class.
+      By default it gets the value from :term:`UBOOT_SIGN_KEYDIR` assigned which
+      means the kernel is signed at build-time with a private key found in
+      :term:`UBOOT_SIGN_KEYDIR` and the U-Boot gets the public key from the
+      same directory injected into its DTB for the on-target verification of the
+      FIT image.
+
+      If this variable is overridden, also the :term:`FIT_KERNEL_SIGN_ENABLE` and
+      :term:`FIT_KERNEL_SIGN_KEYNAME` probably need to be overridden.
+
+   :term:`FIT_KERNEL_SIGN_KEYNAME`
+
+      This variable is used by the :ref:`ref-classes-kernel-fit-image` class.
+      By default it gets the value from :term:`UBOOT_SIGN_KEYNAME`, which
+      means the kernel is signed at build-time with a private key named according
+      to :term:`FIT_KERNEL_SIGN_KEYDIR` and U-Boot gets the public key with
+      the same name injected into its DTB for on-target verification
+      of the FIT image.
+
+      If this variable is overridden, the :term:`FIT_KERNEL_SIGN_ENABLE` and
+      :term:`FIT_KERNEL_SIGN_KEYDIR` variables should also be set appropriately.
+
    :term:`FIT_KEY_GENRSA_ARGS`
       Arguments to ``openssl genrsa`` for generating a RSA private key for
       signing the FIT image. The default value is set to "-F4" by the
@@ -10842,17 +10883,31 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_SIGN_ENABLE`
       Enable signing of FIT image. The default value is "0".
 
-      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
-      :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
-      classes.
+      This variable is defined by :ref:`ref-classes-uboot-config` class.
+
+      It is used by the :ref:`ref-classes-uboot-sign` class.
+      Additionally, it serves as the default value for the
+      :term:`FIT_KERNEL_SIGN_ENABLE` variable, which is
+      used by the :ref:`ref-classes-kernel-fit-image` class.
+
+      That means, if :term:`UBOOT_SIGN_ENABLE` is set to "1", the
+      :ref:`ref-classes-kernel-fit-image` class will sign the FIT image at
+      build-time using the specified private key, and the
+      :ref:`ref-classes-uboot-sign` class will inject the corresponding public
+      key into U-Boot's device tree. This enables U-Boot to verify the
+      authenticity and integrity of the FIT image at boot time, providing a
+      secure boot workflow that helps prevent unauthorized or tampered images
+      from being loaded.
 
    :term:`UBOOT_SIGN_KEYDIR`
       Location of the directory containing the RSA key and certificate used for
-      signing FIT image, used by the :ref:`ref-classes-kernel-fit-image` and
-      :ref:`ref-classes-uboot-sign` classes.
+      signing the FIT image, used by the :ref:`ref-classes-kernel-fit-image`
+      (via the :term:`FIT_KERNEL_SIGN_KEYDIR` variable)
+      and :ref:`ref-classes-uboot-sign` classes.
 
    :term:`UBOOT_SIGN_KEYNAME`
       The name of keys used by the :ref:`ref-classes-kernel-fit-image` class
+      (via the :term:`FIT_KERNEL_SIGN_KEYNAME` variable)
       for signing U-Boot FIT image stored in the :term:`UBOOT_SIGN_KEYDIR`
       directory. If we have for example a ``dev.key`` key and a ``dev.crt``
       certificate stored in the :term:`UBOOT_SIGN_KEYDIR` directory, you will
-- 
2.51.0


