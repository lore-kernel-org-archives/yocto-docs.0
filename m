Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C638FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 18:14:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2505.1777313661435724733
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 11:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TjlYcbaV;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ad135063so96564665e9.0
        for <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 11:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777313660; x=1777918460; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lU2hFO35lQ/6lsNT/GMS2wzI4J2DCb+H81By6kYtJ4U=;
        b=TjlYcbaVzuAb90tkTzdRkZNGvihfI7Dl/r173hYpRvFV6fDEzo97DjDZBAkHNgiFeX
         QuR3XVJW2B97GwEwIYP1Yaq/qd+8LBtGRdOjAn/DTwxaRIhJWYIq6LWdpBg79vWe7Ch5
         cRNkvSI2ntRoE+oRialLRMqZmkSAZijIZ2MBPXph/phHnXCpFVwwg1gaH5CHaCb1NMkm
         SRVkEcWbDhP1gj6yQNr5u1+igV0svt174859e30nqThQZ1q6nR+1ILzG3xLfskZ79kFj
         uDms5V9TbqUIuYcUs/C1FsmB9PAnx575CMaPhSs0GkLyhxayyhfdM6I4S7YzPErdR7yT
         c2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313660; x=1777918460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lU2hFO35lQ/6lsNT/GMS2wzI4J2DCb+H81By6kYtJ4U=;
        b=CyL7BKeuDqIm2VtTLHbRH2NQIzE2OOMqVHQvMcnCTmc3qENPyHjnzysByrSRrLzUYn
         IDAhJH3cwfvq1NuvLHeMYV82+n0UK36eGi3Q1GQv8ejniohblnmonYlkkRu2epRYTq5M
         A8Mk1MMXQJCIMPcPVVTfPRetTaItwv9lL+DWHF8iTalpE3s320PqzE02s5QEHqGSFNox
         KjBq7A/UirNC+QqswhvbfLKXbqidQ9/WKWzECT3BwNfsba6H1ZMDdUlB1moBbGTl2Nww
         E6hDJXv7OgwKAKTdmtUV+SitNHT2YX0XbDeponVDkUAHI+Gm3oIbYF7qDoQQEFlH5yDa
         epNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DlvdWtC8r88+D763PvQ1zWiTY/695rPH3K8wlP+5Vrhr60BeUIDcx8dGGP8NdQRxujSOs@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yya39w4ARG2JGicdwZKBG9dmmVEt8BnMTjS5odB6g8bYiOq+xNS
	WVvUq4POq6n2Kmx3xNORIniaUHx73s9qBqj5ZjE1sATaKSFH5u76LPKT
X-Gm-Gg: AeBDieskzMDKw2Vx31MTPbtzj0vBPAEJKMjxtmr6Sl9OuCg2/GcCGnWSnwD4d/MCjxE
	Hrw2mZvlD/iZaNapTMQKQ9qjC6oDbVldslF5Fi/od3tOLhavysuLIRyBl/cCWCsNY3buff6UFh0
	wMpoMtF/L0lkXBDsz0W9lKVAvpoQ2KQQ5Rgdc5UnW6kzoZpOKGy2a1+YLWeYrd7F0qvyQmAtC9d
	jHZB1VGxYihW/FpTcrUp33EM6yMCck/9orwxwogDE6HoutLoNX76AH8qXrw/vsTrvaqUhkQSMPH
	J1dpmaQKJna7spFPyo6LNKxhRFEG29ATaCPxiK3YWDeJSqR8Wfn3ktWTVYcEADUWTENAtCxo5hn
	sggruLDA4NKgQ0d49pHVASHqo2N8mm5pNruKcamG7xlBFQWUwIcvH7Bk/rYioMm5YU4gwtQ+Pbu
	7epSnKkCLYtxktkv/iZMbD2t9X5NmsAHvPO2uvSW9E+9g2TqciPo8j39i8dTLONXCk1tEU+Bczw
	SmhoMwCcab2PmgPuttCLy4OGlt+JrtuKdBDsOQUid3HSsxUauxRoQeHFpyp
X-Received: by 2002:a05:600c:4fc5:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-48a76f8e680mr4985205e9.26.1777313659552;
        Mon, 27 Apr 2026 11:14:19 -0700 (PDT)
Received: from thinkpad ([2a02:8070:d188:380:a171:2495:6920:2d36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a76f7ecb2sm7957325e9.0.2026.04.27.11.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:14:19 -0700 (PDT)
Date: Mon, 27 Apr 2026 20:14:16 +0200
From: Dawid Bijak <bijak.dawid@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/1] doc: bitbake-user-manual-metadata: fix
 inherit_defer documentation
Message-ID: <ljbjkwt32h72aziah2gepb6k5rfxygfrhkfysmulj5scnca5pu@o4vikz4hfmh3>
References: <20260424062327.820993-1-bijak.dawid@gmail.com>
 <20260424062327.820993-2-bijak.dawid@gmail.com>
 <c25e0e9a-8809-4ac6-90ee-3687972e03af@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c25e0e9a-8809-4ac6-90ee-3687972e03af@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 18:14:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9376

On Mon, Apr 27, 2026 at 02:35:45PM +0200, Quentin Schulz wrote:
> Hi Dawid,
> 
> On 4/24/26 8:23 AM, Dawid Bijak via lists.yoctoproject.org wrote:
> > [You don't often get email from bijak.dawid=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > The documentation for inherit_defer contained the claim
> > 
> > "If VARNAME is going to be set, it needs to be set before the
> > inherit_defer statement is parsed"
> > 
> > which is incorrect and contradicts the purpose of inherit_defer.
> > The wrong claim is replaced with an example which demonstrates
> > the contrast between a plain defer statement and the inherit_defer
> > statement by using an override assignment placed after inherit_defer
> > 
> > Additionally the inline python expression examples have been
> > moved from the inherit_defer section up to the inherit section, since
> > they apply to both directives
> > 
> 
> I'm pretty sure the whole inherit_defer thing started because an inline
> Python expression didn't work. I vaguely remember a bbappend either adding
> this new inherit based on PACKAGECONFIG containing a value, or having the
> main recipe with this inherit <PACKAGECONFIG.contains> and a bbappend modify
> PACKAGECONFIG. See commit 5c2e840eafeb ("ast/BBHandler: Add inherit_defer
> support") in BitBake.
> 
> So I'm very skeptical this is correct.

Hi Quentin,
Thanks for your response.
I'm afraid I don't quite follow your point about PACKAGECONFIG.contains.
I'm not sure what you're referring to exactly.
But, as far as I can tell, the inherit statement works fine with inline python expressions. 
I think, it evaluates the expression in place, much like := would.

For example, on current master I tried the following:
 COND = ""
 COND:append = " x"
 inherit ${@bb.utils.contains('COND', 'x', 'foo', 'bar', d)}
This inherits foo. 

However, if I move the :append below the inherit directive:
 COND = ""
 inherit ${@bb.utils.contains('COND', 'x', 'foo', 'bar', d)}
 COND:append = " x"
it inherits bar.

Greets,
Dawid

