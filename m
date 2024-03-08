Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7313C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 11:46:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.19946.1709898380115663028
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Mar 2024 03:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=I4VL0OQJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PHX0dyhOs3RenTf9FtrlOy9+fAaSU3cfhDqFWfMjZuA=; b=I4VL0OQJSRHQH5h+o+19ESbqUl
	pLfIgm1EFf1vYImEeLmQEfV2EV/9VpXGX7oGujZ1xSqG4rBLnpu4QJYQ5w4zh9fcYwjvCOrZM8mCr
	P8nZ9IFEVO3PfyN3/mvaTD9/78Rbj35ZzClQ7ebkP2i7HQ+ipFW1sjL6KBqzCjXS/1XKwe3H+j/Zk
	1MxzCQOzfIKwrfbJhIkXSWL88vGuFB4XDcUmmZb8/SU84YQc9iysmFvb/u/+C/uJbCyXN+6B6x0Wv
	UBRbA+05O2hbFs70V9W8ANtQIWNb/2ZHp8xr8DrqDMtPB1OYlTxlLCtfjbVmusIkEWraGkM+cq999
	XqpT+FdA==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:45338 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1riYg0-007sZh-0B
	for docs@lists.yoctoproject.org;
	Fri, 08 Mar 2024 06:46:18 -0500
Date: Fri, 8 Mar 2024 06:46:03 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: why would a ptest makefile patch set "DESTDIR =
 /usr/share/xmlsec1"?
Message-ID: <ad358f7-d5e-ec36-c7ad-aa3e8c78216c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 08 Mar 2024 11:46:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4943


  back story: i'm writing a fairly detailed doc on ptest for
colleagues (which i am willing to share with YP docs after i finish),
and am trying to use examples right out of the OE source, which is why
i'm flagging oddities that are hard to explain.

  in particular, this line:

https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch#n33

i've seen lots of examples of recipe patches to add "install-ptest"
targets to the Makefile, but i'm baffled by the setting of DESTDIR to
that directory just before the target definition -- the default, of
course, being ${D}/${PTEST_PATH}.

  i looked around that recipe to see if maybe that /usr/share dir was
being added to the contents of the ptest package but i don't see that.
is there some weird functionality to that assignment that i'm just
missing?

  that recipe is a nice example of simple ptest, but that one line
kind of stands out as inexplicable.

rday

