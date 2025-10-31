Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7FECCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 10:55:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.13034.1761908152416689533
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 03:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0Eob5NbP;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mXH79qj3ZywzBFvpgYgV6vlZqTVO9VQkXQPDohlN/fY=; b=0Eob5NbPiMJWCMemJIdceblEx/
	zTDbwNIxVvcCmsZHF1n6pyqh97jnYzNJSPE2iw8asvhkKwUdDvddgH5uBtDQtPEFbSH2MMlLesLlM
	A3iaMvTwABFIUt2Lu49icw8GgUokNQVVfx1z5EiNjDm0NLHgJM6+Zm4oHCE9ek+pqkoTqeHO69kCm
	K6KGbXteMgsHryCw+jOwmqBia2MmxRuNISa8dQ0jaHjlqb5Yctlz5r8774fnTG1FWK+XXkNIkkud4
	NODOLNXN3Yvt4mAGtdjyYAftY4mRucfdCKUGNexcENt3qMU0Oguda70K/sNeL9ZvLhm8/I0LKP4mh
	M2CpfpsQ==;
Received: from [147.129.179.166] (port=44724 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEmnK-00000005UXf-42LG
	for docs@lists.yoctoproject.org;
	Fri, 31 Oct 2025 06:55:50 -0400
Date: Fri, 31 Oct 2025 06:58:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: why would you even use "FILESEXTRAPATHS:append ..."?
Message-ID: <84dd014b-1c65-412a-ab7b-222add07fb63@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 10:55:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7936


  a followup to my earlier post pointing out improper usage with that
feature ... i'm still unclear as to why one would *append* to
FILESEXTRAPATHS. it seems like that might be something worth
explaining when that section comes up.

rday

