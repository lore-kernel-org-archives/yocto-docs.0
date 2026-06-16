Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8873CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:18:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151137.1781605113653664289
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 03:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=OI1scGyw;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qvJ3JX/P+EwBnI3pS8Z20rOcKPOoXvJtLpgdX0+ly+Y=; b=OI1scGyw/nzZv8qEzMueZ47n4W
	WasfRQ+ERlUVtqEla/cu+XBpYdxQxx5zDHV6C/mrp9sY+RfAhnz9ZFXzJzXbS3X0J879dqGipkRC+
	QkgoVap0NSZFWSYXHXU/ZdeLtICP/GqH7yTRQf0oPiB2YaFND3FJm2yJ/J/S1jt3BkH6Zq/OU5Jq/
	MM8r7yH7j4n5beRhEUIGoDWOoEC7bzhYBUtJGuT9anb7VvFFSYg6PsPKOOtEMl6x5bCi6/HHkD5pl
	I6D8g9WQenNUAz0dy8OFs5x30hmduMH21fKZvOrvYhadn0q5/De3H1+0siyPgVwKV1LcmUkVuYtSE
	rz5yE2fw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:40436 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZQsI-00000006ghB-2GBB
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 06:18:31 -0400
Date: Tue, 16 Jun 2026 06:18:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should the YP docs mention layers.openembedded.org recipe advanced
 query?
Message-ID: <86b66622-c80e-9f67-0e21-0743b305032d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 10:18:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9731


  while transferring some ptest content from the ptest wiki page to
the docs, i was reminded of the advanced query feature of recipes tab
of the OE layers page:

https://layers.openembedded.org/layerindex/branch/master/recipes/

which that ptest wiki page mentioned toward the end:

https://wiki.yoctoproject.org/wiki/Ptest#Recipes_with_ptest_Enabled

as to how to list all recipes that inherited ptest if one wanted to
see some examples:

http://layers.openembedded.org/layerindex/branch/master/recipes/?q=inherits%3Aptest

it occurred to me that that would be kind of a useful note to make in,
say, the ref manual "classes" section -- to inform the reader how to
find examples of recipes that inherit a given class to see how it's
done.

  rather than add a note to the "classes" section, would it make more
sense to add a more comprehensive section somewhere on how to use that
advanced query feature and link to it when appropriate? or does that
feature fall outside the scope of the YP docs?

rday

