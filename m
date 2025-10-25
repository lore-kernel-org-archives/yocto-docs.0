Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B209BCCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 10:16:34 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.2852.1761387388625066709
 for <docs@lists.yoctoproject.org>;
 Sat, 25 Oct 2025 03:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UO1wqx8R;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wifL2HFFPtAFWJltSmno1HhbL7u1+e0HkFtHrKv9RGE=; b=UO1wqx8RagOZKZQ8YoRXeXID9w
	ILfLtB5RuIRGlOUxjgc58uGoZnUtt+fFcfFvLgiXzP8JNaezluaDYYnSzk8BKgtwxYAWn9Egxh0BZ
	4Ai1hmmI6a6x6hwX+i7NmCMvYvKdZbDrmhwYKWMq1J0smKuMe/OjGVp4CxK1L7ON9PI5fEbSxCTLC
	QKaQbhe32c3145VMb92y2n0LlniVqSQubPESn88pzBBpGN1InEmkFExuTdciuyyEdqEWGTB+8LdrO
	l+aiUU4JMHYbf2/Gyc66EpqVnLdO0A/bYSkgRuRbnpPbe6B2x01xx0KtuyQO5rm2oVc6ilJ/oXOYm
	yZmIHWVQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:35098 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCbJu-00000001sNC-3CeL
	for docs@lists.yoctoproject.org;
	Sat, 25 Oct 2025 06:16:26 -0400
Date: Sat, 25 Oct 2025 06:19:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] can you apply back quotes to something already tagged
 with ":ref:"??
In-Reply-To: <1871B4029C050FEA.22537@lists.yoctoproject.org>
Message-ID: <423be681-9172-dd14-1c69-d7dd8d2e32d1@crashcourse.ca>
References: <1871B4029C050FEA.22537@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Sat, 25 Oct 2025 10:16:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7841

On Sat, 25 Oct 2025, Robert P. J. Day wrote:

>
>   just noticed the following in dev manual, "layers" chapter, where it
> *appears* that someone is trying to render as monospaced the utility
> name 'bitbake-layers' inside that ":ref:"
>
>    layer-creation tools, see the
>    ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
>    section in the Yocto Project Board Support Package (BSP) Developer's
>    Guide and the ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
>    section further down in this manual.
>
> Notice the backslash escaping of back quotes that suggest this is an
> attempt to render as monospaced, but that doesn't seem to do that, as
> you can see:
>
> https://docs.yoctoproject.org/dev-manual/layers.html#creating-your-own-layer
>
> or is that trying to do something different?

  never mind, i now see that it has to match the actual heading being
referred to.

rday

