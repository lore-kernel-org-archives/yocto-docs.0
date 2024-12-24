Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46314E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 08:33:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.29950.1735029204496261886
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 00:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UZyyxS62;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 211621BF207;
	Tue, 24 Dec 2024 08:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735029203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anvHjHObOQ79sVSeZti1dO7/AJCIFEw1xSCVVO5bVQo=;
	b=UZyyxS627zpGBMagN6F7sq3zAYZy+7wRWXGLMsgkXP8lmWsBygc4JRFy+g8f63eGHJSH14
	Y+Oo5B0IKLxBpL7YrLzFDNcucPlJR5R0Kch3ZEbIUyjNWu6rMh81C7OOP5taeVo3whNNhX
	s9jXzOqSTIb4gFABxED4hk4A284XYfRZIXExhVxlLZfD9x57EjStYeKtDj8iBshjB/MCJB
	8lfMaYDQIc3bsN9CntEteovncQNETHFJRgvWdj1B1mmwb2bPM/f9os8TpMSvkZ3OabUaj2
	ZUpaOqLntL7F49OMB7fgU9I8iugapFFT20LlHisIQZzUfkMNR87DJcgSX/OnGw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Dec 2024 09:33:03 +0100
Subject: [PATCH 2/2] dev-manual/devtool: remove reference to the extensible
 SDK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-devtool-dev-manual-v1-2-0cc4fb584018@bootlin.com>
References: <20241224-devtool-dev-manual-v1-0-0cc4fb584018@bootlin.com>
In-Reply-To: <20241224-devtool-dev-manual-v1-0-0cc4fb584018@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3004;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6IE51eeYLRlECRoFF5Wec5+3Dim8Iw0MNGccfQsrxXc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnanHRy6tkotxUCF5/npJvYqcOPv0gaRgmeKtNR
 OhqcIsipiiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2px0QAKCRDRgEFAKaOo
 NlW1D/0YIGUsKr9zj9Q29vCpTgEM5pbz0Fihstza4bw2Yu9oNLNPC7y51dAQdrDbBVXxjYmsRze
 PjAwlCYPIvogp4zm22r7x4adU5cPTsEoOWuPfmK4XVW2TbD7cBGyoA5G2Fp/tT8UvOk7KPucqpA
 Tu8zGSaATwgT5jocjclBNKnIDUSH0Yh6gNxWUfii+DFrWDDdyMWf0rZNr2FzTUI9fZ6k/E0XHch
 xUeVa04OqHyk52078v4nDbNN3cMtX6PHOfeRUk00waJxHxhWH2hxX2lTg/O8e667GW3b/Qfj8aj
 qSHdQHxvkcjbo0/wyo2StsFPPoPftbGK/oWXZMYPfYuPC68gKGvwiyj0UM00YguFNIRV1rbskyK
 s+lcY2RlHBj294TGZDoSPAjhYhNKhg5ZBz+XTpjihr7FOprQ5c4xYL6YSO6PHFYlcJzqIQ1MyCs
 82ZsY8zJCVZS0oqL4i0gqNaxqwwgvZuaJkI2k6sDhvrlFoHwHVw/hYDQtN185vzDf/mDFrHJ3s1
 Xl3w9GHxWmRNkZiMfz8a7RKd1gRizKkT523ppZQk6/dTgddQqNVVdGeUe9vMsZ6JNa6yYzjW8DA
 fsp2N6VOBGxPPcUnnbhYA0kM3VmDQKW/UYEhk+QSV1negqONLdVGB6rWnsgT+TXGnAanoQJXp1/
 plGsDa2uyoZu3Rg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 08:33:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6017

There were leftover references to the extensible SDK after moving the
devtool documentation from the Extensible SDK document to its own
devtool document.

This patch follows the bulk move to make it clear what was modified in
the document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/devtool.rst | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index 4b91cf0f47201679b1db93261060b04db3ac53d6..f8820bbe17dd26e16ce713e3704745e802608335 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -678,7 +678,8 @@ mind:
 
 -  The environment in which Make runs is set up with various standard
    variables for compilation (e.g. :term:`CC`, :term:`CXX`, and so forth) in a
-   similar manner to the environment set up by the SDK's environment
+   similar manner to the environment set up by an :ref:`SDK
+   <overview-manual/concepts:Application Development SDK>`'s environment
    setup script. One easy way to see these variables is to run the
    ``devtool build`` command on the recipe and then look in
    ``oe-logs/run.do_compile``. Towards the top of this file, there is
@@ -764,9 +765,6 @@ these behaviors ensure the reproducibility and integrity of the build.
       ``devtool add`` does not receive the other parts, which results in
       several "command not found" errors.
 
-   -  In order to support adding Node.js modules, a ``nodejs`` recipe
-      must be part of your SDK.
-
 As mentioned earlier, you can also add Node.js modules directly from a
 repository or local source tree. To add modules this way, use
 ``devtool add`` in the following form::
@@ -874,10 +872,8 @@ Recipes often need to use files provided by other recipes on the
 :term:`Build Host`. For example,
 an application linking to a common library needs access to the library
 itself and its associated headers. The way this access is accomplished
-within the extensible SDK is through the sysroot. There is one sysroot per
-"machine" for which the SDK is being built. In practical terms, this
-means there is a sysroot for the target machine, and a sysroot for
-the build host.
+is through the :term:`Sysroot`. There is a sysroot for the target machine, and a
+sysroot for the build host.
 
 Recipes should never write files directly into the sysroot. Instead,
 files should be installed into standard locations during the
@@ -891,8 +887,7 @@ remain free from stale files.
 Packaging
 ---------
 
-Packaging is not always particularly relevant within the extensible SDK.
-However, if you examine how build output gets into the final image on
+If you examine how build output gets into the final image on
 the target device, it is important to understand packaging because the
 contents of the image are expressed in terms of packages and not
 recipes.

-- 
2.47.1


