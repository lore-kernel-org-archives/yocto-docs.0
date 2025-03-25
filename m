Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A27DC36017
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.61362.1742894477610056531
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fuFknoU3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E79BA441CD;
	Tue, 25 Mar 2025 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7XVYdwKyEsjmSELONqePGcBgFlmkJQ9Q23+ucqjqWg=;
	b=fuFknoU30P8+bLu/RfgWHziprf0mlPFwBfCL7s8A70ql6bnG0UWwDu7Kji9mt4gPyzbGOu
	btQDA2Xw6rYVrsnftX7n5nCk/HODzprvLJsyuJJfevsZprd7J7T0u6Q8R1OTbEO5i8eXqq
	sBUPB4xK5AOrNYo53XXmsco9GCdn9Y3DgVuQGgGGApYFN/1vlP/656e3EHLrlBJfgsrp79
	5Jd1AlV3H0Bp1cLq/WisMywHpP0EpTamgvvWhlo3QasUvHtYCBQO2tecI3IgXtCyi/Hb1l
	7N1zV6YuS2+n+hvUbY06AXCysI7cZSTUtvLEe3LhHLLnyXqLfDofLCgFZsFMYw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:45 +0100
Subject: [PATCH v2 01/12] ref-manual/classes.rst: document the
 ptest-python-pytest class and variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-1-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2563;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wAu4EFztlT+/HkO6pnPvLbRcOPDzzjD9PevbLGpyhfU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWKyV2NAO/Rp8Srp4pPghbnyVXWraYjx+NEG
 UutVlpr3CuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1igAKCRDRgEFAKaOo
 NtE1EACPNGv/evF36CTNWVbpiFLR/ORoymqPDqdvhdUDOTskbuJIdYoJHmjpFFRzWHz6/emv1Lz
 UiVR+D3s4lSwApYwH3k/qUnwuPYdBD+tB7ORqm0ezizFNJ7BTgEAER+VBUTkmi7fWmUyDZ//OrI
 bduh3/Rb4Ws2kA+gG6kHBjq1ZHaXUYziv+5Eryw4QobIDYnArLM5I/m7rsBbo0UYxAtwRlKNQ6e
 JXVQCDIzmo8FXRZgF6FxZGiDumGzc1By6V5UuzI263iWMVuQjjT1MQlaYNWAMoeu8qY2re89i9W
 Q4JNd3CbHP6CxwYoa8UYyJy1Kik1+EiORhMYV3J8X/FRW4oJ1j2oSwDC41IKD6CXLUq61hvx4Ag
 UmErKTyZbWRU4JyEyU2UvsINjrXQfnyJdSaNh1uTGDFmtXoE/spXZ6tgvbk69cRJrC1TgzDi1OD
 5WalHWLImnWuXfdhLgz7VWhSLNM1mT9ALVYD2WXeFR3c9IAicgb/YQCJuMqxaEPGW3G8WTDDgP+
 WfgxWo49PF1mJ/yxLRmhRRGBixarVxrhqdh/eEdjbTtrgNZ1he9RJe0+wTeGY2XX1KhfRV0mOY7
 SfLpX+D0COjDUDksp1FdZmNE0EsDbv37OxqQLvNxNdJaWZDlWPUwgzhyQ7e4maYnquE4c///8aW
 ZmfDLrlrLswLong==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehhffftddvhfegveetleekvdefueejheekueekudejjeffudfgvdehvdffudfgjeenucffohhmrghinhepphihthgvshhtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6614

Add documentation for the ptest-python-pytest class, and the
PTEST_PYTEST_DIR variable which can be overriden.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 15 +++++++++++++++
 documentation/ref-manual/variables.rst | 10 ++++++++++
 2 files changed, 25 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6797927fe..8b930fe3d 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2707,6 +2707,21 @@ For information on setting up and running ptests, see the
 ":ref:`test-manual/ptest:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual.
 
+.. _ref-classes-ptest-python-pytest:
+
+``ptest-python-pytest``
+=======================
+
+The :ref:`ref-classes-ptest-python-pytest` class can be used in Python-based
+recipes to automatically configure the :ref:`ref-classes-ptest` class for Python
+packages leveraging the `pytest <https://docs.pytest.org>`__ unit test framework.
+
+Within the recipe, the :term:`PTEST_PYTEST_DIR` variable can be overridden to
+specify the path to the directory containing the tests (default value:
+``tests``). Test contained in this directory are installed in :term:`D` by the
+:ref:`ref-tasks-install_ptest_base` task, as well as a specific ``run-ptest``
+script for this task.
+
 .. _ref-classes-python3-dir:
 
 ``python3-dir``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 41bda5d0d..8e0833bff 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7110,6 +7110,16 @@ system and gives an overview of their function and contents.
       at build time should be done by adding "ptest" to (or removing it
       from) :term:`DISTRO_FEATURES`.
 
+   :term:`PTEST_PYTEST_DIR`
+      Within the :ref:`ref-classes-ptest-python-pytest` class, the
+      :term:`PTEST_PYTEST_DIR` variable represents the path within the source
+      tree of a Python package holding the unit tests to be tested with the
+      `pytest <https://docs.pytest.org>`__ framework. The default value for this
+      variable is ``tests``.
+
+      For more information, see
+      the :ref:`ref-classes-ptest-python-pytest` class documentation.
+
    :term:`PV`
       The version of the recipe. The version is normally extracted from the
       recipe filename. For example, if the recipe is named

-- 
2.47.0


