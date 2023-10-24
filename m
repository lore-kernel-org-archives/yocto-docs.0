Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16124C25B6E
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.18023.1698154054725537180
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=W54HFPZ4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F8B7C000E;
	Tue, 24 Oct 2023 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWe+x2oAl67JW42Zg5MagRZMimcPw3xWE9GNXqan/OE=;
	b=W54HFPZ4qbe6xc3L9kBiSGRzI/WnSuUauODTLE9iIziQNO31H3q4RWRwr9fHwc6c13gEgl
	DRNoSVE8pvn2mHj++HehrSji0EOF57B9A0fhdGqtpqJuY29JiNCxX04VjCZtixNcrb+GQx
	PNp82Z5GtMpk5WrzE3PWKhU3x7hwqQYNl3po3X230uaT1LGburY8ikZkO7EgNoIjWvYraU
	jr7EQz4QdXo0VuXigLpqv7Xelk9uMCx3N3qXj3MPxR98BdSSy2zQIkfXze4VkPDmWoGN/W
	Evy18i9chA8nu73oTtehUFSnzpfrJwDyYTfnNd6mMdlmrkjwaLeb0eUytaBZKQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [kirkstone][PATCH 16/16] ref-manual: variables: add example for SYSROOT_DIRS variable
Date: Tue, 24 Oct 2023 15:27:12 +0200
Message-Id: <20231024132712.90600-17-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4491

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELHADJ SALEM Talel <bhstalel@gmail.com>

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 87081d94b9..827c94acd4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7913,6 +7913,35 @@ system and gives an overview of their function and contents.
              ${libdir}/${BPN}/ptest \
              "
 
+      Consider the following example in which you need to manipulate this variable.
+      Assume you have a recipe ``A`` that provides a shared library ``.so.*`` that is
+      installed into a custom folder other than "``${libdir}``"
+      or "``${base_libdir}``", let's say "``/opt/lib``".
+
+      .. note::
+
+         This is not a recommended way to deal with shared libraries, but this
+         is just to show the usefulness of setting :term:`SYSROOT_DIRS`.
+
+      When a recipe ``B`` :term:`DEPENDS` on ``A``, it means what is in
+      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``B``
+      into ``B``'s :term:`SYSROOT_DESTDIR` that is "``${WORKDIR}/sysroot-destdir``".
+
+      Now, since ``/opt/lib`` is not in :term:`SYSROOT_DIRS`, it will never be copied to
+      ``A``'s :term:`RECIPE_SYSROOT`, which is "``${WORKDIR}/recipe-sysroot``". So,
+      the linking process will fail.
+
+      To fix this, you need to add ``/opt/lib`` to :term:`SYSROOT_DIRS`::
+
+         SYSROOT_DIRS:append = " /opt/lib"
+
+      .. note::
+         Even after setting ``/opt/lib`` to :term:`SYSROOT_DIRS`, the linking process will still fail
+         because the linker does not know that location, since :term:`TARGET_LDFLAGS`
+         doesn't contain it (if your recipe is for the target). Therefore, so you should add::
+
+            TARGET_LDFLAGS:append = " -L${RECIPE_SYSROOT}/opt/lib"
+
    :term:`SYSROOT_DIRS_NATIVE`
       Extra directories staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task for
-- 
2.34.1


