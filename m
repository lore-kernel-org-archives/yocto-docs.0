Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6332ACD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:56:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71652.1778579780818768231
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 02:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=h0kcva58;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ILa+JTbXd6p1lSptDV3KnDkkhsJjHg09lOzzx7KCuNA=; b=h0kcva58DROUb0t5fmuttCKVwh
	nVzNkcS62bdlhlnejXYJHkX7dkMKmgqZnl45NQulc72E/ikemwnIMsbs/eS+Mx7Ijim+bq/c1hngF
	uQXNVzgyzDHHdgnDjrdb3lwDv4K8ETAJKh43irpoVByZdRHRXDb7yasQE/kVTYAnP8hohTlPFQhrb
	3oM6/M89eKALisVHfG4sML8Y2LbWUp8p95dUjG5xSg4qTv6KE2yRCVDDi4839wdQ43vUCJR8pli6B
	utpd8vZAlE0F0wh9LzYmGmbulcQWO/Uw27HCRiufMXZd6cVCMyIvh6jw33bcpc3fkKdNPKrjJmLzx
	rUgUOhNA==;
Received: from [147.129.179.166] (port=42864 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMjqa-00000007LwG-3VX5
	for docs@lists.yoctoproject.org;
	Tue, 12 May 2026 05:56:19 -0400
Date: Tue, 12 May 2026 05:59:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: fix "checkout" versus "check out"
Message-ID: <b8e8a936-75cc-4535-1cf5-37e10a5818da@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 09:56:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9458


As with "setup" versus "set up", the pedants at grammarist.com explain
that "checkout" is used as a noun or adjective, while the
corresponding verb is two words, "check out."

  https://grammarist.com/spelling/checkout-check-out/

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 7408a4c62..67e85e174 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -169,7 +169,7 @@ these tarballs gives you a snapshot of the released files.
       BSP repository, the :term:`OpenEmbedded-Core (OE-Core)` and
       :term:`BitBake` repositories. For example, if you have checked out the "&DISTRO_NAME_NO_CAP;"
       branch of :term:`OpenEmbedded-Core (OE-Core)` and you are going to use ``meta-intel``, be
-      sure to checkout the "&DISTRO_NAME_NO_CAP;" branch of ``meta-intel``.
+      sure to check out the "&DISTRO_NAME_NO_CAP;" branch of ``meta-intel``.

 In summary, here is where you can get the project files needed for
 development:
@@ -417,7 +417,7 @@ local branch named "&DISTRO_NAME_NO_CAP;", which tracks the upstream
 branch would ultimately affect the upstream "&DISTRO_NAME_NO_CAP;" branch
 of the ``yocto-docs`` repository.

-It is important to understand that when you create and checkout a local
+It is important to understand that when you create and check out a local
 working branch based on a branch name, your local environment matches
 the "tip" of that particular development branch at the time you created
 your local branch, which could be different from the files in the
@@ -439,10 +439,10 @@ Yocto Project releases.

 When you create a local copy of the Git repository, you also have access
 to all the tags in the upstream repository. Similar to branches, you can
-create and checkout a local working Git branch based on a tag name. When
+create and check out a local working Git branch based on a tag name. When
 you do this, you get a snapshot of the Git repository that reflects the
 state of the files when the change was made associated with that tag.
-The most common use is to checkout a working branch that matches a
+The most common use is to check out a working branch that matches a
 specific Yocto Project release. Here is an example::

    $ cd ~
@@ -461,7 +461,7 @@ whose "HEAD" matches the commit in the repository associated with the
 "&DISTRO_NAME_NO_CAP;-&DISTRO;" tag. The files in your repository now exactly match that
 particular Yocto Project release as it is tagged in the upstream Git
 repository. It is important to understand that when you create and
-checkout a local working branch based on a tag, your environment matches
+check out a local working branch based on a tag, your environment matches
 a specific point in time and not the entire development branch (i.e.
 from the "tip" of the branch backwards).


