Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B690CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 15:41:44 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22622.1781797296058505881
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 08:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=DQMfaUkj;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=EDBLFTdm;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4B2637A00FC;
	Thu, 18 Jun 2026 11:41:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 18 Jun 2026 11:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781797295; x=1781883695; bh=TBCn6etvgw
	7PKYJPVHN6pYwV7CgeG1wZXYR/cDZ/AEA=; b=DQMfaUkjBb5YycTfES8PFKrxqk
	b0FkCEe65fpq+xSXouZxvtkYHxCKNB05OsqnC+VayUsI7KVM3wdm+MwlzQNn7bCS
	2eLPxbeX7dTd+Hu9nQLovhFf+5qOeQBIa9h/W6mW8pQCgX4t5MLXmu8Sgjrp0qzW
	QbW5FPKKepC49n53K8kAQM27EHAirM2tE1haDyci+FpFDoIQVcHMu9YoYQXghzGC
	luOOKOHqvi2fU6kD2dlJYuObSu73jPbEGEWFA+WNP+zbopPFsn8yXpEB7fV9huh0
	4qCQ9Vs1Vl4MG5DIRNier+HMBvwFD+KyUEDncb4WJhl+tE8DDZh7W3Bh7xTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781797295; x=1781883695; bh=TBCn6etvgw7PKYJPVHN6pYwV7CgeG1wZXYR
	/cDZ/AEA=; b=EDBLFTdmC8JfOfAbxnFM1VnaV4tgEIHea7mE0EEkjjcDxTIL0Kq
	aAEYwqmejT9srUZngZimyUJyBfSeUa2PZnf7nmurhyGRH6ezuRnZ7nxXesYCe1Jt
	Tu5Czq7r/IYnRqEk4D5jAnBrGoPO99krGuW8lvuH/4e5E/9FXyN7cxXQaqYy7qHb
	WVoMmdRpVntrXSVlDUYaMwwhhQIFXkwWuvRtyCyGCA0v2wNOq3ssybXcyggCnmPm
	cnSqNaPS7u+NkqpdyyAkq0EfgBiftJrFvcn+X7TaeX8m6jlVlcK8tubcKg9IgNMh
	JUqf18SbbrMEvJrpbYYQcdX3/PwGPDCuvvw==
X-ME-Sender: <xms:rxE0ahP8jm_XOY30e9sLC1xHiCBYHRhMvZgOSofCBZ6FksFgURsA9g>
    <xme:rxE0ap8FcqrV3aS9IwFRlcfBaDZCsGMq98GqiJ8Kj9TeoQXhQYF6M5pOuBc_UDdRH
    aqLMTrJ0SlSSHh9w4WVlq7IT45_v0wjzLDtTpdmueDozKXl2L_OXTc>
X-ME-Received: <xmr:rxE0at40dkggNJkJahdnNVvQU8fm-3jCE9X1DhGRUz95p_HAizzXfQJqWUkM-fMiNHueJIhDsy98tLndWY-srMTKAQpd4JyT3AUtAqK-xx5P>
X-ME-Proxy-Cause: dmFkZTGyrx3Adua1LSBk2wuij/hpNXun66D/coArPhh3yE9H8lzYcl/m3hFUwdSN7noqpq
    2EKLHGdwDWAPhhhGyPP1TDM+8mq2jhKU6Q1V9eMR5Ch60Ykw2evjFTqVS4GXplzXuMGkcT
    /bG6bj8/MqdHni7ewjsWE5dEJ8rIC+D+QPdOss8dar3dzC2HBnvb8f2D1jVy+79tDgLpBk
    cOeMthCEta/SBsJL9ZHxrBP7lteeAxBRb0N+KXavhTceo8cIe7+FZLUDVra0dWhgSKtaKc
    cDywk4cSVFnFpfQmtV7URl4ItxLTRSJ6TOXgUnyYVcCMzKJHiAuZ7o5VOX6U7rGKhc8wZI
    IZItvjVfTFClJHnqJ4Tc6ICJwKzscy4LR6JgIWLnWJgiAfOxykMa3g0ktE567PVrgQ1Z8v
    qBteujj3mMWBzM7I88cGnS0o3bgrx03D3GxC2WJ+0ShyF5RWfRwpRbcn1Osi6NF5hMDjA6
    WluclwdlGK1onJgPPPS35lopV6TEtmgbPuQznhLWJjBtpi8Ux/cGf8tlDx+q56OuA/yi1K
    HCLQQITB6JhCVHtwpnYxTxMAuYeN4JSVW7dd87UbQNPd8x064iHd0u8Bm1MMS5YykGh2OK
    z3M/SM8jw3SBp9tFUL8rgMhj6/4W5g5JDOqfq57JidMJCbVCuA3BZJMvuBMA
X-ME-Proxy: <xmx:rxE0ao0_VnYommYQXTIENuFKAb-tWdfOdu2vbQvmLZrsUdrb2juUxg>
    <xmx:rxE0asA6lKUJCAEy_pCotAfxJ1JtnIKFXAWUJ4yCPO61DE0Qv8sikg>
    <xmx:rxE0ai1vffP9wYPURDfwvvYWgGMsuttbcvvytYqZUWmruFdK_CiveQ>
    <xmx:rxE0aut2W72zHPvFd4XwQavCcztjHCFV2eA91spT--2aU0hXkjFfEg>
    <xmx:rxE0auu2LjKRhRiCQH7oWw5qSdmcsq3929qViekxhH481iDR_Ej93Z4J>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jun 2026 11:41:34 -0400 (EDT)
Message-ID: <267b97102c9f0727031cbfe89e2bc48472414023.camel@pbarker.dev>
Subject: Re: [docs] should the security manual mention the meta-exein layer?
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Thu, 18 Jun 2026 16:41:29 +0100
In-Reply-To: <45d7a560-e62b-df1f-f206-33535234e974@crashcourse.ca>
References: <45d7a560-e62b-df1f-f206-33535234e974@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Lj7KUN4k9hN7rzaawJCA"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 15:41:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9782


--=-Lj7KUN4k9hN7rzaawJCA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-18 at 08:52 -0400, Robert P. J. Day wrote:
>   looking at this section in the security manual:
>=20
> https://docs.yoctoproject.org/security-manual/securing-images.html#tools-=
for-hardening-your-image
>=20
> and it's awfully brief, simply referring the reader to the
> comprehensive meta-security layer. but can/should that section be
> extended to include other (possibly non-YP) layers?
>=20
>   for example, here:
>=20
> https://docs.yoctoproject.org/ref-manual/yocto-project-supported-features=
.html#primary-supported
>=20
> the meta-exein layer is listed as "Primary Supported", so does that
> mean it merits at least a mention? what about other YP-compatible
> tools?

As much as we value Exein as a member company, the docs should not be
suggesting one commercial tool over another.

Thanks,

--=20
Paul Barker


--=-Lj7KUN4k9hN7rzaawJCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajQRqREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bp7qAQC0EIaj0eJcLfFUqMTqBHSnLQq14wMinuNK
zX8B1H0mngEA0DrHofvEi8rvfd2UoJidVAseoqoaaegRWVTLawmpWQU=
=Tf/E
-----END PGP SIGNATURE-----

--=-Lj7KUN4k9hN7rzaawJCA--

