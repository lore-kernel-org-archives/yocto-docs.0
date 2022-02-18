Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2C9C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 16:50:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.13421.1645203017892904068
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 08:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 158D5E0002;
	Fri, 18 Feb 2022 16:50:14 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] ref-manual: classes: provide command with ready-to-use
 password
Date: Fri, 18 Feb 2022 17:49:50 +0100
Message-Id: <20220218164950.3277914-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Feb 2022 16:50:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2476

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

mkpasswd output requires to be escaped before being used as password in
a Bitbake variable. It was explicitly stated after the command, but to
be sure it's not missed, let's give the printf command which does escape
the string for us.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/classes.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 949217bf4..89203dfc5 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -603,12 +603,11 @@ Here is an example that uses this class in an image recipe::
        "
 
 Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
-passwords. First on host, create the password hash::
+passwords. First on host, create the (escaped) password hash::
 
-   mkpasswd -m sha256crypt tester01
+   printf "%q" $(mkpasswd -m sha256crypt tester01)
 
-The resulting hash is set to a variable and used in ``useradd`` command parameters.
-Remember to escape the character ``$``::
+The resulting hash is set to a variable and used in ``useradd`` command parameters::
 
    inherit extrausers
    PASSWD = "\$X\$ABC123\$A-Long-Hash"
-- 
2.35.1


