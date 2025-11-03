Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4E2CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:27:49 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15902.1762158461790308412
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 00:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HjAKQsNL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9CXUjL7pRvVupL/kWKJTd5lBUZkc2rHeV8eAtpkiUHg=; b=HjAKQsNLxMUfzRhNUZpzRfT5o4
	rM2Gn6yOrq5ZEMF5kvgLYu1I9hHNBru1NoRgk67LdWhxQDOVX9Q+vUHJ8jR+K9SFK59ZuW6QXK0sa
	rvOU/EGY0y2clKS4z3iRnSrZVyZt8GI3w9OmiAkyJxh8vqzNULJ9SWuNAUCSD5n+dvIltYD0ZeoCJ
	NwztnDXXMZQX+U+rKQqmgRo9FMRiPikoErQmAmFGunGHSnSa2aqtbAMKNo/n+Jt7E910IoSt7PeTB
	YB4+w2XyGr2k1n6raL0xsBIRSnWtEdjQT5SUA6BYy6oevKySBOcOA8EZ8txNeuHC+XQv7pq1AhoKG
	DZL+Ud9A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:32782 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vFpua-0000000FQEF-4B7n
	for docs@lists.yoctoproject.org;
	Mon, 03 Nov 2025 03:27:39 -0500
Date: Mon, 3 Nov 2025 03:26:49 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: tweaking the cve-check documentation
Message-ID: <2440e0a7-9f89-5fcf-f8e9-78b8c09bf7e1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 08:27:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7964


  one minor nit, and one larger one.

was going over CVE check stuff and noticed there is no mention of the
handy-dandy scripts/cve-json-to-text.py script, so obviously that can
be added.

  the bigger issue is *where* since, as i have whined about before, i
think too much content is going into the reference manual that
properly should be in the docs proper.  for cve check, there are two
sources of explanation:

https://docs.yoctoproject.org/dev-manual/vulnerabilities.html#
https://docs.yoctoproject.org/ref-manual/classes.html#cve-check

  i think the class reference entry tries to do too much -- reference
entries of any kind should be two, maybe three, paragraphs, then a
link to the full and comprehensive documentation. so i'm not even sure
where i would add the mention of cve-json-to-text.py.

  thoughts?

rday

