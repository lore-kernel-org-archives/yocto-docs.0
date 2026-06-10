Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BC8CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:01:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15711.1781082067011331243
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 02:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vpUGwI+g;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gcs1PvN1GbRvGSFO8OlQHirK7YAx/EyldPKMxxug3dI=; b=vpUGwI+gaCyhn0hAKh8S45VvpE
	xmLglUIkJNxz7+rVTdNSgBVsLA+/whEEq8425Ikyp3t9PrLWsoZ9I29vjxT+pMwIQd+rg/Yx5SCsX
	hBabQECMfL+HaNxw4eQXnlqmQHUhXnt0Muqn7f/HqTkO5uPqrBPK5XxPViKuUQzZN9qPrE0e6NPom
	UhlOl/CYuXHeg39in9Oasd2HfTpTWeA829Uqf9Szz0KZpf5jTMnbofaRsIwm2RB5JxFVtkoZ22CX7
	Yy3SDmRCyw3DAtQGxn8cNKb4oZyi1YiFjDhrCNk5bccCK4v8Guom50mKqKulGsYUh0HVPFRI9nuIT
	H2SQvaZw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:55358 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXEo4-00000008QEA-0teQ
	for docs@lists.yoctoproject.org;
	Wed, 10 Jun 2026 05:01:05 -0400
Date: Wed, 10 Jun 2026 05:01:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: change "setup" to "set up" when used as an
 action
Message-ID: <b74ab4e0-603a-9753-da0e-2b3cbe7e8afb@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 09:01:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9672


Similar to the change in the Overview Manual, the proper spelling is
"setup" when a noun but "set up" when representing an action. This
change is dev manual-wide.

There appear to be no similar changes related to "checkout" versus
"check out."

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/hashequivserver.rst b/documentation/dev-manual/hashequivserver.rst
index c866f5001..75b77c30b 100644
--- a/documentation/dev-manual/hashequivserver.rst
+++ b/documentation/dev-manual/hashequivserver.rst
@@ -11,8 +11,8 @@ This document will guide you through the steps required to set up the reference
 Hash Equivalence server provided by the :oe_git:`bitbake-hashserv
 </bitbake/tree/bin/bitbake-hashserv>` script in :term:`BitBake`.

-This guide will explain how to setup a local Hash Equivalence server and does
-not explain how to setup the surrounding infrastructure to secure this server.
+This guide will explain how to set up a local Hash Equivalence server and does
+not explain how to set up the surrounding infrastructure to secure this server.

 Hash Equivalence Server Setup
 =============================
diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index cade9e2b1..833e1631e 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -3,14 +3,14 @@
 Setting Up the Poky Reference Distro Manually
 *********************************************

-While the default way to setup the :term:`Poky` reference distro is to use
-``bitbake-setup``, it is also possible to manually setup the environment. This
+While the default way to set up the :term:`Poky` reference distro is to use
+``bitbake-setup``, it is also possible to manually set up the environment. This
 document guides through this setup step-by-step.

 .. note::

    This document will produce a setup similar to what is described in
-   :doc:`/brief-yoctoprojectqs/index`, which shows how to setup :term:`Poky`
+   :doc:`/brief-yoctoprojectqs/index`, which shows how to set up :term:`Poky`
    with ``bitbake-setup``.

 Obtaining The Source Repositories
@@ -41,7 +41,7 @@ Throughout the documentation, we will use ``bitbake-builds`` as the name of the
    $ cd bitbake-builds

 You need to get a copy of the different :term:`layers <Layer>` needed
-to setup the :term:`Poky` reference distribution on your build host. Use the
+to set up the :term:`Poky` reference distribution on your build host. Use the
 following commands:

 .. code-block:: shell
@@ -90,7 +90,7 @@ an entire Linux distribution, including the toolchain, from source.
       page of the Yocto Project Wiki.

 #.  **Initialize the Build Environment:** From your current working directory,
-    setup a build environment with the following command:
+    set up a build environment with the following command:

     .. code-block:: shell

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 2aa3d5da5..4ea27fceb 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -235,7 +235,7 @@ particular working environment and set of practices.
        equivalence feature.

        See the :doc:`/dev-manual/hashequivserver` section of the Yocto Project
-       Development Tasks Manual for details on how to setup a
+       Development Tasks Manual for details on how to set up a
        :ref:`overview-manual/concepts:Hash Equivalence` server.

     -  Set up an Autobuilder and have it populate the sstate cache and
@@ -606,7 +606,7 @@ Initializing the Build Environment
 Initializing the build environment is a common task, as it needs to be done for
 each new instance of the shell where the :term:`Poky` reference distro was set up:

--  If ``bitbake-setup`` was used to setup the :term:`Poky` reference distro, you
+-  If ``bitbake-setup`` was used to set up the :term:`Poky` reference distro, you
    need to source the ``init-build-env`` file of the :term:`bitbake:Setup`
    directory that was created after the :ref:`bitbake:ref-bbsetup-command-init`
    command execution:
@@ -616,7 +616,7 @@ each new instance of the shell where the :term:`Poky` reference distro was set u
       $ source <setup-dir>/build/init-build-env


--  If the :term:`Poky` distro was setup using manual clones of the layers, you
+-  If the :term:`Poky` distro was set up using manual clones of the layers, you
    need to source the ``oe-init-build-env`` script present in the
    :term:`OpenEmbedded-Core (OE-Core)` layer:

@@ -624,7 +624,7 @@ each new instance of the shell where the :term:`Poky` reference distro was set u

       $ source openembedded-core/oe-init-build-env

-This will setup your current shell and change the current working directory to
+This will set up your current shell and change the current working directory to
 the :term:`Build Directory`.

 Where To Go From Here

