Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933D2C36001
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.47913.1742202393293013265
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZzSc9zLi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A022943277;
	Mon, 17 Mar 2025 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SiiwRhhPce3e49ARkTjnl+PpFnZ8LjRnyQx66RFv20=;
	b=ZzSc9zLiNr/4FLI9iUJEsboDpQ+LUMsz4SPyVqr7DSsVHXAYHNerRtbI/zXSEoKoXJbb/L
	6Fcf3Q01R9viptBCNc1vcFp0upMyF0LVBvEKffi7mD0MsZS5WlFxKExiYo/y8WcnFLVW/O
	+BrJKas4FJ3OGXx6dB56iSulncgxMVdYE3gZoCsZKyqZ9JZB4oY44uExf8H/dHIFuJX2bb
	+p8DbW25MbA1gqhM9J9ShWAe7nZU4NpjrMIfsKxDn/yTeDBcGBHQ+xiP1ZlC3sz7Nxu2Pr
	/7h3PkPZKdcb2ZBxvfAsQ+FH02/vtnoxLmI//WJdeJyz+kmOGc4g/60q6peOuQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:07 +0100
Subject: [PATCH 01/11] ref-manual/classes.rst: document the
 ptest-python-pytest class and variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-1-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2563;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=z0uunkhlLUu7NEyI+jgQBWRivYkZvqfdUsJWczVaYoo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YVd52Y7cqjAp7K7w/cA2z0t+Q8qLuUe5aV+
 2fIh2JSs4uJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFQAKCRDRgEFAKaOo
 Nn0sD/9ICQkfOSXE2LGR1YG0f3rErbMBlO5keBmQ1qaqsu8dCIC6+t2IsH4+Ize/PTaA7cfq5y+
 IzFf0AuWs6vuk/on0/SXM39ntqI3aaE56qZ4AclTRtdXG7FFO/DHQpp+1BSHZOzmwRV77G9L6D0
 XI2NRxjtEyjsXU+E7MA1iZ7TO9daEqEz7Kad0mG/VdhZxRDWK/uA4221r+Y6amqRmL0NV2wYyzb
 LhScGkr+G3HTBjTcvPudUGjfNH2dhwxEi/MbByRPy/3fQzIMBc2ZRnXr3FlEd8RLHgwAVVCK388
 h2j1ZaCaqaXXph07vR69jCGdmfvCvKk7e3murc7i2BAAlmDZFfpTealmJssd1x0ywpJAbAqUkvE
 UpWuUuWVNMI5k5N65WFw7td4KWHFgyI7asKeAnGDrQga1W+1Ug4R21J8ZgDV2vbhPwAcr+uCDLk
 Ddw+hSe20snSYwUyp1wLn4pMCyi0Gzsg50aSLKIYfm/8No+T/dk/RFv0hu3kbDhMaG8rgqoWWVA
 qeIkLZaKGSKFSF80RwhN+qiEyRtxBMa8K5LT1Cw1rIdnyVMrE9wa4xBthmJNFYtbb1pWjkaE1hr
 7pJpUt8yLFNry/iRZfKCnG8GjMwX/lh0SUj/jFS9oPohlTpn/syMa6lLEdT1usPLcI6MK6uadJw
 f2yEvkdn5PGBT5w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehhffftddvhfegveetleekvdefueejheekueekudejjeffudfgvdehvdffudfgjeenucffohhmrghinhepphihthgvshhtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 ehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6562

Add documentation for the ptest-python-pytest class, and the
PTEST_PYTEST_DIR variable which can be overriden.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 15 +++++++++++++++
 documentation/ref-manual/variables.rst | 10 ++++++++++
 2 files changed, 25 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b93279ff6..047ca5d7f 100644
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
index 861b04eaa..b697a4e2d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7088,6 +7088,16 @@ system and gives an overview of their function and contents.
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


