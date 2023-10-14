Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05922CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 10:15:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.60038.1697278536404424161
 for <docs@lists.yoctoproject.org>;
 Sat, 14 Oct 2023 03:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lQP+9Sc0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L1+5p7/EI5XvKhue/9d5PhzNKvigFslFcIxsPGSQtMg=; b=lQP+9Sc0DpPVOSuv/Jv59rD9hY
	CEYqDXTSwn36KwNy2w1B0E0dNGnkKBoESPyy9w4RD3N4w5iSpDRSYnDxNVoYYP3SMq8E7u/B4ga2x
	mykchdLVszZrivz27GUIwf2kh+Xo0mzekffBCuqacvniGi19IAwo8qnuiO3cMPg4cww/XvJF25wAk
	FcSpA5FaiFgehFucxGXiJsjquS1wJjpaf96+D3auy2f/dLa/7n9tS/ZI90UFx6p3CsZq+/70rnj2B
	id3auamlzNGA4USiP0tNJMNiFAtW9/p8zVZWeKF1rXXRf35GWhlDF7vYHYRoeYKhkBJemkUih1YFq
	8DShkJrQ==;
Received: from [::1] (port=50480 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qrbg9-00D0hG-0R
	for docs@lists.yoctoproject.org;
	Sat, 14 Oct 2023 06:15:34 -0400
MIME-Version: 1.0
Date: Sat, 14 Oct 2023 06:15:23 -0400
From: rpjday@crashcourse.ca
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] profile-manual, Chapter 1, aesthetic cleanups
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <6d3b57846c1525e3663e7ee0b61dbd93@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 14 Oct 2023 10:15:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4371

Various aesthetic cleanups of section 1 of that manual, including:

   * replace 'HOWTO' with manual
   * add more examples of sdk-related images
   * font fixes

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/profile-manual/intro.rst 
b/documentation/profile-manual/intro.rst
index 93f8429ee..9d286b8fd 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -7,39 +7,41 @@ Yocto Project Profiling and Tracing Manual
  Introduction
  ============

-Yocto bundles a number of tracing and profiling tools --- this 'HOWTO'
+Yocto Project bundles a number of tracing and profiling tools --- this 
manual
  describes their basic usage and shows by example how to make use of 
them
-to examine application and system behavior.
+to analyze application and system behavior.

-The tools presented are for the most part completely open-ended and 
have
+The tools presented are, for the most part, completely open-ended and 
have
  quite good and/or extensive documentation of their own which can be 
used
  to solve just about any problem you might come across in Linux. Each
  section that describes a particular tool has links to that tool's
  documentation and website.

-The purpose of this 'HOWTO' is to present a set of common and generally
+The purpose of this manual is to present a set of common and generally
  useful tracing and profiling idioms along with their application (as
  appropriate) to each tool, in the context of a general-purpose
  'drill-down' methodology that can be applied to solving a large number
-(90%?) of problems. For help with more advanced usages and problems,
-please see the documentation and/or websites listed for each tool.
+of problems. For help with more advanced usages and problems,
+refer to the documentation and/or websites provided for each tool.

-The final section of this 'HOWTO' is a collection of real-world 
examples
-which we'll be continually adding to as we solve more problems using 
the
-tools --- feel free to add your own examples to the list!
+The final section of this manual is a collection of real-world examples
+which we'll be continually updating as we solve more problems using the
+tools --- feel free to suggest additions to what you read here.

  General Setup
  =============

  Most of the tools are available only in 'sdk' images or in images built
-after adding 'tools-profile' to your local.conf. So, in order to be 
able
-to access all of the tools described here, please first build and boot
-an 'sdk' image e.g. ::
+after adding 'tools-profile' to your ``local.conf`` file. So, in order 
to be able
+to access all of the tools described here, you can build and boot
+an 'sdk' image, perhaps one of: ::

     $ bitbake core-image-sato-sdk
+   $ bitbake core-image-weston-sdk
+   $ bitbake core-image-rt-sdk

-or alternatively by adding 'tools-profile' to the 
:term:`EXTRA_IMAGE_FEATURES` line in
-your local.conf::
+Alternatively,  you can add 'tools-profile' to the 
:term:`EXTRA_IMAGE_FEATURES` line in
+your ``local.conf`` file::

     EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile"

@@ -64,8 +66,8 @@ the tracing and profiling tools will be included in 
non-sdk images as well e.g.:
  If you've already built a stripped image, you can generate debug
  packages (xxx-dbg) which you can manually install as needed.

-To generate debug info for packages, you can add dbg-pkgs to
-:term:`EXTRA_IMAGE_FEATURES` in local.conf. For example::
+To generate debug info for packages, you can add 'dbg-pkgs' to
+:term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::

     EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"



