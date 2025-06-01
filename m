Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6A1C5B549
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 11:22:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.25198.1748776918556783253
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Jun 2025 04:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZKKBzxtJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TCknXP06ZAOkONWcyEeW+5XV8kEFE5lG2x7MUbgDZyM=; b=ZKKBzxtJRtU8HzKsbqfmCnvArl
	uJC4XjhmKaPaDKDfFdRjTn4uCn9BYakDAQHDASumI+FK3qzTSbs1ui01NLLiHMgtthLVUyapGCS5o
	UYEOIZIKhbsCgph5zUC5aH+PxawbIYETN3aS+ylJgK6c2W0hnYLuFC/fXdsdxcSSjAt8vPRgxplHK
	4e3MATNCGBCW+MjZjuzLxhqEKA8WPlWXKqVJkdkZqcDWnYwsWuS/MfcNsqYKj1YaXY9v1iEyQmLI4
	t0zYmXPkf+mmhSLABns2EizIGz0CXSsDCRf5/goRs4+pSMdhbbyassysL8Qf7wltcWuG4qTnI+B4O
	Kliyi5Pw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:36438 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uLglH-0000000DKnK-2Kbw
	for docs@lists.yoctoproject.org;
	Sun, 01 Jun 2025 07:21:56 -0400
Date: Sun, 1 Jun 2025 07:21:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Explanation of bitbake variable flags seems confusing
Message-ID: <4bcc9347-d780-1deb-f034-52bb80d4204f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 01 Jun 2025 11:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6953


  This section in the BitBake manual:

https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-metadata.html#variable-flags

introduces variable flags, and as examples shows usage:

  variable = d.getVarFlags("variable")
  self.d.setVarFlags("FOO", {"func": True})

then refers the reader for more explanation to:

https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-metadata.html#variable-flag-syntax

But that latter section of the manual doesn't expand on what was at
the first link, it uses the subscripting form for setting flags, so a
beginner might get confused about the sudden change in syntax.

Instead, the additional detail that would follow from that first
section is found here further down that page:

https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-metadata.html#functions-for-accessing-datastore-variables

but that table is still a bit confusing, as it mixes together both
variable access and flag access; I would think that it would be
clearer if that table were broken in two, part 1 being variable access
and part 2 being flag access explained separately.

[Note: in that table, the description for "d.getVarFlag()" is
incorrect, it was clearly just copied from the earlier description of
d.getVar()]

In any event, that explanation does seem to be potentially confusing.

Thoughts?

rday

