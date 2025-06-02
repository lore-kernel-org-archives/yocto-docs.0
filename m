Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39C3C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:29:06 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.49843.1748870943149136828
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 06:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=oQi7ydCh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BcRkPaVygiui1Vg3Oha3en1X0t8XrPsZkQPmCEyOvEM=; b=oQi7ydChZtXg9Sh61YVC6GJ8yR
	Tmgc/Dgn7J7aLFtbZtzI6ME5Xw+hI0mRDE3s1d9rC1pqBe0Lu2s2VCOqCPk2V/XenFuB+HHkctxqA
	uPPYZxJtlo1UComSM0OxKe8bZ0AK50rZcwM/68BcAnyOG1SUxpjVjTeaJw32JFv3mtb4KuPf14SUW
	YGbFuCDOBl7BOH23Z24N7p2zUbRGN8sonCRh0tmLKcUXsLNDj0Eof3S4B4qCvSyLdtLw7petAIiiW
	MXqplL/z7n14kHMdTFzZC/g1W7oUUd/LkBBma9s7i1/GWM1O1M4OB+RpgA3Z8J2UyE+8ufVesj7sK
	WFvYy1nQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:59800 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uM5Dm-0000000HF02-0oen
	for docs@lists.yoctoproject.org;
	Mon, 02 Jun 2025 09:29:01 -0400
Date: Mon, 2 Jun 2025 09:28:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] clarify how bbappend files work with an unversioned BitBake
 recipe
Message-ID: <562c3a8a-2cfd-a4cc-7dc8-0126b5b02a86@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 13:29:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6976


Add a short note to the BitBake intro manual chapter to clarify that,
given an unversioned .bb recipe file, the matching .bbappend must also
be unversioned.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
index 539bb62d8..1c3faff0e 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
@@ -272,6 +272,12 @@ append name would not match. However, if you named the append file
 In the most general case, you could name the append file something as
 simple as ``busybox_%.bbappend`` to be entirely version independent.

+.. note::
+
+   In the infrequent case of an unversioned BitBake recipe (such as
+   ``linux-yocto-dev.bb``), the corresponding append file must be similarly
+   unversioned; that is, ``linux-yocto-dev.bbappend``.
+
 Obtaining BitBake
 =================


