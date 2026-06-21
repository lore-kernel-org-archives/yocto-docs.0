Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98200CD98F0
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 19:36:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29461.1782070603408485704
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Jun 2026 12:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UEpHV7U1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rkr6jk8QORR3xJOkdBh2kmTraNhSmmZDObA4VLTDCm8=; b=UEpHV7U1N74g02W1Q0LteJizIb
	pxiiO7b1CEGBzquzLC3BYu4a+a2K4eNBQJpD2SUn7w216ixyai8XOR5XA4448UJnhtHrIpCESpO56
	DqSotDP1a0DuHH1cEFYnD6P5UeZh/uGFQIDLHKBmbrw3WP/ogUzG043giqrAYpGUrG1eDSwb4Yqu2
	ooCDxsIdd9l3+5o3WCz9Oae6XoH2wN5L0ioT8izPNELVnYw7OY6e3T/vIYKcDNrKhevALk4h43eOl
	l1y7KmKXuExxVoEdu9CMRu/90bg6apnj5wpI6NXjfzl7ylky6L1+UFMEyPx7gre4w9IEcHtsJFs3n
	tSH+z/GQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59530 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbNyC-00000008c2B-1CqV
	for docs@lists.yoctoproject.org;
	Sun, 21 Jun 2026 15:36:41 -0400
Date: Sun, 21 Jun 2026 15:36:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: small number of grammar/punctuation changes
Message-ID: <1f016852-03ef-1792-c8ae-54d04f1c59ab@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1687207760-1782070596=:1966440"
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
 <docs@lists.yoctoproject.org>; Sun, 21 Jun 2026 19:36:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9814

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1687207760-1782070596=:1966440
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT


Nothing significant, just grammar and punctuation fixes in Chapter 2.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  if none of this justifies churn, i'm fine with antonin just dropping
it.

diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
index 021fca36b..f615081d6 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -15,18 +15,18 @@ Reference Manual for more information on these types of releases.

 The infrastructure behind the test environment is the
 :ref:`Yocto Project Autobuilder <test-manual/intro:Yocto Project Autobuilder
-Overview>`. The Autobuilder contains a set of Builders that are associated to an
+Overview>`. The Autobuilder contains a set of Builders that are associated with an
 architecture or a feature to test. For example, the ``qemuarm64`` builder
 corresponds to testing the ARM 64-bit architecture.

 Below is a comprehensive list of target architectures and features that are
 supported, as well as their level of support. For each architecture or feature,
-their corresponding builders are also listed.
+the corresponding builders are also listed.

 Primary Supported
 =================

-The term "primary" means that dedicated builds for these architectures or
+The qualifier "primary" means that dedicated builds for these architectures or
 features are being run on a daily basis on the Yocto Project Autobuilder and
 also tested with incoming changes before they merge. These changes are usually
 on the "-next" Git branches of the :term:`OpenEmbedded-Core (OE-Core)`
@@ -158,10 +158,10 @@ Below is a list of primary tested features, their maintainer(s) and builder(s):
 Secondary Supported
 ===================

-The term "secondary" means that in some cases there is code/feature/support
+The qualifier "secondary" means that, in some cases, there is code/feature/support
 which is desired by people using the project and is in the project's interests
-to support, however there isn't wide enough interest and support to justify
-testing all incoming changes on it. There are however project member
+to support; however, there isn't wide enough interest and support to justify
+testing all incoming changes. There are, however, project member
 organisations and maintainers willing to run tests and review fixes.

 This category may be applicable�as support/usage in an area develops and grows,
@@ -235,7 +235,7 @@ builder(s):
 Untested
 ========

-"Untested" means that whilst the configurations are present in the project, we
+"Untested" means that, whilst the configurations are present in the project, we
 don't currently run the tests on any regular basis and new changes are not
 tested against them. We may take patches in these areas if they make sense but
 it is on a best effort only basis.
--8323329-1687207760-1782070596=:1966440--

