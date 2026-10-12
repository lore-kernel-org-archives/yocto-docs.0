Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064C8CC6B1A
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3992.1791914096241048614
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 10:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1xjDjO6U;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BBABFC653F7
	for <docs@lists.yoctoproject.org>; Tue, 13 Oct 2026 17:55:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24D4760362
	for <docs@lists.yoctoproject.org>; Tue, 13 Oct 2026 17:54:54 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 828ED11D703F4; Tue, 13 Oct 2026 19:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/GlTaVRWm/U92E36TfLnkaoMiObRx/KHm2Iv9p3boyQ=;
	b=1xjDjO6Un3hbZQvdHPG9S4eSZCIT6VBkiruO4070Qz5EJ4t0oBlCmfWpVvY3g4R/9YxyP+
	4pKpoOZikSfj5Xu+hXcaqfGu+0t3O938qREN5geLTrfsNVU74/BHlmnU+TayDV6s3A08yy
	fuhmzaTMoqB0Swkc8ojxh/0V2bP7waClelZ+zDXcgvuk+MtsoBhxXoYGJWERvjavWUhYFM
	md4k6JPcsb2Vzj6V3Z7fLoxQ9U2qZQeZGQ2Dw0Gx/yWXBq7/fENmakx0P7T4/caDwuaRAk
	jZd86cr9rggKIDCyGRFWmCjiXq2WOUyadk8ow5Kh+rc1u1xp69oOlAYkZShiHA==
Authentication-Results: mail.galae.net;
	none
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 15:08:00 +0200
Message-Id: <DM2VSZ91PNOJ.YXQAWC84B6NR@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yann.dirson@vates.tech>, <bitbake-devel@lists.openembedded.org>
Subject: Re: [bitbake-devel] [PATCH] doc: document dependency tracking
 associated with addpylib
References: <1791793541.8631fc262581453bbf619ec5b2062170.1a12f37b16e00080d7@vates.tech>
In-Reply-To: <1791793541.8631fc262581453bbf619ec5b2062170.1a12f37b16e00080d7@vates.tech>
X-TUID: iobtIYJNIygo
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 828ED11D703F4
X-Spamd-Result: default: False [-4.10 / 30.00];
	BAYES_HAM(-5.50)[100.00%];
	DATE_IN_PAST(1.00)[28];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	BCC(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	URIBL_BLOCKED(0.00)[vates.tech:email,galae.net:url,bootlin.com:email,bootlin.com:mid,bootlin.com:url,yoctoproject.org:email,openembedded.org:url,openembedded.org:email,groups.io:url,localhost:rdns,localhost:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim]
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Oct 2026 17:54:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10668

Hi,

On Mon Oct 12, 2026 at 10:25 AM CEST, Yann Dirson via lists.openembedded.or=
g wrote:
> Reported-by: Claude Opus 5.5
> Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
> ---
>  doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/d=
oc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> index 621aab253..eef1f9624 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> @@ -2264,6 +2264,14 @@ The specified <namespace> is imported automaticall=
y, and if the imported
>  module specifies an attribute named ``BBIMPORTS``, that list of
>  sub-modules is iterated and imported too.
> =20
> +Additionally, Bitbake will detect usage of functions from such a
> +library and include them in task hashes, so changes in those functions
> +trigger task rebuilds.  Note that only functions inside modules
> +declared using ``BBIMPORTS`` benefit from this dependency tracking,
> +any name defined directly in the specified namespace (e.g. in
> +`<namespace>/__init__.py`, or in a library hat would be defined as

s/hat/that/

> +`<namespace>.py`) would *not* benefit from this tracking.

Otherwise, this is clear to me. I did not know about this limitation/featur=
e,
and this is definitely important to document, thanks!

Antonin
text:
Return-Path: <bounce+67608+20320+8963659+13752387@lists.openembedded.org>
Delivered-To: antonin.godard@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id 8CW/IMPbzGq5RBAAtaWaaQ
	(envelope-from <bounce+67608+20320+8963659+13752387@lists.openembedded.org>)
	for <antonin.godard@bootlin.com>; Mon, 12 Oct 2026 15:08:19 +0200
X-Original-To: antonin.godard@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id 0C14411D70CFA
	for <antonin.godard@bootlin.com>; Mon, 12 Oct 2026 15:08:14 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=lists.openembedded.org header.s=groups1 header.b="UGeNK/3F";
	dmarc=pass (policy=none) header.from=lists.openembedded.org;
	spf=pass (mail.galae.net: domain of bounce+67608+20320+8963659+13752387@lists.openembedded.org designates 66.175.222.12 as permitted sender) smtp.mailfrom=bounce+67608+20320+8963659+13752387@lists.openembedded.org
ARC-Seal: i=1; s=dkim; d=bootlin.com; t=1791810495; a=rsa-sha256; cv=none;
	b=cNxEOJIttT5A4d73TX5EgewhO1UDsovk6JqMnVlJ/yDeswZLX3Zje5HS1C0H63666OYRQ+
	vB4qRoYtHGa8AY8VXlIYAvCd3scSSy2+4zEwA9Aow0cDN3u2XgkLx39MixSr1SsKQDlgP6
	jYtEN88EuCA/RIT5d22BMLn/yqm5KHEw9thz5IN9nSzr0sZ88wZ+u3xIRNPZ5NNQH6q6J/
	1YLfurJbqZzRJi3zOk1rGPXDvNzqUjDkVeIB6nstih1OCxii707kInq7CBQzujsGgwoKmI
	mOxVMFWe9dgnDhvhfu7Bole30vAuZhMmGqFepnogWNJg0HS1ZIoDApP0rCBaBg==
ARC-Authentication-Results: i=1;
	mail.galae.net;
	dkim=pass header.d=lists.openembedded.org header.s=groups1 header.b="UGeNK/3F";
	dmarc=pass (policy=none) header.from=lists.openembedded.org;
	spf=pass (mail.galae.net: domain of bounce+67608+20320+8963659+13752387@lists.openembedded.org designates 66.175.222.12 as permitted sender) smtp.mailfrom=bounce+67608+20320+8963659+13752387@lists.openembedded.org
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791810495;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:resent-from:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-unsubscribe-post:list-subscribe:list-post:dkim-signature;
	bh=znVcl4BpIH0xSR9Lwdoy3cSidbN6NYCx8EemJ2QhD7k=;
	b=KWOpEfbJDTzEccAY9Vf29WhbQ5Rcr/5nmPJ4pZ+Y5YIbRHGGU8iJgTOX5NQorIZi9o76wn
	fHehM/XctzkBcgSvUcWU58s0ZdVZGie/1jsGK5zffO1aGy4AcgGQ3Q/nGC9pKFVVs80yp7
	hBnQMIn6Q101NSiM0CzO/eBF7i4GCDm7CUMjKmBHmJu1MI8uyMsgkj8lGNGguhRkw7gnLs
	wLyf1+NFZcoNUP7YL5j4/RQCG/F+RpRmRYiBeBPPcdbt9niTGk9G4FX1sZtRUxLT1Mr+T0
	vXsb/1EK0hAFoCMXvgNSrrjIX104VeYT7u8bYJ7VNRDIFn0KrM6aKLMsGBODRg==
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 708A7343DD1
	for <antonin.godard@bootlin.com>; Mon, 12 Oct 2026 13:08:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=znVcl4BpIH0xSR9Lwdoy3cSidbN6NYCx8EemJ2QhD7k=;
 c=relaxed/relaxed; d=lists.openembedded.org;
 h=From:Subject:Date:Message-ID:To:Cc:In-Reply-To:References:Reply-To:Sender:List-Id:List-Post:List-Subscribe:List-Unsubscribe:List-Help:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=groups1; t=1791810493; v=1; x=1792069693;
 b=UGeNK/3Fbs1URhjutP5dGyKw9H89d9yyEoqsLuGP1zosiO/hll0uB9DoZ1mxbKsQLfvMflcI
 BoANhWpVMdM9MZYJAPeTh7Tvd88D12KKTwfrrZKrXDv92LBxBJXreua190vkhgTq5OUV8lgjbWi
 j3qljUEwp6DgG3wj4kqKv1EOCz+rMfG+1Ysb0t7Vz3bEWwk0LpdaXMS0hs47mZos8tNiVo+sMZg
 8RJzZrpnfwelSUvETX+Ge/Lv6OZd/BIc7/qMo5GEO1d2B8vKhwrHAFCJeWwZWDizfWvzaLpSGV+
 U50Cm4KjM5Q6bQsQiuKaxGj/9NnHtReK21+0al/P2niRA==
X-Received: by 127.0.0.2 with SMTP id U7y0YY8964994x5XNlFmIQoq; Mon, 12 Oct 2026 06:08:13 -0700
X-Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12864.1791810489459952278
 for <bitbake-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:08:10 -0700
X-Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 224091A1044
	for <bitbake-devel@lists.openembedded.org>; Mon, 12 Oct 2026 13:08:07 +0000 (UTC)
X-Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA0EB601A6;
	Mon, 12 Oct 2026 13:08:06 +0000 (UTC)
X-Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77CBC11D70CE8;
	Mon, 12 Oct 2026 15:08:01 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 12 Oct 2026 15:08:00 +0200
Message-Id: <DM2VSZ91PNOJ.YXQAWC84B6NR@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard via lists.openembedded.org" <antonin.godard=bootlin.com@lists.openembedded.org>
To: <yann.dirson@vates.tech>, <bitbake-devel@lists.openembedded.org>
Subject: Re: [bitbake-devel] [PATCH] doc: document dependency tracking associated with addpylib
References: <1791793541.8631fc262581453bbf619ec5b2062170.1a12f37b16e00080d7@vates.tech>
In-Reply-To: <1791793541.8631fc262581453bbf619ec5b2062170.1a12f37b16e00080d7@vates.tech>
X-Last-TLS-Session-Version: TLSv1.3
Precedence: Bulk
List-Subscribe: <mailto:bitbake-devel+subscribe@lists.openembedded.org>
List-Help: <mailto:bitbake-devel+help@lists.openembedded.org>
Sender: bitbake-devel@lists.openembedded.org
List-Id: <bitbake-devel.lists.openembedded.org>
Mailing-List: list bitbake-devel@lists.openembedded.org; contact bitbake-devel+owner@lists.openembedded.org
Delivered-To: mailing list bitbake-devel@lists.openembedded.org
Resent-Date: Mon, 12 Oct 2026 06:08:10 -0700
Resent-From: antonin.godard@bootlin.com
Reply-To: antonin.godard@bootlin.com
List-Post: <mailto:bitbake-devel@lists.openembedded.org>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <https://lists.openembedded.org/g/bitbake-devel/leave/13752387/8963659/1916163865/plugh>
X-Gm-Message-State: bb7qyzuGHZFqYnVPetBgRxu9x8963659AA=
Content-Type: multipart/mixed; boundary="unYFBYknsXXaikQDvLIZ"
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 0C14411D70CFA
X-Spamd-Result: default: False [-7.38 / 30.00];
	BAYES_HAM(-5.50)[99.99%];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 66.175.222.12(-1.00)];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.openembedded.org,none];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[lists.openembedded.org:s=groups1];
	R_SPF_ALLOW(-0.20)[+ip4:66.175.222.12:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MX_GOOD(-0.01)[];
	TAGGED_FROM(0.00)[67608,20320,8963659,13752387];
	URIBL_BLOCKED(0.00)[openembedded.org:email,openembedded.org:url,lists.openembedded.org:dkim,vates.tech:email,bootlin.com:mid,bootlin.com:email,bootlin.com:replyto,web01.groups.io:helo,web01.groups.io:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=1];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	ARC_NA(0.00)[];
	BCC(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.openembedded.org:+];
	TO_DN_NONE(0.00)[];
	DNSWL_BLOCKED(0.00)[66.175.222.12:from];
	DWL_DNSWL_BLOCKED(0.00)[openembedded.org:dkim];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antonin.godard=bootlin.com@lists.openembedded.org,bounce@lists.openembedded.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:66.175.216.0/21, country:SG];
	HAS_REPLYTO(0.00)[antonin.godard@bootlin.com];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	CTYPE_MIXED_BOGUS(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[66.175.222.12:from]

--unYFBYknsXXaikQDvLIZ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Oct 12, 2026 at 10:25 AM CEST, Yann Dirson via lists.openembedded.or=
g wrote:
> Reported-by: Claude Opus 5.5
> Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
> ---
>  doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/d=
oc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> index 621aab253..eef1f9624 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> @@ -2264,6 +2264,14 @@ The specified <namespace> is imported automaticall=
y, and if the imported
>  module specifies an attribute named ``BBIMPORTS``, that list of
>  sub-modules is iterated and imported too.
> =20
> +Additionally, Bitbake will detect usage of functions from such a
> +library and include them in task hashes, so changes in those functions
> +trigger task rebuilds.  Note that only functions inside modules
> +declared using ``BBIMPORTS`` benefit from this dependency tracking,
> +any name defined directly in the specified namespace (e.g. in
> +`<namespace>/__init__.py`, or in a library hat would be defined as

s/hat/that/

> +`<namespace>.py`) would *not* benefit from this tracking.

Otherwise, this is clear to me. I did not know about this limitation/featur=
e,
and this is definitely important to document, thanks!

Antonin

--unYFBYknsXXaikQDvLIZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#20320): https://lists.openembedded.org/g/bitbake-devel/=
message/20320
Mute This Topic: https://lists.openembedded.org/mt/121711853/8963659
Group Owner: bitbake-devel+owner@lists.openembedded.org
Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [antonin.=
godard@bootlin.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--unYFBYknsXXaikQDvLIZ--

