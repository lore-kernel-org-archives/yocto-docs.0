Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AE4CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:52:39 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.23935.1697709157160212295
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 02:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=MzPtbOZZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YCtwLrnyXYhSmCv4ZQwQCyxw7THQ2jt14zjeqahzJl0=; b=MzPtbOZZqST+ylcTqrLcCvCmMR
	F0wMMKmd9/j7Jiwm00J8JssHegBsSGmLTGUcYo3IfpDV1wHx7ZFSZiL+uhYQWIa3uV1/AGTfRjifA
	YnI9omJ/YYRoBhQNzl14YAPYxWob0m0EOAl4EjNSn5cRUOibvqmOxKZzqGQc7Ie+LOPTgM+wIxFQS
	mTS2cPfea040tClrwa/sqz7f2C2dnSavu3jc+0nwHEvapzgq1ZEWDzxmyYpVvKrX8dhwRq7M0rscc
	Sc8iTEHIjL8Qf9neKyXWVDbKJRj/BUj8USYUZ+BqIeO5N0jCfvYeUT18yrbq/sPTUQHDdW21xGjer
	DlyWdCqw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:51978 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qtPhe-005eLk-2F;
	Thu, 19 Oct 2023 05:52:35 -0400
Date: Thu, 19 Oct 2023 05:52:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Marta Rybczynska <rybczynska@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
    Richard Purdie <richard.purdie@linuxfoundation.org>, 
    yocto-security@lists.yoctoproject.org
Subject: Re: [docs] Documenting YP processes
In-Reply-To: <CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
Message-ID: <f5b419a-64be-f3bd-1351-88dc3df5e85c@crashcourse.ca>
References: <CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 09:52:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4420

On Wed, 18 Oct 2023, Marta Rybczynska wrote:

> Hello,
> I'm writing the "official" documentation for the YP security processes
> and I'm realizing that I do not know which document to put it into.
> There is no "YP Processes" manual. What about adding a "Security
> manual"? It can then include:
> - security processes
> - a single place describing how to submit CVE fixes
> - links to other manuals for relevant material and/or rewrites if necessary
>
> What do you think?

  Is there a thought for addressing industry security certifications?
FIPS? DISA STIG?

  https://www.perforce.com/blog/kw/what-is-DISA-STIG

Other industries where there are mandatory requirements for security
analysis and certification, and how those relate to YP?

rday

