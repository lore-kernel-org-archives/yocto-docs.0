Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F1EC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 15:24:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.34098.1698938643666493240
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 08:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=y6Hfhuxf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1XytUqTxWPjDYVfN9mOnY0Qw4deAY/Ji6zRZKTLvOW8=; b=y6Hfhuxf/DuHIbv/u3yuwuwbB3
	qUOvkkBSJiteDYtAIcj0QclxWsba/SXgNVjx1V9QHdyhdG0qvnydV/26cHdqWdR9BEOL8U97iow78
	HcQdr7D0QZXM6xSBcZ9HHiSxJB61p54uUSgtIqXglvI3/iwjfuK8rrncbyvGYi4JRXBxI7q/aatIQ
	FmdVDBN+Rw3VgFF/wn9BMUPbRCZKF9djCwSEte9sdEo/BY4vJdns76b7XAgvz/vJMHV56s+5Ezl+p
	Fj70ykhYSEmG2ZEBO3nCFXme17mZwBYB5d/g/69QwUcVKcdVKfpO5U4qzwTXrgXAuFKqEl5h07HDc
	usUiHzOw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:33366 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qyZY7-00Ga1g-0s;
	Thu, 02 Nov 2023 11:24:02 -0400
Date: Thu, 2 Nov 2023 11:23:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <ross.burton@arm.com>
cc: docs@lists.yoctoproject.org, michael.opdenacker@bootlin.com, nd@arm.com
Subject: Re: [docs] [PATCH 09/14] sdpx is poky, not global default
In-Reply-To: <20231101172706.81576-10-ross.burton@arm.com>
Message-ID: <9097745-6a19-e7cf-cd76-7a74581d51b1@crashcourse.ca>
References: <20231101172706.81576-1-ross.burton@arm.com> <20231101172706.81576-10-ross.burton@arm.com>
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
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 15:24:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4576


  "sdpx"?

