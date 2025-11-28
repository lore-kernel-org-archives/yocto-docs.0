Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44720D116F9
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18706.1764344115453825522
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xKxnOle6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E806D1A1E09
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF77A60706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D55110B02063;
	Fri, 28 Nov 2025 16:35:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5mvPuqfetvwn84niLIqthZUaNgF6sAl7+eYAz8TtzXY=;
	b=xKxnOle6WUEIIU9UW+UOYlytxrObu77vG1VXAopMCU8ucGudjsa6JEpOSbDQ6JZ9entwH4
	EgkYsib78okV6O2Sh4iBQx95b/kvxUIqGCkdC1lQX1FqriRuKMfvesbEDjNrDXxR6dDT8G
	YpC4CsIYNctetKsmxyxvCUck1XR4BPZSbM5ZuzkVuZOhhwd6fh7eZMKe+wJEnPdHFpAVN4
	xbEkZWW2lMfVWUjTnx5M2708PCcnWWMBmqKDKr3GRq6PGRyFtI7rx8AdAQDxLySUfW8eqg
	kfiVKgaDfgbHbSSJ9XZnMAR0CwbTRrYKEo1a/QL0Dlz0a7O6pqpJt0R9rfhyZQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:34:59 +0100
Subject: [PATCH 2/9] ref-manual/tasks.rst: document the
 do_list_image_features task
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-release-note-5-3-updates-v1-2-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Dpx6Uzye9sPC0SXDBuu4R0xoDUyUkGJmD3arwFnC+P0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEtrV7gpB+eS1mj8KG5jy4aJb59I/3ZAexN9
 irMjIQDsDyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLQAKCRDRgEFAKaOo
 NqtBD/9p6il6YBdoLYxiI1v7j4UrZwvr/adXBhYruKtq0UTM0irCBzjI2gImR22Fm4Sd2pvh73j
 Ye+vac2zoFPgDMNj1EO5TxYyKXy+IMFx/AbYoVn+Cj6buSrhkKPW2r6d6cHXcd05CnyWocWYAji
 FeTeNblnFvxA+dA0mIqt/TkRVb4vUkv3Jgx6NcU7ZhZksQKXixFjuYQMUf/aIiFTW7GMsU6D6q7
 NtiPAOq8RKcUgXnlY6yI5iJ750U8g5RY5+mIiB5P15v01uokiHIOuau3AtgQ6hi+xWL3h8Ruk78
 3nmt+DlAVcWUAqM1rlclMjRaeV4qS+DT6WX1IeBopX+I1gud1LxBzkoCACNIwZyCquh88Sxp2zB
 Td9ugoJ8biP/JQISRKUg+xgRMXum2wCGJhREiZOJ8hJHhsGosn+SSt2PJjKXXLHPsqPjEI176J0
 U+YYkeEUjibq1iOK7KZKZjWHZAWcLuR6w6r2YPzyL7xwOwvWiD1yTU/KDwokZDIHqV8EH1vjiVG
 uuovMychPFiBpE5u6IPalEu4Hhzxn9heu8fwMgd3/4Pht07BsMxWLckwGyP54TwOeJ3qToJ04Fe
 GZRchW9YmzxYJFFbV6v7sy+PzZjHcAtKMLTHqhRPm/xviTDPXuxBnnEmP5jmN3t64iJjtQ6iLgo
 8oafp9CINovs5hg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8165

This new image task was added by commit 957e6dc65def ("classes/image:
add new task to list defined image features") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 90f70c1ac..8651f219f 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -566,6 +566,14 @@ or both. See the ":ref:`dev-manual/development-shell:using a development shell`"
 Yocto Project Development Tasks Manual for more information about using
 ``devshell``.
 
+.. _ref-tasks-list_image_features:
+
+``do_list_image_features``
+--------------------------
+
+Lists the available features for an image recipe. These features can be set
+in the :term:`IMAGE_FEATURES` variable.
+
 .. _ref-tasks-listtasks:
 
 ``do_listtasks``

-- 
2.51.0


