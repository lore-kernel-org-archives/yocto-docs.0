Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7521FE9B377
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 12:55:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.159712.1772456121298117359
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 04:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G3ddmEpt;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b6d9c981so684553f8f.1
        for <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 04:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772456120; x=1773060920; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee+bXOtt6v4+nlqOs403RBeovaAcS6q5hVWKlIZcMV0=;
        b=G3ddmEptkURAwmSUbF+ggE1w3QS/6fLxj+mjp/72JhH/JuE1ydl6CQwVKlDos72BPs
         QVN2nwx4UOL7xVQ4EOQoFkxvPBJzA91ERaM1ncusXWJXsRW15+3nQOieyT8dlNUIYaTm
         QPcnaaAIJU2n/BeAAlK92QWxGPRjtjmGlMfLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456120; x=1773060920;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ee+bXOtt6v4+nlqOs403RBeovaAcS6q5hVWKlIZcMV0=;
        b=X6GgUvk/58tg55h+waYBgn99ddyME/nqzpLCjhh+vWW7+zMWfc1g+elHt8zmGTwPcR
         C72A65ghHDXfqd0d0tJASAkvvNt93WsCkYv6zkVFw0sVADc+2nbFjxB3abLRBLRnvsX5
         Hb2ZIC75+abyhfIE7KosqdZqtH0Q0EIoK1SQIWAZtpIAFCwb+HZb6pOZBfxBYfUWFFp+
         sRZRb0jr86QWP1h0Z7kTyZVD6OOaQnfdLK3Mw2higbCvDQpXrLiFYtz3mQgZG0tVE+s6
         +3WguV4onNRqjKmYB/XuefvoUKlYpmA9N2pxowVjgdygHOZ+6Wbx0nLXy871cRsD//zn
         +ivw==
X-Forwarded-Encrypted: i=1; AJvYcCXiq7rMqnXxMZRjO/wI6nDnxbt7/bivcRsHpYX2iVdmgM/xwhY6kkh5mY2g/WjWTzK5N1qI@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzI6z6uBgU3nRFhclXWIAgmUsSoOyTSaEfc8kisznz+BeHXEG6o
	9j/rBW71QR8cq9d9cMIffkEmbuRlbmQYMjfixfmCfAqTkq6ik5EXFyl6bBOgtzzytYg=
X-Gm-Gg: ATEYQzy1HdmgZsGm2AGMDp8pTrLxoFRaRjD3NAzYJ9a4rPAdqURCE3L0o8NvWEQY8+H
	9QchpHx0hWZqP2gNdKWOjSojldDZfr3quWr8acAXnNl8iImYedXJu5bvZvajtwQGtuyMjadh91I
	gV0vNPLaU5ASpoNPgdiE3iNq0TbHlgBE+H4G8t4ioAnm7WV2Vfs8AIWr6nJ2XC6RGqSGa7TMqrU
	sGEiczJQiqVDzFdhkbqPYGD5E7V9nItioRdfE8bdfo6hxr2Glw773U3cnBrim/X5Wbfn1SBZGqc
	a+xl1nl9RGHQjFWS7Y9DFr1170Fih7pOUDTtqUWR1drR+C0W00G+mnHvNjwd9QSxkw3znODz/Fw
	rSkUmaplRz83FMEw/nGfiLCkaU6q2MSJxlQBnAiIuLTdp7yTbqaDjQYTdLHkzD8facsFzhvqEO6
	mX+DjAlqBLmK+qeta9aR7TM1TRzA==
X-Received: by 2002:a05:6000:2dc6:b0:439:b79d:b9a6 with SMTP id ffacd0b85a97d-439b79dbc2amr6166116f8f.11.1772456119492;
        Mon, 02 Mar 2026 04:55:19 -0800 (PST)
Received: from localhost ([2001:861:8010:5750:5fc1:b679:8afc:8f97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm10519034f8f.12.2026.03.02.04.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:55:19 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:55:18 +0100
Message-Id: <DGSB97RS2F6T.2YJCNNLB7GJCJ@smile.fr>
Subject: Re: [docs] should dynamic layers be documented other than as
 BBFILES_DYNAMIC?
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
References: <16cf1ee4-14bc-061c-dac3-3d3ee539cd64@crashcourse.ca>
In-Reply-To: <16cf1ee4-14bc-061c-dac3-3d3ee539cd64@crashcourse.ca>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 12:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9042

On Mon Mar 2, 2026 at 1:21 PM CET, Robert P. J. Day via lists.yoctoproject.=
org wrote:
>
>   colleague asked about dynamic layers, went to point him at the
> relevant part of the docs only to notice that it is not documented
> anywhere in the main body of the docs, only via the BBFILES_DYNAMIC
> variable in the variables glossary:
>
> https://docs.yoctoproject.org/ref-manual/variables.html#term-BBFILES_DYNA=
MIC
>
>   i don't care for the idea of the documentation of some feature being
> restricted to a short entry in the reference material; IMNSHO, any
> "reference" content should be brief and refer the reader to the
> "official" explanation somewhere else in the documentation.
>
>   if there was a "proper" place in the YP docs to cover dynamic
> layers, where theoretically would that be?

Note: This is an opened documentation bug: https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D15713

>
> rday
--=20
Yoann Congal
Smile ECS


