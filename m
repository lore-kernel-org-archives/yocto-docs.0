Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817AEC98338
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 13:21:39 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19269.1790428891660530148
 for <docs@lists.yoctoproject.org>;
 Sat, 26 Sep 2026 06:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=NYDp388u;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=lBESn0FK;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C867C7A003B;
	Sat, 26 Sep 2026 09:21:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 26 Sep 2026 09:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790428890;
	 x=1790515290; bh=+2rGbGGqCXKEJTBz1priKRBeKNabDZtwL0YbgEB2huQ=; b=
	NYDp388ux/hvVYG9lsfbYStMzBK+MNVcCmYqu8jc4DMVEG+q0H0xiP60zvW2RW/5
	lReGZ01vr93QjXC5Uptwv1YeNRJ/17qf+7ZiigV7YofI+HbTo1NCfkI/u0YJ2zIA
	T9P4B2ktHr76WiG7Bi/+1fFRgVCUfUsQMcWDbE0m+MJCudAflklSr/XzPxN58Grh
	uvg99efxnkgUnJcgPPI+SkP/52XcfY48uWFzJwG/kLAUUyrBf5Bxpy1+upjW1T6f
	ERMqdNKKYOubPi7yW/BPCjF3bYL1pxVTdYx6NRlWYFvnR7nxeXZtVc9sljU1Ydpb
	XjoKQKHR0x0FQEdDNeCavA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790428890; x=1790515290; bh=+
	2rGbGGqCXKEJTBz1priKRBeKNabDZtwL0YbgEB2huQ=; b=lBESn0FK508Hoanwe
	pAoJ0LDHyXio1AGkeGUBH1y+ZI1WmLL+mTpEEa7Tcwj1UF6SeWRmO58p70DrHxX+
	pDUe8pA6iYkR1atT1yQ4G3DLy0bJjNDAFQm560uFttsIUcFM47FaK120Jyjxt3Gf
	ZBrIFwwEshCa2GnEns10d3p8awGxvDPO5dZWEljbrLlWgX7lv7CtNsK/8U4dbPaH
	ULov1e9l9uawvXb7U6GK6wqzejtytTMd1mQanVIEjYMwehQGI/SPpgxk3Rbq/LPw
	gS6bZcSVMXmWyRfzGvB5fGZ5nA2iR8Tx5Rfp+uFqeeve/MIMfeHcNf1WvZUv9pmz
	+YxeA==
X-ME-Sender: <xms:2sa3an2ZG6R-S4D-t662AhLSy8UhnwLUwFjeaQ_2SW5ZAnFvF1pVSA>
    <xme:2sa3asFHdmnkt9LFaVWRMiRkW5a3w_jXk5Rpk5SZIY3uPpPDMIrJUlWX6-6A4Y8L7
    SxSQJCWrzkBm9VFJqW5AiK8qHXM45y_Z0Wf5Wda_Y6VoZlmLK8pgvW5>
X-ME-Received: <xmr:2sa3aljpCOQInwQYyT80DbqyJ-ZvLOkz09aR1sPuYQ_h9ybc5BlR6M6tWwrg2mhmm5kZL_LsNqSfbmGWKrHrPQc82GQj2efr75jx3os>
X-ME-Proxy-Cause: dmFkZTGfcasrdRj1HV+nKZGRyiOFt0353ZmbiA8OADcXkdt5TzOSZ4GRtebACX1SKr49mo
    so78jmTQJzipCDtepcY3tD2+0x/u8mlczbbP84KQvw/Qx2TWGtA2PeqI4TvbWdSNtDc8At
    xMclcnflpA9k7w+vfemz9RNx8xQOCSmCkfR9gxB0kRkKV2gB2VuV1AVKJM0IZdqvJe6S2u
    jTs2Rs5ZUTteI5l7ynjFIsXU5qqaBgYjc0oGAEPCFX13fRVU6Xgg92hsEjNmJF9V+3LBzz
    bbMivhP2RdJckq0HqH/GrQmL7Nfb+YhA2/KEGEgzSOU0U5LH2ShgkWaiwy8LfrzXxQWVkG
    FHM4DwnnVvYGprkSsD6SIlUGvJ0nwg+7zLJPoqnLrCuElWcGdb4snafHjl5SgnBAy/ay55
    bg/hHVZU0ZPxweuwWoAMtYc4k229uhdceJf2AosVLdGGQYjG0LPIbsihpEKFHcTf38qPi/
    /JwZauatg3H/WTgcR0KQx4ZrMLP9h5QtrfTgmISG6+kSQX7P3ZIxRZnWr9Xq/gCOuLUSHR
    XHZFpXS95EN6mjBELSSLRxGWBSoIV/bSmpM38BUwZ6NoqdE1yfzT6VaE0CJ20OZcK7ubUk
    v5oUWGsXOuaAYN0MWXhpVuC3aOBx5jrK3k6xjky9+LkmvfC5DQHep/1iCqqA
X-ME-Proxy: <xmx:2sa3an-zaq5TpUzW94OxP8PUUnb7qy4J7KrtB9KOXQVcqatYvx30XQ>
    <xmx:2sa3asoEjaUjsFkLzyu1dgpnEm8JtK3NmsX8gFwmZSEq4z6jgUBnPQ>
    <xmx:2sa3am9xKGO9IfWPQJWrl0NaWAfF1MXpHSpBsqTEuMAMX1Q5l40EFQ>
    <xmx:2sa3agW5Cj6wjM_x8CIpdeeFDez48GgN6FgthQutW6BDxQejUAvBAQ>
    <xmx:2sa3ajMq9DrMMkWogOQ0CsJcpF6XLhMS_oQrj_OtKenYHye1z8ghpW_U>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 09:21:29 -0400 (EDT)
Message-ID: <8e8a2198ffc43898045566b07fef83c011ad9697.camel@pbarker.dev>
Subject: Re: [PATCH v2 0/5] dev-manual/devtool: ide-sdk doc rewrite and
 Mermaid diagrams
From: Paul Barker <paul@pbarker.dev>
To: AdrianF <adrian.freihofer@siemens.com>, docs@lists.yoctoproject.org
Date: Sat, 26 Sep 2026 14:21:28 +0100
In-Reply-To: <20260924192929.907566-1-adrian.freihofer@siemens.com>
References: <20260924192929.907566-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 26 Sep 2026 13:21:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10641

On Thu, 2026-09-24 at 21:29 +0200, AdrianF wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> Update the "devtool ide-sdk" section to reflect its current behavior,
> and fix outdated non-patch local file handling docs (5.1 change).
>=20
> Add the sphinxcontrib-mermaid Sphinx extension, add workflow/
> architecture diagrams for "devtool ide-sdk", and convert the existing
> devtool add/modify/upgrade flow chart PNGs to Mermaid too.
>=20
> Diagrams render client-side via a CDN-hosted mermaid.js, so the build
> server needs no new dependency.

Hi Adrian,

Expecting clients to fetch the CDN-hosted mermaid.js breaks the ability
to render the diagrams offline for local reading. We also generate PDF
and ePub versions of the docs - would this change require CDN access to
build those?

We may be better carrying a minified copy of mermaid.js and setting
mermaid_use_local [1].

[1]: https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/#mermaid-u=
se-local

Best regards,

--=20
Paul Barker


