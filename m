Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E411BC61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:15:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35050.1787832921636862734
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 05:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=IEjUpycN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AtjG9fvAn8xUN9xCba4adnJ0d/JJ4RQS0GV+Q0HTbJk=; b=IEjUpycNGzPleAs0yGlM1kTCjQ
	dd4xoS9pqU+4J+wVQwYh0tZA3eWABJGBtTeuAjrT57MYv42qKGzU8ZuFSgEjqWPV9VYhucjdKgkA1
	ko0+9PqEvlCJX4413FgqX0hgszpYJLMqG1pJgcr3RutMSf0MFuchKZG2EKgDdOsp4Ep7hj80ld/yD
	D1z4lwh0BLzArATMGBgI11ehtLYIlcDIgNjkuIGB9ZfCpeLw+sC66PbqetijigzSOHAUKnLf4SCXd
	3vCiy4//AGTdUfmrnGgWwActoS9S4ufu2pAm0+5HyPKO3E/7FOYLCH7MwtIjE4aI0MX/u0GXB+6vq
	1NXTeSZA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:49412 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wzZ0k-00000003uKc-0rpp
	for docs@lists.yoctoproject.org;
	Thu, 27 Aug 2026 08:15:19 -0400
Date: Thu, 27 Aug 2026 08:13:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] README: Correct capitalization, "Docbook" to "DocBook"
Message-ID: <9134188e-15a1-7164-2038-898a9d686879@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 12:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10381


Product is properly referred to as "DocBook".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/README b/documentation/README
index 5915a26c6..56abe83bb 100644
--- a/documentation/README
+++ b/documentation/README
@@ -200,12 +200,12 @@ were inherited from the DocBook CSS stylesheets.
 Sphinx design guidelines and principles
 =======================================

-The initial Docbook to Sphinx migration was done with an automated
+The initial DocBook to Sphinx migration was done with an automated
 tool called Pandoc (https://pandoc.org/). The tool produced some clean
 output markdown text files. After the initial automated conversion
 additional changes were done to fix up headings, images and links. In
 addition Sphinx has built in mechanisms (directives) which were used
-to replace similar functions implemented in Docbook such as glossary,
+to replace similar functions implemented in DocBook such as glossary,
 variables substitutions, notes and references.

 Headings
@@ -229,7 +229,7 @@ Here are the heading styles that we use in the manuals:
             Subsubsection      => ~~~~
               Subsubsubsection => ^^^^

-With this proposal, we preserve the same TOCs between Sphinx and Docbook.
+With this proposal, we preserve the same TOCs between Sphinx and DocBook.

 Built-in glossary
 =================
@@ -251,8 +251,8 @@ Global substitutions
 ====================

 The Yocto Project documentation makes heavy use of global
-variables. In Docbook these variables are stored in the file
-poky.ent. This Docbook feature is not handled automatically with
+variables. In DocBook these variables are stored in the file
+poky.ent. This DocBook feature is not handled automatically with
 Pandoc. Sphinx has builtin support for substitutions
 (https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#substitutions),
 however there are important shortcomings. For example they cannot be

