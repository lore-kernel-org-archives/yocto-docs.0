Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7C7CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 17:36:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3352.1781631370922987777
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 10:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=JKcxx3XN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h1Bl69dYYaOQzllP8aGvjpTkvwCwrJbf+0YVhy1+IPg=; b=JKcxx3XNV/qUSw3hKNQqlDtGUd
	ThyRPQApmIqHP39hoUMIM7wQuB5otXMHAjAqkeBlMKKOJPd7oUwn2DDMFL925Xc5/2Q/rz0VuPWFp
	g+Fv2x6km1q6gfpK8Nmjq1fhE8HI5xkxY/5j6mTQ/NwvSHjX/t1EQ9nvxDJfeN60fFEQgtLuMbeU4
	fiLHaWpgy7Ef3rZOrVLX9nwJ5J54NZfzRoZE3PI9w7w3ixW08zDl9mCte8DQF73WKXxbvZg8j/1WR
	CbSsHRB9lG+6VkLb1vc+RGJwdDLFw7IGeXFxiZUu3jYAe09+eLdzVuXFOti5z+80ggfA0rrlPJBgH
	z1HuN7GQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46124 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZXhe-00000007VJi-16cw
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 13:35:58 -0400
Date: Tue, 16 Jun 2026 13:35:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: update glossary entries for packaging backend
 variables
Message-ID: <19502e62-c54b-239f-1b9e-13f963beb9d9@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 17:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9762


Either clarify or correct the packaging backend information for the
package exclusion variables:

  -  PACKAGE_EXCLUDE
  -  BAD_RECOMMENDATIONS
  -  NO_RECOMMENDATIONS

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df3666f1c..82ff48fd5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -300,6 +300,9 @@ system and gives an overview of their function and contents.
       variable), the OpenEmbedded build system ignores your request and
       will install the packages to avoid dependency errors.

+      This variable is supported for the RPM and IPK packaging backends,
+      but not for DEB.
+
       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`PACKAGE_EXCLUDE` variables for related
       information.
@@ -6498,8 +6501,7 @@ system and gives an overview of their function and contents.
          functionality, such as kernel modules. It is up to you to add
          packages with the :term:`IMAGE_INSTALL` variable.

-      This variable is only supported when using the IPK and RPM
-      packaging backends. DEB is not supported.
+      This variable is supported for all packaging backends.

       See the :term:`BAD_RECOMMENDATIONS` and
       the :term:`PACKAGE_EXCLUDE` variables for
@@ -6930,8 +6932,7 @@ system and gives an overview of their function and contents.
       an iterative development process to remove specific components from a
       system.

-      This variable is supported by all of the RPM, DEB and IPK
-      packaging backends.
+      This variable is supported for all packaging backends.

       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`BAD_RECOMMENDATIONS` variables for

