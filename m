Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40EACD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 13:47:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42844.1781876829874551711
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 06:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YXiLipAf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZVCaupUwV86CI834V4/Bw013jTOOFmGMJb1pIm/g0QI=; b=YXiLipAfzV4T5VmKZjVpLA75sX
	UBE9PVIx8+94MJgQPY/SXQoqY/XixLB1PzXo3ZIfcD2+AqfJNDt8vouM1erqBiYkaH5W0DngPCUvw
	F69GA2U8KoeZZas5qlOFfzamm38LegLVEbZ1mkUnja5fXiwiK2Myk4gRz9RHyooEZRqyUbpi8nuui
	dbVh3FkJdnvZwx5F9qkN4r7m1FEuELrKoxdOuBwb5DgFVRs8t5aiBLLaPQh9dkLIWHulPwJBszDJ5
	q0Bl2kG53mRL2aMjouyvQ4xxpXS1Ow6cNLTvPKOj3iL7Pwf1ReZTpRGa4OzDkbfFZWbS+Ji54xmDX
	LM+4j77w==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:60832 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1waZYp-00000002vQC-2lcU
	for docs@lists.yoctoproject.org;
	Fri, 19 Jun 2026 09:47:08 -0400
Date: Fri, 19 Jun 2026 09:47:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] security-manual: clarify text on avoid root logins, empty
 passwords
Message-ID: <29e35b25-c93d-536a-469d-c688176b387c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 13:47:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9786


Explain how, during development, it's convenient to allow root logins
and empty passwords in one of two ways:

  - explicitly setting image features, or
  - through an available configuration fragment

and advise on removing such settings for the production image.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  accidentally dropped a colon for a code snippet

diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index 952808f3b..d47a85b38 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -92,21 +92,20 @@ Considerations Specific to the OpenEmbedded Build System
 You can take some steps that are specific to the OpenEmbedded build
 system to make your images more secure:

--  Ensure that "allow-empty-password", "allow-root-login", or
-   "empty-root-password" are not one of your selected :term:`IMAGE_FEATURES`.
-   When creating a new project, the default is to provide you with an
-   initial ``local.conf`` file that enables these features using the
-   :term:`EXTRA_IMAGE_FEATURES`
-   variable with the line::
+-  During development, it's convenient to relax security in your builds
+   and allow the use of empty passwords or root logins. This is typically
+   done by adding the values "allow-empty-password", "allow-root-login", and
+   "empty-root-password" to your build's image features, commonly with the
+   addition of the line::

       EXTRA_IMAGE_FEATURES = "allow-empty-password empty-root-password allow-root-login"

-   To disable these features, simply comment out that line in your
-   ``local.conf`` file, or make sure :term:`IMAGE_FEATURES` does not contain
-   any of these features before producing your final image. Among other things,
-   leaving this in place sets the root password as blank, which makes
-   logging in for debugging or inspection easy during development but
-   also means anyone can easily log in during production.
+   to your ``local.conf`` file, or by enabling the exactly equivalent
+   configuration fragment "root-login-with-empty-password.conf".
+
+   If you're using either of these approaches during development,
+   make sure you remove or de-activate these settings before generating
+   your final production image.

 -  It is possible to set a root password for the image and also to set
    passwords for any extra users you might add (e.g. administrative or

