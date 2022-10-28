Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3383ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:10:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.623.1666969855784508252
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 08:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XRVqgFB/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9EEB1FF80B;
	Fri, 28 Oct 2022 15:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666969853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FUi733WntN08qwU1auoxJqxJmJ/WmRtmA0/ZYyI2TMU=;
	b=XRVqgFB/lJHI/uIfTqIlK49pKocskuYMsS/lZ4lsYoFX9ZSXC3JTaWrwsaA/ADpEviqdvf
	8u52/SM2PZuOwAuTrnE5VkuLk/xYyYED6Vvfxo0Z6B4iOTlgcBpwiL21aJQ7FwI9lMT5kN
	vvadvIy6uIC9vIi5iIqTvaQvPmjveDIkE0KyDPfVVZnyEInohDiUWgdfNcW0CrY6BzJpmB
	kTkzB4Xyp6xgcRhF6C+JbVQlU/PH7VtWLCfvDNwIYrNdrl+n1fGdnlyoJzF4a6ive0xrjv
	3HbLkY7cxfUW0G4q7dlVknfiJFjXvFITF26vTfkEcmGW2bBpaL8kE2qqh3m6Zg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: JPEWhacker@gmail.com,
	mikko.rapeli@linaro.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 2/5] ref-manual: variables.rst: document spdx-create class variables
Date: Fri, 28 Oct 2022 17:10:30 +0200
Message-Id: <20221028151033.383087-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028151033.383087-1-michael.opdenacker@bootlin.com>
References: <17224368BE5A21CF.6604@lists.yoctoproject.org>
 <20221028151033.383087-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 15:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3444

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 82 ++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index dc6eccb314..0cc73a234c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7284,6 +7284,88 @@ system and gives an overview of their function and contents.
 
          You can specify only a single URL in :term:`SOURCE_MIRROR_URL`.
 
+   :term:`SPDX_ARCHIVE_PACKAGED`
+      This option allows to add to :term:`SPDX` output compressed archives
+      of the files in the generated target packages.
+
+      Such archives are available in
+      ``tmp/deploy/spdx/MACHINE/packages/packagename.tar.zst``
+      under the :term:`Build Directory`.
+
+      Enable this option as follows::
+
+         SPDX_ARCHIVE_PACKAGED = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling this
+      option multiplied the size of the ``tmp/deploy/spdx`` directory by a
+      factor of 13 (+1.6 GiB for this image), compared to just using the
+      :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
+
+      Note that this option doesn't increase the size of :term:`SPDX`
+      files in ``tmp/deploy/images/MACHINE``.
+
+   :term:`SPDX_ARCHIVE_SOURCES`
+      This option allows to add to :term:`SPDX` output compressed archives
+      of the sources for packages installed on the target. It currently
+      only works when :term:`SPDX_INCLUDE_SOURCES` is set.
+
+      This is one way of fulfilling "source code access" license
+      requirements.
+
+      Such source archives are available in
+      ``tmp/deploy/spdx/MACHINE/recipes/recipe-packagename.tar.zst``
+      under the :term:`Build Directory`.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES = "1"
+         SPDX_ARCHIVE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      these options multiplied the size of the ``tmp/deploy/spdx``
+      directory by a factor of 11 (+1.4 GiB for this image),
+      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
+      class with no option.
+
+      Note that using this option only marginally increases the size
+      of the :term:`SPDX` output in ``tmp/deploy/images/MACHINE/``
+      (+ 0.07\% with the tested image), compared to just enabling
+      :term:`SPDX_INCLUDE_SOURCES`.
+
+   :term:`SPDX_INCLUDE_SOURCES`
+      This option allows to add a description of the source files used to build
+      the host tools and the target packages, to the ``spdx.json`` files in
+      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Directory`.
+      As a consequence, the ``spdx.json`` files under the ``by-namespace`` and
+      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
+      modified to include references to such source file descriptions.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      this option multiplied the total size of the ``tmp/deploy/spdx``
+      directory by a factor of 3  (+291 MiB for this image),
+      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
+      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
+      image), compared to just using the
+      :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
+
+   :term:`SPDX_PRETTY`
+      This option makes the SPDX output more human-readable, using
+      identation and newlines, instead of the default output in a
+      single line::
+
+         SPDX_PRETTY = "1"
+
+      The generated SPDX files are approximately 20% bigger, but
+      this option is recommended if you want to inspect the SPDX
+      output files with a text editor.
+
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
-- 
2.34.1


