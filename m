Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6738AC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 19:35:07 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network
 (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web08.2002.1665430505025633385
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 12:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=vLzma5kK;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 3a8a5587-48d3-11ed-89ae-f8db88ea9a09;
	Tue, 11 Oct 2022 03:39:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UbZtm11CBQ81hjrqr+TUZ+XEk8D+nrwx6knrC37Azk4=; b=vLzma5kKirGtta3JMu1mm+RYEe
	O3WrlXhAo5+JQUF8XnIMsHTSAS20MGe/luV9Y+Qe1W58WN39fDCnEx5daK7XMgZr6URCyNFPEbYD3
	PVjrmd0Npa0PxTFz7OzXlCejB0E/RmenJrw9ThuE9KDYVBbWOiCSx27SVdXCndX0Jf39uNEXH7tKb
	bwZy43B4hm+l69BtBYO3lIXgCDxJ3VrGJV5wo4FOiANK7+xVPIxGEbTkGp4cYZ+6Z+cxUl9h2XWag
	jRvvyOahBafzzh19TTjuTErA/31W/0nBO+NSdsSSCnDEmwIOyKTSltn2x3w+0ETwhEuLScMHeMgfw
	RhGC8P5g==;
Received: from [151.210.143.155] (port=15698 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1ohyYG-0000uW-N9;
	Tue, 11 Oct 2022 08:35:00 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 16/34] ref-manual: add CVE_CHECK_SHOW_WARNINGS
Date: Tue, 11 Oct 2022 08:34:59 +1300
Message-ID: <4006882.mvXUDI8C0e@linc>
In-Reply-To: <7454912b76c0453aaed694d1a29e496e@axis.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <e1277d4cbf71153fba9f56516864f23262c06ed1.1665392835.git.paul.eggleton@linux.microsoft.com>
 <7454912b76c0453aaed694d1a29e496e@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id:
 paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 19:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3342

On Tuesday, 11 October 2022 02:55:17 NZDT Peter Kjellerstedt wrote:
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -1508,6 +1508,13 @@ system and gives an overview of their function and
> > contents.
> > 
> >           # This is windows only issue.
> >           CVE_CHECK_IGNORE += "CVE-2020-15523"
> > 
> > +   :term:`CVE_CHECK_SHOW_WARNINGS`
> > +      Specifies whether or not the :ref:`pypi <ref-classes-cve-check>`
> > class
>
> Change "pypi" to "cve-check".

Oops - fixed on the branch.

Thanks
Paul




