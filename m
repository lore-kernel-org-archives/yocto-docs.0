Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F34C25B6D
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.18021.1698154053635199237
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=blkd36tX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F28DE0004;
	Tue, 24 Oct 2023 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0zrZkMCPcMATDus5lXvlbiE70k0pOQEmcACdx90lpQ=;
	b=blkd36tXvQDTlGqb6oPTOP1o3xuC5eZQ5ZgUmGPCbjUZpnreKnSDD/xxDUraoNO4Z/T0kq
	u+sSpnFz5/sA/nF3KEckLXZALgZkzzkZBbOCnK5klg5MiIN4jqZkkaaeg57lgjw2W/wqCb
	BR+nixbIjbnOXq7roDqKorqaHMg73Ue4WzEGkJ+wZgvDrKCDCY8+01IemhBWdMb5pVRAcb
	u05Hoab2S4/gA8lMBzHxymfBSXcN9sUb3Bl42jf/0m9emBQJ4VLPQU/3EKrhgMd+JoEkgY
	xhhumPgHtwBLeTY4/BdNFUPv5tD/tvM5spbneHguWPPnpiL5l9tAxJ5SHcoDhQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [kirkstone][PATCH 11/16] dev-manual: layers: Add notes about layer.conf
Date: Tue, 24 Oct 2023 15:27:07 +0200
Message-Id: <20231024132712.90600-12-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4488

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELHADJ SALEM Talel <bhstalel@gmail.com>

As discussed before with Richard Purdie, the code supports this but the documentation does not.
Developers in general will not notice this or focus on it because they do not mess with the
layer.conf template file, but in my opinion I think more details can help.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/layers.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index c5c34134b6..16f62ee696 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -128,6 +128,20 @@ Follow these general steps to create your layer without using tools:
       variable is a good way to indicate if your particular layer is
       current.
 
+
+   .. note::
+
+      A layer does not have to contain only recipes ``.bb`` or append files
+      ``.bbappend``. Generally, developers create layers using
+      ``bitbake-layers create-layer``.
+      See ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`",
+      explaining how the ``layer.conf`` file is created from a template located in
+      ``meta/lib/bblayers/templates/layer.conf``.
+      In fact, none of the variables set in ``layer.conf`` are mandatory,
+      except when :term:`BBFILE_COLLECTIONS` is present. In this case
+      :term:`LAYERSERIES_COMPAT` and :term:`BBFILE_PATTERN` have to be
+      defined too.
+
 #. *Add Content:* Depending on the type of layer, add the content. If
    the layer adds support for a machine, add the machine configuration
    in a ``conf/machine/`` file within the layer. If the layer adds
-- 
2.34.1


