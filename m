Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC8ECD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 15:29:40 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23277.1780500575809831295
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 08:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Wt/eVxkb;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=e1lfOcRg;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id D589F1D000BC;
	Wed,  3 Jun 2026 11:29:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 03 Jun 2026 11:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1780500573; x=1780586973; bh=vD
	sr7h0dB0bLpTHBE8rGK5CxonjViGfLvV50Cf07AgM=; b=Wt/eVxkbVj6n44PtgM
	IZ7YRjYICr851fw7xyjSmjvRUZTUEwoZJdAtd82ITOyCxKynI69rO78O1F3oVw0e
	CPoj6ohOnrCBlB6x8lCoCzMhpn/ocTBWt2K/ghf5PSgTRPo+oou/4ENoCtzqh6ym
	QXoHq4sYDmhMKJUfaJL5UsCUkqS0owUA2j/6ksbEII2qz6tf0GXVMQvFD9Q0IBOK
	3J7FcKZRDnU1yk4iLGTDkZSWnlQVW9Cjlwdgzol4vYbTnod/dwJuNKwDdsQAMMOs
	Auj+MlPvhzm/vteL8Enld1Fhf6VLnoonKYBQY2Qqx3ckX6+ZC2thNwa6V1c1uUq1
	z3ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1780500573; x=1780586973; bh=vDsr7h0dB0bLpTHBE8rGK5CxonjV
	iGfLvV50Cf07AgM=; b=e1lfOcRgCqfxZXpsXlGrDoGIxzYA7y1Nby+avGdbpdkp
	OxV8R0xJ+ro4y6tQz9pr/rV2GqfFHPtlsJQch+jIKG9njr9GJmzaJyK088i1tUdQ
	fN2yQdvxgk/IalufIkGkyc0u49Jx0K/GIhELDGt2uEwqKO0AfIMeWI+Qy1hNeu/t
	CXvARbvSpVFEAODtCPxwB75p+UpxIu9Awy2valaF5vV2PB2utSP3Bs+iRQ9fo6yk
	EGAqUorNHzyLEeFjLpS0y5bciis9Oqd6sPbWeFeUlfWcXEf/YcaIe3w2xxfUnlyW
	syM95/E6ZuH70B+4TdsSPIm8hhrlVzYEOPBbILBG1A==
X-ME-Sender: <xms:XUggavaKspFRYHBDPzyan6GQgaipNrwan6_tYFOjzlesLWrHTYYoQw>
    <xme:XUggakbOObnWRK9yqly1IwKOt1I3OOIeTSNt84cx2l9nsUTe0bAQhSXPu1VWJfMeC
    U7wkJxM7Lh5kL5wc5ObloYcIGsqh6Pu2K8B13J_aRKM1rkSj2gEgjY>
X-ME-Received: <xmr:XUggavmtwN1LI7MJV5MnUst6S-iMEoD4G2VBrLqHfDToVDmYrPLzjqF6bh0m357VuptRgi3-cqhf9a_X5XaDiJnQA3PSHa0>
X-ME-Proxy-Cause: dmFkZTFDonhTulki9/+orxsO1iY747OMDe4heiR0dncAr4CZDrmjhkSmn0L4IZNi+Dpkwu
    oudoKLKwOwhYWMjVmJxidNyV3QlvSxndtvEEqa6gZTR/hbzDF4vVhdg9cd1ri5MFzcdIKv
    b0oH8QXfZKWApmE0kYHbk+f/NVuBIMHdWRo27moPJBo4dCRxMJHOUGJVVYUhIIngmh0QBN
    O+vd8bMEhatebi2vrNaL0N26UxQJbuvnLA9CUmOpAezXqp/4iLO0LfRXfo3Dv9pTxESKgg
    jP+xOREAQgm61DciMlcVU5kOmf3FH4n+9OeZ79UH4nMPF5imXuxjJW5sTYSaRATguCXdUk
    aklWwEksa6sOGBZ2D5i4QjcWL4tGOEXZJFFCqDd/M/0+fUeFWC2LzEXwIPzgRWv2BF+wZt
    Z54qYFNk+CaPDRDXHwY6Q1aXlKB3AgVptYrNOUXdAfPHl/bSuyKMrlAgoVPj1As6P6UTfS
    dBGK+qD9lJEaNpmuHicE8vk5BZp3h2YGm3vW1+skOhlQWs8SqVorbG8W8R/4Q6TpfBZzQR
    5WLyX7Fxe+8MFw3mc9ljhNWyVe3cYueeUXd5qgUpgARdt/om2mptp1mrbJ5uJB/fZFlqNC
    5JT6p13MIqgAeUXIxtyAOCXs9HVZS0adZN0Y+ax61pv4w/RQvUGHLVh3f6/g
X-ME-Proxy: <xmx:XUggagwSvv4dWgwVKs7mkOIms1JY_xwH1N9qQwR5vU8HDpT_IlIURA>
    <xmx:XUggatP0-i9tELRcTD5RsFI3gMRRtUhNcAi6-Wd6NmizliBB_o9_iw>
    <xmx:XUggakS76y8bhTyX5rB2mwYIaUD0209dr52P8INW30aXEnP3w6Yavg>
    <xmx:XUggaraG4qci5OQi40tqExmxE1iMnPTdcVza8v4sL4yIVbfGD5GLyQ>
    <xmx:XUggap8iAw-qmpb64Bb01pUZl1Lu8PIqryu1SWxRsfIHdFiSiSHqE5Fr>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 11:29:33 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/2] Security team documentation updates
Date: Wed, 03 Jun 2026 16:29:21 +0100
Message-Id: <20260603-sec-team-v1-0-ffb2e8965875@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFFIIGoC/yXM2wpAQBSF4VfRvjY1TMl4FblgLGzl0Gyk5N0NL
 r/617pI4BlCRXSRx8HCyxyQxBG5oZ57KG6DKdVppjNtlMCpDfWkEmes1RYmNw2FfPXo+Pyuyuq
 37M0It717uu8HTU4WuWwAAAA=
X-Change-ID: 20260603-sec-team-1c39909e383b
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=RylhWTTdZsTwx4DyR/DvS7yXmcz1qgrwQth71yL96Jc=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQpeMQEF5TWRq9W7169v7dNQT5s8abm/VKPt3ccVnzpL
 zi5xp+ro5SFQYyLQVZMkWVzz9f7T3sdeTNCbinAzGFlAhnCwMUpABMpj2JkePTtCOPE5WLl88Ss
 4jqMXFaFMxuUV7WuUrlazvIrf56fE8M//S8cE3i9Z90Qj96f18y+7Mi7120Cp4sYX1xTbFktFDC
 VGQA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 15:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9563

- Add myself to the security team in place of Steve Sakoman.

- Small tidy up and update of how we describe the security team
  operations.

I've based this on top of Marta's patch to update her email address [1]
so that it is easier to apply.

[1]: https://lore.kernel.org/yocto-docs/20260603105914.26433-1-marta.rybczynska@ygreky.com/

---
Paul Barker (2):
      security-team: Update membership list
      security-team: Avoid redundant info & update Mitre link

 documentation/security-reference/security-team.rst | 26 +++++++---------------
 1 file changed, 8 insertions(+), 18 deletions(-)
---
base-commit: 7a7a641c679712a98558bd1d291400ba0c84f47e
change-id: 20260603-sec-team-1c39909e383b

Best regards,
--  
Paul Barker


