Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8922DCD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 11:34:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13492.1781696088924127561
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 04:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=B1duibHC;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x8JES5z/WuI9ffsBkZ61QZ5r+xVSuAJNENsHhK0CvAM=; b=B1duibHCX53X5NqUVULj3rdfj7
	86kSn9CY+Qt1IP5qjfuRKQ9k0z8lRkjAC41dIbat2IU2S5H3P03pTQfP7rZm31QhpQQNoPsc7SBMj
	AlBS/j/tRjdKbYEanEtH7RgyIqIWHYg2sgXu79cJAg77ghYblOymtezv22ZRQhrXKp/lYRqCk8zXQ
	rna6syoBNVv9WMlLyRSoMQwf45ouqwNrdr4NzQIskCbXZBl478RsK6kueX9uhE4VvkJir1q+eqYCm
	sXouzRGW8dW6DI19LfWqVJCfQt52ZTUdnpNpuKSMDGerAv8uGZIJz32GlvSO+Bu+p8I6LaUjAR1SZ
	IjAg8UcA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:44726 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZoXe-00000009MiB-0dLx
	for docs@lists.yoctoproject.org;
	Wed, 17 Jun 2026 07:34:47 -0400
Date: Wed, 17 Jun 2026 07:34:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: explain default value used for SUMMARY
 metadata
Message-ID: <c1cbec86-6b95-fb96-8676-f117082d17bb@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 11:34:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9772


Explain that if you don't set a value for the SUMMARY variable in a
recipe, it will get this default value from bitbake.conf:

  SUMMARY ?= "${PN} version ${PV}-${PR}"

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df3666f1c..bb142dc4b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10350,6 +10350,11 @@ system and gives an overview of their function and contents.
       :term:`DESCRIPTION` variable if :term:`DESCRIPTION` is
       not set in the recipe.

+      If you don't set this variable in your recipe file, it will contain
+      the default value as set in the ``bitbake.conf`` file::
+
+         SUMMARY ?= "${PN} version ${PV}-${PR}"
+
    :term:`SVNDIR`
       The directory in which files checked out of a Subversion system are
       stored.

