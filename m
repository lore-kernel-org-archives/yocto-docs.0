Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD6AC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 17:08:22 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.web11.80.1714756094009421358
 for <docs@lists.yoctoproject.org>;
 Fri, 03 May 2024 10:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VWHLg6bJVz5gp;
	Fri,  3 May 2024 19:08:11 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4VWHLg2bFyzpYJ;
	Fri,  3 May 2024 19:08:11 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 03 May 2024 19:07:45 +0200
Subject: [PATCH] docs: brief-yoctoprojectqs: explicit version dependency on
 websockets python module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-websockets-module-v1-1-4065c348276d@cherry.de>
X-B4-Tracking: v=1; b=H4sIAOAZNWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNj3fLUpOL85OzUkmLd3PyU0pxU3RSztKREQ6NEE0NzQyWgvoKi1LT
 MCrCZ0bG1tQC4w229YwAAAA==
To: Joshua Watt <JPEWhacker@gmail.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Quentin Schulz <foss+yocto@0leil.net>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 May 2024 17:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5214

From: Quentin Schulz <quentin.schulz@cherry.de>

We now check that the websockets module version is at least 9.1 in
bitbake itself so we can specify more precisely what "recent version"
means.

While at it, list which distributions have a recent enough websockets
python module in their package feed and give some hint at how to support
other distributions.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This is done according to the pending patch:
https://lore.kernel.org/bitbake-devel/20240502183516.1216885-1-JPEWhacker@gmail.com/T/#u

Still wondering if we should add this to poky.yaml.in as a "hard"
dependency? If we do, how do we plan to handle distros which do not have
(a recent enough) websockets python module?
---
 documentation/brief-yoctoprojectqs/index.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 4301bfd97..c5400e4ac 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -256,8 +256,11 @@ an entire Linux distribution, including the toolchain, from source.
          BB_HASHSERVE = "auto"
          BB_SIGNATURE_HANDLER = "OEEquivHash"
 
-      The hash equivalence server needs a recent version of python
-      websockets installed to work correctly.
+      The hash equivalence server needs the websockets python module version 9.1
+      or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream
+      9 and later, and Ubuntu 22.04 (LTS) and later, all have a recent enough
+      package. Other supported distributions need to get the module some other
+      place than their package feed, e.g. via ``pip``.
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:

---
base-commit: 291dae69b7ecc5ae49f378a7098c1187c820765b
change-id: 20240503-websockets-module-d6fba12a4171

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


