Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9766CCD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 19:14:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2158.1778267686264403809
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 12:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lB1UoOey;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MBzYVynX2pKxYhBi/Vlq2VtwMHL9VBVEIvAUDcszsyo=; b=lB1UoOeyOS2pdri33RSGgLDcd4
	rRHKZ/ML/z4xaLdrlgG49hdmKJ70z+ULvUFyJx0YvhA5b2eJfmXdKcQMr4iEj8xKWpDythtaCqdJq
	l8zuEn4OmNSsZ5GjXr3uv3eQdApKqVP1l8JVFMEOuHcjO+KwLJ51QqI2p1Y8eESfMLhiwDCLA2k8S
	rqzy6GXMlnzzs7tm8guih/U/kih+6B1aNsAXnCMNUCRCEndmLkD5Co/Jpqo/0urhDEq7wMXqZ9MGu
	KKIF2bIDdBepl1wTk35UAhsWwRrQ6lCZr0MatgCsPmZMh/RbYt31A9fIThDZJFwSNxFEUm+jp3I3O
	eGdEUrwA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37320 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLQen-00000004Ofj-3Lp5
	for docs@lists.yoctoproject.org;
	Fri, 08 May 2026 15:14:45 -0400
Date: Fri, 8 May 2026 15:17:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] YP Quick Build: use "set up" as a verb
Message-ID: <24bc012b-dc44-ca34-b3d0-b08200bf77d8@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 19:14:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9420


Pedantically speaking, the difference between "setup" and "set up" is
explained here:

  https://grammarist.com/spelling/set-up-vs-setup/

- "setup" is one word when used as a noun
- "set up" is two words when it functions as a verb

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  Over time, I will fix the rest of the docs similarly.

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7fbf92098..34a04cc96 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -88,7 +88,7 @@ Use Git to Clone bitbake-setup
 ==============================

 Once you complete the setup instructions for your machine, you need to
-get a copy of the ``bitbake-setup`` tool to setup the :term:`Poky` reference
+get a copy of the ``bitbake-setup`` tool to set up the :term:`Poky` reference
 distribution on your build host. Use the following commands to clone
 the bitbake repository.

@@ -102,9 +102,9 @@ Setup a build environment with the following command:

    $ ./bitbake/bin/bitbake-setup init

-By default, this will setup a top directory in the current directory.
+By default, this will set up a top directory in the current directory.

-If you prefer to setup your builds in a different top directory, for example
+If you prefer to set up your builds in a different top directory, for example
 ``$HOME/bitbake-builds``, you can set it with the :ref:`bitbake:ref-bbsetup-command-settings` command:

 .. code-block:: console
@@ -219,7 +219,7 @@ This directory contains:

 .. note::

-   It is also possible to setup the :term:`Poky` reference distro manually. For
+   It is also possible to set up the :term:`Poky` reference distro manually. For
    that refer to the :doc:`/dev-manual/poky-manual-setup` section of the Yocto
    Project Development Tasks Manual.

@@ -245,7 +245,7 @@ an entire Linux distribution, including the toolchain, from source.

 #.  **Initialize the Build Environment:** Source the ``init-build-env``
     environment setup script within the :term:`bitbake:BitBake build` directory
-    to setup the :term:`BitBake` build environment on your host:
+    to set up the :term:`BitBake` build environment on your host:

     .. code-block:: console

@@ -279,7 +279,7 @@ an entire Linux distribution, including the toolchain, from source.

        These set up the environment similar to what was previously in the local
        configuration file :ref:`local.conf <structure-build-conf-local.conf>`,
-       which is now largely empty. To setup the build how it was done
+       which is now largely empty. To set up the build how it was done
        previously, see the :doc:`/dev-manual/poky-manual-setup` section of the
        Yocto Project Development Tasks Manual.


