Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60ED0CF11DA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.41659.1728562259058939939
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pY7H9PgR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EA91FF80E;
	Thu, 10 Oct 2024 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blsAKzTZp9ZsQrHFyTdOh6tpRSOO8K5LgHjWU4ZBSF8=;
	b=pY7H9PgRkzxJE9vSBFaNTUhTuZ21eDI5B9vgnoPFN8s0IFQeD0IY0m77mKfMsoQCp1eu/H
	HoJvpFKvfoIBI2wl6vI+Oo6aW0dJEc1bO0jCeSOKs+N+1mKcEHw5BS9bXgyz8Had8fs9tq
	FgqcaZtLhBC12ZXNtIA5VIwL38NlUJkgX9XqDeP9IUeDl9dbHottp/GpPLTx/Vyrq6NTC1
	AwOr54wztyrlq/+oIYCs1ddUGkX6OrrMSJvoW5bgMBwCc++K/c0aRxcFDlfg6zzSxF7Wgp
	rgS9VqnDmoPx8LNDl/SlNmmE0PBJ78gtUAlpy4fnawfUPcJmOuV9ay7SFB5+yA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:31 +0200
Subject: [PATCH v3 06/16] ref-manual: drop siteconfig class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-6-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yjDrzUs+kiEwvVJH2kHDnWqbFA5ToOoc+EjCkYuQQFQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8RO9uIB8U3upcAS/Y9748zeB8vQyqMwp+Nn4
 vVrsNEA1+eJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 NvZgD/41530UTVDhx9l9lvusg3mxaRQAPdrVdYmWmXLqrWxgukmdSZYNeVxK3J7DbuMzuqoaK1Z
 ohe3pYInEHFpoZf23ldkcCqtvfKv7fvcDCsBGHuZ/eA2X1DgboMcXDyBJvd3LleDSzsag+1HwhP
 Bps22mmBYANNN2Qa8cCLlD6kb/Ua6LP9vsgorVrMasHpi0yHQE4K8xuyprUI8WKszmVYHmATnXq
 JjDvgmNktqpYfNjVPm+c542XJ3mBQCSiHm0ywHmSd0wxt03UAPAmCP+AelW0btVY5RF0S5FzZWj
 Dd5YOkVaEQl9qiCyHx78JgvQUSKrEueFvqxJ89C3umNHlTxnGBP/9iKkOmSC04xB/K0T4cvgcb+
 ZcYVs9PoNGDoF9Q6a/QiUc0j3mmhY9eEAGUiK+wqq3qadOYOAwsYC0VUEpw4mw8sS8QjY/eAwuP
 7L2CZtmMY2fMSa5wlxo8q/jhc7AEwjuxY04ThGNVvT9KdY/DSTAK0iB1FKBnk8dVbtrgqoXsUnj
 y5LWYdNm6mL55egEyFUFt3oje/bf0i1Ox9Jo1XL02BIgN9d1oGdHSoQG+OzF5FbHpHl7NXxI4QS
 QQ9Cgw4cXa9i9mBbW8U3XRLZEWtbT6PfJv93ji2r/I87oFBAsvwHRuy8DK0MhwGp7BBAC/RddzM
 2f0GRWBSqEY9UQw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5459

Removed as it was only used by ncurses and zlib and adding minimal
added-value for a considerable amount of added runtime.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 14aa0f3a3..121887d1f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2940,15 +2940,6 @@ in the :ref:`ref-classes-setuptools3` class and inherit this class instead.
 
 The :ref:`ref-classes-sign_rpm` class supports generating signed RPM packages.
 
-.. _ref-classes-siteconfig:
-
-``siteconfig``
-==============
-
-The :ref:`ref-classes-siteconfig` class provides functionality for handling site
-configuration. The class is used by the :ref:`ref-classes-autotools` class to
-accelerate the :ref:`ref-tasks-configure` task.
-
 .. _ref-classes-siteinfo:
 
 ``siteinfo``

-- 
2.46.0


