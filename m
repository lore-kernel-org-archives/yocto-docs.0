Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75A4CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 13:09:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19207.1781788197999945247
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 06:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=j0AtwaCy;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hI+t5maOKeeTAnvwAcl+JJwSr1Q2GuzLXr4aDliaBm8=; b=j0AtwaCyTcU98MyygZz0KbrjzU
	SMIJX1Chz0OXNfKyCXap6wuVyRqcOP+xhQuBe4Dj4qGzTPZW9SNKsY2G9rdzntcQ85zTOP/UEmQAY
	FjtEhn410h1vPkA61KZFxyUZ9EvekQNDV11/kVMSshXiS4KWp2KoWisNZOkqdmU06PTG/nGoCWLMA
	Jm0/VCXHFC8gTa0rmwF+s+Kv9nHEEVZsTGJO1j8mfCa/Q/5zNLvUOE8MK1qtI1FFrNW0A5aH0swya
	qsxqoM5cCToQD5v4vQGejgSYeLd6d24SNpN7R+M2deFoNQP+FqrAsZVQ+jPhAV4P4ixajR7iG2Nky
	+oklRYlg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:36410 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1waCVI-00000000ErF-0Lip
	for docs@lists.yoctoproject.org;
	Thu, 18 Jun 2026 09:09:56 -0400
Date: Thu, 18 Jun 2026 09:09:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] security-manual: warn about "root-login-with-empty-password"
 fragment
Message-ID: <c6714d6e-8855-6c07-3c7e-2841d7f314f8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 13:09:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9781


Mention that the development-related features that make an image less
secure might have also been added via a configuration fragment.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index 952808f3b..5493b32aa 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -108,6 +108,13 @@ system to make your images more secure:
    logging in for debugging or inspection easy during development but
    also means anyone can easily log in during production.

+   .. note::
+
+      It is also possible to set those same image features by including the
+      :term:`OpenEmbedded-Core (OE-Core)` configuration fragment
+      ``root-login-with-empty-password.conf``, so make sure that that
+      fragment has not been activated for your build configuration.
+
 -  It is possible to set a root password for the image and also to set
    passwords for any extra users you might add (e.g. administrative or
    service type users). When you set up passwords for multiple images or

