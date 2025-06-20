Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6850C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 10:28:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.4699.1750415332949068643
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 03:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vFrzwksB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c2HCAzsHz60uQYPx0ZCBZARQpckxTbYmjrmx3hHJ1oE=; b=vFrzwksB8RtIgpM7RNjAA3zo8K
	MhB0bgY0zfYGemJ4K9ON0Qy6wiSvgNWdPzc/Ktd8pZaoyG8fu+22aFYT7XT+WW8nht+1r99GUo/s3
	yTOveW2DiFF8uXZWdxCcfpV4EiufhRkR+uPa6YJz1+ruJqf2okAeRJsy8eGTL2SOwEqd3lHua7yO8
	ZNlnLZPfgy3AFU4Yn+fUXTCYkxJvLFzeqsJTRvEuTQoodD5aL9aGy7pFYhBtMvQafAEJ3sOQpuWRY
	MeLuulf24cvF0ZFlDu1U7Ria4nSg8oUKaE0KfK4fmVGa5QG0LyBi45gICq4CleukbvmwL5t2sd6ZB
	FP5BZIgQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:44878 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSYzJ-0000000GMik-2PMZ
	for docs@lists.yoctoproject.org;
	Fri, 20 Jun 2025 06:28:51 -0400
Date: Fri, 20 Jun 2025 06:28:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: CH 2, small number of clarifications
Message-ID: <bf003426-3d6b-c35b-769e-a09af45b05e1@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 10:28:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7123


  - drop reference to "opkg", just refer in general to packagers
  - correct what "QEMU" stands for (missing space)
  - correct version conditional
  - add a couple extra steps to typical workflow
  - drop implication that one can modify local poky checkout

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index d77da0427..44bd2de13 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -109,7 +109,7 @@ particular working environment and set of practices.

     -  Keep your cross-development toolchains updated. You can do this
        through provisioning either as new toolchain downloads or as
-       updates through a package update mechanism using ``opkg`` to
+       updates through a package update mechanism to
        provide updates to an existing toolchain. The exact mechanics of
        how and when to do this depend on local policy.

@@ -159,7 +159,7 @@ particular working environment and set of practices.
        are made.

     -  Allows triggering of automated image booting and testing under
-       the QuickEMUlator (QEMU).
+       the Quick EMUlator (QEMU).

     -  Supports incremental build testing and from-scratch builds.

@@ -310,7 +310,7 @@ Project Build Host:

    -  GNU make &MIN_MAKE_VERSION; or greater

-   If your build host does not meet any of these listed version
+   If your build host does not satisfy all of these listed version
    requirements, you can take steps to prepare the system so that you
    can still use the Yocto Project. See the
    ":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
@@ -568,7 +568,7 @@ extension accordingly.
 Locating Yocto Project Source Files
 ===================================

-This section shows you how to locate, fetch and configure the source
+This section shows you how to locate, fetch, unpack, patch and configure the source
 files you'll need to work with the Yocto Project.

 .. note::
@@ -720,11 +720,11 @@ Follow these steps to create a local version of the upstream
       $ git branch
       * master

-   Your local repository of poky is identical to the
-   upstream poky repository at the time from which it was cloned. As you
+   Your local repository of poky is initially identical to the
+   upstream poky repository from which it was cloned. As you
    work with the local branch, you can periodically use the
-   ``git pull --rebase`` command to be sure you are up-to-date
-   with the upstream branch.
+   ``git pull`` command to be sure you stay up-to-date
+   with the upstream poky branch.

 Checking Out by Branch in Poky
 ------------------------------

