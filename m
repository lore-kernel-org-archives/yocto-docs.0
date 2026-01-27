Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D709D2F02C
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:27:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10988.1769520467660971802
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 05:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=R6ySH/QZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAjg56700207
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:27:46 GMT
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3twxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:27:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352de7a89e1so4826010a91.1
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 05:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769520466; cv=none;
        d=google.com; s=arc-20240605;
        b=jwWsGmRnIDxVjgfSnQkbZSQtWnnSI2XSxA/ce1cgT2gQk+P9iytAVgzqUY2FG8o5sC
         ER8zkpZuNGNI29d6zxFSBuJw/k4Be64YjmvM3Is7FkiGGqDiY6yFrpQRGJeDAm9IcDkr
         wUKFOa4g0qKg0hHphANYrnMaYf1+DehGZkTkTfQChH/MIJ5vQ8P/PSEXSAZf4Ie+QbAw
         5AqllNPbmAkXhHBDdyYzITh0Ua9ESbEI6getVTbk6oQTXFtSzXlYptzgOrzbtiMDseaI
         u79wOG2wJ1icdiOo3lGGGEMk8QRGRrQpOhNqVP+Qw15mt8ahSqCIcxFvmha0lPYH0SqC
         z2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2LVlj+0XbeeQhSr59/AnGewyFag7N/yXgB4iwOUTpqU=;
        fh=5ZB7iX+9iEtYqQ6NUAc6LElp5lb1XS17meRcitYD6MY=;
        b=NjA1JDOYKT5WvilwXHhzAJJB1M8VHQ9YVZ3eDs2DGaKs1PIhB9nD0HjC0PCTedix3+
         RjhaJORl6IHYXsmVwBBo8o4F3NPfEPuC/gm4OGFARNICf1tzhcUzNLwAac99qxzBqXhP
         zzIbG1TUBrpp0tmB8kkVWlqUVIjLV0oHpXkv+027uUpCqmylB9KZD2tmROnQljvFL+WM
         yODoxifm+/XORgAJT61b5CPO47uI0DtETIdYYv3dOu73aOy9vp1dRLNRDmUrDrdcj0Rz
         6jYTpHEQ855e/HlmqHXnbUSWAMYxcVkqP3RpcaLcJmadQRmyk7LXj5an/NkwzxoNlQgJ
         ZhSA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769520466; x=1770125266; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LVlj+0XbeeQhSr59/AnGewyFag7N/yXgB4iwOUTpqU=;
        b=R6ySH/QZ/GZgrYn41isDXnSJGuR0rwR3xoWyDR4nCwrX0WAuZ3Mp1oBdasaRjT76+k
         JRO24NOcx5KUGpH+7toessr6a/LP3pdLSwAPHMA63tnLJKkeVZ/rXlRILv4FRumZfGzp
         k9ICfK3IXd4rKtZULQUquknt4RlBeWVaOCvypDLQFlXWqwGoLiT74XxWDu+cRGf3HrtL
         9I+by4ZOjf1/zjBLqLgFP79PwF/SBErldWNzRgPNNzhdgvLgHikXDL0ZVQ7EFF/4kOSm
         g8TSJHSyu4F/ZTSISq9cRnsoHjyUoZPDX9YLj1nwBPIsSGGdRY+YCYIhTvBFm7+QhTIM
         wJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520466; x=1770125266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LVlj+0XbeeQhSr59/AnGewyFag7N/yXgB4iwOUTpqU=;
        b=dsgyy3KODFZPo1IVdkSMoJIJ/tD00kBc0FXzBqpxjCxGOiRFN9f8oN6dHpFEgzF3cA
         ePewmRPGeGXAYQBCmr04QUxWRAJqWWROEbjTw9HS2VbZL634j/mHun363QCcLWxi4W4c
         m5u+9SrPZPedrfwL+HHJd09limX3baLkHSnTU+UZIvkIAgkzUntaqJjy06f7NtKPv8xP
         333Wvq0BrNtF36VAoLO+/RND3J9naaMhaGneA8MN+QMUr+x2sFgRLOg1/4Z+ILvQGg5O
         pEzcPD/R2fgE/SGywWY7LMNmPJd3q0FVbEuBzMU9eeXvipjehpLzP54tbJm4oj8aaPYX
         a6/w==
X-Forwarded-Encrypted: i=1; AJvYcCW+eX/LuSllu40ErkohFbjgAeKouxCvbofJyyTaMKzzE2JZum77lLghvRh04s9D23NuJ5MR@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyzhm83fsVLxkA8FkAeBuQpsqv+YS2ZcK38pVQki+NG8GaDd1P9
	rd0FXU2ObTtC821Cmapc5NKJdvtgQzR5WPpM0aojqKhurMU7cIomQ41uWFfzxR6ruUUrjuIZ7uo
	dHPBptESPDDS0m9dB2jHa/c0uKmbsiJMGY8h3uKkyjdAelxQAAvdM8p1CUj953nThtEaGTj8B0+
	EeUntogGw7SsT+Y+0O9rzjqvQ2YjbCw/o5gInAMZI=
X-Gm-Gg: AZuq6aLY60WBWKOgw4UwaHrARI9XDQ64Wq7LMh0QiErOYmrlANE1dWqETbYCl8bvwI2
	lJkfnJNMilCc2PV4eTB84D06zyREaBAL4gNMywDmjy+wpkgxVKj6DPN6d9W/23yuC4wZyJHFGKo
	ZFjj/bE7tDD993PW7DGWGixr5w2jM8khGPgY4PyNxGL45Vh3Exzd5E6rxt594NE/RWz98061U0L
	M3IUdQ3RKsoMfqOqbULMmjndlMeKnjIc7smSPb/VN7SwfhkwaDZqHNi
X-Received: by 2002:a17:90a:e7d0:b0:341:3ea2:b625 with SMTP id 98e67ed59e1d1-353fecf48d8mr1760751a91.12.1769520466008;
        Tue, 27 Jan 2026 05:27:46 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:341:3ea2:b625 with SMTP id
 98e67ed59e1d1-353fecf48d8mr1760725a91.12.1769520465390; Tue, 27 Jan 2026
 05:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-5-daiane.angolini@foundries.io> <DFZAULAJWR0S.1RQ0LXOE4BSUR@bootlin.com>
 <CANNYZj_Y1JiRoXK3iW2mwe1Cvga95icXtx3FzByfBzRs4upMuQ@mail.gmail.com>
In-Reply-To: <CANNYZj_Y1JiRoXK3iW2mwe1Cvga95icXtx3FzByfBzRs4upMuQ@mail.gmail.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Tue, 27 Jan 2026 10:27:33 -0300
X-Gm-Features: AZwV_QiilGMoSrzfHmDfQcEXBIPQcl6v38SfgH6ld5djXcUxPiHz-BVTQ28nwCc
Message-ID: <CA+HEL791UhQ28wsGx4zofiadgbgx4kfYDG+fQR6P1PrTvKQeeQ@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs][PATCH 5/5] docs: Fix sources as required
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org,
        docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: _jT0iIMLMQZtsCxHmTThMi1b6zq94UuI
X-Proofpoint-GUID: _jT0iIMLMQZtsCxHmTThMi1b6zq94UuI
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978bd52 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=X6vjHCo-xMRvEbcC8qUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOSBTYWx0ZWRfX8ULzXoC48UbF
 qi9LjUe0UwX3nAIN1I6wBDx4iDNbVb3DoERg7KhaZdLrdw3ZWUQHlURKQslO1UNL+C3fFuxWP+d
 F/bnydoHR7kqez1VuG/fg6rmHLH/zjSrawbo40LB5vzd01Hi/1RWuNkC+anw8U6/+0437BRzAiS
 4jU/JHQtpMIHDXjUdcVxMTvM9UCce43CV/FIzXmWmarrQfY0GNl7oI+iV69Rw/X57sSWa7eevIR
 ET3bg4jDOlAFRugXhH64sJ/ZShnMd5+4xxlH1hfjzzb0SRyQphSUOqcpXvuwX40zAeG+CJDcI63
 ymiI6rtK+yzGdML+AfP1IF5cq83UPSET5Vimwwt8uMNxZJx8cfw4FCiAE9dCSh9SfNYWwT09FVi
 Vfs5e78v+JqYQblTQsN4EG9Oudd7IWA9i4RcTCa3qlQEasz2g0o64/WAGU7VJayWNlkN+vsemSh
 IRSomn22K1cyceNa4aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270109
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:27:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8738

On Tue, Jan 27, 2026 at 7:50=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 27 Jan 2026 at 11:28, Antonin Godard via
> lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
> > > +   under ``layers/`` directory of a :term:`Setup`. Although the list=
 of sources
> > > +   can be very flexible, at least BitBake should be cloned to genera=
te a
> > > +   :term:`Setup`.
>
> Not necessarily. It's an esoteric example, but one could write a list
> of sources without bitbake in it, and leave 'configurations' empty. In
> this case bitbake-setup will clone/unpack the sources and stop there.

For this one, I'm really guessing. Because, when I made a "wrong" json
file, I got an error that bitbake source is needed (so I added
bitbake).

But when I drop "sources" completely, nothing is created (and I was
expecting at least the top directory and the .conf files)

So, saying it's "optional" is not accurate, but saying it's "required"
is not accurate either.  But I don't quite understand the constraints
here.

Daiane
>
> Alex

