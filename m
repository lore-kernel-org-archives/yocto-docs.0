Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BECCD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:35:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10997.1780673750085466169
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 08:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZxGL8g1s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600ddc4017so1613333f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780673748; x=1781278548; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9vJvCUTK5LExGzAPI0YU3i8H78UnNFFVyVPgIHa1W2E=;
        b=ZxGL8g1szvnTCOzQ7zYml+Seqoo4gCaFmMYUiWc4LmjzjmpZxdjdGIfdictBB4+D0a
         GabJ/0xd4i+NGCUypr+GINkUXBb0OIOmkLymeEQ4+/srLX8zh2cZZhzSNmtztNyuJ1a0
         vtotLzrHlXKHN8IK8cQqbfQJyX+ggiSZr/Awc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673748; x=1781278548;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vJvCUTK5LExGzAPI0YU3i8H78UnNFFVyVPgIHa1W2E=;
        b=LF5bo5Gq1FVO/N02TXuuqpB0e/vOfccvs9HxZqSLmnkEB8342XWs2HcalEBVBFTsRD
         TRMTbT4TA0JyhKsCCSF1yaIJaxMYxx9Tzsy2v35Z510Zxr+fJayod95qFxjTDMTIwJpt
         TUWFWzId6BqzAHGr3CIwRc+PAuuZdvd5TLU7xuEzWDkxn4XZ97/5exXK4SoUoHPjuvj/
         dXZmi/0ktEJ1OLuf9mkCD6s49cvNeue+TOa4wPMI/t4NgAxY3KbCWE3svo51avDXtmBZ
         scp8lnVOfmMEbnXCl5FQ1QDXlx2o6NrH8wVnTNXO8IO5+7cCyDWExJK1lrZ4LmdelGDu
         2SPw==
X-Forwarded-Encrypted: i=1; AFNElJ9Wi6z8P0OWoEkz47uedxkDyWvTeC2TZkbeziusipL/s//q7ABu9Ce+3NmN7Pgt22OIm86V@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxx43s6KI7LgwmRN6bPd5OGMZ+6fy6Wb3JsVM7Ir8lZRkYRXYA8
	C9SjupXIHRc5VXXM99bYK8RU0i3twYvuJ9sfCxrc6vhSTxgzpJdNSd5wBYq6JiEiLl8=
X-Gm-Gg: Acq92OFALGNUUb/tTYX7UR+kDtbAGhMBHM4I6tkeQu3bSeZvCs0cISZcdle1hGlxdiM
	ULkJbm+bqbRCx4ufSNhXo9Ib4sT0rprRYgQUdSfb8y8jDQUbiOWvOC9VnByESZCndB+JKgWCvBt
	1WVc4P5ONXzZwBa5ievmoEJqRXOZqUzTTmy4WkrqLhtwS2gOaREa8+XnuWagNhQLfeJSyYgVjN0
	g/kjFpycwGZfdwn64wmMgCG+K0Mbjz/J5YXD5YSI74j3MozVrMbqgvyJOJGyirxVEedfnTT94nS
	hQTkfeE8/QII6gorVYkXJ+HM2oJJNlv9XBv14ppVdcGIUhMynyxulZd1dwUFVdGW2/hUI0a01aw
	k/unOWhGUvhhzKGf/ijh0ltTKFIBaXrc7DeGcGeeTpuytpwIJmm2Uyo+LMjoHvwNnLhTTrDgOe3
	Lo2Chz6ucxH95GbGvfrcPuydCgPn/5PAxhVmH9TkjaYs5/QXqssHgPxRbW80n5upnRb9X+99Kk/
	HDAnK4uOZ8hY4DDr4bB1/NNNxA=
X-Received: by 2002:a5d:598b:0:b0:45e:73b3:8118 with SMTP id ffacd0b85a97d-46030512fa1mr7259113f8f.29.1780673748324;
        Fri, 05 Jun 2026 08:35:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:176b:6db2:d527:85f4? ([2001:8b0:aba:5f3c:176b:6db2:d527:85f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm26359480f8f.3.2026.06.05.08.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 08:35:47 -0700 (PDT)
Message-ID: <b5010b6b2373955c252760ef900d860b3480d85d.camel@linuxfoundation.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: antonin.godard@bootlin.com, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 05 Jun 2026 16:35:46 +0100
In-Reply-To: <3bc0de42-2b65-212b-c8ac-39898b4fc0e4@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>
	  <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>
	  <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>
	 <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>
	 <3bc0de42-2b65-212b-c8ac-39898b4fc0e4@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 15:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9613

On Fri, 2026-06-05 at 11:12 -0400, Robert P. J. Day wrote:
> =C2=A0 i should point out that the same inconsistency about required vers=
us
> suggested occurs here:
>=20
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
>=20
> where it claims that the OE system "requires" patch upstream status,
> but follows that up with that each patch "should" provide detailed
> information. i deleted a few patch "Upstream-Status" lines and parsing
> worked just fine.

I hinted at this but let me be more specific. Try a build ;-)

OE-Core definitely requires Upstream-Status.

Cheers,

Richard

