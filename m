Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A1ECCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:06:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.3194.1761732367948532749
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 03:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jbLRJVfJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9229KBFgcgPZQyIP1lUKgyqvZPXHFQ5HUx00WbbN+H8=; b=jbLRJVfJmTSBKM60wXKyTmhwZy
	kAuldvmytv9o1GiLsezCpP/6j/6KMaQkR2bNHxQchL6za8KRYnOAPD5SFGMBKMDXfk5xwnB3wjCUw
	LEZW+oVG4FEbJqltfKmu0COMmbYrwZ1mmICUbxV5eyFYsoBDRFA36zzlYBz8N9M4J8pBfppR1/jsF
	wblhc8MB8+fyV0NW7qIWGmY9lOxDmO8XiGm4NIl3oBqMZnSi+/sgkcUbuTCnBYDOEC0im47WUF029
	nXGlKG9puqCjucc2A1TudRyQgJHzvLpdpeSWLI5e9EB+OP2BQHwWIIS4VrcQLdyE5YZtgw5GzK14p
	cPqxqCsQ==;
Received: from [147.129.179.166] (port=43164 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vE347-0000000FpEX-2QMN
	for docs@lists.yoctoproject.org;
	Wed, 29 Oct 2025 06:06:06 -0400
Date: Wed, 29 Oct 2025 06:09:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should section on "Unpacking Code" not mention UNPACKDIR?
Message-ID: <8bc6e10f-f341-b615-e4e7-fdafe0905ec7@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 10:06:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7894


here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#unpacking-code

there is no mention of UNPACKDIR. is that deliberate? does the reader,
at this point, not need to know about those underlying details?

rday

