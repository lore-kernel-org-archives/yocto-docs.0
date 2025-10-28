Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A08CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 15:56:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.12753.1761667018248708433
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 08:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Au85QGSK;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oLBqWBPEaEbAWtV0ERniEfP9Exu6a0oVrtKRV3O4wUU=; b=Au85QGSKpju44xNaFUTS9kxnFm
	EtmIEOf+CbeWmAOGEyXr5LoC07cs8pz+u5L5VH4+n40eD6BM01siuG9qvIcX6HFEECtgba7AvhfUu
	CygF+sALKKQGf79Zdc3AO7TnlzdWznjbRu+iS1mrCcqFGAuwXdv2cxbkU8hLVIEnWUIsJuDotP2bm
	DG4mQ/NtwhnMfmZPDbp4w9uzHFVsr1To1MdD0UXb7fRIfGVhKp+LDHMuMHW+NctUWm8TwtQQQN1yA
	FrXbILOThj8H32sbtB1KzDAV/xSVUqONJSkXIRc4/a/KJu6SlaU9yRcW3dc2fRbCTGv4d19+i1baR
	6JUTAYYg==;
Received: from [147.129.179.166] (port=44736 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDm46-0000000DCkH-26FA
	for docs@lists.yoctoproject.org;
	Tue, 28 Oct 2025 11:56:56 -0400
Date: Tue, 28 Oct 2025 11:59:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual/new-recipe.rst: update "recipetool -h" output
Message-ID: <30f458a9-3d34-3c28-9e8e-5aad593f13fe@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-5212282-1761667188=:3890502"
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
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 15:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7884

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-5212282-1761667188=:3890502
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT


Update the output of "recipetool -h" to include the missing "edit"
subcommand.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index aa4fb97a4..705623dd3 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -83,19 +83,20 @@ command::
    OpenEmbedded recipe tool

    options:
-     -d, --debug     Enable debug output
-     -q, --quiet     Print only errors
-     --color COLOR   Colorize output (where COLOR is auto, always, never)
-     -h, --help      show this help message and exit
+     -d, --debug       Enable debug output
+     -q, --quiet       Print only errors
+     --color COLOR     Colorize output (where COLOR is auto, always, never)
+     -h, --help        show this help message and exit

    subcommands:
-     create          Create a new recipe
-     newappend       Create a bbappend for the specified target in the specified
-                       layer
-     setvar          Set a variable within a recipe
-     appendfile      Create/update a bbappend to replace a target file
-     appendsrcfiles  Create/update a bbappend to add or replace source files
-     appendsrcfile   Create/update a bbappend to add or replace a source file
+     newappend         Create a bbappend for the specified target in the specified layer
+     create            Create a new recipe
+     setvar            Set a variable within a recipe
+     appendfile        Create/update a bbappend to replace a target file
+     appendsrcfiles    Create/update a bbappend to add or replace source files
+     appendsrcfile     Create/update a bbappend to add or replace a source file
+     edit              Edit the recipe and appends for the specified target. This obeys $VISUAL if set,
+                       otherwise $EDITOR, otherwise vi.
    Use recipetool <subcommand> --help to get help on a specific command

 Running ``recipetool create -o�OUTFILE`` creates the base recipe and
--8323329-5212282-1761667188=:3890502--

