Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1301C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 11:56:38 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10867.1787745396284000907
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 04:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=jMJbh9un;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=leesVKKx;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 354161D00149;
	Wed, 26 Aug 2026 07:56:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 26 Aug 2026 07:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787745395;
	 x=1787831795; bh=BQ6f2uZreSZ5EOPl7238nBtQ4zvjfPDohdJbZFwwCBI=; b=
	jMJbh9unQ/7N5cczNds7E6LPd9Ezpcf7wsVzaoyJhvmcfF0qDfBPCDoa68C4rJcj
	gB1WDuL15CuuDJ4pVtn+P6zqQtHTT5sVyg+1a4apjn0891fK/W2AjdZF2Eg7ZuvV
	mZwoPy2fZ1HVZh0g/vlQHfHLSS+JSGi8fHAHN8VuBpUzUTJKI+1wIqK5r7ML6WYv
	qrxKoUyGqHm+8pAEHKyev/GnxtVuh4VYBuOZ3lz+UCn+MCqgijNgMeG9Z4TDOzRS
	KsS8u11iYIqgS/zgsz9UGXornPWVlSj0sYlViOaFzoD2Lh2kv+Lg69G4kIX/brm9
	EyFe7K49Bbn/Lp6twueeIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787745395; x=1787831795; bh=B
	Q6f2uZreSZ5EOPl7238nBtQ4zvjfPDohdJbZFwwCBI=; b=leesVKKxmXKpCvHkl
	6mJ1lmgrQWEisv/buAdhECdik4Erf2IJAJt3bLVyKPmqt6dFKpMR6Dfb//cnAIva
	qW5wY3TAPFHIbFP9Nl1Lpf8hhJYq0yKc2HkATMpFMkLeQwAQjXZVU22S8TD9NgUn
	m2Vzxv/Eiovrfy1WPrSv9rvDQCiDmpgA67112uo8PkEqW7ywQTS53+5LMMUpe4QU
	HY4Pr/eykp4vfQjXMAMC8uY5AIhoWssVBtATXOj01TzO4k7GMnwskZLGvjYjAv+s
	1WGJQpJS1tOgDuuo7SoaVHGZR1XBCFaRBh41pVeBrQsgFtL5uMw9rBXQVPsUEWB9
	3p8Ig==
X-ME-Sender: <xms:ctSOakSVY-26q3wb7JdtHjhHaX7SlZ02dKJJDzrg0_qbsQkJpDflCQ>
    <xme:ctSOanxFxfYQMQcYEuyJKz8spKo9Nhk1EHRpnFJwhM0vDqU7Yu1OEKiuOC9sVz9ji
    ULTFohVMRxhvuF3aa7X0-G4v_Y6pwrsBTDGttH1yiE8GcNVbqqGzwo>
X-ME-Received: <xmr:ctSOavfzBBkCF9bf3D5AGjRrwvK-oCCfjq1_LqXyR3rWO0dDe9t3_OVtYkz6xGiipagVmMkE-zI_j2ervMq1BfQKvmms7igSDh89jbFUI557>
X-ME-Proxy-Cause: dmFkZTEINDCFHux/tkqzHIXV6ERXAjnGEz+7PJMFxK0nxiynI5Q/cZF5/Eo+zzz7CxN1VY
    sp2wDMZ8QqeszMxUGSrKhjIf957isCJ5+zFwShknOobFnd8KFt0qZeVlZ6tgHmrB3k18xE
    I/H0wHP6T+IpORQDGMQrEPI12MIEU324WnOFpCaoLVsdnmZHRvDLo2PeuMlLSpJjHtdJ1o
    qXsmwJBIUWVfdQ72SyKcb97VpKuHE3fs6T0SYxHWMkFd6+iZ/kZ3YmsEbI/VryVczNjlrr
    Mis5v0sLZQRnjIOCIwTaGyZW1RsgztR8Ia+EJ53h1ncTfofdeciZt/fPfpsb17HTqfMyCJ
    Lvshg1n2Tln7XVVg9hONoX8PWfaY+SgcOBi4DPtVLqHkXbZlhl6yiZ7DI+tcbESJ2X5dHJ
    E0BgGx3Jd114gxGvQQ8E4ZoBIcha7fLOxDQqrNRyHCQhZT6Fcnyw2qjFGmAoCmAxnNTK7m
    li5xUZEJJor15pUUozC2VL69g1qa3Js81pgkj3plc/vpWkICDxlAWL2hIXqOtl9wgdPvJL
    PBtQ2ZmRPQ8JGZh5GzcGWlkWJIWWBnAMD+JRehrkwP6EPi7jAGArcASPHV6Z1hfyZjAX1Y
    PAxrMyaxQbe1qYNzcnfwAAmMH6agj4C6wAcD0+xYlKu3MR3CkIFDcwEPhfaw
X-ME-Proxy: <xmx:ctSOajIT2lskqW_lALk53oQ4c7abi4OdXgvQ7mCGDmD5Sc_4jWtTrQ>
    <xmx:ctSOagGW9wADvY9AyBswWN6AzM763HeekofJdQYptzlsPEU4DW8-TQ>
    <xmx:ctSOatqvs57sqPKBpjY_JxFuHLoiHTeLdCvZQ2rPgHnP1IFjjdXrjA>
    <xmx:ctSOapRuDAfEqA9YaF_9YtFWQ2vWtTshtDen3UtEccv1w5rcfeXskA>
    <xmx:c9SOajjviYqXRKQQtEuRHMfKjSxwrvirf81zlymYeAhbqhIV2xuSyLrM>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 07:56:34 -0400 (EDT)
Message-ID: <4a093c1908c664f29ac49e8f68d606f2491fb8bf.camel@pbarker.dev>
Subject: Re: [PATCH 00/10] docs: highlight BitBake snippets with the bitbake
 language
From: Paul Barker <paul@pbarker.dev>
To: Trevor Woerner <twoerner@gmail.com>, docs@lists.yoctoproject.org
Date: Wed, 26 Aug 2026 12:56:32 +0100
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 11:56:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10361

Hi Trevor,

On Tue, 2026-08-25 at 21:34 -0400, Trevor Woerner wrote:
> Please do not apply this yet

It's easy to miss this when looking at the individual patches, you
should use `RFC` in the subject :)

Best regards,

--=20
Paul Barker


