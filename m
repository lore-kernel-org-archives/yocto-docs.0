Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D66D2B92C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:48:59 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.18392.1730814533213096814
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 05:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SjbzfH3l;
 spf=pass (domain: baylibre.com, ip: 209.85.218.49, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99ebb390a5so1166185566b.1
        for <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 05:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730814531; x=1731419331; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYUBmQ1/6RUM3I9bP9OpqNncsPo1y1/zpBYk+d2b4x0=;
        b=SjbzfH3lH5Woc9kQNBfhMM+wVJrElSYd/Ua1/sDYCfUm3osnQtTtfviLReOZKPti73
         P6wr0KeihzoqpNTYtr4KXubKAbgw2xuciDCqN4QaV2lhkfxK8UZdlQ6ay8u2EFiFdjx6
         L/Bw0YpIiFFaaWoesZigWxF/+YJvTxS4CxiUPAkP+CY+sa7W1waJVBMhwT92HAgZOcH1
         POohQPtut1qqMJLf2VD3spW8oAuIARCwrpC9BqF8zYvfJ9Umm4ECYMGGNVMYKLspRvB3
         Gx0dkkt+Qf26d8KygoBxSPazWWjKBdSzJh3moaURL2LJiiJuWdY0Duxphmc9/5GHJGrn
         SkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730814531; x=1731419331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYUBmQ1/6RUM3I9bP9OpqNncsPo1y1/zpBYk+d2b4x0=;
        b=UgusvHskwG2AG5vXEWmzuIgdtZINqfcClCSN2T/HnODQ2cn3O+wXuNm9XOYK/7MP5N
         /h3/WZG+GGIk03LL/4fhbHSuAfU1xPup9RQtt73hpB5IGqGRC1ss9RLymUktut3HK4j0
         zv7jR92sVobBEafCaWOdOhPpJawFyRpLDmjTBbE6Gm/ITIUS7VEEapetCCvt/Rby8YyK
         DTL+B7/iYRmKeHXEkf1ADhekuLwIPbg4tGJMxcqMEUm0KQoHAItkMcbGZLG1Xv4/u+20
         6MC5gAQe48ZIapn7dNn4sHLvwX7G8ah6Xx2Zgi1azl+1cIggSPOI4d7fZK7qh7v1pweW
         AAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp+6hH2m8HIMI3b58KPaWvEmF8171ywODFFe+en06b6mQzWOej4LNUJ1nw8QJSZIfKHf/8@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwFZoxR4RWNO9HbHw5O8rXUYw46B2AXtqGWF5WeNUIr18Mrnzaw
	rTYi2h4RxzWZTtN1/qOEduu8ojk99rNZcpm+FDg415EUfKJImcVtCathjuqvfrvzm69/E4oOwx5
	y2w//HqdSFcZ9jlyqH/M5/HutoF8klJhT1PJ88g==
X-Google-Smtp-Source: AGHT+IF6Kl/hW+673/bIYdVNmlBxHjlbz9lt0X6KvQKhNRrb3/uRZLciWz+VivJAxWzcc7DvYftCj1bY4Kj0JLasQxA=
X-Received: by 2002:a17:907:7d8f:b0:a9a:b818:521d with SMTP id
 a640c23a62f3a-a9e65382905mr1675902866b.18.1730814531358; Tue, 05 Nov 2024
 05:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
 <D5E9RNX36GZW.10MSD4UHMX2LR@bootlin.com> <2a77885c-43ff-4574-bf1c-d35ed77935d5@cherry.de>
 <D5EA30PTOQXJ.3CMF3M4B07K5R@bootlin.com> <37be0713-d238-44a6-a4da-a6e8b33d9cbf@cherry.de>
In-Reply-To: <37be0713-d238-44a6-a4da-a6e8b33d9cbf@cherry.de>
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 5 Nov 2024 14:48:39 +0100
Message-ID: <CAEHHSvbdTvAAgC=dG3xujG0FdvNGKbw9tQgcbUqukO0ouUS7Ow@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 0/2] Add bblock documentation
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 13:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5682

Hi Quentin and Antonin,

Oops sorry I splitted the series in two, but I forgot to update the
cover letter title of one of them :/

Cheers
Julien

Le mar. 5 nov. 2024 =C3=A0 14:33, Quentin Schulz <quentin.schulz@cherry.de>=
 a =C3=A9crit :
>
> On 11/5/24 2:27 PM, Antonin Godard wrote:
> > Hi Quentin
> >
> > On Tue Nov 5, 2024 at 2:14 PM CET, Quentin Schulz wrote:
> > [...]
> >>
> >> There's a v3 already BTW, so maybe take/review that one instead?
> >>
> >> Cheers,
> >> Quentin
> >
> > The original series was split in two, and only the other half was sent =
as a v3 I
> > believe. Thanks for your vigilance! :)
> >
>
> Oof, two different series with the same title for the cover letter? I
> wouldn't even have read the v2 at all not knowing it was a different
> series of patches!
>
> Cheers,
> Quentin

