Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F105BD2FED4
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 18:17:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18810.1769537849636784532
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 10:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=QxW6ohQ9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFMBoN621762
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 18:17:28 GMT
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjej1g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 18:17:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ec823527eso10017631a91.2
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769537847; cv=none;
        d=google.com; s=arc-20240605;
        b=NNAN1x8IdWB7V0TcVo1n8dGj6+YVCDCFTmlUdU+vvqz4jQJM3S+qi0/GQe/cSfvQ9Z
         ckOSWFBnCcblN1oeHfw/adeLTloFH/32p6VMzZWqLTW3e3FPxDtgRaEQwRQKjGypk345
         fAAmR3uxohOEHlCw0OMO6YlVt8BmBE/FEr6elA0LvuivHMeLEdfIbCs2gmRir8e6mVMC
         Qc1B+JSe9IB3J9+n0SSMsZQtqTzCx7PK3/5LFd7NXcc6sYruwl1Ly0p+D9SKwSkGdws2
         ESG13lDaEMrQGn7oWDp8qH+plF+aY7kkPRR3XGWekkrrFuRJUk+ZYlAPukEWuMND4Xyz
         HC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hT7oEiipyhtT/w2BNqfazuSf7V89RXDuVDA53iIL4A0=;
        fh=8YuCfUB/F3Dzc09prdlG/PNFHA0SXhwoL5IaH2ZQQOY=;
        b=R6lYlSNgW8F5mUr+hsuA+tO7u4fXGNHusVBqGkiVhw6P1uYlzZ5QkiDgC+ZW9wJtHd
         RZgmT5qq+f10bqhic0Ptg+w1d11Fznr5lEDIILgOI7ea8gZqzG8wi+3HCCV6kqz1yFRd
         i0w8SgYonEcOhaCUNpPW3SPuythGHt8qLodCexZNV36UMuJxnqC2NaGdN9WOkWp5Adew
         D0ce1ZkLlUEksT+utfN7pfeiD50gw720OLKGwVSMNFmy0HJL1IjjqKaJcdBg8VJ7t9m0
         ar/OQnkWNB1lUNsEb01v2ANakn7I1tXSbUH0hOQtzeHq8z7WOiOUxhSujYsLBo/yLRey
         ioiw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769537847; x=1770142647; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT7oEiipyhtT/w2BNqfazuSf7V89RXDuVDA53iIL4A0=;
        b=QxW6ohQ92lxPcMWRE2PwohCRgXvvy7DF8b0oRYsnQ78uD5udbYmHIuxscn82caWwH0
         WpF2qlqRhuPNTobUqS92nMgWDgGzYkf/dYyfDfRsyDCrHSevQWGf7uLcCJ4is39sZ1aL
         t32K+0oEDfNBLAyp6txSS4J7YS2HdhL5pFp0tBRlJv6e1csHYycdroDLRwdtHeb46RCt
         Uqy3S9lUGYoPMNpYJcM/3RYLSLibJ1dHMhBKOQA5UWE+KiDkJaHpykPM+5uZxs8IrOUw
         niNUpgME5y8A1jMPoAnk452sRvM+8Q304aIMfDLJMKEBwTfYP88R5aTWvV0TTUuMYgth
         TjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537847; x=1770142647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hT7oEiipyhtT/w2BNqfazuSf7V89RXDuVDA53iIL4A0=;
        b=LbnHOwGygyEpz4JXfenQ/ymsheQ3b3C7RCCjn3v/npUFA3oVuxVWV5dbG5gFelEbQi
         5SR1O5DpBIzBzMTMbr+UcMSIHEtiqUfXdPaxZbU6QI1Xe7ZSsF1UvxJQ9cfBtTW0u1cO
         j0H22+xUzOQLZf/1wsvTGoKgaZC7A3BLhf7jJBdNdhfIBeGbi1VTz5qpEpSxGfFcr0yO
         LTpIWazeksutdzUThe93bXtHzNbP0im7PS/dEPi1SksNbI86rsWUpT9zZnWjpHSOLjHe
         UQkmMI7WWmE3aCnIanO+FXKPL7Yv8/t+kNZyf8708g6EzP5OHakXw+8lQwdNrXfs2ytl
         NTjg==
X-Forwarded-Encrypted: i=1; AJvYcCWA6R7TJphlaIxy1hI7WA+e1jLwCEIgo7miH/NTAX+VnN07KKBTHL6ZvypkMwoy0fYtijiY@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx77SmvvMSxI/3BvHa2jh/VO7OkqTAO/4QWDOmg3dixc4Aqj1WQ
	lKg2hduo1tH3XFPVQ/h2SQHyZ6OnqXy1wTgdSj33U8ft6Vc5cdUKx55Jfx/XIvyWGPQrcqc4Hf2
	AOxaFpmzaPQiTovfZ/KRzThodBg0k5RlAL/6yPoThWYhXkBazqZUBeDxDfM+XxjiGNvxiyGFNkA
	tovrz3QJG8tCETJaXnpADFPRipehEOfSlSj5HW9oU=
X-Gm-Gg: AZuq6aK9MeaCWl6jNoNLUO/bMJm0pYuSMsQebT2glKiBdHSCBevJPqNXGxWxaByKWtC
	OFnZ5Ur4YiL/FiwV1FYDoA86izoU7kurV0qm5C8uRJVYGBR+YKGUdQOzbDPzMtBVuEgSyS3MqMj
	iabYmUbk2nUJkN/5MOepkLF9qsEZMmBiZFoWpx6/X3KWiK2Mx/57b/DRX8Tu8yDKF3h9z5bIc1G
	1gr9Oz2wwdhQEUXiJyXioRtGnC+WHBGQSoZRwC5hY+ifmO3kYArhhPc
X-Received: by 2002:a17:90b:3901:b0:353:e91:9b2f with SMTP id 98e67ed59e1d1-353fedcc422mr2480327a91.37.1769537847510;
        Tue, 27 Jan 2026 10:17:27 -0800 (PST)
X-Received: by 2002:a17:90b:3901:b0:353:e91:9b2f with SMTP id
 98e67ed59e1d1-353fedcc422mr2480281a91.37.1769537846766; Tue, 27 Jan 2026
 10:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-2-daiane.angolini@foundries.io> <DFZAUTK11Y5A.1PPDDZRLH02PU@bootlin.com>
 <CANNYZj_DhwvpzBcG0Vi7E9aYqx7b30uDUxJFkmdE686f1+Zkog@mail.gmail.com>
 <CA+HEL79Bs-OaWjNa2OSrVULiBqpeXU_0m1u=vUwgh3cXWXY5uA@mail.gmail.com> <CANNYZj_o9A8hpmnwrJ3Ng+ZvPLHy+AbGnRcS3QJm2nUDT=SW0Q@mail.gmail.com>
In-Reply-To: <CANNYZj_o9A8hpmnwrJ3Ng+ZvPLHy+AbGnRcS3QJm2nUDT=SW0Q@mail.gmail.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Tue, 27 Jan 2026 15:17:15 -0300
X-Gm-Features: AZwV_Qjc01R1xqwrv6ieBYPZGrCZoBkG0E9AggAi5WI6l-eb6jeuGGYxP_fUJkk
Message-ID: <CA+HEL79+C2zsSq_dC3-DjkvFS74OqPs-AB6eCdKrUQ2fmOOoHQ@mail.gmail.com>
Subject: Re: [docs][PATCH 2/5] bitbake-setup: Change the output to match the
 terminology in the docs
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org,
        docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0OCBTYWx0ZWRfXwq4APVIBmpri
 ESe2BOrgaOdgTl2na+ezbRP9E1bwJCCeUogJWs+yRyJ8cxSYcXFwjKegUut4kVrfCxknffLATpc
 Kz1+vZg391H9H1od7mC1IlYuK6/DICqKR6ZgNXokmZgxKjLilkDMgt4C0DU6sb/2GLE0Y36n/wP
 ETmHdn/8wqNBFGsfSGGqkCPPjAolqc63lxv0GSh3ZaiB8FeHnJhoFJpJTSeeFZ2pf0jjFP8INWX
 vhc2Pf5XXxE1hyy+c0Nqym43j7PaWHi0t0gSVD+/UWrJGqx0xRQGhkHzE9qmRFp7wj4TGGLa4r2
 Sb4YSobmCA+k3fW699NCSQ4d+q0IM4XXhFDEyh4ECeAsn/CqITYM35+vetAlveamJAsqAkp8uSS
 2MXnwcHSFvX5F7yrwZ0xNmlwabHT88Rg728SHKtP7aB++ZSuiCjZwqRjberyrYgkOKWd5KjzHiE
 Gwrhq5fi5N84OulgdPw==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=69790138 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=LVY25okwlNza5Yhv:21 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=OTZOkuoYe6Fad0i9pToA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: TFnG2EtSY1aA0pqqgJXNl8belIeFSw8q
X-Proofpoint-GUID: TFnG2EtSY1aA0pqqgJXNl8belIeFSw8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270148
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 18:17:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8749

On Tue, Jan 27, 2026 at 2:45=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 27 Jan 2026 at 14:21, Daiane Angolini
> <daiane.angolini@foundries.io> wrote:
> > If everything is configuration, all stuff is the same for the
> > newcomer. Bitbake configuration is the most generic way to refer to
> > anything. If I have a site.conf with DL_DIR set there, it's a bitbake
> > configuration, if I have a KERNEL_DEVICE inside a machine.conf it's a
> > bitbake configuration.
> >
> > How do you like Fragment Set?
>
> It's not just the fragment set. It's also what layers are enabled in
> bblayers.conf, and what is in site.conf. All these things together are
> collected in build/conf/, they define what bitbake starts with (the
> metadata in layers is pulled in based on what layers are included in
> bblayers.conf) , and they are commonly understood as adding parameters
> to bitbake configuration for a particular build directory, on top of
> layer metadata - if you change those things, then it affects only that
> build directory.
>
> So maybe 'bitbake configuration' isn't unambigious, but tweaking
> build/conf to adjust the bitbake configuration without changing layers
> is a well understood concept. Can you suggest a better name for that?

Not today. Today I can only think about "former local.conf".

I will prepare v2 without touching on variants.

Daiane
>
> Alex

