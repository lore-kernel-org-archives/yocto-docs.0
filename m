Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0B9C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 19:11:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2099.1787339493928794383
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 12:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HpwJp3Oq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y2lbvkJia1IDnMqGenSDNUJVrLR6BMiIHt5kZRjZ0TA=; b=HpwJp3OqCyl20cOBL7iDLxb5c6
	bAzpyPX22bUlww8mRwmLQ8Q2vN4D61stVePtZtC5ld42O9ydAlQLqMfUB/Lp/HJxkLhwTM2fPUa8/
	zR9gtNfbKZdvLNhMYOi0tFLlKOr5Y43prmk1qhpFh4jBs6QGP5Fi1opdDG7cVqYVPRj4jvVQQTro7
	t/4zTltpPZuy87PS+qb2vM0NOi79pdQInPRCJT1+9f16xyFMnfpUT/3cVjhL17CyqvoDwDywDT0qR
	xKSBWukLDeZ1dSpAkMTgF7axLt9E4uaZ3iH+irncMZ5s9OfC3tu/0/w153dtDEiHFQ+/KDF0J5qch
	3X7VjJOw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37010 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wxUeF-00000003YLW-3VKv
	for docs@lists.yoctoproject.org;
	Fri, 21 Aug 2026 15:11:32 -0400
Date: Fri, 21 Aug 2026 15:09:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] documentation: use "https" protocol for
 git.yoctoproject.org
Message-ID: <a297f905-8632-7861-aff1-cfdf143e7548@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 19:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10320


Since the git protocol is not supported anymore, change all references
to "git.yoctoproject.org" to use https instead. This is a simple
textual substitution across the various manuals.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/README b/documentation/README
index a3301b662..27d650576 100644
--- a/documentation/README
+++ b/documentation/README
@@ -8,7 +8,7 @@ This repository is where manual development occurs. If you plan on contributing
 back to the Yocto Project documentation, you should set up a local Git
 repository based on this upstream repository as follows:

-  git clone git://git.yoctoproject.org/yocto-docs
+  git clone https://git.yoctoproject.org/yocto-docs

 Manual Organization
 ===================
diff --git a/documentation/bsp-manual/bsp.rst b/documentation/bsp-manual/bsp.rst
index 168d64e6e..b71786e59 100644
--- a/documentation/bsp-manual/bsp.rst
+++ b/documentation/bsp-manual/bsp.rst
@@ -60,7 +60,7 @@ repository unto itself and clicking on the layer name displays two URLs
 from which you can clone the layer's repository to your local system.
 Here is an example that clones the Raspberry Pi BSP layer::

-   $ git clone git://git.yoctoproject.org/meta-raspberrypi
+   $ git clone https://git.yoctoproject.org/meta-raspberrypi

 In addition to BSP layers, the ``meta-yocto-bsp`` layer is part of
 :yocto_git:`meta-yocto </meta-yocto>`. The ``meta-yocto-bsp`` layer maintains
@@ -177,7 +177,7 @@ section.

    #. *Clone the Layer:* ::

-         $ git clone git://git.yoctoproject.org/meta-intel.git
+         $ git clone https://git.yoctoproject.org/meta-intel.git
          Cloning into 'meta-intel'...
          remote: Counting objects: 15585, done.
          remote: Compressing objects: 100% (5056/5056), done.
@@ -210,7 +210,7 @@ section.
    your hardware most closely matches the ``meta-raspberrypi``, clone
    that layer::

-      $ git clone git://git.yoctoproject.org/meta-raspberrypi
+      $ git clone https://git.yoctoproject.org/meta-raspberrypi
       Cloning into 'meta-raspberrypi'...
       remote: Counting objects: 4743, done.
       remote: Compressing objects: 100% (2185/2185), done.
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 3937c54ad..49dc7a6e9 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -963,13 +963,13 @@ above:

       Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
       Running 'git init -q /srv/work/alex/my-build/meta-intel'
-      Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
+      Running 'git remote remove origin > /dev/null 2>&1; git remote add origin https://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
       Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
       Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel

       Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
       Running 'git init -q /srv/work/alex/my-build/poky'
-      Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
+      Running 'git remote remove origin > /dev/null 2>&1; git remote add origin https://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
       Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
       Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
       Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index cc984bbcc..3a974fdfc 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -73,7 +73,7 @@ The following steps describe how to set up the AUH utility:
    onto your development host. The following command uses Git to create
    a local copy of the repository on your system::

-      $ git clone git://git.yoctoproject.org/auto-upgrade-helper
+      $ git clone https://git.yoctoproject.org/auto-upgrade-helper
       Cloning into 'auto-upgrade-helper'... remote: Counting objects: 768, done.
       remote: Compressing objects: 100% (300/300), done.
       remote: Total 768 (delta 499), reused 703 (delta 434)
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index b36bea67c..321033b7b 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -741,8 +741,8 @@ Metadata to the build as a "type=kmeta" repository through the
 example, consider the following :term:`SRC_URI` statement from the
 ``linux-yocto_5.15.bb`` kernel recipe::

-   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
-              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
+   SRC_URI = "https://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+              https://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"

 ``${KMETA}``, in this context, is simply used to name the directory into
 which the Git fetcher places the Metadata. This behavior is no different
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 948718433..d9b4478d5 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -207,7 +207,7 @@ section:
    ``linux-yocto-4.12`` kernel and be in the ``standard/base`` branch::

       $ cd ~
-      $ git clone git://git.yoctoproject.org/linux-yocto-4.12 --branch standard/base
+      $ git clone https://git.yoctoproject.org/linux-yocto-4.12 --branch standard/base
       Cloning into 'linux-yocto-4.12'...
       remote: Counting objects: 6097195, done.
       remote: Compressing objects: 100% (901026/901026), done.
@@ -233,7 +233,7 @@ section:
    ``yocto-kernel-cache`` and switch to the ``yocto-4.12`` branch::

       $ cd ~
-      $ git clone git://git.yoctoproject.org/yocto-kernel-cache --branch yocto-4.12
+      $ git clone https://git.yoctoproject.org/yocto-kernel-cache --branch yocto-4.12
       Cloning into 'yocto-kernel-cache'...
       remote: Counting objects: 22639, done.
       remote: Compressing objects: 100% (9761/9761), done.
diff --git a/documentation/kernel-dev/maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
index 53b737608..48deec4ba 100644
--- a/documentation/kernel-dev/maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -30,8 +30,8 @@ example, the following commands clone the Yocto Project baseline Linux
 kernel that branches off ``linux.org`` version 4.12 and the
 ``yocto-kernel-cache``, which contains stores of kernel Metadata::

-   $ git clone git://git.yoctoproject.org/linux-yocto-4.12
-   $ git clone git://git.yoctoproject.org/linux-kernel-cache
+   $ git clone https://git.yoctoproject.org/linux-yocto-4.12
+   $ git clone https://git.yoctoproject.org/linux-kernel-cache

 For more information on
 how to set up a local Git repository of the Yocto Project Linux kernel
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index cdba7c50c..920908577 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -403,7 +403,7 @@ development branch in the repository. To help illustrate, consider the
 following example Git commands::

    $ cd ~
-   $ git clone git://git.yoctoproject.org/yocto-docs -b &DISTRO_NAME_NO_CAP;
+   $ git clone https://git.yoctoproject.org/yocto-docs -b &DISTRO_NAME_NO_CAP;

 In the previous example
 after moving to the home directory, the ``git clone`` command creates a
@@ -442,7 +442,7 @@ The most common use is to check out a working branch that matches a
 specific Yocto Project release. Here is an example::

    $ cd ~
-   $ git clone git://git.yoctoproject.org/yocto-docs
+   $ git clone https://git.yoctoproject.org/yocto-docs
    $ cd yocto-docs
    $ git fetch --tags
    $ git checkout tags/&DISTRO_NAME_NO_CAP;-&DISTRO; -b my_&DISTRO_NAME_NO_CAP;-&DISTRO;
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 3050b5d0f..02cd4b0e6 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -277,7 +277,7 @@ release selection:
    <!-- Bitbake versions which correspond to the metadata release -->
    <object model="orm.bitbakeversion" pk="1">
       <field type="CharField" name="name">&DISTRO_NAME_NO_CAP;</field>
-      <field type="CharField" name="giturl">git://git.yoctoproject.org/poky</field>
+      <field type="CharField" name="giturl">https://git.yoctoproject.org/poky</field>
       <field type="CharField" name="branch">&DISTRO_NAME_NO_CAP;</field>
       <field type="CharField" name="dirpath">bitbake</field>
    </object>
@@ -331,7 +331,7 @@ that includes the layer. In general all releases include the layer.
    <object model="orm.layer" pk="1">
       <field type="CharField" name="name">openembedded-core</field>
       <field type="CharField" name="layer_index_url"></field>
-      <field type="CharField" name="vcs_url">git://git.yoctoproject.org/poky</field>
+      <field type="CharField" name="vcs_url">https://git.yoctoproject.org/poky</field>
       <field type="CharField" name="vcs_web_url">https://git.yoctoproject.org/cgit/cgit.cgi/poky</field>
       <field type="CharField" name="vcs_web_tree_base_url">https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/%path%?h=%branch%</field>
       <field type="CharField" name="vcs_web_file_base_url">https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/%path%?h=%branch%</field>
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index a0c27499b..c8ec8e91e 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -236,7 +236,7 @@ Perform the following steps to install Toaster:
 #.  Checkout a copy of ``poky`` into the web server directory. You will
     be using ``/var/www/toaster``::

-      $ git clone git://git.yoctoproject.org/poky
+      $ git clone https://git.yoctoproject.org/poky
       $ git checkout &DISTRO_NAME_NO_CAP;

 #.  Install Toaster dependencies using the ``--user`` flag which keeps the

