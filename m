Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14735.1795781016186108671
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 04:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=w8tkXbcF;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: twoerner@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4877837890fso4274368fac.2
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 04:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781015; x=1796385815; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSAY5i+TywGovALB2VAY+K/xcTYtFlgQee/D1xxjA08=;
        b=w8tkXbcF4h1mQuyYVsBa6LOxiyP2R3Z9KbUJy5an1Cj0L4EiVa1I+Kay80CmryPtVI
         ROhKNN6n0Ms73mEqMFShZC3hddEs7PQkSIUEgCb5uXTUohdh0xsRlNdB+yMe9N5VCXBn
         rN08pQUhU0MNEz/OkCGOLam060i56xpUQoWBsMJozseR/syxLrSea43JWCXwUg668tEz
         uvSmKZBR0QnAPCrNEvGhegmfRwcCIregkmxMt97amlfpVVLrGIdAKoeY1TqD5n8+6h6p
         QgIUd/m+N7iK76c6nFo9/D6qT7A4JKI6p//p3+diNAtpeXR9LnLQloV0ltYmzFRVgVgp
         6bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781015; x=1796385815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSAY5i+TywGovALB2VAY+K/xcTYtFlgQee/D1xxjA08=;
        b=EJOhuFX1IoJS6x1pW0OI1szvGtx1LiUszyDXbWAouPgF4bRsMDm4aGujydxPALrknx
         eLXXJspHiHutZHS/ysMaxatiXeBiAWG8mEBeP+vmLJXuMCCqhQoQGdw844PdfD9EQAKr
         DzsQhLYlb7j1anh0ohK4lQkhy6SCVRgETaSi/fIpMn5hJt4Mep9hl4j6SbBn9gpgt76A
         1gKclJrvWsBXZUiIjny2GHeKApNm0d+WCTlkVdtkSTmVOqtYLU7i1ShW0sxYhfeONDyO
         lMzQmRHQOXJffPEoD8Wdfrz6P1lXbmFBM2MZj8nU2DTPTux56DurELM/Au+rS65IOmQo
         8Psw==
X-Gm-Message-State: APuU4Z8Z8mPJ+wY5yXbRVMTCu4TbQFxqa7UQz41u+Jj4yQwOjIyR8nxR
	82rbXENwRbPnnqKDzYlWj29szR3HdJpAhLhOpV6CzdyxYEyQNLDOPEl8
X-Gm-Gg: AZFdTZdGaN9rCqRcSgzzHP9X7PRz2sg0cMcNUGGzOYqfG3jGfcSJEimFR/cNKYfs1F3
	rkSA8O9izjwzonwoVoWJYVL+1iwLx+DxEPLQ/sz+d9H2Lz/Qrf5kbnMcaRUsqcRxeL5OlfpHbaV
	2XeMxlBq35VIyhCVeAng+qfSabZC33G6NFSGLQaj8FxMEKbqHXzOqCS/2XzEN0/IuBTbBGqmYDz
	GYYyBi246lCgEMsoSBD5Q2S4JbR+whGFHxn3cJ8AY3Nq6AO/c8pVCurANRJXGENC8HoORtijXuB
	wVW+6Xm2ws2W7+KpWppI+fsHwUhiBpI9WIo+QXeW8ynlWgsvWGz0A1SvoBdrbEjO/mItZXx4Ub3
	vUfyW+6nX2iYq+vf+hrwYbMljEWnQapay3d3aykq8PlhENI6VEYKF006ZyxhHZpn9Mq273zvziC
	jO8uUp5ePyhtr65cvCb+jndXBWZiJ7gu8cKq6roziQ0Wvb18HRCvpmb1CMw5m6Ak66iSeU88MD2
	tNvQ7/gbpnOF6prmsCFwAm85l4DRMeA2bgZBcejFdDzLPmGjPtoKARhImQqOgyiejWeSk08Y+OB
	N1aq0aRePSLx+RS2qLm94x83YV0WFrZwGeyDgAorWYjnKfjTKZbiLACQPWMFz+Ft1Uo2cu42R01
	Cavy7DceV2MZ7cWoo
X-Received: by 2002:a05:6820:3398:20b0:71a:de26:e969 with SMTP id 006d021491bc7-71b394ca078mr13902833eaf.48.1795781015030;
        Fri, 27 Nov 2026 04:03:35 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a0189dbcesm763838585a.13.2026.11.27.04.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:03:34 -0800 (PST)
Date: Fri, 27 Nov 2026 07:03:32 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 0/2] sphinx: add lexers for wic kickstart files
 and pydevshell sessions
Message-ID: <awlxlB-C-BQsvq9H@localhost.localdomain>
References: <20261126223650.3701672-1-twoerner@gmail.com>
 <DN5UA9PRFTFL.D3Y0NKYY84H8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DN5UA9PRFTFL.D3Y0NKYY84H8@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 12:03:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10852

On Fri 2026-11-27 @ 09:10:31 AM, Antonin Godard wrote:
> Hi,
> 
> On Thu Nov 26, 2026 at 11:36 PM CET, Trevor Woerner via docs wrote:
> > Lexers for wic kickstart (.wks) files and for sessions in BitBake's
> > Python development shell, which the manuals show and Pygments does not
> > cover. No block names either yet, so the rendered manuals do not change.
> 
> Thanks! These look good and I've tested them, just one minor comment on patch 2.
> 
> In a v3, would you be able to replace the occurrences of wks and pydevshell code
> blocks to use your lexers?

Yes, v3 coming up.

In my original plan the "flip" series was rather large and was going to
be sent as one patchset that would flip all of the code-block blocks at
once. I'll add the wks and pydevshell parts now as part of the lexers.

I still need to send a flip patchset as part of the "make bitbake the
default highlight" decision.

> Thanks,
> Antonin
