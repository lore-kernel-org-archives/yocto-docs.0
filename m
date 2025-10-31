Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3610CCF9FA
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 10:18:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.11977.1761905932439424892
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 03:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=zeB7MX3V;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yC4bSANJrJSGAhX3+mQZ0jDaKppnhhsE1a9ckqI/EWg=; b=zeB7MX3V/hQipRSEOn5yOUKnLy
	2O7uJXz1RDf8jydF4oTeND6bgZRFj25Db8Mc9vYwc4BfRenx3LzKBWGaOlI+DyMCSBzwIkC2UsJDb
	7/6GGt2UmW7mMLZ6yQnObLlEODhXqU4T6FdFu3Gq8ZVEu9Hi7qDqa7rsSOlF4vtgfE6YAeWb8epEj
	lzTE/ixdvOL8vZgDa3ngAS159oZSE0lNvk9/wkHn/yjkP98B66vYVonp13CZpC28cq/awl8Sbz13B
	hyHDatiDCM3wQWQtPlCXmy2F7+m5+gVadsI0cfVB0aDjMK1eg6EwHdEZB4YaNVbkRboIOzEUH4kIx
	sad5WmhQ==;
Received: from [147.129.179.166] (port=36592 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEmDX-00000005PLo-07mo
	for docs@lists.yoctoproject.org;
	Fri, 31 Oct 2025 06:18:50 -0400
Date: Fri, 31 Oct 2025 06:21:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should the "New recipe" testing section not refer to the test
 guide?
Message-ID: <3881fcd0-107e-6388-47f2-4757ddf9ea29@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 10:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7935


here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#testing

it seems that that paragraph should at least have a reference to the
test environment manual:

https://docs.yoctoproject.org/test-manual/index.html

or are these referring to two different things?

rday

