Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CF0C71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:53:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.3208.1751921632601386235
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 13:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZXtuVS68;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g1mNkpgMaKcprf8Uppi8HO+lwnzIOJFm4QqYRmxbwHw=; b=ZXtuVS68hifMxlIhOEMZqPwvDs
	l26aJfQhgvOHc2QrlkjNfRJd1k1wYPIBh7ya/32nH7JOBnMgJbqNHu0ZJ9ajhqmvIqwummmPl+uce
	/egNaQjpFaHgA3EWuR8FJUIszfyMf1+sOCU74SWZY7VuITs0y5TxlcjocQVojDHRqEeWg5Vqa8KaL
	gGKuR61DEJS5R7KOIS6NdwwKSVDuJmlxYp5WM3IR7i/ar4UAv6CrsBaIWdOOxhsrFjDmiBirTX/ml
	y5etm93R1qFyiThOQ0P+8MqRNMW83oiWVZMOvCgFhhulkFU+8s57gXxBx9bRWMQgLbgOKlxVtJrim
	n9RA42wQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47094 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uYsqT-00000004fkQ-2ZjU
	for docs@lists.yoctoproject.org;
	Mon, 07 Jul 2025 16:53:51 -0400
Date: Mon, 7 Jul 2025 16:53:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: where in BB manual to mention "classes-global" and "classes-recipe"
 dirs?
Message-ID: <d0fbdce5-8bcc-5f78-ec23-ea218659302c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1330036758-1751921630=:331853"
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
 <docs@lists.yoctoproject.org>; Mon, 07 Jul 2025 20:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7271

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1330036758-1751921630=:331853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


at the end of this section:

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#locating-include-and-class-files

one reads:

"In order for include and class files to be found by BitBake, they
need to be located in a “classes” subdirectory that can be found in
BBPATH."

not technically true since searching also checks the classes-global
and classes-recipe directories (see lib/bblayers/query.py.

  is this the right place to mention those additional directories?

rday
--8323329-1330036758-1751921630=:331853--

