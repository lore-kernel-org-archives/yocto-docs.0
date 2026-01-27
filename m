Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA6ED2FECF
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 18:06:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18533.1769537210891613317
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 10:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=jKp4C5OP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZkSJ1066032
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 18:06:50 GMT
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x0sna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 18:06:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f29ae883bso41109635ad.3
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:06:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769537210; cv=none;
        d=google.com; s=arc-20240605;
        b=cCQhwLvDEMbf/lvqwNIzBbH2K8j4x79HP/8QtBgmOy8KWurU0GmWEI6pya+3DEx16q
         aZzcsjxnS3pullxtseEV72iLyKwISDem6VjFEfilRNnzj9KFfaKyWf64msBtjMVsD7n0
         8DjW9rait0c91Iiy33LX+1KmH8ez40PsnBQAc+69+BhJThmY6rtHw30LSVS/OeAsmXsX
         o9I06ffp1dxHoDZ+Vyx7NiCsGtwfPXrh/DdS3ELI4x6We3mVhkyEcdHlCWoQ6x68/UL0
         2owgUPCJ1C/abPJ0qvVvEhgchUdVcvhSaTV/XSraNC1PCm8ISrx41DNCNET2uHvQVL+G
         As+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v84rYts3G0FceH/049AyyBi8qgyd6/NT/hFCfJ9kaD4=;
        fh=vUecs7jwdthx7YJx0sTjqSw0t+l+S3keB9Je+btYV1I=;
        b=MTlw267UD1yj7WpEnnH0uLXEacXNcE5rsusO9a+zmndYOrXIxLyZRP1c2H8UG9bqvc
         DPq3xBwkZ53sJjriylPDLBst/UmRsvo21157S+OG8KGwXUf/SaZfC2eZu5FkAMPSRwnl
         0FAUm7pRGzW1TvxjE6pzeDtoRbR9jlxHeZCqQat4aBC2xclL+zS4mhKWWZw2JsZOtNOs
         xNDEBt+5atSvg0Dbrp6mVBjo3c2EX52ubq+m6/BPu5n1kBOceeyFNafmInTq3ok7EyKl
         hGUBrjAqwHTWmj6Pdq1f+r8odZakTtU0LCJcBMvHXg06HBsrQzIMhSMnDPKKRUHyLMl6
         BEuA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769537210; x=1770142010; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v84rYts3G0FceH/049AyyBi8qgyd6/NT/hFCfJ9kaD4=;
        b=jKp4C5OPxfrMJBQLNmdPQGkZmQUZPBnAb8vTf9De2gCPgDdmLlRqZ5jX8jNx95DXX6
         cP3tHsl8shPPJKAzdVQcybrn1PCkpDfE+e+EDVq/x+KWOxUecDdvleFmWhQIzV03/wmX
         jMZ9gFbFaMYPYNnazMp8BfcQF3pxKjAbojlZlxNwCV8B37zEPhYpJ+9hrYcVnZDx+1sC
         PCm77MHc1XRNlRjXbJbwTQdjjeEDA0eiU9fdnhANV95SgWmW9rAX05TLNzC/t5xyV6RD
         lIOD6n36YlKwMG7qgYgQEcUUBM9wUNuE6afGFdFmAqFsgUQgIT8Gaa2oi3cW9/WouaFw
         /7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537210; x=1770142010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v84rYts3G0FceH/049AyyBi8qgyd6/NT/hFCfJ9kaD4=;
        b=Je393bGcXJA1q7aEEdERun1aLUKxblOz/Gr7FAWGrNWp3U/UDYVdKcETbQaGr/RYW4
         uYGFDKt9v14DLiueXn4kbS+wSdesP0UNbbTL8D1YK+ySbdot0vhgOwKAjgEVWPHXj/Yd
         GTfmXAAXVJdArnTyXglcPynqXN82+VaxVEXMHoyFeBpZ7ZuqgI5sKPc18nEcoGS6/tDd
         umhJ9poBxnw1FrNspAGh9VmkNybT8OgCJtf49h1hHNT4RLZvQ7KNyquKECxkiEiSF9OU
         94TeOUoPA/GowkvMGCeg186yXmjEoxVGdudyucnXAhhBwM+srwn3Zz+8rWMtfv97j/Af
         tnxg==
X-Forwarded-Encrypted: i=1; AJvYcCXx7BDMtTOAvtENjepWnSiCS9zgsGTBvrTvUVYEjv05XiijZXZz00oO4Fk/wKxaGj63A9rF@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzlQg+3fYQADpkEd40RDScjEnyvYktzxd8OiIgxzU/Sxd5ixfnS
	slCWxZCt4xOdmGkvaWcn/jYK2EKv87WSTMGN7Q7dcSrJMnbxtmZnSm7/0T6kxOvgie9QbIYj0Fl
	JQLATXvzAtpQAQSqg6nxUL83ksdJuTIPsvw2Wn8C2k/GeZoUevQOjhV4fFQpoiILEJnZSB84uH/
	d/pBM0yt3aqCvROx2RK/e6gIdsAQDct5otcK/fGVo=
X-Gm-Gg: AZuq6aICUkP4k9sI4KIfZcJuaprSque8VYLwvPPJxd9+Dmekx2OHeQkyqpH2XK5kRyz
	3uy1WZ2ZjI0eaMY1sTnRJEw8ig0daOS34LTTq4+jJAJhU/C+ht43/1dL/8CO1cF/bck442faJRO
	EOIGmsFEeG/qTGnOFF5oaHwrlaDX7J/3CVOi4Fq/uoULf9LpOBHSMg3WLopy3o38MUyxJCMUyea
	vfAMLA9JnOBfyhX2OUiIvCmvb/R7QnifsguPUpNFejtbjRYGMt70O27
X-Received: by 2002:a17:902:ceca:b0:2a1:35df:2513 with SMTP id d9443c01a7336-2a870d613bfmr27145225ad.17.1769537209549;
        Tue, 27 Jan 2026 10:06:49 -0800 (PST)
X-Received: by 2002:a17:902:ceca:b0:2a1:35df:2513 with SMTP id
 d9443c01a7336-2a870d613bfmr27144955ad.17.1769537209066; Tue, 27 Jan 2026
 10:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-5-daiane.angolini@foundries.io> <DFZAULAJWR0S.1RQ0LXOE4BSUR@bootlin.com>
 <CANNYZj_Y1JiRoXK3iW2mwe1Cvga95icXtx3FzByfBzRs4upMuQ@mail.gmail.com>
 <CA+HEL791UhQ28wsGx4zofiadgbgx4kfYDG+fQR6P1PrTvKQeeQ@mail.gmail.com> <CANNYZj9+x9hxi2XFOM5G5FUCTT+tkrwmtoY89JrOSQMPpx2gJQ@mail.gmail.com>
In-Reply-To: <CANNYZj9+x9hxi2XFOM5G5FUCTT+tkrwmtoY89JrOSQMPpx2gJQ@mail.gmail.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Tue, 27 Jan 2026 15:06:37 -0300
X-Gm-Features: AZwV_QgYBFyqn6gtrmxXtAyLEnZrMBZ7L4ckqYisXMA2lgDSoBTTKSvVlVqRHHI
Message-ID: <CA+HEL7_x3+=s_VXHPEhRVaNJyK95rOLGZkyU6Ovx4JPEqpB5sA@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs][PATCH 5/5] docs: Fix sources as required
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org,
        docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iPENF-_aGtTS3zu_WZVBLl4KDiTTEHFk
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=6978feba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=beYWP-WcvahK77ATy8QA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: iPENF-_aGtTS3zu_WZVBLl4KDiTTEHFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0NyBTYWx0ZWRfXw4OPV0AainZR
 BqXPQdE/sBzTiywr6+/3iiFr77B3nnvD3+celwdP3FxzcAmGfqkxrm6lG9lPv1BVk8GHRizAO1b
 cKcsfV70+IXAK+qR0dzrX2HTyQhfzXGU+hZOyPk6YYhmoE7VzYL0PH7eHhSnMBtHbgitpie3Yzh
 SmLWoO14O4ug3SK/sf5WR2puyBBdFN0n1MMHeSek4imXIL6KwOkij2N6HxVtyryIoSTjp53Biwo
 e8kPizwd5HSTWbzPKjGv+ojCvT5v91mwW8Jl4fWlVr6fqNBYBznM0meLyP06JoC+VVM9B7sfmjd
 TpGscmMnItGjVitI1Q3LakHsRpb7vYcwQRD07j5k+U8CyweGszAzCkWVVPY/K+bgy6uj+FzxXEH
 pRCr9jc0nv6giKrLOQlikAJ17CBM2vZZHPLJAcjfnvRX+U/PDknCjDCCRaFG/XLvPetUJGgCP1G
 oGw5IjmlO0dSlyYuv4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270147
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 18:06:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8748

On Tue, Jan 27, 2026 at 2:47=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 27 Jan 2026 at 14:27, Daiane Angolini
> <daiane.angolini@foundries.io> wrote:
> > For this one, I'm really guessing. Because, when I made a "wrong" json
> > file, I got an error that bitbake source is needed (so I added
> > bitbake).
> >
> > But when I drop "sources" completely, nothing is created (and I was
> > expecting at least the top directory and the .conf files)
> >
> > So, saying it's "optional" is not accurate, but saying it's "required"
> > is not accurate either.  But I don't quite understand the constraints
> > here.
>
> It's just that these are all not very common corner cases, and they
> aren't tested. We test the common case, but if behaviour in such
> special situations doesn't make sense, that can be fixed in the tool
> itself if there's a need for it.
>
> 'configurations' without 'sources' doesn't make sense though, as
> configurations contain lists of layers and fragments, which are both
> references into sources .

so, it's required.

Daiane
>
> Alex

