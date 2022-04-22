Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F60C54F3E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8451.1650633214477880380
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 06:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id DCC621BF218;
	Fri, 22 Apr 2022 13:13:31 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/2] docs: ref-manual: variables: add hashed password example
 in EXTRA_USERS_PARAMS
Date: Fri, 22 Apr 2022 15:13:15 +0200
Message-Id: <20220422131316.283346-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2851

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Add examples for hashed hardcoded passwords from extrausers.bbclass so
that this feature is not hidden away.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/variables.rst | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1bfa66778..f8808cc05 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2338,6 +2338,37 @@ system and gives an overview of their function and contents.
          # usermod -s /bin/sh tester; \
          # "
 
+      Hardcoded passwords are supported via the ``-p`` parameters for
+      ``useradd`` or ``usermod``, but only hashed.
+
+      Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
+      passwords. First on host, create the (escaped) password hash::
+
+         printf "%q" $(mkpasswd -m sha256crypt tester01)
+
+      The resulting hash is set to a variable and used in ``useradd`` command parameters::
+
+         inherit extrausers
+         PASSWD = "\$X\$ABC123\$A-Long-Hash"
+         EXTRA_USERS_PARAMS = "\
+             useradd -p '${PASSWD}' tester-jim; \
+             useradd -p '${PASSWD}' tester-sue; \
+             "
+
+      Finally, here is an example that sets the root password::
+
+         inherit extrausers
+         EXTRA_USERS_PARAMS = "\
+             usermod -p '${PASSWD}' root; \
+             "
+
+      .. note::
+
+         From a security perspective, hardcoding a default password is not
+         generally a good idea or even legal in some jurisdictions. It is 
+         recommended that you do not do this if you are building a production 
+         image.
+
       Additionally there is a special ``passwd-expire`` command that will
       cause the password for a user to be expired and thus force changing it
       on first login, for example::
-- 
2.35.1


