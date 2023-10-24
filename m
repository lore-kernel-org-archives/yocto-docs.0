Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A08AC25B70
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.17909.1698153825608131881
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=InOFHQrS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B61CFF813;
	Tue, 24 Oct 2023 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wznv725ElEacGSVwrmUzgISDOtRaOWnEK5e8DPnmQVc=;
	b=InOFHQrSCnH0R3OBQs77HLFJfpIVc7i6JnXgtv2QF9wWE2IP/UE5niacDGxuPQ5B529MAo
	eahkAj+sCaUVcOjMlosLZQNwkkbJzZ1L8dC3ZBw2jcFuFLVLeK8U53Lb/BejwogGQPH8i+
	kpwh4+nt/PYxSwu4nNb11M5kGmdx488iYVwDEhaq+b48yp5Duj4zSjb4ggosAD4mZM2TV5
	txVQ9NOO1E9xrmY7bZWQrX+jxzcz5W3lfWzaXQw99GSxR5GqI8zW0R5bw8GqCwPO/zplwA
	dWxA71BpuHD21qyO1NbPR6eKSC6xQJmi2L9gjEJyxGZaOvOouGoA8j/VKdDpIg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [mickledore][PATCH 13/13] ref-manual: variables: add example for SYSROOT_DIRS variable
Date: Tue, 24 Oct 2023 15:23:18 +0200
Message-Id: <20231024132318.90209-14-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
References: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4474

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELHADJ SALEM Talel <bhstalel@gmail.com>

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3529b6f47c..4a0b50ed67 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8294,6 +8294,35 @@ system and gives an overview of their function and contents.
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


