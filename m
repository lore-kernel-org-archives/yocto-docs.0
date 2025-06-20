Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8377EC71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:48:16 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.4208.1750412887649608743
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 02:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=blRIzPvG;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6face367320so15400216d6.3
        for <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750412887; x=1751017687; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iycd5GP4dDSTnmWkEE1dj5XScMcsXeZx6TsVMEVxF8o=;
        b=blRIzPvGiMI9UiSepsYCd0nknN/fyM10G5DEEXZicpO1vll0eAZnRY2VQoteJa4oe/
         uIVG0UioObUav0pkl2xwbsyNpZVVI+s6GMD3vXhrEaxEk/6K6zarrIsajjTHi772IhwP
         b6LNtNSUN5K6hnSRN4fB4zzAi+pHUFasTdiGDmoqzQN7O6DXl6a3V5YCratLb/II+UGo
         UaWN/4Q3en5AnyNDerxDf/+m0zQQxlW9NGuZg8wWPCGmGnEKFC7YvsVF5PC3jgoRqCoD
         gR01QWR0R15kazefmXkWW5WJzD8zVpb/0SoudCpWr4guKKzWWptc5Sz8fJ0pmSa8aOUX
         CUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412887; x=1751017687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iycd5GP4dDSTnmWkEE1dj5XScMcsXeZx6TsVMEVxF8o=;
        b=OdrffixbL4fmiPXcU8Qpp9I+Vr2+IYCHA7JPTIqSiRbplRHbpEDJm94MQiuHRw5mQB
         vV812TBPORfFhd8nwhqoSGX12F8916nSgwll8lbSiTpAOUP+zF8CkRRw68iDn/zcfEwR
         59AAn1LYItA1krWvYMhGEdma3YSkOopijIycvhpP6LS25TdEXOHkTZAiQtztozfDVBCs
         QrohwC+rxDHPjigncwmrrz1sHh3JPOt5P6AZuABWm1zwicTlqA1AK5xnbohxNyCDDIEc
         XS3hRxI533pZc80B3VUGGV2nIoMHdDRoe/aurL5Ig2izmjyzDA3TfNTS7VI7k94y/Ney
         sz7Q==
X-Gm-Message-State: AOJu0YxQIwNlplvYCfzsTaVzDZJjUNsRJ3vdENkqOO+0d6iSJefPuKHs
	WKL2jtYd16q9vQjF4Y+pcgoQmWGUaW19xUe0ok8/6EnF0Ur1TgWWb3lMoeLqWOHqluTW8BxPpcf
	VxxP/f6bEsSR4FUK2PBNmxZUjg04hsAo=
X-Gm-Gg: ASbGncszh9fHpCJvc9tLhp2h0GWYlCOfTbsBoVRmIfZKumoRNr0kYcVIJL+Sl8D72Z9
	EzqeMMqNVcWmxGQlkRxNuiwVFo+Ep+9IM9kq7IV2cul8w4zb+LDJI9Nh9wn3JURfXUA6LxhioK1
	Y/HYAJnclOhqEKC7Yns7iied4jeGcIki9AGehXPCtKk0ggi3idEATgzP89ucgps9OAhomFhsmlY
	X3VsA==
X-Google-Smtp-Source: AGHT+IGZbnbXaPv29RDRG8rURKXqIOYJjHTewx1VBuYzemRGnBYsiXfLCT1Wy2nhdCarDaVimGA8YHuQu3cfXumqVhE=
X-Received: by 2002:a05:6214:23c9:b0:6fa:cc39:84 with SMTP id
 6a1803df08f44-6fd0a49633cmr34488746d6.13.1750412886674; Fri, 20 Jun 2025
 02:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <7da04e7f-11c4-819e-cd9b-7aaea55bd91d@crashcourse.ca>
 <CANNYZj-vcNipixa-0e+v43ww7CCfLqtFVG4WBF7U+Tq9Fg2PEg@mail.gmail.com> <3f1b7be8-fed6-efdd-ce87-79441aa58a8a@crashcourse.ca>
In-Reply-To: <3f1b7be8-fed6-efdd-ce87-79441aa58a8a@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jun 2025 11:47:55 +0200
X-Gm-Features: Ac12FXyj70DimpYPQuAyVN_X9y-_e5UZnYbhHtMPgmnuw6waIfwZZZLbRB6Cc4A
Message-ID: <CANNYZj-oUWVgEaw=2NfYhhEA3bNPPtwvHb4j4a0EtB1iSVBZmw@mail.gmail.com>
Subject: Re: [docs] dev manual inconsistently encourages changing "poky"
 checkout locally
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 09:48:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7121

On Fri, 20 Jun 2025 at 11:44, Robert P. J. Day <rpjday@crashcourse.ca> wrot=
e:
>   it's point 5 here:
>
> https://docs.yoctoproject.org/what-i-wish-id-known.html

"Never modify the POKY layer. Never. Ever. When you update to the next
release, you=E2=80=99ll lose all of your work. ALL OF IT."

I'm not sure what this point wants to say to be honest. Can't make sense of=
 it.

Alex

