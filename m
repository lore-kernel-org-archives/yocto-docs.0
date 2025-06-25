Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97CAC7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 09:24:08 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.11498.1750843446732145583
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 02:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=gPnYOsKJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b0n3qXgHImksOcZxPnz1qW1m0S+2f3T8Y9Q0Nfqb134=; b=gPnYOsKJ/0j9GcKvpK8uoFOviC
	au90Eg8awESzvQozG0Ogmpx+9HC3gOvkr44qgbbg99mHygcSZEU8UCfEbRcevGIBjxMB9Ns/TnBnq
	2YLL/r8eBIETPYuaGXs6FmiCde7skbidF01Rdpl9v7VenHlmorIccan2+lazXXEAlJWtzcY1kXbFA
	yDU/JYudicqvJs/vb5S/TLQI4I093HiWQ/OQREOrPEc8PkLCkICqBue+uKHgQ5RVq6geXFy1A5qv8
	HaWeRNowiRdF+gL/H8d9GgB1EvZJ1uUD9HtUN/iTnzAtC4Gcp5eIW+tdzvEv0a/W9lrz83JrO3cjf
	cdFHxt/A==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:56696 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uUMMI-00000000HiD-316r
	for docs@lists.yoctoproject.org;
	Wed, 25 Jun 2025 05:24:05 -0400
Date: Wed, 25 Jun 2025 05:23:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: simplify recipe names to use "oe_git" links
Message-ID: <5c8eda5e-5bcf-b5d2-9d12-73922ead8d14@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 25 Jun 2025 09:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7223


Shorten a small number of cumbersome recipe names by replacing them
with :oe_git: markup to link to their repositories.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index c49881efe..a7a6603a6 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -276,11 +276,11 @@ upgrading the recipe to a future version is as simple as renaming the
 recipe to match the new version.

 Here is a simple example from the
-``meta/recipes-devtools/strace/strace_5.5.bb`` recipe where the source
-comes from a single tarball. Notice the use of the
+:oe_git:`strace recipe </openembedded-core/tree/meta/recipes-devtools/strace>`
+where the source comes from a single tarball. Notice the use of the
 :term:`PV` variable::

-   SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
+   SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \

 Files mentioned in :term:`SRC_URI` whose names end in a typical archive
 extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so
@@ -292,7 +292,7 @@ another example that specifies these types of files, see the
 Another way of specifying source is from an SCM. For Git repositories,
 you must specify :term:`SRCREV` and you should specify :term:`PV` to include
 a ``+`` sign in its definition. Here is an example from the recipe
-:oe_git:`meta/recipes-sato/l3afpad/l3afpad_git.bb </openembedded-core/tree/meta/recipes-sato/l3afpad/l3afpad_git.bb>`::
+:oe_git:`l3afpad_git.bb </openembedded-core/tree/meta/recipes-sato/l3afpad/l3afpad_git.bb>`::

    SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"

@@ -347,8 +347,8 @@ paste them into your recipe and then run the build again to continue.
    continuing with the build.

 This final example is a bit more complicated and is from the
-``meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb`` recipe. The
-example's :term:`SRC_URI` statement identifies multiple files as the source
+:oe_git:`rxvt-unicode </openembedded-core/tree/meta/recipes-sato/rxvt-unicode>`
+recipe. The example's :term:`SRC_URI` statement identifies multiple files as the source
 files for the recipe: a tarball, a patch file, a desktop file, and an icon::

    SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \

