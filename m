Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C13C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 11:11:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10468.1741259504359137327
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 03:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U0h3V+wM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bd87f7c2eso2917125e9.3
        for <docs@lists.yoctoproject.org>; Thu, 06 Mar 2025 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741259502; x=1741864302; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UjsvzOZUNjx1E4QknaLeHz++p50xmtteXdMqw9FgxNo=;
        b=U0h3V+wMSAGM3s3Jj89aIhdaVJBsGJROWIL8PZmgIEBXopE7/M1x+fXf3NDm8HZuO+
         4DRlTe1JJwva3/Er3b0fd3zS7UNezp6V69hNYskRwsxKm6mI6yGJtI9mEobNA/7ZtXH3
         fI81eBjJpv9vV+yvHsH3+Nhf28XXNWddGirNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259502; x=1741864302;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjsvzOZUNjx1E4QknaLeHz++p50xmtteXdMqw9FgxNo=;
        b=fYuPh8gf9k8jNNbDtELyTdqhCJfseROc9hUWjtp8Z443I0zG9fjiIxLSwEOPfzDoVI
         G9klZD/un1pUlbc+7Ye4ld/fEBaDXoEfNmb5iSJOYvMTn6WyxlIdQX4F/mkLG4R33xkr
         HrEIKlFMGHhqnJkoTtK9VCi8h1QrwroiEvUqVW0hitrG84jDod1WKFdiawYj+n42MGY2
         RoG/g9NcyXp0j8ym6IirKXXy1pJ7S7ulJi1FuvPrsMDMpP9ryyUHvknglcXhmqlRzBKH
         Ir/kZnGSKJnnaA1CJnrnGQUaf11+SIKsLaP9YXNQW+RVwFkqJQwDC7VGymEdUWUJw9cH
         7DmQ==
X-Gm-Message-State: AOJu0YxRjcVs3rgMXAcqCWV2UTkQ8g+uXwJAfIoeFWDx5ZCThhtUjsGa
	qgkPTav0usLlIIFovHyKNS5x7aSEaLEgkDLgwlhlAVS4ERFAncPDorI4ykJj5AI=
X-Gm-Gg: ASbGncumUdO1aA+1wjxRhlzmtTA32Uq0OZtqPF216ce8TWX3NUrybZ/xVvbYTFMvBMy
	vpur/cTdsI6Ahe9oDJdXrf15ReM76+Lu6xlkk0wzwySrgAd/ikGZvyDNRRx90zJoTxJu37G4yCb
	btYNQPfpZ3ZB+8bUfxhEEiRcB03gU1adifB1BP87Ra0C0cxWIzc5JVezw344ix3fnNtREQlkWeB
	mcdztP4qXFPJKS5PPudO9IxscPmhZc4oqIoIFYKfWAYooSqH+naUMLXa+vrJj+M5dkJZuCtg43/
	LP/+ZAIoHni1fS/SASAk/D2MKeD6N1ZR7UZB2th148LDSv3vGWxWarIiPYc9QdhYoCr56Hb0pWX
	uzGq34qQinpjv0Meb4HTJsltK00sDBbLF5Q==
X-Google-Smtp-Source: AGHT+IFLEj8BUBJdOYs204gt3pC6D2qlnCWbQJywM6pngNUlcsMTEwzkk227/gQ07JLe/ysNUlg6sA==
X-Received: by 2002:a05:6000:2108:b0:391:2ab1:d4c2 with SMTP id ffacd0b85a97d-3912ab1d7cemr1354686f8f.37.1741259502439;
        Thu, 06 Mar 2025 03:11:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e869:4c46:3bba:1ea9? ([2001:8b0:aba:5f3c:e869:4c46:3bba:1ea9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1037bfsm1718499f8f.96.2025.03.06.03.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:11:41 -0800 (PST)
Message-ID: <a147420295a67f1db7be369e6ad45b2fb2bb086c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2 0/5] fetch2/github_release_artifact: fetcher
 for (private) release artifacts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: lgo@pengutronix.de, bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, yocto@pengutronix.de
Date: Thu, 06 Mar 2025 11:11:40 +0000
In-Reply-To: <20250227090853.1632280-1-l.goehrs@pengutronix.de>
References: <20250227090853.1632280-1-l.goehrs@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Mar 2025 11:11:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6500

On Thu, 2025-02-27 at 10:08 +0100, Leonard G=C3=B6hrs via lists.yoctoprojec=
t.org wrote:
> This fetcher enables downloading artifacts attached to GitHub releases
> in private repositories.
>=20
> Authentication is provided using tokens via the `GH_TOKEN` variable
> or a `token=3D` URI parameter.
>=20
> Changes from v1:
>=20
> =C2=A0 - Provide examples on how to provide the `GH_TOKEN` more securely =
than
> =C2=A0=C2=A0=C2=A0 just hardcoding it in the recipe in the commit message=
.
> =C2=A0=C2=A0=C2=A0 E.g. via the `local.conf` or environment variables.
> =C2=A0 - Indent the code example in the documentation `.rst` using three
> =C2=A0=C2=A0=C2=A0 spaces instead of two.
> =C2=A0 - Document the `token=3D` URI parameter along with the `GH_TOKEN`
> =C2=A0=C2=A0=C2=A0 variable.
>=20
> Thanks to Alexander Kanavin and Antonin Godard for their review feedback
> so far.

I'm torn on this. I am leaning towards merging it however I realised
there are a few issues. Firstly, it is failing during testing on=20
Ubuntu 20.04 workers:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/54/builds/1129

Secondly, it adds support for putting the tokens in SRC_URI urls. I'm
not in favour of this since it encourages people to write them in
recipes where it is all too easy to unintentionally share them. I do
not think we should enable this.

Finally, the naming of the variable, GH_TOKEN is not in keeping with
the rest of the codebase. It needs to be prefixed so something like
BB_FETCH_GHRA_TOKEN which makes it clear it is bitbake, the fetcher and
the GHRA fetcher.

Cheers,

Richard



