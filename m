Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7910C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 11:45:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.11004.1638963900731346770
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 03:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hzpz1C1o;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: simon.eu@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id z6so1365361plk.6
        for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 03:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=BKXeGBLztYZ140wWB7Vvqu4FgaqoXwT90ZZdIF9WrSs=;
        b=hzpz1C1oK4Xvryrug36M/CPN9vcOzt9y/RVO2DVyqWMX5wGineegJWqm0jDO1TVjPX
         SR8YaDWOu7/OB6qIOGe4G06Ec9St99dq5WzRxvUA6J6HdTsHlhGBdKrQEFZzycnS8dax
         KyQ/haPCofK1afgTCd10B8howqUSnH3uUIjdTXUEoHxn6m01wD5L3DAkKBwJ4FLlY7Lr
         Ybxk91SlzB5x/WA6JIZf3RzKYr3rEEVR/w5pze3AQGvFFTIr3Eez+mzNg2IU0jFT3P3G
         AalRZmlZUje3tX7Rc7YIHozdBbDvZjQsGAsOW8ec0hB7lGOZYsrg1WUtnd/LFU+i8Iw/
         R+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=BKXeGBLztYZ140wWB7Vvqu4FgaqoXwT90ZZdIF9WrSs=;
        b=VNRNVzcluKQejQ3oprGm/RuN+CjLXgQkJ630fJQn36PJidK2Wfg9Paku8ml9JnhvBD
         E5cA+Zdd5yA0IKK269Bl+IXY4DETdHzJlGcXw7yx1p3KQbMM5OD86uBj3INVnTOI1IVw
         tqpkUscrGv1Yd6InbI9BIPyHLpXdnsGrDdgG0TLfVO/3xQXJTdYUAvmnhk0EQmg6YagW
         Y/9GmFiUQWfUBmAtmVOOpG1McWnwlzqyPwrmvonpw80/1lABozuPUliBQeNNx7mdhXL2
         BPpmscDocWtPHALop1vpENey4TrMIO6ORQifmwgB+3tjqVqDD85qf6E59LiUAK7LmMHR
         vIuA==
X-Gm-Message-State: AOAM530lcjZTWq8U0KaS/zFmj8PJkljsbT4YqeBuWrQxfFRGM7eo/64U
	yVCVAmgEzA9NMCsCM0Xdbi5mAAh8Lp76QQeGkAeBR0AR
X-Google-Smtp-Source: 
 ABdhPJwLvNnnpx5Z94VXQqBr1s2fj1kQAnDcMuDHfjIrcABPOuNICCHViCF1lmIu+WfZYsTHbiN36I4FCiFfjSulmEk=
X-Received: by 2002:a17:90a:f2c2:: with SMTP id
 gt2mr6758881pjb.178.1638963899921;
 Wed, 08 Dec 2021 03:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20211115124546.97456-1-simon.eu@gmail.com>
 <09f9337d978b9d0727de2a937eb417e8185ca0b3.camel@linuxfoundation.org>
 <16B7BA9296511776.16692@lists.yoctoproject.org>
 <CAO8d5Ba4SJ_SeK2y+qHcGWqxVWjDL=buaOcYxcGXDmhYZg3MGA@mail.gmail.com>
In-Reply-To: 
 <CAO8d5Ba4SJ_SeK2y+qHcGWqxVWjDL=buaOcYxcGXDmhYZg3MGA@mail.gmail.com>
From: Simon Eugster <simon.eu@gmail.com>
Date: Wed, 8 Dec 2021 12:44:48 +0100
Message-ID: 
 <CAO8d5BYWy-+XNDp1eDPq3f1DLpnxQpaQ1HP6HVdjxFQygC9PnQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v3] bitbake: doc: bitbake-user-manual: Add more
 explanations to OVERRIDES
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000df67005d2a10552"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 11:45:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2229

--0000000000000df67005d2a10552
Content-Type: text/plain; charset="UTF-8"

PS: Any feedback on this one? :)

Thanks!
Simon

Am Mo., 29. Nov. 2021 um 08:50 Uhr schrieb Simon Eugster <simon.eu@gmail.com
>:

> Now based on the bitbake repository and not on the poky repo!
>

--0000000000000df67005d2a10552
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>PS: Any feedback on this one? :)</div><div><br></div>=
<div>Thanks!<br></div><div>Simon<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Am Mo., 29. Nov. 2021 um 08:50=C2=
=A0Uhr schrieb Simon Eugster &lt;<a href=3D"mailto:simon.eu@gmail.com">simo=
n.eu@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Now based on the bitbake repository and not on the=
 poky repo!<br></div>
</blockquote></div>

--0000000000000df67005d2a10552--

