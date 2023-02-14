Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD8DC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 10:36:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.3516.1676371007006462055
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 02:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jDe7qkB4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BB9EF240014;
	Tue, 14 Feb 2023 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676371004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9V+ScjJhsEHv2n9Emn7VnF3Z+xuM+PIjj9Vx7pIXaE4=;
	b=jDe7qkB4N0u1R0JYPO0Ms5SCODNdUtWk5yiHfCv4gRCoGrPVFYUb8DDZPXKdMPCT2xdqWB
	Y3nj6CBeEagVoSDoXplH/mwGPiHV7GjkKOBABNVnRF728sMvHnzhuFpCHrqgr+TDC5c9HK
	BuTsBCxGOhxjBwl/TF43DHyoIOcBfQjSJcH5BIurVEio5rlqO3RxIvue+GM58WxJxubqQf
	Gy8gAmoh3+A6cL1bKAleOBwShEg+/UZ3k/XTJZsc8nw6mJA2WkZ26N0JB+mBKDTZsnS9GV
	4ecWhe/TxqbZ7ovPFXzLEolIfq2ssZZ4W4rQ3dXltY5FgR/C+xHHIvLIU34+wQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Tim Orling <ticotimo@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] ref-manual: classes.rst: add python-setuptools3_rust and python_pyo3 classes
Date: Tue, 14 Feb 2023 11:36:11 +0100
Message-Id: <20230214103611.39995-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Feb 2023 10:36:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3676

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Tim Orling <ticotimo@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>
---
 documentation/ref-manual/classes.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b5443c0d0a..2a20e095aa 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2231,6 +2231,29 @@ The :ref:`ref-classes-python_poetry_core` class enables building Python modules
 
 Internally this uses the :ref:`ref-classes-python_pep517` class.
 
+.. _ref-classes-python_pyo3:
+
+``python_pyo3``
+===============
+
+The :ref:`ref-classes-python_pyo3` class helps make sure that Python extensions
+written in Rust, built with `PyO3 <https://pyo3.rs/>`__ and
+:ref:`ref-classes-python-setuptools3_rust`, properly set up the environment
+for cross compilation.
+
+.. _ref-classes-python-setuptools3_rust:
+
+``python-setuptools3_rust``
+===========================
+
+The :ref:`ref-classes-python-setuptools3_rust` class enables building Python
+extensions implemented in Rust with `PyO3 <https://pyo3.rs/>`__, which allows
+to compile and distribute Python extensions written in Rust as easily
+as if they were written in C.
+
+This class inherits the :ref:`ref-classes-setuptools3` and
+:ref:`ref-classes-python_pyo3` classes.
+
 .. _ref-classes-pixbufcache:
 
 ``pixbufcache``
-- 
2.37.2


