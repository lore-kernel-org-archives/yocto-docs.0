Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAA2C27C46
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.147625.1698153823666416588
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m00PO1t2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C694A1C0012;
	Tue, 24 Oct 2023 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s8ySGILYpc6oNVQyuEKZnNPeXUnzKaBSyBM7Ym/atPY=;
	b=m00PO1t2QdJ/Fpx+kNP5+Lo9sOGn7gTWSWIsDC/o3O+q0TwXXbDNfCnt638MjDx+uaLRIr
	DKlc7Al6gycq+YBPXejsSk/MaFVReQLBu2vBNywDCcsXW4VWfJXswnxddjdyotYky/8GUh
	4KKngPiCrSPICsz+1eZFfMSQuLJ/7/jd5qYaotQiwAA/bvFnKvqfafbt3h0FQIGtOwzu77
	JWtWrHfwl1SPJlUtaduXWzjFz4kSKx/7WsoTGkSES2s5VtXdi4Vq5r1/WtfqUgCamRJ4H7
	AEL1naTQWgRzNoU1hfnElMQNyMkzSPHum65+lKzCINhBuANZ8oTl7dayjMzd4w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [mickledore][PATCH 08/13] dev-manual: layers: Add notes about layer.conf
Date: Tue, 24 Oct 2023 15:23:13 +0200
Message-Id: <20231024132318.90209-9-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4469

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
index 2d809562d1..c65a94b4fa 100644
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


