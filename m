Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B553C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:13:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10789.1789550019012975368
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 02:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Y80V+RTd;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hru107ntnnRnj8tkTtC8z6rZprahHebuGXI3wHefpL4=; b=Y80V+RTdNcSfW8BzP7RXKSUJJ9
	7ddMNCD0uUBUc132hMeTycw4qGpnV8XF1uPwlpcQOWd6hbsiemsXXaVkkp5GmtrUv6HXD5bI8TFDP
	KjIofeN4flFkD3W+hk15ad8uhqbvdtPBncU7+1/D9IOJu6s7UFTDQyM4DYJKIeEioykRLIpjj+A2U
	v1Mfstkx/iDakzOj9aQZjuyM7VxXKrATnXgPXpzAHcxKRGKbvFZ0bzjSqCVwfDAA9GySAjS7jQAMx
	gn7MA3n6x2SqtciIreawq4lzcZokQ+VgrUZe5sdM5rXjLf2vfzmuTEaDpNBQeZByw7QbN4mb4ohAF
	s5O/dNzQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:51130 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x6lhv-0000000FpGx-2LIR
	for docs@lists.yoctoproject.org;
	Wed, 16 Sep 2026 05:13:37 -0400
Date: Wed, 16 Sep 2026 05:11:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: update pre-release recipes section, drop ref to
 "irssi"
Message-ID: <1eaede83-5957-d74e-be76-b2f13fc40e73@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 16 Sep 2026 09:13:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10522


The section "Properly Versioning Pre-Release Recipes" contains a
reference to the irssi recipe which no longer uses a release
candidate, so reword the section to use a generic explanation, then
refer to OE's avahi recipe as an actual example.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 3f360597f..e8ad38b15 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1042,25 +1042,33 @@ The following lists specific examples of virtual providers:
 Properly Versioning Pre-Release Recipes
 =======================================

-Sometimes the name of a recipe can lead to versioning problems when the
-recipe is upgraded to a final release. For example, consider the
-``irssi_0.8.16-rc1.bb`` recipe file in the list of example recipes in
-the ":ref:`dev-manual/new-recipe:storing and naming the recipe`" section.
-This recipe is at a release candidate stage (i.e. "rc1"). When the recipe is
-released, the recipe filename becomes ``irssi_0.8.16.bb``. The version
-change from ``0.8.16-rc1`` to ``0.8.16`` is seen as a decrease by the
-build system and package managers, so the resulting packages will not
-correctly trigger an upgrade.
-
-In order to ensure the versions compare properly, the recommended
-convention is to use a tilde (``~``) character as follows::
-
-  PV = "0.8.16~rc1"
-
-This way ``0.8.16~rc1`` sorts before ``0.8.16``. See the
-":ref:`contributor-guide/recipe-style-guide:version policy`" section in the
-Yocto Project and OpenEmbedded Contributor Guide for more details about
-versioning code corresponding to a pre-release or to a specific Git commit.
+Occasionally, someone wants to release a recipe that is clearly marked
+as a `release candidate` --- say, ``app_2.0-rc1.bb`` --- until the
+eventual release of ``app_2.0.bb``. The problem with this approach is
+that, based on release numbering, the eventual version change from ``2.0-rc1``
+to ``2.0`` would be seen as a `decrease` by the build system and package
+managers, so the resulting packages would not trigger a proper upgrade.
+
+In order for the versions to compare properly, the recommended
+convention is to name the recipe file with the eventual final
+release --- ``app_2.0.bb`` --- but, inside the recipe file, set
+the ``PV`` variable to incorporate the release candidate number using
+the tilde (``~``) character::
+
+   PV = "2.0~rc1"
+
+ensuring that ``2.0-rc1`` sorts before ``2.0``.
+
+This is exactly the approach taken with OpenEmbedded's ``avahi`` recipe,
+whose current ``avahi_0.9.bb`` recipe file identifies that it is now on
+its `fifth` release candidate::
+
+   PV = "0.9~rc5"
+
+See the ":ref:`contributor-guide/recipe-style-guide:version policy`"
+section in the Yocto Project and OpenEmbedded Contributor Guide for more
+details about versioning code corresponding to a pre-release or to a
+specific Git commit.

 Post-Installation Scripts
 =========================

