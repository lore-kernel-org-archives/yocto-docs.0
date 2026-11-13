Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8031.1794565585535428255
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 02:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=PJTY/Gph;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=C0Ya09Ur;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6F5A814005B3
	for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2026 05:26:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 13 Nov 2026 05:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794565584;
	 x=1794651984; bh=5nXOweqsjh6rrGqEY/mA0yJ+nF+fKzglHBPygJxvMh4=; b=
	PJTY/GphPC3/Ybi6+xS/CGamnkJ+MGgnl4bipNvPyz1o5mP+V73boCqPKgJ8PZFF
	277oNoVQymyuOdWKdgwz8j7nlxkAm1d7AFeEsqjRBwQA5H0eZVbzc3mFe6jogOEN
	AVZWsm0Tn/huQ5kxrujfozHv3D5eI930SWhlBxFnZAfq/ggyH9Sxd93H4ZBaccSj
	q6BKusJVtMHUUG7Qzakw9ld34tVgeEQDncg+ihulqux8Cqd67p0hgQrGG2D0RC0y
	dErWw+TWmymAWuv8RA4r80qT9UmwFFE1eG/fU5uQ8ru9ljQPWkZwa9gpEksGIQMC
	MYHsrA0qr2KQpG/pZpy6xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794565584; x=
	1794651984; bh=5nXOweqsjh6rrGqEY/mA0yJ+nF+fKzglHBPygJxvMh4=; b=C
	0Ya09UreLNcPc8GoQk14tsn6uWmC6oIxpbMRTCgzrMRQ1zT6tJcg6EGY0logWYsj
	2PAVvv7Jc/JglBh5vd/OZZ499pzNa2Cga5PAMqc4sNM/gVHzMDY8+46GC5NR9xhE
	XxtKyzuLHCGVYzIXH4jmgHSHy5elLYyAanfuxW6Vt36xgxWg1y10wOKfiS7q/44x
	PfdjAiKMFdN6vKAR+Fwe4asQRgJ0B/bRJ5cfHo6BBj/h41Ba6C8+zObjjImsUf7a
	Afr2hdl0uZVUopllAWY7YPI+YHFpNmYc0I/NyQ93ML2cDrwIZI9gFn6NQ9LIPh0W
	9OrIZsDrHjZxq+FT8cRlA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794565584; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4=;
	s=fm1:rsa-sha256:Pssqv7c5IqnSlFxil2pLz65dzFD6wiqe4o0r3c+4FGeDlIk
	PbWLcs//MuRedpSBkdm3ZGJJJq34vJCRoEc5qb297G7RR19mN6syCplnBRGQgpeQ
	pKY/X5BhjwI/Dfk/MLdqLApkCC7mMQcAZaFGQdpQS6pBmS14Ahe2hkX2Mx1sLPhg
	UXldJf/78pQn4IHk1zqeUsovqECovkyD72iI4qVSKvsmdDT5F8Ktdf4RM4qn6UGv
	jhButsTTcdkr/nO7SeJzFVvgHR0yV/Vna34GX5rVyVjy1mNRxCcZhrm1WflxobdC
	T5s5QULgAj0zZk+Q0La3aeq5Wm4APa+B0grAwsQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:mUqKjMRaGBmWSXbollVLLPvFLQ++z3j9P6qQ3n+4z7w=:5nXOweqsjh6rrGqEY/mA0yJ+nF+fKzglHBPygJxvMh4=;
X-ME-Sender: <xms:0OX2as_ib5ZjolaWie4Y-d9yK2ux6riLwPcZlfRWNSX1itS5pFYeaA>
    <xme:0OX2asKDD95DdIOVThPtmfINIawhg8Iby1uJRlj-LahZlYchRK5_SU_Sb77X6HCTU
    z2eyE9LR6NPgJeFcy9cjIOXzatysaJwUSqe5sVc5lW--1WgK89l943d>
X-ME-Received: <xmr:0OX2avZtUWRYYOdbZpMa3OnD4NcAslZwQgrS44ar4uGk6rH76Fnq1gZ1rwu19V1B0q3BqQPH0xFhR8SnXOv7k24ocqwC>
X-ME-Proxy-Cause: dmFkZTGFcd1yWC4ZcbgBdG2Xw3brFQ8qJ47rn4u95iSvcOjMADKuIixKd+HJhlLBV8SNuZ
    Vmp3Ej8i8m1Lf1U9BS1cTJlr9wiOarRjP4QHo9k+Awj4BSA6rrttdv+sa0Vqq0WIJSGV1Q
    FMAaUzzYP8oRvWXG7Hd1ivO5z23qIMvoxqUlDY+OG8ltSxJAi9YWORpDRDjLRSGVD8Btxm
    9Rt+cQGO0O4uSguSil61AKGLOERdlLJgpSMg0mJbi/k2ii0hKQXq0ZkNAWUW/OoG9pR6Y7
    APV835ihRM+TqORhQmuODX464v7mJAOsN8yYhpTOinIprEWP4Va+xn8sGJ+tTa/l21dHe8
    KZ4sHKyXziOO9aJGwjuyiaWYmN5eWbPi1AkmdzJvd4NA+0A6iGPJMTzqhAzBULhjLarlzc
    l4K0EVtgQZe5ECsBxnhT7TsxmcTuBNLeSgushwkmI3UsCmLqX5I7WUplrcJW5DiYqfhh8U
    oGyPfaKWBX1kc/QRg7bv5dyChCpuNIpYUWkSh44mh/COiR1mOCd0ZDAZqifQqL7Hzuu3je
    UfWlya7tLzal7JJRLCcV7BmJCxdV2GAckMDg34PuMmHGgSdrevJ0St/YLdvVCmErt4LcXe
    aoipyUmC4Y1fbtoTNIJ/3zcMizLM92DH0Kr9GtECBR7LO5FwGNtUgC/vo+Xw
X-ME-Proxy: <xmx:0OX2amJZCXufQXDFtbEB-0W7EpN5LTPYF_H9gL-k4SFdFbA5Afs1DQ>
    <xmx:0OX2alCWApZtMNDbyNy_gOYV4yzB44VqHrDJTzqLn3ikHnGwgdc5xg>
    <xmx:0OX2ajphdy441H5A9m1v1etM5sVEoNahJNmrZcyP7IsP9mDE3RETaw>
    <xmx:0OX2aoiLeWXAfu3XJu-dtRW9NsUCl9Y_hSQFgHn_1JSMNC-B-2WHCQ>
    <xmx:0OX2agrIu-ODwe-xTi7KAnvhbguBeBTAPQEBIWiB0qekHyp7NL1IZfox>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 05:26:23 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 10:26:22 +0000
Message-Id: <DMU0ENEWL3YD.11RL7V0WT2AKU@pbarker.dev>
Cc: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH] dev-manual/packages.rst: document gpg-agent
 configuration for parallel signing
From: "Paul Barker" <paul@pbarker.dev>
To: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261111160622.115144-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20261111160622.115144-1-adarsh.jagadish.kamini@est.tech>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2026 10:26:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10790

On Wed Nov 11, 2026 at 4:06 PM GMT, Adarsh Jagadish Kamini wrote:
> OE-Core no longer passes auto-expand-secmem through --agent-program.
> Document how to enable it in gpg-agent.conf and restart the agent to
> avoid secure-memory exhaustion during parallel signing.
>
> [YOCTO #16480]
>
> AI-Generated: Uses Kiro (claude-opus-5.5)
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Hi Antonin,

Please hold this docs patch until we've reviewed the corresponding
oe-core patch [1].

[1]: https://lore.kernel.org/openembedded-core/20261111140027.69866-1-adars=
h.jagadish.kamini@est.tech/

Best regards,

--=20
Paul Barker

