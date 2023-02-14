Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1457FC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 11:40:14 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.4634.1676374807897761467
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 03:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g8LUSIWv;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 04BA4100004;
	Tue, 14 Feb 2023 11:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676374805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fGS9LrE5LzjxUYVsn0KNL1VQnd07yL6EuHRO8jayj8=;
	b=g8LUSIWv9Joi+O3Yy8jl9ptyuSqYp6pKucn8NEX8qk+Ck1t0Dv6GLuSiax24449Mfj3nQ3
	Dqtj65Dx/uNT9kSrEH1gzPpnG6wXBjik4baCnW9uayOSHSudWs7BI9uG4TY9pJG9+TH0tf
	0tNKL7tZjW+pXXwAxYNnsm1HzfPKlrWqoqiL4j8HnHNKCeAku0pf7nV3MnsWqXusxKLopa
	YO2IrLoAqLqzZdnYGPSAitwPWbuocaa4eMkJQ5Q0kgw9sr973nojZzcJzH/XcmNDU+OGdL
	lydEBA5hGgMhQ2eLNgddvgLmMsEQ3zSM8HOGh+5oVkagwMRmyMux3sb6baXiLA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Tim Orling <ticotimo@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH v2] ref-manual: classes.rst: add python-setuptools3_rust and python_pyo3 classes
Date: Tue, 14 Feb 2023 12:39:52 +0100
Message-Id: <20230214113952.41425-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <1743AD5BB1A370BE.2641@lists.yoctoproject.org>
References: <1743AD5BB1A370BE.2641@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Feb 2023 11:40:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3679

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Tim Orling <ticotimo@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>

---

Changes in V2:
- Reword to highlight that python_pyo3 is internal to python-setuptools3_rust,
  as pointed out by Quentin Schulz
---
 documentation/ref-manual/classes.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b5443c0d0a..310be59912 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2231,6 +2231,31 @@ The :ref:`ref-classes-python_poetry_core` class enables building Python modules
 
 Internally this uses the :ref:`ref-classes-python_pep517` class.
 
+.. _ref-classes-python_pyo3:
+
+``python_pyo3``
+===============
+
+The :ref:`ref-classes-python_pyo3` class helps make sure that Python extensions
+written in Rust and built with `PyO3 <https://pyo3.rs/>`__, properly set up the
+environment for cross compilation.
+
+This class is internal to the :ref:`ref-classes-python-setuptools3_rust` class
+and is not meant to be used directly in recipes.
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


