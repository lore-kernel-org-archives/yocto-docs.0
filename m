Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D00CFD626
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 12:51:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4987.1767790261288834001
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 04:51:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qs5ZiHNG;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jinq03CLMGpKw4GFgJRW8yxQ5N4aVbvQDiaKLievU30=; b=qs5ZiHNGbp5ubquH1jpokMnDaZ
	HHZ1IB2Icdq1sxmtJVd5E/QXVb0ypa/L+tM5dc1fNJuBMwZAiCgeZpZVOTt6TsSYch5p5zaUGPou0
	JFW7Snkyj0B29KYjl5dJHOknnjnjFhW6n4cdBTySQTS7FCneSckHZBJAIvK9uTh3NUeAogwcoWcF0
	Tngap4YsPsoBGBUYC7hx3dVfidB8S+li+6jWlrgbYOvLroY567t5BAQyL3v2Wza9ODt4FTJfY1Bbt
	FOffipePPZ2CiIe74BQ2YsfSjC329ceTtv6uHi3Vk/xP2XzMiNHOiDgsT1ySgM2JiQYtF5XzrvX9M
	c9hfEqQA==;
Received: from [147.129.179.166] (port=52212 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdT07-0000000FIJ5-0xcT
	for docs@lists.yoctoproject.org;
	Wed, 07 Jan 2026 07:50:59 -0500
Date: Wed, 7 Jan 2026 07:54:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is a wildcarded bbappend file name valid without a "_"?
Message-ID: <0a95bb97-ef68-5bb2-c4f6-319fc8f62e06@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 12:51:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8402


  wasn't sure where to ask this but since i read it in the bitbake
manual, i figured, let's ask docs.

  regarding using wildcarding in bbappend file names, the bitbake
manual insists:

"In the most general case, you could name the append file something as
simple as busybox_%.bbappend to be entirely version independent."

  ok, fair enough, that appears to imply that even in the most general
form of wildcarding, you would have the underscore just before the "%"
wildcard character.

  but i've seen a number of examples where even the underscore is
omitted, such as in this search under the meta-security layer, where
the final line shows that the underscore is missing from the filename:

$ find . -name "linux-yocto*bbappend"
./recipes-kernel/linux/linux-yocto-rt_%.bbappend
./recipes-kernel/linux/linux-yocto_%.bbappend
./meta-tpm/recipes-kernel/linux/linux-yocto-rt_%.bbappend
./meta-tpm/recipes-kernel/linux/linux-yocto_%.bbappend
./meta-integrity/recipes-kernel/linux/linux-yocto%.bbappend
$

  so this is clearly legal. should it be mentioned as being legal? or
discouraged? the bitbake manual certainly doesn't explain that this is
a valid form of wildcarding. should it?

rday

