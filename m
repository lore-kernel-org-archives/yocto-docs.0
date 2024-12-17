Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB51E77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77899.1734427636160099704
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MrucljP6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B31631C0007;
	Tue, 17 Dec 2024 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXteR5lcLbV4+GUKYnfroKt2MrHm7dn7pv43jkcPzfc=;
	b=MrucljP6JGDXAQdp4xtCOUIUFS74lE+p2Xfo4HwVhHr4xhuyDOThvZOccbepA0z16aSsUa
	xb7+sSH6glshs/ZTSToCGr2LRcFAMqiYe/3yuY5LrUtJEYX2ReHqAYsFYg6LcyQ/t7qxHp
	qmbsIrBNPi59lU4CErul9Q2btOi1GXwpESCoExxpWeox43sdDEbpDKeTRni1lPvOI03fCw
	m4tP6L1nD7aFKX+OlwK67hFRHj3qKj5tK60juXioZQkZtLxTGQVo4QqUs75y6+TRTXVbqr
	I35bMFoiRsMb+pn4CnneG/3IHKmxf6HWalqXaPflgeCc9Gx56K8sXYAgFNotDg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:05 +0100
Subject: [yocto-docs PATCH 06/14] ref-manual/variable: remove obsolete
 SETUPTOOLS_INSTALL_ARGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-6-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=D0x35t+SLxeqKMUI+SEZxvLfa2U/eck8bRq/OR+dQN8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPwU5WSP3QtSkELUgNz3qyDtZF1YfAgyl5Mb
 sZn6R+zl8SJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 NvH5D/42wXUP8TzJZ1Ddg5kYl/Nf/SuBRz7bxphgdPqpTGDjPk/O5GaG1q2xUMupVcnOebztHCk
 obVOv4Zeom85DBXCtepsexDAvPh15H9qc/q9lnKYaiUqKpEeFC0nEp0vRXBHUBWrEFZ6Z65kfPs
 QsVbwf8tmSXAfk5D3Ca97DstcR/sUNoYZpyxLmSg9/YmznE/J1Kmv+VAQKkPj0Hn2zdn4vmIBkX
 n7KxlCKfqzZLoQX3VXFxRoA2KslEmeJ/GUYYBQHSff7JZNSQqf5roA/TxADMjK//q13umGOFFla
 cNQA5Kw0Y5q3tOBlMC0LRcpPzbZpzmAt5RZ4hRUWHp1dio+e6/ieGPFgxFfMoGFzTB/B5i2A4m4
 0RhAmJ2AwSv/4wlqnMkg55DjvlwKI8JN8LzktImFWpehXHo9zXvdmMiq9zQl/om0RHKHLep9x1A
 hL+85Fj27qHvk4mbr4gJFIecnGJARQzS9/tYvFNwqY6tO6ML1AQAVQm9QRjSyDkDqNPVsslmtEp
 dHXwJ4tNSMW8AOnGx/SWG9C7Ybd9bK9aUMv2a6q8DTpeX8kM16qWMwn9qEWNrCHcJnILVIyfwqR
 NF00FjSAjvKq8BvFY6rRiwO32cqgTcnpAGjY70PBDp81jxqW9zHhBpu8/CV9e27oee4AbFAi60v
 l1djLYPPID0xgWg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5939

Remove in oecore by commit b4bdfc78e8e1cb8b86221bc55d80d601ea1a065f
("python3-cython: remove obsolete SETUPTOOLS_INSTALL_ARGS").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index bce8a1c7ed3af7115655f51aa0a6c558478d8c86..2c2226dd16c25ebb5cdefce9a657a124e51ab143 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7841,11 +7841,6 @@ system and gives an overview of their function and contents.
       class, this variable can be used to specify additional arguments to be
       passed to ``setup.py build`` in the ``setuptools3_do_compile()`` task.
 
-   :term:`SETUPTOOLS_INSTALL_ARGS`
-      When used by recipes that inherit the :ref:`ref-classes-setuptools3`
-      class, this variable can be used to specify additional arguments to be
-      passed to ``setup.py install`` in the ``setuptools3_do_install()`` task.
-
    :term:`SETUPTOOLS_SETUP_PATH`
       When used by recipes that inherit the :ref:`ref-classes-setuptools3`
       class, this variable should be used to specify the directory in which

-- 
2.47.1


