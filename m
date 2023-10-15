Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B68CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 09:46:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.88040.1697363195387881146
 for <docs@lists.yoctoproject.org>;
 Sun, 15 Oct 2023 02:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Zv9Jb2c1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/Lh9T1JTsFzhDVbeKOE6Sa8kWLLsw+Rw1TxI7e2Xxpk=; b=Zv9Jb2c1lBNwdwU7UfnJ+6PO5q
	wQcMLtWICzkj1h4RzbYv4wbDVKo1vSojTuxq+s+r8IC/paGEzLU0Z98LtGqnJC5zB3kgAvsrq2Vf+
	T4Hd+rWXC8xNOOvuVoXbJTuc1Uypq9nI/M9TgW5ytuf/9/mA6bAQ6f5zP0ZRdlZr24kMsWx3EuTVw
	cNfzh21RVWQILJA8r3eP5OPwtMs5mWHAdNsqFZ4dnydNKcdo4vo0aOpGEfdk1YIdCy/CsOgHAVi4a
	GT51r/9QYwNckNwJLH8jjkx1EM+lQ9qrpHN72fn9j9rG0mx6Yd0nimGnZ/x1P2rKzHEwMKLydRa7L
	yPonxDQw==;
Received: from [::1] (port=56660 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qrxhh-00Ew0e-0k
	for docs@lists.yoctoproject.org;
	Sun, 15 Oct 2023 05:46:34 -0400
MIME-Version: 1.0
Date: Sun, 15 Oct 2023 05:46:31 -0400
From: rpjday@crashcourse.ca
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Dev Manual, "5.16 Sharing Files Between Recipes", does not define
 /sysroot-only
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <b04580d85e3578125b326abb70607998@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 15 Oct 2023 09:46:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4372

Here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#sharing-files-between-recipes

the Note reads:

"The /sysroot-only is to be used by recipes that generate artifacts that 
are not
included in the target filesystem, allowing them to share these 
artifacts without
needing to use the DEPLOY_DIR."

Except there does not appear to be any explanation of what 
"/sysroot-only" means
earlier in that manual.

rday

