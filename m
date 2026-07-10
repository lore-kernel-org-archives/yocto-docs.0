Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8968C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:55:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8634.1783673743164452649
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 01:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Pblr6x5v;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RqOWcENqn7Llgbum8zO3kGHKO0Zvd7vv6XF5G5gTKLI=; b=Pblr6x5vh1Tiuq8h8zNo3L8AVh
	DM7NztmojK7xl/W/tCeyKpXjlFFQZis165Y1T5vFdFyW9kwDuQ97MvY4fsIs2qkt6NdYXf0ureMsv
	KaDXJCknFKDqAn8DEYQyCkd8/VF9yx2Pb8xUrSM5gnb+wKj2XoYmOLbZ/FJROqkes0sVgB7vLOV9Y
	CUiX3DCJzOhcUI67/C3k2Zhxwlq6INtcc+1VOSxYSrWV/1fOKUZRdEjawg+bxpDbwZzg2wlgthAsY
	WTX5qrzTWnhNwvv4z+XEAnzAzo+ecsP1Ag6Rv6wYYgt+9jv9IyBXdHrKjrGdEzdmpsB7QSCMgUex9
	UmiN+2OA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:54614 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wi71F-00000008U3Z-0sqQ;
	Fri, 10 Jul 2026 04:55:41 -0400
Date: Fri, 10 Jul 2026 04:55:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: expand on kernel "do_sizecheck"
 task
In-Reply-To: <DJUQAEXAC03Q.2T7IDXHKVIX95@bootlin.com>
Message-ID: <d93acab6-cf51-91f4-bd68-0bb291bdab7d@crashcourse.ca>
References: <b5a26548-6620-a7cb-ae04-d42f57df9bc3@crashcourse.ca> <DJUQAEXAC03Q.2T7IDXHKVIX95@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10053

On Fri, 10 Jul 2026, Antonin Godard via lists.yoctoproject.org wrote:

... snip ...

> du's docs:
>
>   -k     like --block-size=1K
>   -B, --block-size=SIZE
>
>   The SIZE argument is an integer and optional unit (example: 10K is
>   10*1024).  Units are K,M,G,T,P,E,Z,Y,R,Q (powers of 1024) or KB,MB,...
>   (powers of 1000).  Binary prefixes can be used, too: KiB=K, MiB=M, and
>   so on.
>
> Otherwise looks good, thanks! I'll merge in master-next with this modification.

  thanks for handling that, feel free to tweak any of my submissions
as the need arises, i'm not territorial.

rday

