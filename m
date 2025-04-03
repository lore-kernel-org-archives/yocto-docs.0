Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FFDC3601A
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 14:08:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.14188.1743689330755536622
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 07:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I5yZMCN7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9ADA744352;
	Thu,  3 Apr 2025 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743689328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrG83kNW/lbGZwFZnyJMnYQ/6ByX9ypYvRN2o67rLuo=;
	b=I5yZMCN78I8a46KOIZP8LORykAS4GtehpdlXj1wCGNLHproIGnzLxAdtUZjhK047Z0UPYt
	/SpMsvx4ppjircUpBq5dZamcOPpYNb7QQPuoZxWVyHt8XAewdSCEmTpJfA6DrS2aedxy6G
	MQ3hqohBIXToUkqYig8RVqT0MJ+S7D2RTEd3M5osZaF6XvXsDO4DmbTOA/r5qiV/sqzVF+
	8T8esc804LtYCGhCpEa1q7s8GVTt83vhS/ZLYy/kc8qJRtH74ZWCqlpyTQKVFcL+JMMvS9
	7q1MxY6JeBhtdgbDleH3DK7/9ra3C/nKiLE1fXNDB0BIPIsUj6EefIbB8NaEEA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 03 Apr 2025 16:08:28 +0200
Subject: [PATCH 1/2] ref-manual/classes: ptest-python-pytest: improve the
 current documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-release-note-5-2-updates-fixes-v1-1-13d16361f17c@bootlin.com>
References: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
In-Reply-To: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2388;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ddRxX6ohfgsOqrkbGFNxoPP5XRYlAyI/Mn2MrCww9q8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn7pZvd9c0ya9z436Tk1XcEzLUQT59UskpQrKiG
 5WXt/PHhNOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+6WbwAKCRDRgEFAKaOo
 NomsEACIugnXFE95TKDKgN7bCdowZlZe+S3qWFJpnsJrTKVgVCMmF/IGotu1xkn9UPvB7vZtaCq
 Gb6Z0mspiB2AyeHbhoel8ix3Dw45IsCETvyin6TdC8yLiDT7Jhr0/BmYc1A1ppCg+OMlvfoaom4
 4m0JnN7opati8dTzfh+6jAv6Lud1WPfYuimlsR5332y1DTipZEHwp5Krid9Zvx0rqGtWYso1PtT
 IaSZni7bVOA4JthDlhp4iPXnmOu4WmqxWVQ9IIrsDPLH22Wrceiy6MdbecUo20quOMkyq7miohV
 +hQVK4DMBrlEybUKkLX5IURAI0Tr+HWz9Gyig8b5XbszyPHgMDHIXPcayEwEryrw5ETUnDa3DBm
 tanWdHy7wO9Nhmn6IBe2s7NNFPVMPvixs6aCzQZ/Ox4ZWkyVEQ49xSWuEYZYv80X0MN+amBPZUQ
 WZ1MuSPQq74b3TInUoAU2vbhFIRvw+wHrynPAJ3qCYdcwaRq4H7F779O7ziHVohK0hp15Lb0QwA
 zz/moMyVNbkBnZjrTm8Z3H7wtUwDFg95Nea9nDXqtX9M0et+CIIBOQPeXUByhql1c5j7L0nWS6J
 /anr4U6ZKPFK+zIkwXDRzQyqW9uSvW/ox/12bP5d+xokDXgD3B/EYhkh9Lj+aghYCljLQpgLa6u
 Ud59YvoUqsfZkVw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehhffftddvhfegveetleekvdefueejheekueekudejjeffudfgvdehvdffudfgjeenucffohhmrghinhepphihthgvshhtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughot
 ghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 14:08:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6706

Improve the current ptest-python-pytest documentation and
PTEST_PYTEST_DIR variable definition. Namely remove the default value
that may evolve over time.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 7 +++----
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 8b930fe3d..59efcbe19 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2712,13 +2712,12 @@ section in the Yocto Project Development Tasks Manual.
 ``ptest-python-pytest``
 =======================
 
-The :ref:`ref-classes-ptest-python-pytest` class can be used in Python-based
+The :ref:`ref-classes-ptest-python-pytest` class can be inherited in Python-based
 recipes to automatically configure the :ref:`ref-classes-ptest` class for Python
 packages leveraging the `pytest <https://docs.pytest.org>`__ unit test framework.
 
-Within the recipe, the :term:`PTEST_PYTEST_DIR` variable can be overridden to
-specify the path to the directory containing the tests (default value:
-``tests``). Test contained in this directory are installed in :term:`D` by the
+Within the recipe, the :term:`PTEST_PYTEST_DIR` variable specifies the path to
+the directory containing the tests that will be installed in :term:`D` by the
 :ref:`ref-tasks-install_ptest_base` task, as well as a specific ``run-ptest``
 script for this task.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0f65620a5..266470bd5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7393,7 +7393,7 @@ system and gives an overview of their function and contents.
    :term:`PTEST_PYTEST_DIR`
       Within the :ref:`ref-classes-ptest-python-pytest` class, the
       :term:`PTEST_PYTEST_DIR` variable represents the path within the source
-      tree of a Python package holding the unit tests to be tested with the
+      tree of a Python package holding the unit tests to be run with the
       `pytest <https://docs.pytest.org>`__ framework. The default value for this
       variable is ``tests``.
 

-- 
2.47.0


